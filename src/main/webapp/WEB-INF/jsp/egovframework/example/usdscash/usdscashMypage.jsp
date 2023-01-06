<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Thu Jan 05 2023 08:07:12 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="639032dd5fb6d1f5055735a0" data-wf-site="638d805ee804c444b60a5350">
<head>
<jsp:include page="../usdscashFrame/header2.jsp"></jsp:include>
</head>
<body class="body">
	<div class="frame">
		<jsp:include page="../usdscashFrame/top2.jsp"></jsp:include>
		<div class="article">
			<div class="section">
				
				<div class="form-block w-form">
					<form id="infoForm" name="infoForm">
						<input type="hidden" name="idx" id="idx" value="${info.idx}" />
						<input type="hidden" name="changePhone" id="changePhone" value="false" />
						<input type="hidden" id="copyInput" />
						<div class="my_section">
							<div class="my_block">
								<div class="my_container">
									<div class="p_title"><spring:message code="menu.mypage"/></div>
									<div class="my_title"><spring:message code="wallet.accountInformation"/></div>
									<div class="l_inputbox _1">
										<div class="input_title"><spring:message code="join.email"/></div>
										<input type="text" class="my_inpuit w-input" value="${info.email}" readonly>
									</div>
									<div class="l_inputbox _1">
										<div class="input_title"><spring:message code="join.invite"/></div>
										<input type="text" class="my_inpuit w-input" value="${info.inviteCode}" readonly>
										<a href="javascript:inviteCopy()" class="my_input_btn w-button">LINK</a>
									</div>
									<div class="l_inputbox _1">
										<div class="input_title"><spring:message code="join.name"/></div>
										<input type="text" class="my_inpuit w-input" value="${info.name}" readonly>
									</div>
									<div class="l_inputbox _1">
										<div class="input_title"><spring:message code="join.date"/></div>
										<input type="text" class="my_inpuit w-input" value="<fmt:formatDate value='${info.joinDate}' pattern='yyyy-MM-dd'/>" readonly>
									</div>
								</div>
								<div class="my_container" id="veriWarp">
									<div class="my_title"><spring:message code="join.resetPW"/></div>
									<div class="l_inputbox _1">
										<div class="input_title"><spring:message code="join.phone"/></div>
										<input type="text" class="my_inpuit w-input" name="phone" id="phone" value="${info.phone}" readonly>
										<a href="javascript:sendRequest()" class="my_input_btn w-button" id="phoneBtn"><spring:message code="wallet.request"/></a>
									</div>
									<div class="l_inputbox _1" id="verification" style="display:none;">
										<div class="input_title"><spring:message code="join.code"/></div>
										<input type="text" class="my_inpuit w-input" name="code" id="code" onkeyup="numCheck(this)">
										<a href="javascript:phoneCodeCheck()" class="my_input_btn w-button"><spring:message code="wallet.confirm"/></a>
									</div>
								</div>
								<div class="my_container passWarp" style="display:none;">
									<div class="my_title"><spring:message code="join.resetPW"/></div>
									<div class="l_inputbox _1">
										<div class="input_title"><spring:message code="join.newPW"/></div>
										<input type="text" class="my_inpuit w-input" name="changePw" id="changePw">
									</div>
									<div class="l_inputbox _1">
										<div class="input_title"><spring:message code="join.checkPW"/></div>
										<input type="text" class="my_inpuit w-input" name="pwCheck" id="pwCheck">
									</div>
								</div>
								<a href="javascript:pwChange()" class="genral_btn w-button passWarp" style="display:none;"><spring:message code='trade.apply'/></a>
								<!-- <div class="my_container">
									<div class="my_title">계정삭제</div>
									<div> 본 계정을 더 이상 이용할 수 없게 되며, 저장된 데이터 전체가 영구 삭제됩니다. <span class="delete">내 계정 삭제</span> </div>
								</div> -->
							</div>
						</div>
					</form>
				</div>
				
			</div>
		</div>
		<jsp:include page="../usdscashFrame/footer2.jsp"></jsp:include>
		<div class="pop acdelete">
			<div class="pop_warn">
				<div class="pop_titleblock">
					<div> <strong>내 계정 삭제</strong> </div>
					<div class="exsit_btn">
						<img src="/usdscash/webflow/images2/wx_black.png" loading="lazy" sizes="100vw" srcset="/usdscash/webflow/images2/wx_black-p-500.png 500w, /usdscash/webflow/images2/wx_black-p-800.png 800w, /usdscash/webflow/images2/wx_black-p-1080.png 1080w, /usdscash/webflow/images2/wx_black-p-1600.png 1600w, /usdscash/webflow/images2/wx_black.png 1600w" alt="" class="exsit_icon">
					</div>
				</div>
				<div class="pop_general">
					<div class="pop_txt"> •계정을 삭제하면 데이터를 다시 조회할 수 없게 됩니다. 모든 계정 데이터가 삭제됩니다.<br>•<strong>"delete"를 입력해 삭제를 확인해 주세요</strong> </div>
					<div class="form-block w-form">
						<form id="email-form-6" name="email-form-6">
							<div class="p_input">
								<input type="text" class="input2 w-input" name="field-10" id="field-10">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../usdscashFrame/bottom2.jsp"></jsp:include>
	<script>
	function numCheck(self) {
		let num = $(self);
		let re = /[^0-9]/gi;
		num.val(num.val().replace(re, ""));
	}
	function inviteCopy() {
		$("#copyInput").attr("type", "text");
		$("#copyInput").val("https://usdscash.com/usdscash/join.do?invi=${info.inviteCode}");
		$("#copyInput").select();
		document.execCommand('Copy');
		$("#copyInput").attr("type", "hidden");
		alert("<spring:message code='pop.clipboard'/> ");
	}
	function sendRequest() {
		$.ajax({
			type : 'post',
			data : {
				'phone' : $("#phone").val()
			},
			dataType : 'json',
			url : '/usdscash/user/verificationPhone.do',
			success : function(data) {
				alert(data.msg);
				if (data.result == "success") {
					$("#verification").css("display","flex");
					$("#phone").attr("readonly","true");
				}
			},
			error : function(e) {
				console.log('ajax error ' + JSON.stringify(e));
			}
		})
	}
	function phoneCodeCheck() {
		if (changePhone && $("#code").val() == '') {
			alert("<spring:message code='pop.inputConfirmCode'/>");
			return false;
		}
		$.ajax({
			type : 'post',
			data : {
				'code' : $("#code").val(),
			},
			dataType : 'json',
			url : '/usdscash/user/verificationPhoneConfirm.do',
			success : function(data) {
				if (data.result == "success") {
					checkPhone = true;
					$("#veriWarp").css("display","none");
					$(".passWarp").css("display","flex");
				}else{
					alert(data.msg);
				}
			},
			error : function(e) {
				console.log('ajax error ' + JSON.stringify(e));
			}
		})
	}
	function pwChange() {
		let code = $("#code").val();
		let pw = $("#changePw").val();
		let pwCheck = $("#pwCheck").val();
		if(!chkPW()){
			return;
		}else if(pw != pwCheck){
			alert("<spring:message code='join.jpWrong'/>")
			return;
		}
		
		$.ajax({
			type : 'post',
			data : {"code":code, "pw":pw},
			url : '/usdscash/user/changePW.do',
			success : function(data) {
				alert(data.msg);
				if (data.result == 'success') {
					location.reload();
				}
			},
			error : function(e) {
				console.log('ajax error ' + JSON.stringify(e));
			}
		})
	}
	
	function chkPW() {
	    var pw = String($("#changePw").val());
	    var num = pw.search(/[0-9]/g);
	    var eng = pw.search(/[a-z]/ig);
	    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	    if (pw.length < 8) {
	        alert("<spring:message code='join.pwTerms'/>");
	        return false;
	    } else if (pw.search(/\s/) != -1) {
	    	 alert("<spring:message code='join.pwTerms'/>");
	        return false;
	    } else if (num < 0 || eng < 0) {
	    	 alert("<spring:message code='join.pwTerms'/>");
	        return false;
	    } else {
	        return true;
	    }
	}
	</script>
</body>
</html>