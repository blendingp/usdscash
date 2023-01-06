package egovframework.example.sample.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import egovframework.example.sample.classes.CointransService;
import egovframework.example.sample.classes.Member;
import egovframework.example.sample.classes.Message;
import egovframework.example.sample.classes.Project;
import egovframework.example.sample.classes.SocketHandler;
import egovframework.example.sample.service.impl.Log;
import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.web.util.Send;
import egovframework.example.sample.web.util.Validation;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class JoinController {

	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	@Resource(name="messageSource")
    MessageSource messageSource;

	@RequestMapping(value = "/login.do")
	public String login(HttpServletRequest request, Model model) throws Exception {
		return "usdscash/usdscashLogin";
	}
	
	@ResponseBody
	@RequestMapping(value = "/loginProcess.do" , method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String loginprocess(HttpServletRequest request, ModelMap model) throws Exception {
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		
		String id = ""+request.getParameter("id");
		String pw = ""+request.getParameter("pw");
		
		EgovMap in = new EgovMap();
		in.put("id", id);
		in.put("pw", pw);
		
		EgovMap info = (EgovMap) sampleDAO.select("selectMemberForLoginById", in);
		
		if(info==null){
			obj.put("msg", Message.get().msg(messageSource, "join.jpWrong", request));
			return obj.toJSONString();
		}
		int userIdx = Integer.parseInt(info.get("idx").toString());
		Member mem = Member.getMemberByIdx(userIdx);

		HttpSession session = request.getSession();
		session.setAttribute("userIdx", info.get("idx"));
		session.setAttribute("userName", info.get("name"));
		session.setAttribute("userPhone", info.get("phone"));
		session.setAttribute("userLevel", info.get("level"));
		session.setAttribute("mute", info.get("mute"));
		session.setAttribute("phoneCode", null);
		session.setAttribute("emailCode", null);
		if(Project.isKrCode())
			session.setAttribute("isKrCode", mem.getKrCode());
		else
			session.setAttribute("isKrCode", true);
			
		in.put("userIdx", info.get("idx"));
		
		String userip = Member.getClientIP(request);
		in.put("userIp",userip);
		
		sampleDAO.update("updateLastLogin",in);
		obj.put("result", "success");
		obj.put("msg", Message.get().msg(messageSource, "pop.loggedin", request));
		obj.put("name", info.get("name"));
		mem.lastLoginWebSession = session;
		
		Log.print("User Login suc userIdx = "+ info.get("idx")+"phone = "+request.getParameter("phone")+" IP = "+userip, 1, "logincheck");
		
		obj.put("result", "success");
		return obj.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/logoutProcess.do", produces = "application/json; charset=utf8")
	public String logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("loginId", null);
		session.setAttribute("userIdx", null);
		session.setAttribute("userPhone", null);
		session.setAttribute("userLevel", null);
		session.setAttribute("userName", null);
		session.setAttribute("inflLogin", null);
		JSONObject obj = new JSONObject();
		obj.put("msg", Message.get().msg(messageSource, "pop.loggedout", request));
		obj.put("level", "1");
		obj.put("result", "success");
		
		Locale locales = new Locale("en");
		session.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, locales);
		session.setAttribute("lang", "EN");
		
		return obj.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/findIdAuth.do" , method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String findIdAuth(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		
		String phone = request.getParameter("sphone");
		
		if(Validation.isNull(phone)){
			obj.put("msg", "휴대폰 번호를 입력해주세요");
			return obj.toJSONString();
		}
		
		try {
			String authCd = Validation.getTempNumber(6);
			if(!Send.sendMexVerificationCode("82" , phone , authCd)){
				obj.put("msg", Message.get().msg(messageSource, "pop.sendError", request));
				return obj.toJSONString();
			}
			HttpSession session = request.getSession();
			session.setAttribute("authPhone", phone); // 인증코드 받을떄 입력한 휴대폰
			session.setAttribute("authCd", authCd); // 인증코드
			session.setAttribute("authStat", false); // 인증 상태
			
			obj.put("msg", "인증코드가 발송되었습니다.");
			obj.put("result", "success");
			return obj.toJSONString();
		} catch (Exception e) {
			// TODO: handle exception
			obj.put("msg", "인증코드 발송중 오류가 발생했습니다 다시 시도해주세요.");
			return obj.toJSONString();
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/findId.do" , method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String findId(HttpServletRequest request, ModelMap model) throws Exception {
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		
		String phone = request.getParameter("sphone");
		String cd = request.getParameter("scode");
		
		if(Validation.isNull(cd)){
			obj.put("msg", "인증코드를 입력해주세요.");
			return obj.toJSONString();
		}
		
		HttpSession session = request.getSession();
		if(!session.getAttribute("authCd").equals(cd)){
			obj.put("msg", "인증코드가 다릅니다.");
			return obj.toJSONString();
		}
		else{
			session.setAttribute("authStat", true); // 인증 상태
			
			EgovMap userInfo = (EgovMap)sampleDAO.select("selectMemberByPhone", phone);
			if(userInfo == null){
				obj.put("msg", "일치하는 회원이 없습니다.");
				return obj.toJSONString();
			}
			
			obj.put("userId", userInfo.get("id"));
			obj.put("result", "success");
			return obj.toJSONString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "/findPwAuth.do" , method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String findPwAuth(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		
		String id = request.getParameter("sid");
		String phone = request.getParameter("sphone");
		
		if(Validation.isNull(id)){
			obj.put("msg", "아이디를 입력해주세요.");
			return obj.toJSONString();
		}
		if(Validation.isNull(phone)){
			obj.put("msg", "휴대폰 번호를 입력해주세요.");
			return obj.toJSONString();
		}
		
		EgovMap in = new EgovMap();
		in.put("id", id);
		in.put("phone", phone);
		EgovMap userInfo = (EgovMap)sampleDAO.select("selectMemberForPwAuth", in);
		if(userInfo == null){
			obj.put("msg", "일치하는 회원이 없습니다.");
			return obj.toJSONString();
		}

		try {
			String authCd = Validation.getTempNumber(6);
			if(!Send.sendMexVerificationCode("82" , phone , authCd)){
				obj.put("msg", Message.get().msg(messageSource, "pop.sendError", request));
				return obj.toJSONString();
			}
			HttpSession session = request.getSession();
			session.setAttribute("authPhone", phone); // 인증코드 받을떄 입력한 휴대폰
			session.setAttribute("authCd", authCd); // 인증코드
			session.setAttribute("authStat", false); // 인증 상태
			
			obj.put("msg", "인증코드가 발송되었습니다.");
			obj.put("result", "success");
			return obj.toJSONString();
		} catch (Exception e) {
			// TODO: handle exception
			obj.put("msg", "인증코드 발송중 오류가 발생했습니다 다시 시도해주세요.");
			return obj.toJSONString();
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/findPw.do" , method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String findPw(HttpServletRequest request, ModelMap model) throws Exception {
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");

		String id = request.getParameter("sid");
		String phone = request.getParameter("sphone");
		String cd = request.getParameter("scode");
		
		if(Validation.isNull(cd)){
			obj.put("msg", "인증코드를 입력해주세요.");
			return obj.toJSONString();
		}
		
		HttpSession session = request.getSession();
		if(!session.getAttribute("authCd").equals(cd)){
			obj.put("msg", "인증코드가 다릅니다.");
			return obj.toJSONString();
		}
		else{
			session.setAttribute("authStat", true); // 인증 상태

			EgovMap in = new EgovMap();
			in.put("id", id);
			in.put("phone", phone);
			
			EgovMap userInfo = (EgovMap)sampleDAO.select("selectMemberForPwAuth", in);
			if(userInfo == null){
				obj.put("msg", "일치하는 회원이 없습니다.");
				return obj.toJSONString();
			}
			
			obj.put("result", "success");
			return obj.toJSONString();
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/changePW.do", produces = "application/json; charset=utf8")
	public String changePW(HttpServletRequest request) throws Exception {
		JSONObject obj = new JSONObject();
		obj.put("result", "false");
		
		HttpSession session = request.getSession();
		String phone = request.getParameter("phone");
		String pw = request.getParameter("spw");
		String pwCheck = request.getParameter("spwCheck");
		
		if(Validation.isNull(pw) || !Validation.isValidPassword(pw)){
			obj.put("msg", Message.get().msg(messageSource, "join.pWrong", request));
			return obj.toJSONString();
		}
		if(pw.compareTo(pwCheck)!=0){
			obj.put("msg", Message.get().msg(messageSource, "join.jpWrong", request));
			return obj.toJSONString();
		}
		
		EgovMap in = new EgovMap();
		in.put("phone", phone);
		in.put("pw", pw);
		sampleDAO.update("updateChangePW" , in);
		
		
		obj.put("msg", Message.get().msg(messageSource, "copyNoti.change", request));
		obj.put("level", "1");
		obj.put("result", "success");
		return obj.toJSONString();
	}
	
	@RequestMapping(value = "/join.do")
	public String join(Model model, HttpServletRequest request) throws Exception {

		return "usdscash/usdscashJoin";
	}
	
	@ResponseBody
	@RequestMapping(value="/joinProcess.do" , produces="application/json; charset=utf8")
	public String joinProcess(HttpServletRequest request) throws UnsupportedEncodingException{
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		
		HttpSession session = request.getSession();
		
		String name = request.getParameter("name"); // 이름
		String id = request.getParameter("id");
		String pw = request.getParameter("pw"); // pw
		String phone = request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3"); // 전화번호
		String email = request.getParameter("email1")+"@"+request.getParameter("email2"); // 이메일
		String inviteCode = request.getParameter("inviteCode"); // 초대코드

		String msg = joinDataCheck(request);
		if(!Validation.isNull(msg)){
			obj.put("msg", msg);
			return obj.toJSONString();
		}
		
		try {
			EgovMap in = new EgovMap();
			name= name.trim();
			pw = pw.trim();
			
			in.put("name", name);
			in.put("id", id);
			in.put("pw", pw);
			in.put("phone", phone);
			in.put("email", email);
			in.put("level", "user");
			in.put("wallet", "0");
			
			if(Validation.isNull(inviteCode)){ // 관리자코드
				in.put("parentsIdx", -1);   // 추천인 -1
			}
			else if(inviteCode != null && !inviteCode.equals("")) {
				in.put("inviteCode", inviteCode);
				//부모를 찾는다
				EgovMap parents = (EgovMap)sampleDAO.select("selectMemberByAdminInvitationCode", in);
				if (parents == null || Member.isBanded(parents.get("idx").toString())) {
					obj.put("msg", Message.get().msg(messageSource, "pop.wrongInvite", request));
					return obj.toJSONString();
				}
				in.put("parentsIdx", ""+parents.get("idx"));
			}
			
			String invi = Validation.getTempNumber(3);
			in.put("inviteCode", invi);
			Project.putDefAddress(in);
			int userIdx = (int)sampleDAO.insert("insertMemberNoWallet", in);
			invi = invi + userIdx;
			in.put("invi", invi);
			in.put("userIdx", userIdx);
			String destinationTag = Validation.getTempNumber(3)+userIdx;
			in.put("destinationTag", destinationTag);
			sampleDAO.update("updateInviteCode",in);
			
			in.put("euserIdx", userIdx);
			in.put("kind", "join");
			CointransService.createBalance(""+userIdx, "USDT");
			
			obj.put("result", "success");
			obj.put("msg", Message.get().msg(messageSource, "pop.welcome", request));
			obj.put("login",false);
			session.setAttribute("phoneCode", null);

			Member mem = Member.getMemberByIdx(userIdx);
			obj.put("protocol", "newMember");
			SocketHandler.sh.sendAdminMessage(obj);
			
			Send.sendAdminMsg(mem,"신규 유저가 가입했습니다.");
			
			return obj.toJSONString();
			
		} catch (Exception e) {
			Log.print("joinProcess err! "+e, 1, "err");
			obj.put("result", "fail");
			obj.put("msg", Message.get().msg(messageSource, "pop.joinFail", request));
			return obj.toJSONString();
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/idCheck.do" , produces="application/json; charset=utf8")
	public String idCheck(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		
		try {
			String id = request.getParameter("id");
			
			if(Validation.isNull(id)){
				obj.put("msg", Message.get().msg(messageSource, "join.inputId", request));
				return obj.toJSONString();
			}
			else{
				EgovMap isId = (EgovMap)sampleDAO.select("selectIsMemberId",id);
				if(isId != null){
					obj.put("msg", Message.get().msg(messageSource, "join.duplId", request));
					return obj.toJSONString();
				}
			}
			
			obj.put("result", "success");
			return obj.toJSONString();
			
		} catch (Exception e) {
			obj.put("result", "fail");
			obj.put("msg", "fail");
			return obj.toJSONString();
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/userDataCheck.do" , produces="application/json; charset=utf8")
	public String userDataCheck(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		
		try {
			String msg = joinDataCheck(request);
			if(msg.compareTo("")!=0){
				obj.put("msg", msg);
				return obj.toJSONString();
			}
			
			obj.put("result", "success");
			obj.put("msg", "가입이 완료되었습니다.");
			return obj.toJSONString();
			
		} catch (Exception e) {
			obj.put("result", "fail");
			obj.put("msg", "가입을 실패하였습니다.");
			return obj.toJSONString();
		}
	}
	
	public String joinDataCheck(HttpServletRequest request){
		String name = request.getParameter("name"); // 이름
		String id = request.getParameter("id");
		String pw = request.getParameter("pw"); // pw
		String pwCheck = request.getParameter("pwCheck");
		String phone = request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3"); // 전화번호
		String email = request.getParameter("email1")+"@"+request.getParameter("email2"); // 이메일
		
		try {
			if(Validation.isNull(name)){
				return Message.get().msg(messageSource, "pop.inputName", request);
			}
			
			if(Validation.isNull(id)){
				return Message.get().msg(messageSource, "join.inputId", request);
			}
			else{
				EgovMap emailCheck = (EgovMap)sampleDAO.select("selectIsMemberId" , id);
				if(emailCheck != null){
					return Message.get().msg(messageSource, "join.duplId", request);
				}
			}
			
			if(Validation.isNull(pw) || !Validation.isValidPassword(pw)){
				return Message.get().msg(messageSource, "join.pWrong", request);
			}
			if(pw.compareTo(pwCheck)!=0){
				return Message.get().msg(messageSource, "join.jpWrong", request);
			}

			if(Validation.isNull(phone)){
				return Message.get().msg(messageSource, "pop.inputPhone", request);
			}
			else{
				EgovMap phoneCheck = (EgovMap)sampleDAO.select("selectIsMemberPhone" , phone);
				if(phoneCheck != null){
					return Message.get().msg(messageSource, "pop.alreadyPhone", request);
				}
			}
			
			if(Validation.isNull(email)){
				return Message.get().msg(messageSource, "join.emailTxt", request);
			}
			else if(!Validation.isValidEmail(email) && email.length() > 50){
				return Message.get().msg(messageSource, "pop.checkEmail", request);
			}
			else{
				EgovMap emailCheck = (EgovMap)sampleDAO.select("selectIsMemberEmail" , email);
				if(emailCheck != null){
					return Message.get().msg(messageSource, "pop.alreadyEmail", request);
				}
			}
			
		} catch (Exception e) {
			return "fail";
		}
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="/auth.do" , produces = "application/json; charset=utf8")
	public String auth(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		
		String phone = request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");
		
		if(Validation.isNull(phone)){
			obj.put("msg", "휴대폰 번호를 입력해주세요");
			return obj.toJSONString();
		}
		else{
			EgovMap isPhone = (EgovMap)sampleDAO.select("selectIsMemberPhone",phone);
			if(isPhone != null){
				obj.put("msg", Message.get().msg(messageSource, "pop.alreadyPhone", request));
				return obj.toJSONString();
			}
		}
		
		try {
			String authCd = Validation.getTempNumber(6);
			if(!Send.sendMexVerificationCode("82" , phone , authCd)){
				obj.put("msg", Message.get().msg(messageSource, "pop.sendError", request));
				return obj.toJSONString();
			}
			HttpSession session = request.getSession();
			session.setAttribute("authPhone", phone); // 인증코드 받을떄 입력한 휴대폰
			session.setAttribute("authCd", authCd); // 인증코드
			session.setAttribute("authStat", false); // 인증 상태
			System.out.println("authCd : "+authCd);
			
			obj.put("msg", Message.get().msg(messageSource, "pop.sendCode", request));
			obj.put("result", "success");
			return obj.toJSONString();
		} catch (Exception e) {
			// TODO: handle exceptionpop.sendError
			obj.put("msg", Message.get().msg(messageSource, "pop.sendError", request));
			return obj.toJSONString();
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/authChk.do" , produces = "application/json; charset=utf8")
	public String authChk(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		String cd = request.getParameter("authCode");
		if(Validation.isNull(cd)){
			obj.put("msg", Message.get().msg(messageSource, "pop.inputConfirmCode", request));
			return obj.toJSONString();
		}
		HttpSession session = request.getSession();
		if(!session.getAttribute("authCd").equals(cd)){
			obj.put("msg", Message.get().msg(messageSource, "pop.wrongPhoneCode", request));
			return obj.toJSONString();
		}
		else{
			session.setAttribute("authStat", true); // 인증 상태
			obj.put("result", "success");
			return obj.toJSONString();
		}
	}
	
	public static String createWallet(String method , String surl, String paremeter) throws IllegalStateException {
		String inputLine = null;
		StringBuffer outResult = new StringBuffer();
		String jsonValue = paremeter;
		try{
			URL url = new URL(surl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			if( paremeter != null )
				conn.setDoOutput(true);
			else
				conn.setDoOutput(false);
			conn.setRequestMethod(method);
			conn.setRequestProperty("User-Agent", "Mozilla/5.0");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Accept-Charset", "UTF-8");
			
			//conn.setRequestProperty("sessionkey", "api:fxvare:51692dad8ff84718864f88499806a5b5:1614852187316:HP7e1F+rHr1Rr0cgn0kPt/KZfF8=:yEfMvy");
			conn.setConnectTimeout(10000);
			conn.setReadTimeout(10000);
			if( paremeter != null){
				OutputStream os = conn.getOutputStream();
				os.write(jsonValue.getBytes("UTF-8"));
				os.flush();
			}
			// 리턴된 결과 읽기
			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			while ((inputLine = in.readLine()) != null) {
				outResult.append(inputLine);
			}
			conn.disconnect();
		}catch(Exception e){
			e.printStackTrace();
		}   
		return outResult.toString();		
	}
}
