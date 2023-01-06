<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Thu Dec 01 2022 07:56:03 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="638d805ee804c441330a535c" data-wf-site="638d805ee804c444b60a5350">
<head>
<jsp:include page="../usdscashFrame/header2.jsp" />
</head>
<body class="body">
	<div class="frame">
		<jsp:include page="../usdscashFrame/top2.jsp"/>
		<div class="article">
			<div class="banner">
				<div class="b_img login">
					<div class="b_box">
						<h1 class="heading"><spring:message code="menu.register"/></h1>
					</div>
				</div>
			</div>
			<div class="form-block w-form">
				<form id="joinForm" name="joinForm">
					<input type="hidden" name="terms1" id="terms1" value="0"/>
					<input type="hidden" name="terms2" id="terms2" value="0"/>
					<div class="section">
						<div class="login_section">
							<div class="r_step_area">
								<div class="r_step on" id="subtitle1">
									<div class="r_deco on"></div>
									<div>1.<spring:message code="join.termsAgree"/></div>
								</div>
								<div class="r_step" id="subtitle2">
									<div class="r_deco"></div>
									<div>2. <spring:message code="join.infoInput"/></div>
								</div>
								<div class="r_step" id="subtitle3">
									<div class="r_deco"></div>
									<div>3. <spring:message code="join.checkInfo"/></div>
								</div>
								<div class="r_step" id="subtitle4">
									<div class="r_deco"></div>
									<div>4.<spring:message code="join.subscriptionComplete"/></div>
								</div>
							</div>
							<div class="r_block" id="block1">
								<div class="login_title"><spring:message code="join.termsAgree"/></div>
								<div class="login_txt"><spring:message code="join.infoInputTxt"/></div>
								<div class="login_title"><spring:message code="support.tac"/></div>
								<div class="r_term"> <div><spring:message code="support.tac"/></div> </div>
								<div class="check_box" onclick="termsCheck('terms1')" style="cursor:pointer">
									<div class="check_area" id="terms1Check"> <img src="/usdscash/webflow/images/check_whitesmokesvg.svg" loading="lazy" alt="" class="check_icon"> </div>
									<div><spring:message code="copyNoti.tConsent" /></div>
								</div>
								<div class="login_title"><spring:message code="menu.info"/></div>
								<div class="login_txt"><spring:message code="join.infoTxt"/></div>
								<div class="r_term"> <div><spring:message code="support.personalInfoText"/></div> </div>
								<div class="check_box" onclick="termsCheck('terms2')" style="cursor:pointer">
									<div class="check_area" id="terms2Check"> <img src="/usdscash/webflow/images/check_whitesmokesvg.svg" loading="lazy" alt="" class="check_icon"> </div>
									<div><spring:message code="copyNoti.tConsent" /></div>
								</div>
								<div class="general_btn_area">
									<a href="/usdscash/main.do" class="genral_btn _2 w-button"><spring:message code="wallet.cancel"/></a>
									<a href="javascript:termsCheckAll()" class="genral_btn w-button"><spring:message code="wallet.confirm"/></a>
								</div>
							</div>
							<div class="r_block" id="block2" style="display:none;">
								<div class="login_title"><spring:message code="join.infoInput"/></div>
								<div class="r_general">
									<div class="r_input_warp">
										<div class="r_input_title"> <span class="star">*</span><spring:message code="join.name" /> </div>
										<div class="r_input_box">
											<input type="text" class="login_input w-input" name="name" id="name">
											<div class="regist_warn" id="nameTxt"></div>
										</div>
									</div>
									<div class="r_input_warp">
										<div class="r_input_title"> <span class="star">*</span><spring:message code="join.id" /> </div>
										<div class="r_input_box">
											<input type="text" class="login_input w-input" name="id" id="id">
											<a href="javascript:idCheck()" class="r_btn w-button" id="idBtn"><spring:message code="join.idcheck" /></a>
											<div class="regist_warn" id="idTxt"></div>
										</div>
									</div>
									<div class="r_input_warp">
										<div class="r_input_title"> <span class="star">*</span><spring:message code="join.pw" /> </div>
										<div class="r_input_box">
											<input type="text" class="login_input w-input" name="pw" id="pw">
											<div class="circle_brn" onclick="pwpopToggle()">?</div>
											<div class="regist_warn" id="pwTxt"></div>
										</div>
									</div>
									<div class="r_input_warp">
										<div class="r_input_title"> <span class="star">*</span><spring:message code="join.pwConfirm" /> </div>
										<div class="r_input_box">
											<input type="text" class="login_input w-input" name="pwCheck" id="pwCheck">
											<div class="regist_warn" id="pwCheckTxt"></div>
										</div>
									</div>
									<div class="r_input_warp">
										<div class="r_input_title"> <span class="star">*</span><spring:message code="join.phone" /> </div>
										<div class="r_input_box">
											<input type="text" class="login_input w-input" name="phone1" id="phone1">
											<div>-</div>
											<input type="text" class="login_input w-input" name="phone2" id="phone2">
											<div>-</div>
											<input type="text" class="login_input w-input" name="phone3" id="phone3">
											<a href="javascript:auth()" class="r_btn w-button" id="phoneBtn"><spring:message code="join.request" /></a>
											<div class="regist_warn" id="phoneTxt"></div>
										</div>
									</div>
									<div class="r_input_warp">
										<div class="r_input_title"> <span class="star">*</span><spring:message code="join.email" /> </div>
										<div class="r_input_box">
											<input type="text" class="login_input w-input" name="email1" id="email1">
											<div>@</div>
											<input type="text" class="login_input w-input" name="email2" id="email2">
											<select class="login_input select w-select" onchange="email2Select(this)">
												<option value="-1"></option>
												<option value="naver.com">naver.com</option>
												<option value="hanmail.net">hanmail.net</option>
												<option value="hotmail.com">hotmail.com</option>
												<option value="nate.com">nate.com</option>
												<option value="yahoo.co.kr">yahoo.co.kr</option>
												<option value="empas.com">empas.com</option>
												<option value="dreamwiz.com">dreamwiz.com</option>
												<option value="freechal.com">freechal.com</option>
												<option value="lycos.co.kr">lycos.co.kr</option>
												<option value="korea.com">korea.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="hanmir.com">hanmir.com</option>
												<option value="paran.com">paran.com</option>
											</select>
											<div class="regist_warn" id="emailTxt"></div>
										</div>
									</div>
									<div class="r_input_warp">
										<div class="r_input_title"> <span class="star">*</span><spring:message code="join.invite"/> </div>
										<div class="r_input_box">
											<input type="text" class="login_input w-input" name="inviteCode" id="inviteCode" value="${invi}">
											<div class="regist_warn" id="emailTxt"></div>
										</div>
									</div>
								</div>
								<div class="general_btn_area">
									<a href="javascript:step('1')" class="genral_btn _2 w-button"><spring:message code="affiliate.prev"/></a>
									<a href="javascript:userData()" class="genral_btn w-button"><spring:message code="wallet.confirm"/></a>
								</div>
							</div>
							<div class="r_block" id="block3" style="display:none;">
								<div class="login_title"><spring:message code="join.checkInfo"/></div>
								<div class="r_general">
									<div class="r_input_warp">
										<div class="r_input_title"><spring:message code="join.name" /></div>
										<div class="r_input_box"> <div class="r_txt" id="jname"></div> </div>
									</div>
									<div class="r_input_warp">
										<div class="r_input_title"><spring:message code="join.id" /></div>
										<div class="r_input_box"> <div class="r_txt" id="jid"></div> </div>
									</div>
									<div class="r_input_warp">
										<div class="r_input_title"><spring:message code="join.phone" /></div>
										<div class="r_input_box"> <div class="r_txt" id="jphone"></div> </div>
									</div>
									<div class="r_input_warp">
										<div class="r_input_title"><spring:message code="join.email" /></div>
										<div class="r_input_box"> <div class="r_txt" id="jemail"></div> </div>
									</div>
								</div>
								<div class="general_btn_area">
									<a href="javascript:step('2')" class="genral_btn _2 w-button"><spring:message code="affiliate.prev"/></a>
									<a href="javascript:join()" class="genral_btn w-button"><spring:message code="wallet.confirm"/></a>
								</div>
							</div>
							<div class="r_block" id="block4" style="display:none;">
								<div class="login_title"><spring:message code="join.subscriptionComplete"/></div>
								<div class="r_general">
									<div class="r_box _2">
										<div class="complete">
											<strong><spring:message code="root.project"/></strong>
											<spring:message code="join.subscriptionCompleteTxt"/>
										</div>
										<div><spring:message code="pop.show.login" /></div>
										<img src="/usdscash/webflow/images/usds_logo_2.svg" loading="lazy" alt="" class="r_checkimg">
									</div>
									<div class="r_box">
										<div><spring:message code="pop.show.login"/></div>
									</div>
								</div>
								<div class="general_btn_area">
									<a href="/usdscash/login.do" class="genral_btn w-button"><spring:message code="menu.login" /></a>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<jsp:include page="../usdscashFrame/footer2.jsp" />
		<div class="pop registpop" id="pwpop" style="display:none;">
			<div class="pop_warn">
				<div class="pop_titleblock">
					<div>비밀번호 안내</div>
					<div class="exsit_btn" onclick="pwpopToggle()">
						<img src="/usdscash/webflow/images/wx_black.png" loading="lazy" sizes="100vw" srcset="/usdscash/webflow/images/wx_black-p-500.png 500w, /usdscash/webflow/images/wx_black-p-800.png 800w, /usdscash/webflow/images/wx_black-p-1080.png 1080w, /usdscash/webflow/images/wx_black-p-1600.png 1600w, /usdscash/webflow/images/wx_black.png 1600w" alt="" class="exsit_icon">
					</div>
				</div>
				<div class="pop_general">
					<div class="pop_txt"><spring:message code="join.pwTerms"/></div>
				</div>
			</div>
		</div>
		<div class="pop login_pop" id="authPop" style="display:none;">
			<div class="l_pop _1">
				<div class="exsit_btn" onclick="authPopToggle()">
					<img src="/usdscash/webflow/images/wx_black.png" loading="lazy" sizes="100vw" srcset="/usdscash/webflow/images/wx_black-p-500.png 500w, /usdscash/webflow/images/wx_black-p-800.png 800w, /usdscash/webflow/images/wx_black-p-1080.png 1080w, /usdscash/webflow/images/wx_black-p-1600.png 1600w, /usdscash/webflow/images/wx_black.png 1600w" alt="" class="exsit_icon">
				</div>
				<div class="login_title"><spring:message code="join.authenticate"/></div>
				<div class="form-block w-form">
					<form id="authForm" name="authForm">
						<div class="l_title"><spring:message code="wallet.code"/></div>
						<div class="l_inputbox">
							<input type="text" class="input2 w-input" name="authCode" id="authCode">
						</div>
					</form>
				</div>
				<a href="javascript:authChk()" class="genral_btn w-button"><spring:message code="wallet.confirm"/></a>
			</div>
		</div>
	</div>
	<jsp:include page="../usdscashFrame/bottom2.jsp" />
	<script>
	function idCheck(){
		var data = $("#joinForm").serialize();
		$.ajax({
			type :"post",
			data : data ,
			dataType : "json" ,
			url : "/usdscash/idCheck.do",
			success:function(data){
				if(data.result == "success"){
					$("#idBtn").html("<spring:message code='join.comfcode'/>");
				}
				else{
					alert(data.msg);
					$("#id").focus();
				}
			},
			error:function(e){ console.log("ajax error"); }
		});
	}
	
	function pwpopToggle(){
		if($("#pwpop").css("display") == "none"){
			$("#pwpop").css("display", "flex");
		}
		else{
			$("#pwpop").hide();
		}
	}
	
	function authPopToggle(){
		if($("#authPop").css("display") == "none"){
			$("#authPop").css("display", "flex");
		}
		else{
			$("#authPop").hide();
		}
	}
	
	let authCheck = false;
	function auth(){
		var data = $("#joinForm").serialize();
		$.ajax({
			type :"post",
			data : data ,
			dataType : "json" ,
			url : "/usdscash/auth.do",
			success:function(data){
				if(data.result == 'success'){
					authPopToggle();
				}
				else{
					alert(data.msg);
					$("#phoneBtn").html("<spring:message code='join.comfcode'/>");
				}
			}
		})
	}
	function authChk(){
		var data = $("#authForm").serialize();
		$.ajax({
			type:'post',
			data : data,
			url :'/usdscash/authChk.do',
			success:function(data){
				alert(data.msg);
				if(data.result == 'success'){
					authCheck = true;
					$("#phone").attr("readonly", "readonly");
					$("#authBtn").attr("href", "#");
					$("#authBtn").html("<spring:message code='join.comfcode'/>");
					$("#authPop").hide();
				}
			}
		})
	}

	function email2Select(obj){
		if(obj.value == "-1"){
			$("#email2").val("");
		}
		else{
			$("#email2").val(obj.value);
		}
	}
	</script>
	<script>
	function step(num){
		$(".r_step").removeClass("on");
		$(".r_deco").removeClass("on");
		$("#subtitle"+num).addClass("on");
		$("#subtitle"+num+" .r_deco").addClass("on");
		
		$(".r_block").hide();
		$("#block"+num).css("display", "flex");
		
		location.href="#joinForm";
	}

	function termsCheck(name){
		if($("#"+name).val() == 0){
			$("#"+name).val(1);
			$("#"+name+"Check").addClass("click");
		}
		else{
			$("#"+name).val(0);
			$("#"+name+"Check").removeClass("click");
		}
	}
	function termsCheckAll(){
		let terms1 = $("#terms1").val();
		let terms2 = $("#terms2").val();
		if(terms1==0 || terms2==0){
			alert("<spring:message code='copyNoti.tConsent_advice'/>");
			return;
		}
		else{
			step('2');
		}
	}
	
	function userData(){
		if(!authCheck){
			alert("<spring:message code='join.phoneconfirm'/>");
			return;
		}
		
		var data = $("#joinForm").serialize();
		$.ajax({
			type :"post",
			data : data ,
			dataType : "json" ,
			url : "/usdscash/userDataCheck.do",
			success:function(data){
				if(data.result == "success"){
					$("#jname").html($("#name").val());
					$("#jid").html($("#id").val());
					$("#jphone").html($("#phone1").val()+$("#phone2").val()+$("#phone3").val());
					$("#jemail").html($("#email1").val()+"@"+$("#email2").val());

					step('3');
				}
				else{
					alert(data.msg);
				}
			},
			error:function(e){ console.log("ajax error"); }
		});
	}

	function join(){
		if(!authCheck){
			alert("<spring:message code='join.phoneconfirm'/>");
			return;
		}
		
		var data = $("#joinForm").serialize();
		$.ajax({
			type :"post",
			data : data ,
			dataType : "json" ,
			url : "/usdscash/joinProcess.do",
			success:function(data){
				if(data.result == "success"){
					step('4');
					return;
				}
				else{
					alert(data.msg);
					return;
				}
			},
			error:function(e){ console.log("ajax error"); }
		});
	}
	</script>
</body>
</html>