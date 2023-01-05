<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
				<div class="ad_box"></div>
				<div class="form-block w-form">
					<form id="email-form" name="email-form">
						<div class="my_section">
							<div class="my_block">
								<div class="my_container">
									<div class="p_title">계정 정보</div>
									<div class="my_title">로그인 정보 관리</div>
									<div class="l_inputbox _1">
										<div class="input_title">아이디</div>
										<input type="text" class="my_inpuit w-input" name="field-9" id="field-9">
										<a href="#" class="my_input_btn w-button">변경</a>
									</div>
									<div class="l_inputbox _2">
										<div class="input_title">비밀번호</div>
										<input type="text" class="input w-input" name="field-2" id="field-2">
										<a href="#" class="my_input_btn w-button">변경</a>
									</div>
									<div class="my_title">계정삭제</div>
									<div> 본 계정을 더 이상 이용할 수 없게 되며, 저장된 데이터 전체가 영구 삭제됩니다. <span class="delete">내 계정 삭제</span> </div>
								</div>
								<a href="#" class="genral_btn w-button">변경완료</a>
							</div>
						</div>
					</form>
				</div>
				<div class="ad_box"></div>
			</div>
		</div>
		<jsp:include page="../usdscashFrame/footer2.jsp"></jsp:include>
		<div class="pop purchase">
			<div class="p_popbox">
				<div class="pop_titleblock">
					<img src="/usdscash/webflow/images2/usds_logo_1.svg" loading="lazy" alt="" class="pop_logo">
					<div class="exsit_btn">
						<img src="/usdscash/webflow/images2/wx_black.png" loading="lazy" sizes="100vw" srcset="/usdscash/webflow/images2/wx_black-p-500.png 500w, /usdscash/webflow/images2/wx_black-p-800.png 800w, /usdscash/webflow/images2/wx_black-p-1080.png 1080w, /usdscash/webflow/images2/wx_black-p-1600.png 1600w, /usdscash/webflow/images2/wx_black.png 1600w" alt="" class="exsit_icon">
					</div>
				</div>
				<div class="pop_general">
					<div class="w-form">
						<form id="email-form-5" name="email-form-5">
							<div class="p_poptitle">구매하기</div>
							<div class="p_input">
								<img src="/usdscash/webflow/images2/btc.svg" loading="lazy" alt="" class="coin_icon">
								<div>비트코인</div>
							</div>
							<div class="p_poptitle">결재수단 선택</div>
							<div class="p_input">
								<div>결재수단</div>
								<div class="p_pop_btn">
									<img src="/usdscash/webflow/images2/usds_list.png" loading="lazy" sizes="100vw" srcset="/usdscash/webflow/images2/usds_list-p-500.png 500w, /usdscash/webflow/images2/usds_list-p-800.png 800w, /usdscash/webflow/images2/usds_list-p-1080.png 1080w, /usdscash/webflow/images2/usds_list-p-2000.png 2000w, /usdscash/webflow/images2/usds_list.png 2000w" alt="" class="icon">
								</div>
							</div>
							<div class="p_poptitle">지급금액</div>
							<div class="p_input">
								<input type="text" class="input w-input" name="field-8" id="field-8">
								<div class="p_pop_btn"> <div>USD</div> </div>
							</div>
							<a href="#" class="genral_btn w-button">구매하기</a>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="pop acdelete">
			<div class="pop_warn">
				<div class="pop_titleblock">
					<div> <strong>내 계정 삭제</strong> </div>
					<div class="exsit_btn">
						<img src="/usdscash/webflow/images2/wx_black.png" loading="lazy" sizes="100vw" srcset="/usdscash/webflow/images2/wx_black-p-500.png 500w, /usdscash/webflow/images2/wx_black-p-800.png 800w, /usdscash/webflow/images2/wx_black-p-1080.png 1080w, /usdscash/webflow/images2/wx_black-p-1600.png 1600w, /usdscash/webflow/images2/wx_black.png 1600w" alt="" class="exsit_icon">
					</div>
				</div>
				<div class="pop_general">
					<div class="pop_txt"> •계정을 삭제하면 데이터를 다시 조회할 수 없게 됩니다. 모든 계정 데이터가 삭제됩니다.<br>•<strong>&quot;delete&quot;를 입력해 삭제를 확인해 주세요</strong> </div>
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
</body>
</html>