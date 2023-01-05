<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<!--  Last Published: Tue Jun 29 2021 05:48:49 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="638d805ee804c4ef1c0a5355" data-wf-site="638d805ee804c444b60a5350">
<head>
<meta charset="utf-8">
<title>FAQ</title>
<jsp:include page="../usdscashFrame/header2.jsp"></jsp:include>
</head>
<body class="body">
	<div class="frame">
		<div class="form-block w-form">
			<form name="listForm" id="listForm" action="/usdscash/board/faqList.do">
				<input type="hidden" name="pageIndex" />
				<jsp:include page="../usdscashFrame/top2.jsp"></jsp:include>
				<div class="article">
					<div class="banner">
						<div class="b_img custermer">
							<div class="b_box">
								<h1 class="heading">
									<spring:message code="menu.faq" />
								</h1>
							</div>
						</div>
					</div>
					<div class="custermer_container">
						<div class="c_section2">
							<div class="faq_c_area">
								<div class="faq_c_title">
									<a href="#" class="faq_btn click w-button">전체</a>
								</div>
								<div class="faq_c_box">
									<div class="faq_c_warp">
										<div class="faq_box1">
											<div class="faq_box_title">
												<a href="#" class="faq_btn click w-button">보험상품</a>
												<img src="/usdscash/webflow/images2/toggle_right.svg" loading="lazy" alt="" class="icon_faq">
											</div>
										</div>
										<div class="faq_box2">
											<div class="faq_c">
												<span class="c_deco">·</span> 보험이름
											</div>
										</div>
									</div>
									<div class="faq_c_warp">
										<div class="faq_box1">
											<div class="faq_box_title">
												<a href="#" class="faq_btn w-button">보험관련</a><img src="/usdscash/webflow/images2/toggle_right.svg" loading="lazy" alt="" class="icon_faq">
											</div>
										</div>
										<div class="faq_box2">
											<div class="faq_c">
												<span class="c_deco">·</span>보험이름
											</div>
										</div>
									</div>
									<div class="faq_c_warp">
										<div class="faq_box1">
											<div class="faq_box_title">
												<a href="#" class="faq_btn w-button">기타</a><img src="/usdscash/webflow/images2/toggle_right.svg" loading="lazy" alt="" class="icon_faq">
											</div>
										</div>
										<div class="faq_box2">
											<div class="faq_c">
												<span class="c_deco">·</span>보험이름
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="c_list_area">
								<%-- <div class="form-block w-form">
									<form id="email-form" name="email-form" data-name="Email Form"
										method="get">
										<div class="faq_search">
											<div class="search_box">
												<input type="text" class="search_input w-input"
													maxlength="256" name="field" data-name="Field"
													placeholder="Example Text" id="field" required="">
												<div class="search_btn">
													<img src="/usdscash/webflow/images2/search.svg" loading="lazy" alt=""
														class="icon">
												</div>
											</div>
										</div>
									</form>
								</div> --%>
								<div class="faq_block">
									<c:set var="number"
										value="${pi.totalRecordCount -pi.recordCountPerPage*(pi.currentPageNo-1) }" />
									<c:forEach var="result" items="${faqList}">
										<div class="faq_warp">
											<div class="faq_box" style="cursor: pointer;" onclick="answerDisplay('${result.bidx}')">
												<div class="faq_q">Q.</div>
												<div class="faq_txt">
													<c:choose>
														<c:when test="${fn:length(result.btitle) > 25}">
															${fn:substring(result.btitle,0,20)}...
														</c:when>
														<c:otherwise>${result.btitle }</c:otherwise>
													</c:choose>
												</div>
												<div class="faq_p">+</div>
											</div>
											<div class="faq_answer" id="${result.bidx}">
												<div class="faq_txt a">${result.bcontent}</div>
											</div>
										</div>
									</c:forEach>
								</div>
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

	<script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=615fe8348801178bd89ede05" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
	<script>
		function answerDisplay(idx){ 	
		    var idx = document.getElementById(idx); 	
		    if(idx.style.display=='none'){ 		
		    	idx.style.display = 'flex'; 	
		    }else{ 		
		    	idx.style.display = 'none'; 	
		    } 
		}
		function fn_egov_link_page(page) {
			document.listForm.pageIndex.value = page;
			document.listForm.submit();
		}
		
		var type = "faq";
		
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
							location.href = "/usdscash/detail.do?bidx="+bidx+"&type="+type;
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