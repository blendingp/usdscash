<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<!--  Last Published: Tue Jun 29 2021 05:48:49 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="638d805ee804c48ea60a5358" data-wf-site="638d805ee804c444b60a5350">
<head>
<meta charset="utf-8">
<title>Event</title>
<jsp:include page="../usdscashFrame/header2.jsp"></jsp:include>
</head>
<body class="body">
	<div class="frame">
		<div class="form-block w-form">
			<form name="listForm" id="listForm" action="/usdscash/notice.do">
				<input type="hidden" name="pageIndex" />
				<jsp:include page="../usdscashFrame/top2.jsp"></jsp:include>
				<div class="article">
					<div class="banner">
						<div class="b_img custermer">
							<div class="b_box">
								<h1 class="heading">이벤트</h1>
								<div>국민안심투자보험이 준비한 이벤트에 참여해보세요.</div>
							</div>
						</div>
					</div>
					<div class="custermer_container">
						<div class="c_section1">
							<div class="c_list_area">
								<div class="e_list">
									<div class="e_img"></div>
									<div class="e_listttxt">NH부자 습관 저축 보험 가입 이벤트</div>
									<div class="e_date">2022.01.15 ~ 2022.01.30</div>
								</div>
								<div class="e_list">
									<div class="e_img"></div>
									<div class="e_listttxt">NH부자 습관 저축 보험 가입 이벤트</div>
									<div class="e_date">2022.01.15 ~ 2022.01.30</div>
								</div>
								<div class="e_list">
									<div class="e_img"></div>
									<div class="e_listttxt">NH부자 습관 저축 보험 가입 이벤트</div>
									<div class="e_date">2022.01.15 ~ 2022.01.30</div>
								</div>
							</div>
							<div class="page_area">
								<a href="#" class="page_btn w-button">◀</a> <a href="#"
									class="page_btn w-button">1</a> <a href="#"
									class="page_btn w-button">2</a> <a href="#"
									class="page_btn w-button">3</a> <a href="#"
									class="page_btn w-button">4</a> <a href="#"
									class="page_btn w-button">▶</a>
							</div>
						</div>
					</div>
				</div>
			</form>
			<jsp:include page="../usdscashFrame/footer2.jsp"></jsp:include>
		</div>
	</div>
	<!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
	<script>
		function fn_egov_link_page(page) {
			document.listForm.pageIndex.value = page;
			document.listForm.submit();
		}
		
		var type = "notice";
		
		function checkdetail(bidx) {
			$.ajax({
					type : 'post',
					data : {
						bidx : bidx,
						type : type,
					},
					dataType : 'json',
					url : '/usdscash/checkdetail.do',
					success : function(data) {
						if (data.result == 'success') {
							location.href = "/usdscash/detail.do?bidx="+bidx+"&type=notice";
						} else {
							console.log(data.msg);
							alert(data.msg);
						}
					},
					error : function(e) {
						console.log('ajax error ' + JSON.stringify(e));
					}
				})
		}
	</script>
</body>
</html>