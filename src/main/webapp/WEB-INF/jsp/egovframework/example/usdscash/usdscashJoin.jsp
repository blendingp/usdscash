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
						<h1 class="heading">회원가입</h1>
						<div>회원가입을 통해 <spring:message code="root.project"/>의 보험 서비스를 시작해보세요</div>
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
									<div>1.약관동의</div>
								</div>
								<div class="r_step" id="subtitle2">
									<div class="r_deco"></div>
									<div>2. 회원정보입력</div>
								</div>
								<div class="r_step" id="subtitle3">
									<div class="r_deco"></div>
									<div>3. 입력정보확인</div>
								</div>
								<div class="r_step" id="subtitle4">
									<div class="r_deco"></div>
									<div>4.가입완료</div>
								</div>
							</div>
							<div class="r_block" id="block1">
								<div class="login_title">약관동의</div>
								<div class="login_txt">홈페이지 회원가입을 위해서는 아래의 홈페이지 이용약관, 개인정보 수집 및 이용에 대한 정책을 읽어보시고 동의하셔야 합니다.</div>
								<div class="login_title">홈페이지 이용약관</div>
								<div class="r_term"> <div>홈페이지 이용약관 내용</div> </div>
								<div class="check_box" onclick="termsCheck('terms1')" style="cursor:pointer">
									<div class="check_area" id="terms1Check"> <img src="/usdscash/webflow/images/check_whitesmokesvg.svg" loading="lazy" alt="" class="check_icon"> </div>
									<div>위 홈페이지 이용약관에 대해 동의합니다.</div>
								</div>
								<div class="login_title">개인정보 수집 및 이용에 대한 안내</div>
								<div class="login_txt">홈페이지 일반회원가입을 위한 개인정보 수집 및 이용을 위하여 개인정보보호법 제15조 및 제22조에 따라 귀하의 동의를 받고자 합니다.</div>
								<div class="r_term"> <div>개인정보 수집 및 이용에 대한 안내 내용</div> </div>
								<div class="check_box" onclick="termsCheck('terms2')" style="cursor:pointer">
									<div class="check_area" id="terms2Check"> <img src="/usdscash/webflow/images/check_whitesmokesvg.svg" loading="lazy" alt="" class="check_icon"> </div>
									<div>위 홈페이지 이용약관에 대해 동의합니다.</div>
								</div>
								<div class="general_btn_area">
									<a href="/usdscash/main.do" class="genral_btn _2 w-button">취소</a>
									<a href="javascript:termsCheckAll()" class="genral_btn w-button">확인</a>
								</div>
							</div>
							<div class="r_block" id="block2" style="display:none;">
								<div class="login_title">회원정보입력</div>
								<div class="login_txt"> <span class="star">*</span> 표시항목은 필수입력사항입니다(일반전화 제외) </div>
								<div class="r_general">
									<div class="r_input_warp">
										<div class="r_input_title"> <span class="star">*</span>이름 </div>
										<div class="r_input_box">
											<input type="text" class="login_input w-input" name="name" id="name">
											<div class="regist_warn" id="nameTxt"></div>
										</div>
									</div>
									<div class="r_input_warp">
										<div class="r_input_title"> <span class="star">*</span>아이디 </div>
										<div class="r_input_box">
											<input type="text" class="login_input w-input" name="id" id="id">
											<a href="javascript:idCheck()" class="r_btn w-button" id="idBtn">중복확인</a>
											<div class="regist_warn" id="idTxt"></div>
										</div>
									</div>
									<div class="r_input_warp">
										<div class="r_input_title"> <span class="star">*</span>비밀번호 </div>
										<div class="r_input_box">
											<input type="text" class="login_input w-input" name="pw" id="pw">
											<div class="circle_brn" onclick="pwpopToggle()">?</div>
											<div class="regist_warn" id="pwTxt"></div>
										</div>
									</div>
									<div class="r_input_warp">
										<div class="r_input_title"> <span class="star">*</span>비밀번호 확인 </div>
										<div class="r_input_box">
											<input type="text" class="login_input w-input" name="pwCheck" id="pwCheck">
											<div class="regist_warn" id="pwCheckTxt"></div>
										</div>
									</div>
									<div class="r_input_warp">
										<div class="r_input_title"> <span class="star">*</span>휴대폰번호 </div>
										<div class="r_input_box">
											<input type="text" class="login_input w-input" name="phone1" id="phone1">
											<div>-</div>
											<input type="text" class="login_input w-input" name="phone2" id="phone2">
											<div>-</div>
											<input type="text" class="login_input w-input" name="phone3" id="phone3">
											<a href="javascript:auth()" class="r_btn w-button" id="phoneBtn">문자 인증</a>
											<div class="regist_warn" id="phoneTxt"></div>
										</div>
									</div>
									<div class="r_input_warp">
										<div class="r_input_title"> <span class="star">*</span>이메일 </div>
										<div class="r_input_box">
											<input type="text" class="login_input w-input" name="email1" id="email1">
											<div>@</div>
											<input type="text" class="login_input w-input" name="email2" id="email2">
											<select class="login_input select w-select" onchange="email2Select(this)">
												<option value="-1">직접입력</option>
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
								</div>
								<div class="general_btn_area">
									<a href="javascript:step('1')" class="genral_btn _2 w-button">이전</a>
									<a href="javascript:userData()" class="genral_btn w-button">확인</a>
								</div>
							</div>
							<div class="r_block" id="block3" style="display:none;">
								<div class="login_title">입력정보확인</div>
								<div class="r_general">
									<div class="r_input_warp">
										<div class="r_input_title">이름</div>
										<div class="r_input_box"> <div class="r_txt" id="jname"></div> </div>
									</div>
									<div class="r_input_warp">
										<div class="r_input_title">아이디</div>
										<div class="r_input_box"> <div class="r_txt" id="jid"></div> </div>
									</div>
									<div class="r_input_warp">
										<div class="r_input_title">휴대폰번호</div>
										<div class="r_input_box"> <div class="r_txt" id="jphone"></div> </div>
									</div>
									<div class="r_input_warp">
										<div class="r_input_title">이메일</div>
										<div class="r_input_box"> <div class="r_txt" id="jemail"></div> </div>
									</div>
								</div>
								<div class="general_btn_area">
									<a href="javascript:step('2')" class="genral_btn _2 w-button">이전</a>
									<a href="javascript:join()" class="genral_btn w-button">확인</a>
								</div>
							</div>
							<div class="r_block" id="block4" style="display:none;">
								<div class="login_title">가입완료</div>
								<div class="r_general">
									<div class="r_box _2">
										<div class="complete"><strong><spring:message code="root.project"/></strong> 회원가입이 완료되었습니다.</div>
										<div>로그인하신 후 서비스를 이용하실 수 있습니다.</div>
										<img src="/usdscash/webflow/images/usds_logo_2.svg" loading="lazy" alt="" class="r_checkimg">
									</div>
									<div class="r_box">
										<div>기타 문의사항은 이메일상담신청 또는 고객센터(0000-0000)로 연락 주시기 바랍니다.</div>
									</div>
								</div>
								<div class="general_btn_area">
									<a href="/usdscash/login.do" class="genral_btn w-button">로그인</a>
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
					<div class="pop_txt"> •"영문+숫자"조합 10자리 이상 또는 "영문+숫자+특수문자"조합 8자리 이상으로 입력하여 주시기 바랍니다.<br>• 동일한 단어 또는 숫자 반복은 사용 불가합니다.<br>• 사용자 아이디와 동일하게 사용 불가합니다. </div>
				</div>
			</div>
		</div>
		<div class="pop login_pop" id="authPop" style="display:none;">
			<div class="l_pop _1">
				<div class="exsit_btn" onclick="authPopToggle()">
					<img src="/usdscash/webflow/images/wx_black.png" loading="lazy" sizes="100vw" srcset="/usdscash/webflow/images/wx_black-p-500.png 500w, /usdscash/webflow/images/wx_black-p-800.png 800w, /usdscash/webflow/images/wx_black-p-1080.png 1080w, /usdscash/webflow/images/wx_black-p-1600.png 1600w, /usdscash/webflow/images/wx_black.png 1600w" alt="" class="exsit_icon">
				</div>
				<div class="login_title">휴대폰 인증</div>
				<div class="form-block w-form">
					<form id="authForm" name="authForm">
						<div class="l_title">인증번호</div>
						<div class="l_inputbox">
							<input type="text" class="input2 w-input" name="authCode" id="authCode">
						</div>
					</form>
				</div>
				<a href="javascript:authChk()" class="genral_btn w-button">확인</a>
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
					$("#idBtn").html("확인 완료");
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
					$("#phoneBtn").html("인증 완료");
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
					$("#authBtn").html("인증 완료");
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
			alert("약관에 모두 동의해주세요.");
			return;
		}
		else{
			step('2');
		}
	}
	
	function userData(){
		if(!authCheck){
			alert("휴대폰번호 인증을 진행해주세요.");
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
			alert("휴대폰번호 인증을 진행해주세요.");
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