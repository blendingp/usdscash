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
			<form name="listForm" id="listForm" action="/usdscash/notice.do">
				<input type="hidden" name="pageIndex" />
				<jsp:include page="../usdscashFrame/top2.jsp"></jsp:include>

				<div class="article">
					<div class="banner">
						<div class="b_img custermer">
							<div class="b_box">
								<h1 class="heading">공지 · 뉴스</h1>
								<div>공지사항과 새로운 소식을 확인하실 수 있는 공간입니다.</div>
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
				<%-- <div class="frame5">
					<jsp:include page="../userFrame/customerBanner.jsp"></jsp:include>
					<div class="custermer_listblock">
						<div class="custermer_titlewarp" style="padding:0;">
							<div class="title6"><spring:message code="pop.withdrawRequest_7" /></div>
						</div>
						
						
						<div class="custermer_warp1">
							<c:set var="number" value="${pi.totalRecordCount -pi.recordCountPerPage*(pi.currentPageNo-1) }" />
							<c:forEach var="result" items="${noticeList}">
								<div class="custermer_liet" style="cursor: pointer;" onClick="checkdetail(${result.bidx})">
									<div class="custermer_listtxt1">${number}<c:set var="number" value="${number-1}" /></div>
									<div class="custermer_listtxt4" style="word-break: break-word;">
										<c:choose>
											<c:when test="${fn:length(result.btitle) > 25}">
												${fn:substring(result.btitle,0,20)}...
											</c:when>
											<c:otherwise>${result.btitle }</c:otherwise>
										</c:choose>
									</div>
									<div class="custermer_listtxt3"><spring:message code="root.project"/></div>
									<div class="custermer_listtxt2">${result.bdate}</div>
									<!-- <div class="custermer_listtxt3">1</div> -->
								</div>
							</c:forEach>
							<div class="no_data" style=" <c:if test="${fn:length(noticeList) == 0}">display:flex;</c:if>">
								<spring:message code="trader.nodata" />
							</div>
						</div>
						<div class="custermer_warp2">
							<div class="paging">
								<ui:pagination paginationInfo="${pi}" type="customPageUser" jsFunction="fn_egov_link_page" />
							</div>
						</div>
					</div>
				</div> --%>
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