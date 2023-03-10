package egovframework.example.sample.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;
import org.json.simple.JSONObject;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.sample.classes.Member;
import egovframework.example.sample.classes.Message;
import egovframework.example.sample.classes.SocketHandler;
import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.web.util.Send;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class BoardController {
	
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	@Resource(name="messageSource")
    MessageSource messageSource;
	
	@Resource(name = "fileProperties")
	private Properties fileProperties;
	
	@RequestMapping(value="/personalInfo.do")
	public String personalInfo(HttpServletRequest request, ModelMap model){
		return "board/personalInfo";
	}
	@RequestMapping(value="/customerService.do")
	public String customerService(HttpServletRequest request , ModelMap model){
		HttpSession session = request.getSession();
		session.setAttribute("currentP", "customer");
		int lang = 0;
		if(session.getAttribute("lang") == null || session.getAttribute("lang").equals("EN")) lang = 1;
		else if(session.getAttribute("lang").equals("JP")) lang =2;
		else if(session.getAttribute("lang").equals("CH")) lang = 3;
		else if(session.getAttribute("lang").equals("FC")) lang = 4;
		EgovMap in = new EgovMap();
		in.put("blang", lang);
		List<EgovMap> faqList = (List<EgovMap>)sampleDAO.list("selectFaqListLimit3", in);
		model.addAttribute("faqList", faqList);
		List<EgovMap> noticeList = (List<EgovMap>)sampleDAO.list("selectNoticeListLimit3" , in);
//		for(int i=0; i<noticeList.size(); i++){
//			noticeList.get(i).put("bcontent", StringEscapeUtils.unescapeHtml3(""+noticeList.get(i).get("bcontent")));
//		}
		model.addAttribute("noticeList", noticeList);
		return "board/customer";
	}
	
	@RequestMapping(value="/user/helpCenter.do")
	public String helpCenter(HttpServletRequest request, ModelMap model){
		String title = request.getParameter("title");
		
		model.addAttribute("title", title);
		model.addAttribute("refPage","submitRequest");
		
		return "board/helpCenter";
	}
	
	@ResponseBody
	@RequestMapping(value="/contactInsert.do" , produces = "application/json; charset=utf8")
	public String contactInsert(MultipartHttpServletRequest request){
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		List<MultipartFile> files = request.getFiles("uploadFiles");
		JSONObject obj = new JSONObject();
		if(title == null || title.isEmpty()){
			obj.put("result", "fail");
			obj.put("msg", Message.get().msg(messageSource, "pop.inputSubject", request));
			return obj.toJSONString();
		}
		if(content == null || content.isEmpty()){
			obj.put("result", "fail");
			obj.put("msg", Message.get().msg(messageSource, "pop.inputInquiry", request));
			return obj.toJSONString();
		}
		
		title = title.replaceAll("(?i)<script", "&lt;script");
		content = content.replaceAll("(?i)<script", "&lt;script");
		
		HttpSession session = request.getSession();
		String uidx = session.getAttribute("userIdx").toString();

		EgovMap in = new EgovMap();
		in.put("uidx", uidx);
		in.put("title", title);
		in.put("content", content);
		if(files.size() > 0){
			String fkey = UUID.randomUUID().toString().replaceAll("-", "");
			in.put("fkey", fkey);
			String path = fileProperties.getProperty("file.photo.upload");
			File file = new File(path);
			if(!file.exists()){
				file.mkdirs();
			}
			for(int i=0; i<files.size(); i++){
				if(!files.get(i).isEmpty()){
					String fileNm = files.get(i).getOriginalFilename();
					String saveNm = UUID.randomUUID().toString().replaceAll("-", "") + fileNm.substring(fileNm.lastIndexOf("."));
					try {
						files.get(i).transferTo(new File(path+saveNm));
						in.put("originNm", fileNm);
						in.put("saveNm" ,saveNm);
						sampleDAO.insert("insertFile",in);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		sampleDAO.insert("insertContact" , in);
		
		obj.put("protocol", "submitRequest");
		SocketHandler.sh.sendAdminMessage(obj);
		
		Member mem = Member.getMemberByIdx(Integer.parseInt(uidx));
		Send.sendAdminMsg(mem,"????????? ?????? ????????? ????????????.");
		
		in.put("result", "success");
		return obj.toJSONString();
	}
	
	@RequestMapping(value = "/board/{type}List.do")
	public String notice(@PathVariable("type") String type, HttpServletRequest request, ModelMap model) throws Exception {
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");
		int lang = 0;
		if(session.getAttribute("lang") == null || session.getAttribute("lang").equals("EN")) lang = 1;
		else if(session.getAttribute("lang").equals("JP")) lang = 2;
		else if(session.getAttribute("lang").equals("CH")) lang = 3;
		else if(session.getAttribute("lang").equals("FC")) lang = 4;
		
		PaginationInfo pi = new PaginationInfo();
		if(request.getParameter("pageIndex") == null || request.getParameter("pageIndex").equals("")){
			pi.setCurrentPageNo(1);
		}else{
			pi.setCurrentPageNo(Integer.parseInt(""+request.getParameter("pageIndex")));
		}
		
		pi.setPageSize(10);
		pi.setRecordCountPerPage(10);
		EgovMap in = new EgovMap();
		in.put("first" , pi.getFirstRecordIndex());
		in.put("record" , pi.getRecordCountPerPage());
		in.put("userIdx", userIdx);		
		in.put("bcategory", type);		
		in.put("blang", lang);
		
		List<?> list = null;
		if(type.compareTo("inquiry")!=0){
			pi.setTotalRecordCount((int)sampleDAO.select("selectBoardListCnt" , in));
			list = (List<?>) sampleDAO.list("selectBoardList", in);
		}
		else{
			pi.setTotalRecordCount((int)sampleDAO.select("selectContatListCnt" , in));
			list = (List<?>) sampleDAO.list("selectContatListP", in);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		model.addAttribute("type", type);
		return "board/boardList";
	}
	
	@RequestMapping(value = "/detail.do")
	public String detail(HttpServletRequest request, ModelMap model) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("currentP", "customer");
		String bidx = request.getParameter("bidx");
		String type = request.getParameter("type");
		if((""+type).length()>50 || (""+bidx).length()>30){
			return "board/detail";
		}
		
		EgovMap in = new EgovMap();

		EgovMap ed = null;
		String text = "";
		if(type.compareTo("inquiry")!=0){
			in.put("bidx", bidx);
			ed = (EgovMap) sampleDAO.select("selectBoardDetail", in);
			text = StringEscapeUtils.unescapeHtml3(ed.get("bcontent").toString());
		}
		else{
			in.put("idx", bidx);
			ed = (EgovMap) sampleDAO.select("selectContactDetail", in);
			text = StringEscapeUtils.unescapeHtml3(ed.get("content").toString());
		}
		model.addAttribute("item", ed);		
		model.addAttribute("text", text);		
		model.addAttribute("type", type);		
		return "board/detail";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkdetail.do" , produces="application/json; charset=utf8")
	public String checkdetail(HttpServletRequest request){
		HttpSession session = request.getSession();
		String bidx = request.getParameter("bidx");
		String type = request.getParameter("type");
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		
		EgovMap in = new EgovMap();

		EgovMap ed = null;
		if(type.compareTo("inquiry")!=0){
			in.put("bidx", bidx);
			ed = (EgovMap) sampleDAO.select("selectBoardDetail", in);
		}
		else{
			in.put("idx", bidx);
			ed = (EgovMap) sampleDAO.select("selectContactDetail", in);
		}
		in.put("bidx", bidx);
		
		if(ed==null){
			obj.put("msg", Message.get().msg(messageSource, "pop.no.detail", request));
			return obj.toJSONString();
		}
		obj.put("result", "success");
		return obj.toJSONString();
	}

	@ResponseBody
	@RequestMapping(value="/todayClose.do" , produces = "application/json; charset=utf8")
	public String todayClose(HttpServletRequest request){
		String bidx = request.getParameter("bidx");
		
		if(bidx.length()>30){
			JSONObject obj = new JSONObject();
			return obj.toJSONString();
		}
		HttpSession session = request.getSession();
		JSONObject obj = new JSONObject();
		
		ArrayList<String> todayCloseArray = new ArrayList<>();
		if(session.getAttribute("todayCloseArray") != null){
			todayCloseArray = (ArrayList<String>)session.getAttribute("todayCloseArray");
			for(int i = 0; i < todayCloseArray.size(); i++){
				if(todayCloseArray.get(i).compareTo(bidx)==0){
					return obj.toJSONString();
				}
			}
		}
		todayCloseArray.add(bidx);

		session.setAttribute("todayCloseArray", todayCloseArray);
		return obj.toJSONString();
	}
	
}
