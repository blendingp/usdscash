package egovframework.example.sample.web.admin;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.util.Util;

import egovframework.example.sample.classes.AdminUtil;
import egovframework.example.sample.classes.Coin;
import egovframework.example.sample.classes.CointransService;
import egovframework.example.sample.classes.Copytrade;
import egovframework.example.sample.classes.Member;
import egovframework.example.sample.classes.Message;
import egovframework.example.sample.classes.Position;
import egovframework.example.sample.classes.Project;
import egovframework.example.sample.classes.QueryWait;
import egovframework.example.sample.classes.ServerInfo;
import egovframework.example.sample.classes.SocketHandler;
import egovframework.example.sample.classes.Wallet;
import egovframework.example.sample.enums.AdminLog;
import egovframework.example.sample.enums.CopytradeState;
import egovframework.example.sample.enums.QueryType;
import egovframework.example.sample.service.impl.Log;
import egovframework.example.sample.service.impl.MemberControllMgr;
import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.web.util.CryptoUtil;
import egovframework.example.sample.web.util.Send;
import egovframework.example.sample.web.util.Validation;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/0nI0lMy6jAzAFRVe0DqLOw")
public class AdminController {

	@Resource(name="sampleDAO")
	SampleDAO sampleDAO;
	
	@Resource(name="messageSource")
    MessageSource messageSource;
	
	@RequestMapping(value="/login.do")
	public String login(HttpServletRequest request) throws NoSuchAlgorithmException, GeneralSecurityException{
		String key = ""+request.getParameter("key");
		return "admin/login";
	}
	
	@RequestMapping(value="/createSubAdmin.do")
	public String createSubAdmin(Model model){
		model.addAttribute("project",Project.getPropertieMap());
		return "admin/createSubAdmin";
	}
	
	@ResponseBody
	@RequestMapping(value="/subAdminInsert.do" , produces = "application/json; charset=utf8")
	public String subAdminInsert(HttpServletRequest request){
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String authkey = request.getParameter("authkey");
		String level = request.getParameter("level");
		
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		if(id == null || id.trim().equals("")){
			obj.put("msg", "???????????? ??????????????????");
			return obj.toJSONString();
		}
		if(sampleDAO.select("checkAdminId" , id) != null){
			obj.put("msg", "???????????? ?????????????????????.");
			return obj.toJSONString();
		}
		if(pw == null || pw.trim().equals("")){
			obj.put("msg", "??????????????? ??????????????????");
			return obj.toJSONString();
		}
		if(authkey == null || authkey.trim().equals("")){
			obj.put("msg", "???????????? ??????????????????");
			return obj.toJSONString();
		}
		EgovMap in = new EgovMap();
		in.put("id", id);
		in.put("pw", pw);
		in.put("authkey", authkey);
		in.put("level", level);
		sampleDAO.insert("insertAdmin" ,in);
		obj.put("result", "success");
		return obj.toJSONString();
	}
	
	@RequestMapping(value="/subAdminList.do")
	public String subAdminList(HttpServletRequest request , Model model){
		//?????????
		PaginationInfo paginationInfo = new PaginationInfo();
		if (request.getParameter("pageIndex") == null || request.getParameter("pageIndex").equals("")) {
			paginationInfo.setCurrentPageNo(1);
		} else {
			paginationInfo.setCurrentPageNo(Integer.parseInt("" + request.getParameter("pageIndex")));
		}
		paginationInfo.setRecordCountPerPage(15);
		paginationInfo.setPageSize(10);
		//????????????
		EgovMap in = new EgovMap();
		in.put("first", paginationInfo.getFirstRecordIndex());
		in.put("record", paginationInfo.getRecordCountPerPage());
		model.addAttribute("list", sampleDAO.list("selectSubAdminList", in));
		paginationInfo.setTotalRecordCount((int)sampleDAO.select("selectSubAdminListCnt" , in));
		model.addAttribute("pi", paginationInfo);
		return "admin/subAdminList";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/deleteSubAdmin.do" , produces = "application/json; charset=utf8")
	public String deleteSubAdmin(HttpServletRequest request){
		String idx = request.getParameter("idx");
		JSONObject obj = new JSONObject();
		sampleDAO.delete("deleteSubAdmin" , idx);
		obj.put("result", "success");
		obj.put("msg", "?????? ?????????????????????.");
		return obj.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="/changeAuthkey.do" , produces = "application/json; charset=utf8")
	public String changeAuthkey(HttpServletRequest request){
		String idx = request.getParameter("idx");
		String authkey = request.getParameter("authkey");
		JSONObject obj = new JSONObject();
		
		EgovMap in = new EgovMap();
		in.put("idx", idx);
		in.put("authkey", authkey);
		sampleDAO.update("updateSubAdmin" , in);
		obj.put("result", "success");
		obj.put("msg", "?????? ?????????????????????.");
		return obj.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/loginProcess.do", produces="application/json; charset=utf8")
	public String loginProcess(HttpServletRequest request) throws Exception {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String authkey = request.getParameter("authkey");
		String userip = Member.getClientIP(request);
		Log.print("admin Login id:"+id+" ip:"+userip, 1, "logincheck");
		
		JSONObject obj = new JSONObject();
		
		if(id.length()>30 || pw.length()>50){
			return obj.toJSONString();
		}
		
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");
		
		if(id == null || id.equals("")){
			obj.put("result", "fail");
			obj.put("msg", "???????????? ???????????????.");
			return obj.toJSONString();
		}
		if(pw == null || pw.equals("")){
			obj.put("result", "fail");
			obj.put("msg", "??????????????? ???????????????.");
			return obj.toJSONString();
		}	
		EgovMap in = new EgovMap();
		in.put("id", id);
		
		CryptoUtil crypto = CryptoUtil.getInstance();
//		in.put("pw", crypto.encrypt(pw));
		in.put("pw", pw);
		in.put("authkey", authkey);
		EgovMap info = (EgovMap)sampleDAO.select("selectLoginId", in);
		if(info == null){
			obj.put("result", "fail");
			obj.put("msg", "????????? ?????? ??????????????? ???????????????.");
			ServerInfo.get().insertAdminAccessLog(userip,id,pw,false,userIdx);
			return obj.toJSONString();
		}else{
			session.setAttribute("adminLogin", "1");
			session.setAttribute("adminIdx", info.get("idx"));
			session.setAttribute("adminLevel", info.get("level"));
			ServerInfo.get().insertAdminAccessLog(userip,id,pw,true,userIdx);
			Send.sendTelegramAlarmBotMsg(id+" ????????? ?????????.");
			obj.put("result", "success");
			return obj.toJSONString();
		}
	}
	
	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest request, ModelMap model) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("adminLogin", null);
		session.setAttribute("adminLevel",null);
		session.setAttribute("adminIdx", null);
		return "redirect:login.do";
	}
	
	@ResponseBody
	@RequestMapping(value="/getMoneySum.do"  , produces="application/json; charset=utf8")
	public String getMoneySum(){
		JSONObject obj = new JSONObject();
		double margin = 0;
		for(Position p : SocketHandler.positionList){
			if(!p.member.getIstest())
				margin += p.fee;
		}
		obj.put("margin" , margin);
		
		EgovMap today = (EgovMap)sampleDAO.select("selectProfitSumToday");
		BigDecimal marginDecimal = BigDecimal.valueOf(margin);
		BigDecimal exRate = BigDecimal.valueOf(Double.parseDouble(SocketHandler.exchangeRate));
		BigDecimal profit = BigDecimal.valueOf(Double.parseDouble(today.get("profitSum").toString()));
		BigDecimal adminProfit = BigDecimal.valueOf(Double.parseDouble(today.get("adminProfitSum").toString()));
		BigDecimal fee = BigDecimal.valueOf(Double.parseDouble(today.get("feeSum").toString()));
		BigDecimal funding = BigDecimal.valueOf(Double.parseDouble(sampleDAO.select("selectFundingSumToday").toString()));
		
		
		//BigDecimal exRate = BigDecimal.valueOf(Double.parseDouble( SocketHandler.exchangeRate.toString());
		BigDecimal netProfit = adminProfit.subtract(funding);
		if(Project.isFeeAccum()){
			netProfit = netProfit.add(fee);
		}
		if(Project.isFeeReferral()){
			netProfit = netProfit.add(profit);
		}
		BigDecimal profitExrate = profit.multiply(exRate).setScale(0, RoundingMode.HALF_EVEN);
		BigDecimal positionExrate = marginDecimal.multiply(exRate).setScale(0, RoundingMode.HALF_EVEN);
		BigDecimal netpExrate = netProfit.multiply(exRate).setScale(0, RoundingMode.HALF_EVEN);
		
		obj.put("exRate", exRate);
		obj.put("profitExrate" , profitExrate);
		obj.put("positionExrate" , positionExrate);
		obj.put("netpExrate" , netpExrate);
		//model.addAttribute("exRate", SocketHandler.exchangeRate);
		obj.put("adminProfit" , adminProfit);
		obj.put("fee" , fee);
		obj.put("profit" , profit);
		obj.put("netProfit" , netProfit);
		obj.put("funding" , funding);
		
		obj.put("allMember" , sampleDAO.select("selectAllMemberCnt"));
		obj.put("positionMember" , sampleDAO.select("selectPositionCnt"));
		return obj.toJSONString();
	}
	
	/*?????????*/
	@RequestMapping(value = "/fixstat.do")
	public String fixstat(HttpServletRequest request, ModelMap model) throws Exception {
	    model.addAttribute("fixstat", SocketHandler.fixstat);
	    return "admin/fixstat";
	}
	@RequestMapping(value = "/statchange.do")
		public String statchange(HttpServletRequest request, ModelMap model) throws Exception {
		String stat = request.getParameter("stat");
		if(stat.length()>30){
			return "redirect:/0nI0lMy6jAzAFRVe0DqLOw/fixstat.do";
		}
		SocketHandler.fixstat = Integer.parseInt(stat);
		return "redirect:/0nI0lMy6jAzAFRVe0DqLOw/fixstat.do";
	}
	
	@ResponseBody
	@RequestMapping(value = "/giveFunding.do")
	public String giveFunding(HttpServletRequest request, ModelMap model) throws Exception {
		Position.giveFunding();
		return "ok";
	}	
	@ResponseBody
	@RequestMapping(value = "/giveFundingLiquid.do")
	public String giveFundingLiquid(HttpServletRequest request, ModelMap model) throws Exception {
		String kind = ""+request.getParameter("kind");
		String sise = ""+request.getParameter("sise");
		AdminDeleteListController.testKind = kind;
		AdminDeleteListController.testSise = sise;
		Position.giveFunding();
		return "ok";
	}	
	
    @RequestMapping(value = "/adminSetting.do")
	public String adminSetting(HttpServletRequest request, ModelMap model) throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("adminLevel").toString().compareTo("1")==0){
			model.addAttribute("list",sampleDAO.list("selectAdminList"));
			return "admin/adminSetting";
		}
		else
			return "redirect:main.do";
	}
    
    @ResponseBody
    @RequestMapping(value="/setId.do"  , produces="application/json; charset=utf8")
    public String setId(HttpServletRequest request) throws UnsupportedEncodingException{
    	JSONObject obj = new JSONObject();
    	
    	HttpSession session = request.getSession();
    	if(session.getAttribute("adminLevel").toString().compareTo("1")!=0){
    		obj.put("msg" , "????????? ????????????.");
    		return obj.toJSONString();
    	}
    	String idx = request.getParameter("idx");
    	String id = request.getParameter("id");
    	
    	EgovMap in = new EgovMap();
    	in.put("idx", idx);
    	
    	try {
    		in.put("id", id);
    		sampleDAO.update("updateAdminPw",in);
    		obj.put("msg" , "???????????????????????????.");
    		return obj.toJSONString();
    		
    	} catch (Exception e) {
    		e.printStackTrace();
    		obj.put("msg" , "????????? ??????????????????.");
    		return obj.toJSONString();
    	}
    }

    @ResponseBody
	@RequestMapping(value="/setPassword.do"  , produces="application/json; charset=utf8")
	public String setPassword(HttpServletRequest request) throws UnsupportedEncodingException{
    	JSONObject obj = new JSONObject();

    	HttpSession session = request.getSession();
		if(session.getAttribute("adminLevel").toString().compareTo("1")!=0){
			obj.put("msg" , "????????? ????????????.");
			return obj.toJSONString();
		}
    	String idx = request.getParameter("idx");
    	String pw = request.getParameter("pw");
		
		EgovMap in = new EgovMap();
		in.put("idx", idx);
		
		try {
			in.put("pw", pw);
			sampleDAO.update("updateAdminPw",in);
			obj.put("msg" , "???????????????????????????.");
			return obj.toJSONString();
			
		} catch (Exception e) {
			e.printStackTrace();
			obj.put("msg" , "????????? ??????????????????.");
			return obj.toJSONString();
		}
	}
    
    @RequestMapping(value = "/dangerMsgList.do")
	public String dangerMsgList(HttpServletRequest request, ModelMap model) throws Exception {
    	model.addAttribute("list",SocketHandler.dangerMsg);
    	SocketHandler.dangerMsgRead = 0;
    	return "admin/dangerMsgList";
	}
    
    @ResponseBody
    @RequestMapping(value="/getDangerRead.do"  , produces="application/json; charset=utf8")
    public String getDangerRead(HttpServletRequest request){
    	JSONObject obj = new JSONObject();
    	obj.put("read", SocketHandler.dangerMsgRead);
    	obj.put("copy", SocketHandler.copytraderRequest);
    	return obj.toJSONString();
    }
    
    @RequestMapping(value="/dangerDelete.do")
	public String dangerDelete(HttpServletRequest request){
		String idxs = request.getParameter("idxs");
		String [] idxArray = idxs.split("\\:");
		
		Queue<String> msgs = new LinkedList<String>();
		for(int i = 0; i < idxArray.length; i++){
			msgs.add(SocketHandler.dangerMsg.get(Integer.parseInt(idxArray[i]) ));
		}
		while(msgs.size() != 0){
			SocketHandler.dangerMsg.remove(msgs.poll());
		}
		return "redirect:dangerMsgList.do";
	}
    
    @RequestMapping(value = "/adminIpList.do")
	public String adminIpList(HttpServletRequest request, ModelMap model) throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("adminLevel").toString().compareTo("1")==0){
			model.addAttribute("myip",Member.getClientIP(request));
			model.addAttribute("list",sampleDAO.list("selectAdminIp"));
			return "admin/adminIpList";
		}
		else
			return "redirect:main.do";
	}
    
    @ResponseBody
    @RequestMapping(value="/insertAdminIp.do"  , produces="application/json; charset=utf8")
    public String insertAdminIp(HttpServletRequest request){
    	JSONObject obj = new JSONObject();
    	
    	HttpSession session = request.getSession();
    	if(session.getAttribute("adminLevel").toString().compareTo("1")!=0){
    		obj.put("msg" , "????????? ????????????.");
    		return obj.toJSONString();
    	}
    	String ip = request.getParameter("ip");
    	if(ip.length()>30){
			return "redirect:/0nI0lMy6jAzAFRVe0DqLOw/fixstat.do";
		}
    	EgovMap in = new EgovMap();
    	in.put("ip", ip);
    	
		sampleDAO.insert("insertAdminIp",in);
		SocketHandler.adminIpList = (List<EgovMap>)sampleDAO.list("selectAdminIp");
		obj.put("msg" , "?????????????????????.");
		return obj.toJSONString();
    		
    }
    
    @ResponseBody
    @RequestMapping(value="/deleteAdminIp.do"  , produces="application/json; charset=utf8")
    public String deleteAdminIp(HttpServletRequest request){
    	JSONObject obj = new JSONObject();
    	
    	HttpSession session = request.getSession();
    	if(session.getAttribute("adminLevel").toString().compareTo("1")!=0){
    		obj.put("msg" , "????????? ????????????.");
    		return obj.toJSONString();
    	}
    	String idx = request.getParameter("idx");
    	if(idx.length()>30){
			return "redirect:/0nI0lMy6jAzAFRVe0DqLOw/fixstat.do";
		}
    	EgovMap in = new EgovMap();
    	in.put("idx", idx);
    	
		sampleDAO.delete("deleteAdminIp",in);
		SocketHandler.adminIpList = (List<EgovMap>)sampleDAO.list("selectAdminIp");
		obj.put("msg" , "???????????????????????????.");
		return obj.toJSONString();
    		
    }
    
    @ResponseBody
	@RequestMapping(value = "/testUserInsert.do" , produces="application/json; charset=utf8")
    public String testUserInsert(HttpServletRequest request){
    	String count = request.getParameter("count");
    	String wallet = request.getParameter("wallet");
    	if(count.length()>30 || wallet.length()>50){
			return "redirect:/0nI0lMy6jAzAFRVe0DqLOw/fixstat.do";
		}
    	if(count == null) return "not count";
    	if(wallet == null) wallet="0";
    	String insert = MemberControllMgr.get().insertTestMember(Integer.parseInt(count),Integer.parseInt(wallet));
    	return "??????????????? "+count+"??? ????????????\n"+insert;
    }
    
    @ResponseBody
	@RequestMapping(value = "/waitQueryList.do" , produces="application/json; charset=utf8")
    public String waitQueryList(HttpServletRequest request){
    	String text = "";
    	int qsize = SocketHandler.queryList.size();
    	int uqsize = SocketHandler.updateQueryList.size();
    	text = "????????? Send ?????? : "+SocketHandler.sendList.size()+"???\n";
    	text += "????????? Send ?????? : "+SocketHandler.sendStartList.size()+"???\n\n";
    	text += "????????? ???????????? ?????? : "+SocketHandler.msgList.size()+"???\n";
    	text += "????????? INSERT, DELETE ?????? ?????? : "+qsize+"???\n";
    	text += "????????? UPDATE ?????? ?????? : "+uqsize+"???\n";
		for(QueryWait qw:SocketHandler.queryList){
			text += "NAME = "+qw.queryName+" / TYPE = "+qw.type+" / "+qw.map+"\n";
		}
		if(uqsize != 0)
			text += "//////////////////////////////UPDATE /////////////////////////////\n";
		for(QueryWait qw:SocketHandler.updateQueryList){
			text += "NAME = "+qw.queryName+" / TYPE = "+qw.type+" / "+qw.map+"\n";
		}
    	return text+"ok";
    }
    
    @ResponseBody
	@RequestMapping(value = "/waitSendList.do" , produces="application/json; charset=utf8")
    public String waitSendList(HttpServletRequest request){
    	String text = "";
    	text = "????????? Send ?????? : "+SocketHandler.sendList.size()+"???\n";
    	text += "????????? Send ?????? : "+SocketHandler.sendStartList.size()+"???\n\n";
    	text += "????????? ???????????? ?????? : "+SocketHandler.msgList.size()+"???\n";
    	return text+"ok";
    }
    
    @ResponseBody
	@RequestMapping(value = "/chongAccum.do" , produces="application/json; charset=utf8")
    public String chongAccum(HttpServletRequest request){
    	String text = "";
	    ArrayList<Member> clist = Member.getChongList();
		for(Member m : clist){
			if(m.accum == null)
				continue;
			
			text += "????????? = "+m.getName()+" / userIdx = "+m.userIdx+" / ";
			if(m.accum == null) text += "?????? ?????? ??????";
			if(m.accum != null) text += "????????? : "+m.accum;
			text += "\n";
		}
    	return text+"ok";
    }

    @ResponseBody
	@RequestMapping(value = "/copytradeRunList.do" , produces="application/json; charset=utf8")
    public String copytradeRunList(HttpServletRequest request){
    	String text = "";
    	synchronized (SocketHandler.copytradeList) {
	    	int csize = SocketHandler.copytradeList.size();
	    	text += "????????? ?????????????????? ?????? : "+csize+"???\n";
    		for(Copytrade copy:SocketHandler.copytradeList){
    			text += copy.getCopyInfo();
    		}
		}
    	return text+"ok";
    }
    
    @RequestMapping(value="/left.do")
	public String left(HttpServletRequest request , Model model){
    	model.addAttribute("useCoins",Project.getUseCoinNames());
    	model.addAttribute("project",Project.getPropertieMap());
		return "adminFrame/left";
	}
    
	@RequestMapping(value="/copysInsert.do")
	public String copysInsert(HttpServletRequest request , Model model){
		return "admin/copysInsert";
	}
	@ResponseBody
    @RequestMapping(value="/copysInsertProcess.do"  , produces="application/json; charset=utf8")
    public String copysInsertProcess(HttpServletRequest request){
    	JSONObject obj = new JSONObject();
    	obj.put("result", "fail");
    	HttpSession session = request.getSession();
    	if(!AdminUtil.highAdminCheck(session)){
    		obj.put("msg" , "????????? ????????????.");
    		return obj.toJSONString();
    	}
    	try {
    		int tidx = Integer.parseInt(""+request.getParameter("tidx"));
    		int startIdx = Integer.parseInt(""+request.getParameter("startIdx"));
    		int count = Integer.parseInt(""+request.getParameter("count"));
    		double money = Double.parseDouble(""+request.getParameter("money"));
    		String slossCut = ""+request.getParameter("lossCut");
    		String sprofitCut = ""+request.getParameter("profitCut");
    		String smaxUSDT = ""+request.getParameter("maxUSDT");
			Double lossCut = null;
			Double profitCut = null;
			Double maxUSDT = null;
    		if(!slossCut.isEmpty())
    			lossCut = Double.parseDouble(slossCut);
    		if(!sprofitCut.isEmpty())
    			profitCut = Double.parseDouble(sprofitCut);
    		if(!smaxUSDT.isEmpty())
    			maxUSDT = Double.parseDouble(smaxUSDT);

    		Member trader = Member.getMemberByIdx(tidx);
    		trader.insertTrader();
    		
    		for(int i = 0; i < count; i++){
    			int uidx = startIdx+i;
    			for(int j = 0; j < 4; j++){
    				String symbol = Coin.getCoinInfo(j).coinName+"USDT";
    				Copytrade copy = new Copytrade(uidx, tidx, symbol, false, money, null, lossCut, profitCut, maxUSDT, CopytradeState.RUN.getValue(), null, 0, 0, Send.getTime());
    				Copytrade.pushCopytrade(copy);
    			}
    		}
    		obj.put("result", "suc");
    		obj.put("msg" , "?????????????????????.");
		} catch (Exception e) {
			obj.put("msg" , "??????????????????.");
		}
    	return obj.toJSONString();
    }
	@RequestMapping(value="/copysRelease.do")
	public String copysRelease(HttpServletRequest request , Model model){
		return "admin/copysRelease";
	}
	@RequestMapping(value="/wdPhoneList.do")
	public String wdPhoneList(HttpServletRequest request , Model model){
		model.addAttribute("list",sampleDAO.list("selectWdPhone"));
		return "admin/wdPhoneList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/wdPhoneInsert.do" , produces="application/json; charset=utf8")
    public String wdPhoneInsert(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		String phonenum = request.getParameter("phonenum");
		EgovMap phone = new EgovMap();
		phone.put("phonenum", phonenum);

    	int idx = (int)sampleDAO.insert("insertWdPhone",phone);
    	phone.put("idx", idx);
    	Project.getWdPhoneList().add(phone);
    	AdminUtil.insertAdminLog(request, sampleDAO, AdminLog.ADMINPHONE, -1, null, 1, phonenum, null);
    	obj.put("result", "suc");
    	return obj.toJSONString();
    }
	
	@ResponseBody
	@RequestMapping(value = "/wdPhoneDelete.do" , produces="application/json; charset=utf8")
    public String wdPhoneDelete(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		String idx = request.getParameter("idx");

    	sampleDAO.delete("deleteWdPhone",idx);
    	ArrayList<EgovMap> phonelist = Project.getWdPhoneList();
    	String deletePhone = "";
    	for(EgovMap m : phonelist){
    		if(m.get("idx").toString().equals(idx)){
				deletePhone += m.get("phonenum").toString();
    			phonelist.remove(m);
    			break;
    		}
    	}
    	AdminUtil.insertAdminLog(request, sampleDAO, AdminLog.ADMINPHONE, -1, null, 0, deletePhone, null);
    	obj.put("result", "suc");
    	return obj.toJSONString();
    }
	
	@ResponseBody
    @RequestMapping(value="/copysReleaseProcess.do"  , produces="application/json; charset=utf8")
    public String copysReleaseProcess(HttpServletRequest request){
    	JSONObject obj = new JSONObject();
    	obj.put("result", "fail");
    	HttpSession session = request.getSession();
    	if(!AdminUtil.highAdminCheck(session)){
    		obj.put("msg" , "????????? ????????????.");
    		return obj.toJSONString();
    	}
    	try {
    		int tidx = Integer.parseInt(""+request.getParameter("tidx"));
    		int count = Integer.parseInt(""+request.getParameter("count"));

    		for(int i = 0; i < count; i++){
    			Member trader = Member.getMemberByIdx(tidx+i);
    			if(trader != null){
    				trader.traderRelease();
    				EgovMap in = new EgovMap();
    				in.put("tuseridx", trader.userIdx);
    				sampleDAO.delete("deleteUseridxTrader",in);
    			}
    		}
    		obj.put("result", "suc");
    		obj.put("msg" , "?????????????????????.");
		} catch (Exception e) {
			obj.put("msg" , "??????????????????.");
		}
    	return obj.toJSONString();
    }
	
	@ResponseBody
	@RequestMapping(value = "/siseCheck.do" , produces="application/json; charset=utf8")
    public String siseCheck(HttpServletRequest request){
    	ArrayList<Coin> useCoins = Project.getUseCoinList();
    	String text = "????????? ?????? : "+useCoins.size()+"???\n";
    	text += "useCoinMap : "+Project.getUseCoinMap()+"\n";
    	for(Coin coin : useCoins){
    		text += coin.coinName+" fundingRate : "+coin.fundingRate+"\n";
    	}
    	text += "\n";
		for(Coin coin : useCoins){
			text += coin.coinName+ " long ?????? : "+ coin.getSise("long")+"\n";
			text += coin.coinName+ " short ?????? : "+ coin.getSise("short")+"\n";
		}
		
		text += "////////////////////////////////////////////\n";
		
		text += "new siseload ?????? : "+Project.isNewSiseLoad()+"\n";
		text += "copytrade ?????? : "+Project.isCopytrade()+"\n";
		text += "?????? ????????? ?????? : "+Project.isFeeAccum()+"\n";
		text += "?????? ????????? ????????? ?????? : "+Project.isFeeReferral()+"\n";
		text += "copytrade ?????? : "+Project.isCopytrade()+"\n";
		text += "?????????????????? ????????? ?????? ?????? : "+Project.isCopyRequest()+"\n";
		text += "????????? ?????? ?????? : "+Project.isInverse()+"\n";
		text += "?????? ????????? ?????? ?????? : "+Project.isCoinDeposit()+"\n";
		text += "?????? ????????? ?????? ?????? : "+Project.isKrwDeposit()+"\n";
		text += "P2P ????????? ?????? ?????? : "+Project.isP2P()+"\n";
		text += "??????????????? ????????? ?????? ?????? ?????? : "+Project.isTuserFeeIsParent()+"\n";
		text += "?????? ????????? ?????? ?????? : "+Project.isDepositFee()+"\n";
		text += "?????? ????????? : "+SocketHandler.sh.setting.rate+"\n";
		text += "?????? ?????? ????????? ??????????????? : "+Project.getChongMaxRate()+"\n";
		text += "////////////////////////////////////////////\n";
		if(Project.isWdPhoneMsg()){
			text += "????????? ?????? ?????? :\n";
			for(EgovMap m : Project.getWdPhoneList()){
				text += m.get("phonenum")+"\n";
			}
		}
		text += "////////////////////////////////////////////\n";
		
    	return text+"ok";
    }
	
	@ResponseBody
	@RequestMapping(value = "/memberCheck.do" , produces="application/json; charset=utf8")
    public String memberCheck(HttpServletRequest request){
    	String text = "????????? or ?????? ?????? ??????(?????????????????? != ??????) ////////////////////////////////////////////\n\n";
    	synchronized (SocketHandler.members) {
    		for(Member m : SocketHandler.members){
    			double wallet = m.getWallet();
    			double withdrawWallet = m.getWithdrawWallet();
    			if(Math.abs(wallet-withdrawWallet) > 0.0001)
    				text += "userIdx : "+m.userIdx+" / "+m.getName()+" ?????? ?????? : "+m.getWallet()+" / ???????????? : "+m.getWithdrawWallet()+"\n";
    		}
		}
    	text += "\n\n////////////////////////////////////////////\n\n";
    	text += "?????????????????? -??? ??????(??????) ////////////////////////////////////////////\n\n";
    	synchronized (SocketHandler.members) {
    		for(Member m : SocketHandler.members){
    			double withdrawWallet = m.getWithdrawWallet();
    			if(withdrawWallet < 0)
    				text += "userIdx : "+m.userIdx+" / "+m.getName()+" ?????? ?????? : "+m.getWallet()+" / ???????????? : "+m.getWithdrawWallet()+"\n";
    		}
		}
    	text += "\n\n////////////////////////////////////////////\n\n";
    	text += "????????? ?????????????????? DB ????????? ////////////////////////////////////////////\n\n";
    	
    	ArrayList<EgovMap> copyCounts = (ArrayList<EgovMap>)sampleDAO.list("selectAllCopyCount");
    	for(EgovMap m : copyCounts){
    		int cnt = Integer.parseInt(m.get("cnt").toString());
    		int userIdx = Integer.parseInt(m.get("uidx").toString());
    		ArrayList<Copytrade> alist = Copytrade.getCopytrades(userIdx);
    		if(cnt != alist.size()){
    			Member mem = Member.getMemberByIdx(userIdx);
    			text += "userIdx : "+userIdx+" / "+mem.getName()+" ?????? ?????????????????? ?????? : "+alist.size()+" / DB : "+cnt+"\n";
    		}
    	}
    	
    	return text+"ok";
    }
}












