<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<!--  This site was created in Webflow. http://www.webflow.com  -->
<!--  Last Published: Mon Nov 08 2021 08:17:11 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="638d805ee804c465540a5356" data-wf-site="638d805ee804c444b60a5350">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<meta content="login" property="og:title">
<meta content="login" property="twitter:title">
<jsp:include page="../usdscashFrame/header2.jsp"></jsp:include>
</head>
<script>
var auto = "${autoLogout}";
if(auto == "1"){
// 	alert("<spring:message code='join.autoLogout'/>");
	alert("You have been logged out automatically.");
	location.href="/usdscash/login.do";
}
</script>
<body class="body">
	<div class="frame">
		<jsp:include page="../usdscashFrame/top2.jsp"></jsp:include>

		<%-- <div class="article">
			<div class="banner"></div>
			<div class="section">
				<div class="form-block w-form">
					<form action="javascript:login()" id="loginFrm">
						<div class="login_section">
							<div class="l_block">
								<div class="login_block">
									<a href="/usdscash/user/main.do" class="login_logo w-inline-block"> 
										<img src="/usdscash/webflow/images2/usds_logo_2.svg" loading="lazy" alt="" class="l_logo_img">
									</a>
									<div class="login_title">
										<spring:message code="menu.login" />
									</div>
									<div class="l_inputbox _1">
										<div class="l_input_title">
											<spring:message code="join.phone" />
										</div>
										<input type="hidden" name="joinKind" id="joinKind" value="setphone" /> 
										<input type="text" class="input w-input" maxlength="256" placeholder='<spring:message code="join.phoneTxt"/>' name="phone" id="phone"> 
									</div>
									<a href="javascript:sendRequest()" class="l_btn w-button"> 
										<spring:message code="join.request" />
									</a>
									<div class="l_inputbox _2">
										<div class="l_input_title">
											<spring:message code="join.pw" />
										</div>
										<input type="password" class="input w-input" maxlength="256" name="pw" id="pw" placeholder='<spring:message code="join.pWrong"/>' onkeypress="if(event.keyCode==13) {javascript:login(); return false;}">
									</div>
									<div class="l_inputbox _2">
										<div class="l_input_title">
											<spring:message code="join.code" />
										</div>
										<input type="text" class="input w-input" maxlength="256" id="code" name="code" placeholder='<spring:message code="pop.inputConfirmCode"/>' autocomplete="off" onkeypress="if(event.keyCode==13) {javascript:login(); return false;}">
									</div>
									<input type="submit" value="<spring:message code="menu.login" />" data-wait="Please wait..." class="l_btn w-button">
									<a href="#" class="l_btn w-button" onclick="document.getElementById('loginFrm').submit();">
										<spring:message code="menu.login" />
									</a>
									<div class="l_txtbtn_area">
										<a href="#" class="l_txtbtn"><spring:message code="menu.regist" /><span class="l_arrow">&gt;</span></a>
										<a href="" onclick="$('#pwPop').css('display','flex')" class="l_txtbtn">비밀번호찾기<span class="l_arrow">&gt;</span></a><br>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div> --%>

		<div class="frame4">
			<div class="login_block">
				<div class="loginblock"><img src="/usdscash/webflow/images2/wesell_logo.svg" loading="lazy" data-w-id="ea9f9d47-59cb-1533-1095-666329c4628b" alt="" class="login_logo">
					<div class="title4"> <spring:message code="menu.login" /> </div>
					<div class="w-form">
						<form action="javascript:login()" id="loginFrm" class="form-5">
							<div class="regist_btnwarp">
								<input type="hidden" name="joinKind" id="joinKind" value="setphone"/>
								<a href="javascript:setAuth('setphone')" class="button-65 w-button click setphonebtn"><spring:message code="login.phoneauth" /></a> 
								<a href="javascript:setAuth('setemail')" class="button-65 w-button setemailbtn"><spring:message code="login.emailauth" /></a>
								<a href="javascript:setAuth('settelegram')" class="button-65 w-button settelegrambtn"><spring:message code="affiliate.cb.3"/> <spring:message code="join.request"/></a>
							</div>
							
							<label for="name" class="title5 setphone"><spring:message code="join.phone" /></label>
							<label for="name" class="title5 setemail" style="display:none"><spring:message code="join.email" /></label>
							<label for="name" class="title5 settelegram" style="display:none"><spring:message code="join.phone" /></label>
							<div class="loginbox">
								<!-- onkeyup="SetNum(this);" -->
								<input type="text" class="text-field-9 w-input" maxlength="30"  name="phone" id="phone" placeholder="<spring:message code="join.phoneTxt"/>">
								<a href="javascript:sendRequest()" class="button-10 w-button">
									<spring:message	code="join.request" />
								</a>
							</div>
							<label for="code" class="title5">
								<spring:message	code="join.code" />
							</label> 
							<input type="text"	class="text-field-10 w-input" maxlength="256" id="code" name="code" placeholder="<spring:message code="pop.inputConfirmCode"/>" autocomplete="off" onkeypress="if(event.keyCode==13) {javascript:login(); return false;}">
							<label for="email-2" class="title5">
								<spring:message	code="join.pw" />
							</label> 
							<input type="password"	class="text-field-10 w-input" name="pw" id="pw" placeholder="<spring:message code="join.pWrong"/>" onkeypress="if(event.keyCode==13) {javascript:login(); return false;}">
							<div class="login_pwtxt">
								<span onclick="$('#pwPop').css('display','flex')" class="login_pwbtn" style="cursor: pointer;">
									<spring:message code="join.forgotPW" /></span>" / " 
									<span onclick="location.href='/usdscash/join.do'" class="login_pwbtn" style="cursor: pointer;">
									<spring:message code="menu.register2" /></span>
							</div>
							<input type="submit" value="<spring:message code="menu.login" />" data-wait="Please wait..." class="submit-button-2 w-button">
						</form>
		
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="popup" style="display:none;" id="pwPop">
		<div class="password_pop" id="pwPop1">
        <div class="registpop_blcok">
          <div class="poptitle">
            <div class="title6"><spring:message	code="join.forgotPW" /></div>
          </div>
          <div class="w-form">
          	<form action="#" id="loginFrm" class="form-5">
				<label for="name" class="title5"><spring:message code="join.phone" /></label>
					<div class="loginbox">
						<input type="text" class="text-field-9 w-input" maxlength="13" onkeyup="SetNum(this);" name="phoneP" id="phoneP" placeholder="<spring:message code="join.phoneTxt"/>">
						<a href="javascript:sendRequestPop()" class="button-10 w-button">
							<spring:message	code="join.request" />
						</a>
					</div>
					<label for="code" class="title5">
						<spring:message	code="join.code" />
					</label> 
					<input type="text" class="text-field-10 w-input" maxlength="256" id="pCode" name="pCode" placeholder="<spring:message code="pop.inputConfirmCode"/>" autocomplete="off" onkeypress="if(event.keyCode==13) {javascript:login(); return false;}">
			</form>
          </div>
          <div class="pop_btn">
          	<a href="#" class="button-15-copy w-button" onclick="$('#pwPop').css('display','none')">취소</a>
            <a href="javascript:confirmPOP()" class="button-15 w-button">확인</a>
          </div>
          <div class="pop_exist"></div>
        </div>
      </div>
      
      
      <div class="password_pop" id="pwPop2" style="display:none;">
        <div class="registpop_blcok">
          <div class="poptitle">
            <div class="title6"><spring:message	code="join.resetPW" /></div>
          </div>
          <div>
        	<label for="name-2" class="field-label"><spring:message	code="join.newPW" /></label>
		        <input type="password" class="l_p_input w-input" maxlength="256" name="popPW" data-name="Email 3" placeholder="새로운 비밀번호를 입력해주세요" id="popPW" required="">
		        <div class="warn"><spring:message code="join.pwTerms" /></div>
		        <label for="name-2" class="field-label"><spring:message	code="join.checkPW" /></label>
		        <input type="password" class="l_p_input w-input" maxlength="256" name="popPW2" data-name="Email 3" placeholder="새로운 비밀번호를 입력해주세요" id="popPW2" required="">
        	</div>
          
          <div class="pop_btn">
          	<a href="#" class="button-15-copy w-button" onclick="$('#pwPop').css('display','none')">취소</a>
            <a href="javascript:changePW()" class="button-15 w-button">확인</a>
          </div>
          <div class="pop_exist"></div>
        </div>
      </div>
      
	</div>
	<jsp:include page="../usdscashFrame/footer2.jsp"></jsp:include>
	<script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=638d805ee804c444b60a5350" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<script src="/usdscash/webflow/js/webflow.js" type="text/javascript"></script>
	<script type="text/javascript">
		function SetNum(obj) {
			/* val = obj.value;
			if (val.length == 1)
				return;
			re = /[^0-9]/gi;
			let
			temp = val.substr(1, val.length - 1).replace(re, "");
			obj.value = val.charAt(0) + temp; */
		}
		function login() {
			/* if (!checkPhone) {
				alert("<spring:message code='join.phoneconfirm'/>")
				return false;
			}
			var data = $("#loginFrm").serialize(); */
			var formData = new FormData($('#loginFrm')[0]);
			formData.append("checkPhone" , checkPhone+"");
			$.ajax({
				type : 'post',
				data : formData,
				url : '/usdscash/loginProcess.do',
			 	contentType: false,
			 	processData: false,				
				success : function(data) {
					if (data.result == 'success') {
						alert(data.msg);
						location.href = "/usdscash/user/main.do";
					} else {
						console.log(data.msg);
						alert(data.msg);
					}
				}
			})
		}
		var checkPhone = false;
		function sendRequest() {
			$.ajax({
				type : 'post',
				data : {
					'phone' : $("#phone").val(),
					'joinKind' : $("#joinKind").val()
				},
				dataType : 'json',
				url : '/usdscash/verificationPhoneOrEmail.do',
				success : function(data) {
					alert(data.msg);
					checkPhone = true;
				},
				error : function(e) {
					console.log('ajax error ' + JSON.stringify(e));
				}
			})
		}
		
		function sendRequestPop() {
			$.ajax({
				type : 'post',
				data : {
					phone : $("#phoneP").val()
				},
				dataType : 'json',
				url : '/usdscash/verificationPhone.do',
				success : function(data) {
					alert(data.msg);
					checkPhone = true;
				},
				error : function(e) {
					console.log('ajax error ' + JSON.stringify(e));
				}
			})
		}
		
		var userPhone = 0;
		function confirmPOP(){
			 var phone = $("#phoneP").val();
			 var pCode = $("#pCode").val()
			 if(phone==""){
				 alert("<spring:message code='pop.inputPhone'/>");
				 return false;
			 }
			 if(pCode==""){
				 alert("<spring:message code='pop.inputConfirmCode'/>");
				 return false;
			 }
			 console.log(pCode);
			$.ajax({
				type : 'post',
				data : {
					pCode : pCode
				},
				dataType : 'json',
				url : '/usdscash/checkPhoneCode.do',
				success : function(data) {
					alert(data.msg);
					checkPhone = true;
					userPhone = phone;
					$('#pwPop1').css('display','none')
					$('#pwPop2').css('display','flex')
				},
				error : function(e) {
					console.log('ajax error ' + JSON.stringify(e));
				}
			})
		}
		
		function changePW(){
			var phone = userPhone;
			var pw = $("#popPW").val();
			var pw2 = $("#popPW2").val();
			
			$.ajax({
				type : 'post',
				data : {
					phone:phone,
					pw : pw,
					pw2 : pw2
				},
				dataType : 'json',
				url : '/usdscash/changePW.do',
				success : function(data) {
					alert(data.msg);
					$('#pwPop').css('display','none')
				},
				error : function(e) {
					console.log('ajax error ' + JSON.stringify(e));
				}
			})
			
		}
		
		function enterkey() {
			if (window.event.keyCode == 13) {
				login();
			}
		}

		function setAuth(kind){
			$("#joinKind").val(kind);
			$(".setphone").css("display", "none");
			$(".setemail").css("display", "none");
			$(".settelegram").css("display", "none");
			$("."+kind).css("display", "flex");
			
			$(".setphonebtn").removeClass("click");
			$(".setemailbtn").removeClass("click");
			$(".settelegrambtn").removeClass("click");
			$("."+kind+'btn').addClass("click");
		}		
	</script>
</body>
</html>