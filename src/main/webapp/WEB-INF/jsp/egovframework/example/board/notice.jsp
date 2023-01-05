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
<title>Notice</title>
<jsp:include page="../usdscashFrame/header2.jsp"></jsp:include>
</head>
<body class="body">
	<div class="frame">
		<div class="form-block w-form">
			<form name="listForm" id="listForm" action="/usdscash/board/noticeList.do">
				<input type="hidden" name="pageIndex" />
				<jsp:include page="../usdscashFrame/top2.jsp"></jsp:include>

				<div class="article">
					<div class="banner">
						<div class="b_img custermer">
							<div class="b_box">
								<h1 class="heading"><spring:message code="menu.notice" /> </h1>
								<div><spring:message code="main.cutomer_3" /></div>
							</div>
						</div>
					</div>
					<div class="custermer_container">
						<div class="c_section1">
							<div class="c_list_area">
								<c:set var="number" value="${pi.totalRecordCount -pi.recordCountPerPage*(pi.currentPageNo-1) }" />
								<c:forEach var="result" items="${noticeList}">
									<div class="n_list _2" style="cursor: pointer;" onClick="checkdetail(${result.bidx})">
										<div class="list_category">Notice</div>
										<div class="list_txt" style="word-break: break-word;">
											<c:choose>
												<c:when test="${fn:length(result.btitle) > 25}">
													${fn:substring(result.btitle,0,20)}...
												</c:when>
												<c:otherwise>${result.btitle }</c:otherwise>
											</c:choose>
										</div>
										<div class="list_txt date">${result.bdate}</div> 
									</div>
								</c:forEach>
							</div>
							<div class="page_area">
								<a href="#" class="page_btn w-button"> 
									<ui:pagination paginationInfo="${pi}" type="customPageUser" jsFunction="fn_egov_link_page" />
								</a>
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