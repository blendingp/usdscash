<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html data-wf-page="62b181be37670240d0464eb6" data-wf-site="62b1125ac4d4d60ab9c62f81">
<head>
<meta charset="utf-8">
<title>detail</title>
<meta content="detail" property="og:title">
<meta content="detail" property="twitter:title">
<jsp:include page="../usdscashFrame/header2.jsp"></jsp:include>
</head>
<body class="body">
	<div class="frame">
		<jsp:include page="../usdscashFrame/top2.jsp"></jsp:include>
		<div class="article">
			<div class="banner">
				<div class="b_img custermer">
					<div class="b_box">
						<c:if test="${type eq 'notice'}">
							<h1 class="heading">
								<spring:message code="support.notice" />
							</h1>
							<div>
								<spring:message code="main.cutomer_3" />
							</div>
						</c:if>
						<c:if test="${type eq 'faq'}">
							<h1 class="heading">
								<spring:message code="menu.faq" />
							</h1>
						</c:if>
					</div>
				</div>
			</div>
			<div class="custermer_container">
				<div class="c_section1">
					<div class="form-block w-form">
						<div class="c_box">
							<div class="cd_title" style="word-break: break-all;">
								<div class="d_title">${item.btitle}</div>
								<div class="d_date">${item.bdate }</div>
							</div>
							<div class="d_content">
								<div style="word-break: break-all;">${text}</div>
							</div>
						</div>
					</div>
					<div class="general_btn_area">
						<a href="/usdscash/${type}.do" class="genral_btn w-button"><spring:message
								code="button.list" /></a>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../usdscashFrame/footer2.jsp"></jsp:include>
	</div>
	<script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=615fe8348801178bd89ede05" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<script src="/usdscash/webflow/js/webflow2.js" type="text/javascript"></script>
	<!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
</body>
</html>