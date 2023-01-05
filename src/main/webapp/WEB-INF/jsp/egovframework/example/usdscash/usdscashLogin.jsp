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
<html data-wf-page="638d805ee804c465540a5356" data-wf-site="638d805ee804c444b60a5350">
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
						<h1 class="heading">로그인</h1>
						<div>로그인을 통해 <spring:message code="root.project"/>의 보험 서비스를 시작해보세요</div>
					</div>
				</div>
			</div>
			<div class="section">
				<div class="form-block w-form">
					<form id="loginForm" name="loginForm">
						<div class="login_section">
							<div class="l_block">
								<div class="login_title">로그인</div>
								<div class="login_block">
									<div class="l_inputbox _1">
										<div class="l_input_title">아이디</div>
										<input type="text" class="input w-input" name="id" id="id" placeholder="ID">
									</div>
									<div class="l_inputbox _2">
										<div class="l_input_title">비밀번호</div>
										<input type="password" class="input w-input" name="pw" id="pw" placeholder="Password">
									</div>
									<a href="javascript:loginProcess()" class="l_btn w-button">로그인</a>
									<div class="l_txtbtn_area">
										<a href="javascript:searchPop('1')" class="l_txtbtn">아이디찾기<span class="l_arrow">></span></a>
										<a href="javascript:searchPop('3')" class="l_txtbtn">비밀번호찾기<span class="l_arrow">></span></a>
									</div>
								</div>
							</div>
							<div class="general_btn_area">
								<!-- <a href="#" class="genral_btn _2 w-button">고객상담신청</a>
								<a href="#" class="genral_btn w-button">고객센터</a> -->
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="../usdscashFrame/footer2.jsp" />
		<div class="pop login_pop" style="display:none;">
			<div class="l_pop" id="pop1">
				<div class="exsit_btn" onclick="searchPop()">
					<img src="/usdscash/webflow/images/wx_black.png" loading="lazy" sizes="100vw" srcset="/usdscash/webflow/images/wx_black-p-500.png 500w, /usdscash/webflow/images/wx_black-p-800.png 800w, /usdscash/webflow/images/wx_black-p-1080.png 1080w, /usdscash/webflow/images/wx_black-p-1600.png 1600w, /usdscash/webflow/images/wx_black.png 1600w" alt="" class="exsit_icon">
				</div>
				<div class="login_title">아이디 찾기</div>
				<div class="form-block w-form">
					<form id="idSearchForm" name="idSearchForm">
						<div class="l_title">전화번호</div>
						<div class="l_inputbox">
							<input type="text" class="l_input w-input" name="sphone">
							<a href="javascript:findIdAuth()" class="l_inpit_btn w-button">인증발송</a>
						</div>
						<div class="l_title" id="idCode" style="display:none">인증번호</div>
						<div class="l_inputbox" id="idCodeInput" style="display:none">
							<input type="text" class="input2 w-input" name="scode">
						</div>
					</form>
				</div>
				<a href="javascript:findId()" class="genral_btn w-button">확인</a>
			</div>
			<div class="l_pop" id="pop2">
				<div class="exsit_btn" onclick="searchPop()">
					<img src="/usdscash/webflow/images/wx_black.png" loading="lazy" sizes="100vw" srcset="/usdscash/webflow/images/wx_black-p-500.png 500w, /usdscash/webflow/images/wx_black-p-800.png 800w, /usdscash/webflow/images/wx_black-p-1080.png 1080w, /usdscash/webflow/images/wx_black-p-1600.png 1600w, /usdscash/webflow/images/wx_black.png 1600w" alt="" class="exsit_icon">
				</div>
				<div class="login_title">아이디 찾기</div>
				<div class="l_pop_txt">아이디는 <span class="blue" id="findId">user1</span> 입니다.</div>
				<a href="javascript:searchPop()" class="genral_btn w-button">확인</a>
			</div>
			<div class="l_pop" id="pop3">
				<div class="exsit_btn" onclick="searchPop()">
					<img src="/usdscash/webflow/images/wx_black.png" loading="lazy" sizes="100vw" srcset="/usdscash/webflow/images/wx_black-p-500.png 500w, /usdscash/webflow/images/wx_black-p-800.png 800w, /usdscash/webflow/images/wx_black-p-1080.png 1080w, /usdscash/webflow/images/wx_black-p-1600.png 1600w, /usdscash/webflow/images/wx_black.png 1600w" alt="" class="exsit_icon">
				</div>
				<div class="login_title">비밀번호 찾기</div>
				<div class="form-block w-form">
					<form id="pwSearchForm" name="pwSearchForm">
						<div class="l_title">아이디</div>
						<div class="l_inputbox">
							<input type="text" class="l_input w-input" name="sid">
						</div>
						<div class="l_title">전화번호</div>
						<div class="l_inputbox">
							<input type="text" class="l_input w-input" name="sphone">
							<a href="javascript:findPwAuth()" class="l_inpit_btn w-button">인증발송</a>
						</div>
						<div class="l_title" id="pwCode" style="display:none">인증번호</div>
						<div class="l_inputbox" id="pwCodeInput" style="display:none">
							<input type="text" class="input2 w-input" name="scode">
						</div>
					</form>
				</div>
				<a href="javascript:findPw()" class="genral_btn w-button">확인</a>
			</div>
			<div class="l_pop" id="pop4">
				<div class="exsit_btn" onclick="searchPop()">
					<img src="/usdscash/webflow/images/wx_black.png" loading="lazy" sizes="100vw" srcset="/usdscash/webflow/images/wx_black-p-500.png 500w, /usdscash/webflow/images/wx_black-p-800.png 800w, /usdscash/webflow/images/wx_black-p-1080.png 1080w, /usdscash/webflow/images/wx_black-p-1600.png 1600w, /usdscash/webflow/images/wx_black.png 1600w" alt="" class="exsit_icon">
				</div>
				<div class="login_title">비밀번호 재 설정</div>
				<div class="form-block w-form">
					<form id="pwChangeForm" name="pwChangeForm">
						<div class="l_title">비밀번호</div>
						<div class="l_inputbox">
							<input type="text" class="input2 w-input" name="spw">
						</div>
						<div class="l_title">비밀번호 확인</div>
						<div class="l_inputbox">
							<input type="text" class="input2 w-input" name="spwCheck">
						</div>
					</form>
				</div>
				<a href="javascript:changePw()" class="genral_btn w-button">변경</a>
			</div>
		</div>
	</div>
	<jsp:include page="../usdscashFrame/bottom2.jsp" />
	<script>
	function searchPop(num){
		if($("#pop"+num).css("display") == "none"){
			$(".login_pop").css("display", "flex");
			$(".l_pop").hide();
			$("#pop"+num).css("display", "block");
		}
		else{
			$(".login_pop").hide();
			$(".l_pop").hide();
		}
	}
	
	function loginProcess(){
		var data = $("#loginForm").serialize();
		$.ajax({
			type :"post",
			data : data ,
			dataType : "json" ,
			url : "/usdscash/loginProcess.do",
			success:function(data){
				if(data.result == "success"){
					location.href="/usdscash/user/main.do";
				}
				else{
					alert(data.msg);
					$("#userPw").val('');
					return;
				}
			},
			error:function(e){ console.log("ajax error"); }
		});
	}

	function findIdAuth(){
		var data = $("#idSearchForm").serialize();
		$.ajax({
			type :"post",
			data : data ,
			dataType : "json" ,
			url : "/usdscash/findIdAuth.do",
			success:function(data){
				alert(data.msg);
				if(data.result == 'success'){
					$("#idCode").show();
					$("#idCodeInput").show();
				}
			}
		})
	}
	function findId(){
		var data = $("#idSearchForm").serialize();
		$.ajax({
			type:'post',
			data : data,
			url :'/usdscash/findId.do',
			success:function(data){
				if(data.result == 'success'){
					$("#findId").html(data.userId);
					searchPop(2);
				}
				else{
					alert(data.msg);
				}
			}
		})
	}
	
	function findPwAuth(){
		var data = $("#pwSearchForm").serialize();
		$.ajax({
			type :"post",
			data : data ,
			dataType : "json" ,
			url : "/usdscash/findPwAuth.do",
			success:function(data){
				alert(data.msg);
				if(data.result == 'success'){
					$("#pwCode").show();
					$("#pwCodeInput").show();
				}
			}
		})
	}
	function findPw(){
		var data = $("#pwSearchForm").serialize();
		$.ajax({
			type:'post',
			data : data,
			url :'/usdscash/findPw.do',
			success:function(data){
				if(data.result == 'success'){
					searchPop(4);
				}
				else{
					alert(data.msg);
				}
			}
		})
	}
	function changePw(){
		var data = $("#pwChangeForm").serialize();
		$.ajax({
			type:'post',
			data : data,
			url :'/usdscash/changePw.do',
			success:function(data){
				alert(data.msg);
				if(data.result == 'success'){
					searchPop();
				}
			}
		})
	}
	</script>
</body>
</html>