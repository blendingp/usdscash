package egovframework.example.sample.web.admin;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.sample.classes.AdminUtil;
import egovframework.example.sample.classes.Copytrade;
import egovframework.example.sample.classes.Member;
import egovframework.example.sample.classes.Project;
import egovframework.example.sample.classes.SocketHandler;
import egovframework.example.sample.classes.Trader;
import egovframework.example.sample.enums.AdminLog;
import egovframework.example.sample.enums.CopytradeState;
import egovframework.example.sample.enums.CopytraderInfo;
import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.web.util.Validation;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/0nI0lMy6jAzAFRVe0DqLOw/trader")
public class AdminCopyTradeController {
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	@RequestMapping(value="/traderList.do")
	public String tarderList(HttpServletRequest request , Model model){
		String tstat = request.getParameter("tstat");
		String search = request.getParameter("search");
		PaginationInfo pi = new PaginationInfo();
		if(request.getParameter("pageIndex") == null || request.getParameter("pageIndex").equals("")){
			pi.setCurrentPageNo(1);
		}else{
			pi.setCurrentPageNo(Integer.parseInt(""+request.getParameter("pageIndex")));
		}
		pi.setPageSize(10);
		pi.setRecordCountPerPage(30);
		EgovMap in = new EgovMap();
		in.put("first", pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		in.put("search", search);
		in.put("tstat", tstat);
		List<EgovMap> traderList = (List<EgovMap>)sampleDAO.list("selectTraderList" , in);
		pi.setTotalRecordCount((int)sampleDAO.select("selectTraderListCnt",in));
		model.addAttribute("traderList",traderList);
		model.addAttribute("pi",pi);
		model.addAttribute("search",search);
		model.addAttribute("tstat",tstat);
		SocketHandler.copytraderRequest = 0;
		return"admin/traderList";
	}
	@ResponseBody
	@RequestMapping(value="/tstat.do" , produces="application/json; charset=utf8")
	public String tstat(HttpServletRequest request){
		String idx = request.getParameter("idx");
		int useridx = Integer.parseInt(request.getParameter("useridx").toString());
		String tstat = request.getParameter("tstat");
		String istrader = request.getParameter("istrader");
		JSONObject obj = new JSONObject();
		EgovMap in = new EgovMap();
		if(tstat.equals("1")){
			Member.getMemberByIdx(useridx).setTrader();
		}else{
			Member.getMemberByIdx(useridx).traderRelease();
		}
		in.put("tidx", idx);
		in.put("tstat", tstat);
		in.put("istrader", istrader);
		sampleDAO.update("updateUserTstat",in);
		AdminUtil.insertAdminLog(request, sampleDAO, AdminLog.SET_TRADER, useridx, null, Integer.parseInt(tstat), null, null);
		obj.put("msg", "?????????????????????.");
		return obj.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value="/total.do" , produces="application/json; charset=utf8")
	public String total(HttpServletRequest request){
		String idx = request.getParameter("idx");
		int total = Integer.parseInt(request.getParameter("total").toString());
		int useridx = Integer.parseInt(request.getParameter("useridx").toString());
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		EgovMap info = (EgovMap)sampleDAO.select("selectTraderByIdx",idx);
		String prevTotal = ""+info.get("total");
		EgovMap in = new EgovMap();
		in.put("tidx",idx);
		in.put("total", total);
		sampleDAO.update("updateUserTotal",in);
		AdminUtil.insertAdminLog(request, sampleDAO, AdminLog.UPDATE_TRADERINFO, useridx, null, CopytraderInfo.TOTAL.getValue(), total,prevTotal+" -> "+total);
		Trader trader = Member.getMemberByIdx(useridx).getTrader();
		if(trader != null)
			trader.setInfo(total,null);
		obj.put("msg" , "?????????????????????.");
		return obj.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value="/minReg.do" , produces="application/json; charset=utf8")
	public String minReg(HttpServletRequest request){
		String min = request.getParameter("min");
		int useridx = Integer.parseInt(request.getParameter("useridx").toString());
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		if(min == null || min.trim().equals("")){
			obj.put("msg", "????????? ??????????????????");
			return obj.toJSONString();
		}
		Member.getMemberByIdx(useridx).getTrader().setRegistWallet(Double.parseDouble(min));
		obj.put("msg" , "?????????????????????.");
		return obj.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value="/traderDelete.do" , produces="application/json; charset=utf8")
	public String traderDelete(HttpServletRequest request){
		String tidx = request.getParameter("idx");
		int useridx = Integer.parseInt(request.getParameter("useridx").toString());
		Member.getMemberByIdx(useridx).traderRelease();
		JSONObject obj = new JSONObject();
		sampleDAO.delete("deleteUserTrader",tidx);
		obj.put("result", "success");
		obj.put("msg", "?????????????????????");
		AdminUtil.insertAdminLog(request, sampleDAO, AdminLog.UPDATE_TRADERINFO, useridx, null, CopytraderInfo.DELETE_TRADER.getValue(), null,null);
		return obj.toJSONString();
	}
	@RequestMapping(value="/followerList.do")
	public String followerList(HttpServletRequest request , Model model, HttpServletResponse response){
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String state = request.getParameter("state");
		String search = request.getParameter("search");
		String dateSelect = request.getParameter("dateSelect");
		String order = request.getParameter("order");
		String orderAD = request.getParameter("orderAD");
		String symbol = request.getParameter("symbol");
		String tidx = request.getParameter("tidx");

		if(order==null || order.compareTo("")==0){
			order = "sdate";
			orderAD = "desc";
		}
		
		PaginationInfo pi = new PaginationInfo();
		if(request.getParameter("pageIndex") == null || request.getParameter("pageIndex").equals("")){
			pi.setCurrentPageNo(1);
		}else{
			pi.setCurrentPageNo(Integer.parseInt(""+request.getParameter("pageIndex")));
		}
		pi.setPageSize(10);
		pi.setRecordCountPerPage(30);
		
		EgovMap in = new EgovMap();
		in.put("first", pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		in.put("sdate", sdate);
		in.put("edate", edate);
		in.put("search", search);
		in.put("state", state);
		in.put("dateSelect", dateSelect);
		in.put("order", "c."+order);
		in.put("orderAD", orderAD);
		in.put("symbol", symbol);
		in.put("tidx", tidx);
		
		List<EgovMap> copyList = (List<EgovMap>)sampleDAO.list("selectCopyAllList" , in);
		pi.setTotalRecordCount((int)sampleDAO.select("selectCopyAllListCnt",in));
		
		EgovMap tinfo = null;
		if(tidx != null){
			tinfo = (EgovMap)sampleDAO.select("selectTraderFollowerCnt",in);
		}
		
		model.addAttribute("tinfo",tinfo);
		model.addAttribute("list",copyList);
		model.addAttribute("pi",pi);
		model.addAttribute("sdate", sdate);
		model.addAttribute("edate", edate);
		model.addAttribute("search",search);
		model.addAttribute("state",state);
		model.addAttribute("dateSelect",dateSelect);
		model.addAttribute("order", order);
		model.addAttribute("orderAD", orderAD);
		model.addAttribute("symbol", symbol);
		model.addAttribute("useCoin", Project.getUseCoinNames());
		
		String fileDown = request.getParameter("fileDown");
		if(fileDown != null && !fileDown.equals("0") && !fileDown.equals("")){
			in.put("first", null);
			ArrayList<EgovMap> allList = (ArrayList<EgovMap>)sampleDAO.list("selectCopyAllList",in);
			SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			DecimalFormat df = new DecimalFormat("###,###.########");
			// header : ?????? ?????? 
			String[] header = {"UID","?????????","????????????","?????? ","????????????","?????????","?????????","?????????","??????????????? USDT","??????(USDT)","??????(USDT)","?????????","?????????","??????"};
			// dataNm ????????? ????????? ?????? 
			String[] dataNm = {"uidx","uname","tname","symbol","fixLeverage","fixQty","lossCutRate","profitCutRate","maxPositionQty","followMoney","profit","sdate","edate","state"};
			// ???????????? ????????? ????????? ????????? ?????? ?????? 
			for(int i=0; i<allList.size(); i++){
				String lossCutRate = (""+allList.get(i).get("lossCutRate"));
				String profitCutRate = (""+allList.get(i).get("profitCutRate"));
				String maxPositionQty = (""+allList.get(i).get("maxPositionQty"));
				String isQtyRate = (""+allList.get(i).get("isQtyRate"));
				String fixLeverage = (""+allList.get(i).get("fixLeverage"));
				
				allList.get(i).put("sdate", dt.format(allList.get(i).get("sdate")));
				allList.get(i).put("edate", (""+allList.get(i).get("edate")).equals("null") ? "" : dt.format(allList.get(i).get("edate")));
				allList.get(i).put("fixLeverage", (""+allList.get(i).get("fixLeverage")).equals("null") ? "????????????" : (""+allList.get(i).get("fixLeverage")));
				allList.get(i).put("fixQty", (""+allList.get(i).get("isQtyRate")).equals("true") ? (""+allList.get(i).get("fixQty"))+"%" : (""+allList.get(i).get("fixQty"))+" USDT");
				allList.get(i).put("lossCutRate", (""+allList.get(i).get("lossCutRate")).equals("null") ? "??????" : (""+allList.get(i).get("lossCutRate"))+"%");
				allList.get(i).put("profitCutRate", (""+allList.get(i).get("profitCutRate")).equals("null") ? "??????" : (""+allList.get(i).get("profitCutRate"))+"%");
				allList.get(i).put("maxPositionQty", (""+allList.get(i).get("maxPositionQty")).equals("null") ? "??????" : (""+allList.get(i).get("maxPositionQty")));
				allList.get(i).put("followMoney", df.format(allList.get(i).get("followMoney")));
				allList.get(i).put("profit", df.format(allList.get(i).get("profit")));
				String logstate = (""+allList.get(i).get("state"));
				switch(logstate){
				case "0": allList.get(i).put("state", "?????????"); break;
				case "1": allList.get(i).put("state", "??????(?????? ??????)"); break;
				case "4": allList.get(i).put("state", "??????(?????? ??????)"); break;
				case "5": allList.get(i).put("state", "??????(???????????? ????????????)"); break;
				case "6": allList.get(i).put("state", "??????(????????? ??????)"); break;
				case "7": allList.get(i).put("state", "?????????"); break;
				case "8": allList.get(i).put("state", "?????????"); break;
				
				}
				
			}
			try {
				Validation.excelDown(response ,allList,"?????????????????? ????????? ?????????" , header , dataNm ,"", sdate+"~"+edate , "");
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		return"admin/copyList";
	}
	
	@RequestMapping(value="/copyRequestList.do")
	public String copyRequestList(HttpServletRequest request , Model model){
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String state = request.getParameter("state");
		String search = request.getParameter("search");
		String dateSelect = request.getParameter("dateSelect");
		String order = request.getParameter("order");
		String orderAD = request.getParameter("orderAD");
		String symbol = request.getParameter("symbol");

		if(order==null || order.compareTo("")==0){
			order = "sdate";
			orderAD = "desc";
		}
		
		PaginationInfo pi = new PaginationInfo();
		if(request.getParameter("pageIndex") == null || request.getParameter("pageIndex").equals("")){
			pi.setCurrentPageNo(1);
		}else{
			pi.setCurrentPageNo(Integer.parseInt(""+request.getParameter("pageIndex")));
		}
		pi.setPageSize(10);
		pi.setRecordCountPerPage(30);
		
		EgovMap in = new EgovMap();
		in.put("first", pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		in.put("sdate", sdate);
		in.put("edate", edate);
		in.put("search", search);
		in.put("state", CopytradeState.REQUEST.getValue());
		in.put("dateSelect", dateSelect);
		in.put("order", "c."+order);
		in.put("orderAD", orderAD);
		in.put("symbol", symbol);
		
		List<EgovMap> copyList = (List<EgovMap>)sampleDAO.list("selectCopyAllList" , in);
		pi.setTotalRecordCount((int)sampleDAO.select("selectCopyAllListCnt",in));
		
		model.addAttribute("list",copyList);
		model.addAttribute("pi",pi);
		model.addAttribute("sdate", sdate);
		model.addAttribute("edate", edate);
		model.addAttribute("search",search);
		model.addAttribute("state",state);
		model.addAttribute("dateSelect",dateSelect);
		model.addAttribute("order", order);
		model.addAttribute("orderAD", orderAD);
		model.addAttribute("symbol", symbol);
		model.addAttribute("useCoin", Project.getUseCoinNames());
		return"admin/copyRequestList";
	}
	
	@ResponseBody
	@RequestMapping(value="/requestDeny.do" , produces="application/json; charset=utf8")
	public String requestDeny(HttpServletRequest request){
		int useridx = Integer.parseInt(request.getParameter("useridx").toString());
		String symbol = request.getParameter("symbol").toString();
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		
		Copytrade denyCopy = Copytrade.getCopytrade(useridx, symbol);
		if(denyCopy == null){
			obj.put("msg", "?????? ????????? ????????????.");
			return obj.toJSONString();
		}
		
		Copytrade.updateCopytrade(denyCopy, CopytradeState.REJECT);
		
		obj.put("result", "suc");
		obj.put("msg", "?????????????????????. 10??? ?????? ????????? ??? ????????????.");
		return obj.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="/requestConfirm.do" , produces="application/json; charset=utf8")
	public String requestConfirm(HttpServletRequest request){
		int useridx = Integer.parseInt(request.getParameter("useridx").toString());
		String symbol = request.getParameter("symbol").toString();
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		
		Copytrade denyCopy = Copytrade.getCopytrade(useridx, symbol);
		if(denyCopy == null){
			obj.put("msg", "?????? ????????? ????????????.");
			return obj.toJSONString();
		}
		
		if(!denyCopy.requestConfirm()){
			obj.put("msg", "?????? ????????? ????????????.");
			return obj.toJSONString();
		}
		
		obj.put("result", "suc");
		obj.put("msg", "?????????????????????. 10??? ?????? ????????? ??? ????????????.");
		return obj.toJSONString();
	}
	
	@RequestMapping(value="/copytradeLog.do")
	public String copytradeLog(HttpServletRequest request , Model model, HttpServletResponse response){
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String kind = request.getParameter("kind");
		String search = request.getParameter("search");
		String order = request.getParameter("order");
		String orderAD = request.getParameter("orderAD");
		String symbol = request.getParameter("symbol");

		if(order==null || order.compareTo("")==0){
			order = "date";
			orderAD = "desc";
		}
		
		PaginationInfo pi = new PaginationInfo();
		if(request.getParameter("pageIndex") == null || request.getParameter("pageIndex").equals("")){
			pi.setCurrentPageNo(1);
		}else{
			pi.setCurrentPageNo(Integer.parseInt(""+request.getParameter("pageIndex")));
		}
		pi.setPageSize(10);
		pi.setRecordCountPerPage(30);
		
		EgovMap in = new EgovMap();
		in.put("first", pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		in.put("sdate", sdate);
		in.put("edate", edate);
		in.put("search", search);
		in.put("kind", kind);
		in.put("order", "c."+order);
		in.put("orderAD", orderAD);
		in.put("symbol", symbol);
		
		List<EgovMap> copyList = (List<EgovMap>)sampleDAO.list("selectCopytradeLogList" , in);
		pi.setTotalRecordCount((int)sampleDAO.select("selectCopytradeLogListCnt",in));
		
		model.addAttribute("list",copyList);
		model.addAttribute("pi",pi);
		model.addAttribute("sdate", sdate);
		model.addAttribute("edate", edate);
		model.addAttribute("search",search);
		model.addAttribute("kind",kind);
		model.addAttribute("order", order);
		model.addAttribute("orderAD", orderAD);
		model.addAttribute("symbol", symbol);
		model.addAttribute("useCoin", Project.getUseCoinNames());
		
		String fileDown = request.getParameter("fileDown");
		if(fileDown != null && !fileDown.equals("0") && !fileDown.equals("")){
			in.put("first", null);
			ArrayList<EgovMap> allList = (ArrayList<EgovMap>)sampleDAO.list("selectCopytradeLogList",in);
			SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			DecimalFormat df = new DecimalFormat("###,###.########");
			DecimalFormat dfp = new DecimalFormat("###,###.##");
			// header : ?????? ?????? 
			String[] header = {"UID","?????????","????????????","?????? ","???????????? ?????????","????????????","?????????","?????????","??????","?????????","??????(USDT)","?????????","??????","??????"};
			// dataNm ????????? ????????? ?????? 
			String[] dataNm = {"userIdx","uname","tname","symbol","levFollow","leverage","position","entryPrice","buyQuantity","margin","result","profitRate","date","kind"};
			// ???????????? ????????? ????????? ????????? ?????? ?????? 
			for(int i=0; i<allList.size(); i++){
				allList.get(i).put("date", dt.format(allList.get(i).get("date")));
				allList.get(i).put("levFollow", (""+allList.get(i).get("levFollow")).equals("0") ? "??????" : "?????????");
				
				String logResult = (""+allList.get(i).get("result"));
				if(!logResult.equals("null")){
					String smargin = ""+allList.get(i).get("margin");
					double margin = Double.parseDouble(smargin);
					double result = Double.parseDouble(logResult);
					allList.get(i).put("profitRate", dfp.format(result / margin * 100)+"%");
					allList.get(i).put("result",result+" USDT");
				}else{
					allList.get(i).put("result", "-");
					allList.get(i).put("profitRate", "-");
				}
				
				String coinName = (""+allList.get(i).get("symbol"));
				coinName = coinName.substring(0,coinName.length()-4);
				allList.get(i).put("entryPrice", df.format(allList.get(i).get("entryPrice"))+" USDT");
				allList.get(i).put("buyQuantity", df.format(allList.get(i).get("buyQuantity"))+" "+coinName);
				allList.get(i).put("margin", df.format(allList.get(i).get("margin"))+" USDT");
				
				String logstate = (""+allList.get(i).get("kind"));
				switch(logstate){
				case "0": allList.get(i).put("kind", "???????????? ??????"); break;
				case "1": allList.get(i).put("kind", "???????????? ??????"); break;
				case "2": allList.get(i).put("kind", "??????"); break;
				case "3": allList.get(i).put("kind", "??????"); break;
				case "4": allList.get(i).put("kind", "?????? ??????"); break;
				}
				
			}
			try {
				Validation.excelDown(response ,allList,"?????????????????? ???????????? ??????" , header , dataNm ,"", sdate+"~"+edate , "");
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return"admin/copyLog";
	}
	@ResponseBody
	@RequestMapping(value="/traderinfoUse.do" , produces="application/json; charset=utf8")
	public String traderinfoUse(HttpServletRequest request){
		int useridx = Integer.parseInt(request.getParameter("useridx").toString());
		int use = Integer.parseInt(request.getParameter("use").toString());
		int type = Integer.parseInt(request.getParameter("type").toString());
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		EgovMap in = new EgovMap();
		in.put("tuseridx", useridx);
		EgovMap info = (EgovMap)sampleDAO.select("selectTraderInfo",in);
		if(use == 1){
			if(info == null){
				sampleDAO.insert("insertTraderInfo",in);
			}
		}else if(info == null){
			obj.put("msg", "????????? ???????????????.");
			return obj.toJSONString();
		}
		if(type == 0){
			in.put("useFollow", use);
		}else{
			in.put("useOtherInfo", use);
		}
		
		sampleDAO.update("updateTraderInfoUse",in);
		if(type == 0){
			if(use == 1) AdminUtil.insertAdminLog(request, sampleDAO, AdminLog.UPDATE_TRADERINFO, useridx, null, CopytraderInfo.WRITE_FOLLOWER.getValue(), null, null);
			else AdminUtil.insertAdminLog(request, sampleDAO, AdminLog.UPDATE_TRADERINFO, useridx, null, CopytraderInfo.WRITE_F_RELEASE.getValue(), null, null);
		}else{
			if(use == 1) AdminUtil.insertAdminLog(request, sampleDAO, AdminLog.UPDATE_TRADERINFO, useridx, null, CopytraderInfo.WRITE_INFO.getValue(), null, null);
			else AdminUtil.insertAdminLog(request, sampleDAO, AdminLog.UPDATE_TRADERINFO, useridx, null, CopytraderInfo.WRITE_I_RELEASE.getValue(), null, null);
		}
		
		obj.put("result", "suc");
		obj.put("msg", "?????????????????????.");
		return obj.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="/traderinfoWrite.do" , produces="application/json; charset=utf8")
	public String traderinfoWrite(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		try {
			int useridx = Integer.parseInt(request.getParameter("useridx"));
			String profitRate = request.getParameter("profitRate");
			String tradeCount = request.getParameter("tradeCount");
			String fAccum = request.getParameter("fAccum");
			String follow = request.getParameter("follow");
			String revenue = request.getParameter("revenue");
			String avail = request.getParameter("avail");
			String loss = request.getParameter("loss");
			String winRate = request.getParameter("winRate");
			EgovMap in = new EgovMap();
			in.put("tuseridx", useridx);
			in.put("profitRate", profitRate);
			in.put("follow", follow);
			in.put("tradeCount", tradeCount);
			in.put("fAccum", fAccum);
			in.put("revenue", revenue);
			in.put("avail", avail);
			in.put("loss", loss);
			in.put("winRate", winRate);
			sampleDAO.update("updateTraderInfo",in);

			obj.put("result", "suc");
			obj.put("msg", "?????????????????????.");
		} catch (Exception e) {
			obj.put("msg", "????????? ?????? ?????????????????????.");
		}
		return obj.toJSONString();
	}
}
