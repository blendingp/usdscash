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
<html data-wf-page="638ff25c2ef2d24c3c5fa5d3" data-wf-site="638d805ee804c444b60a5350">
<head>
<jsp:include page="../usdscashFrame/header2.jsp"></jsp:include>
<script>
function fn_egov_link_page(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/user/tradeHistory.do'/>";
   	document.listForm.submit();
}
</script>
</head>
<body class="body">
	<div class="frame">
		<jsp:include page="../usdscashFrame/top2.jsp"></jsp:include>
		<c:set var="coinName" value="SafeCoin"/>
		<div class="article">
			<div class="section">
				
				<div class="p_section">
					<div class="p_title_block">
						<div class="c_p_titleblock">
							<div class="coin_name">
								<img src="/usdscash/webflow/images2/binance_logo.svg" loading="lazy" alt="" class="coin_icon">
								<div><spring:message code="trade.coin.${fn:toLowerCase(coinName)}"/>(${coinName})</div>
							</div>
							<div class="c_p_titlebox">
								<div>0</div>
								<div class="coin_rate down">0.0%</div>
								<a href="/usdscash/user/cryptoDetail.do" class="c_purchase_btn w-button"><spring:message code="menu.deal"/></a>
							</div>
						</div>
					</div>
					<div class="m_sc_list_box2">
						<div class="ms_list t">
							<div class="ms_list_content _2">
								<div><spring:message code="th.time"/></div>
							</div>
							<div class="ms_list_content _2">
								<div><spring:message code="trade.type"/></div>
							</div>
							<div class="ms_list_content _2">
								<div><spring:message code="th.price"/></div>
							</div>
							<div class="ms_list_content _3">
								<div><spring:message code="th.qty"/></div>
							</div>
							<div class="ms_list_content _2">
								<div><spring:message code="th.fee"/></div>
							</div>
						</div>
						<c:forEach var="item" items="${list}">
							<div class="ms_list list">
								<div class="ms_list_content _2">
									<div><fmt:formatDate value="${item.buyDatetime}" pattern="yy-MM-dd HH:mm"/></div>
								</div>
								<div class="ms_list_content _2">
									<div><spring:message code="wallet.p2p.buy"/></div>
								</div>
								<div class="ms_list_content _2">
									<div><fmt:formatNumber value="${item.entryPrice}" pattern="#,###.##"/> USDT</div>
								</div>
								<div class="ms_list_content _3">
									<div><fmt:formatNumber value="${item.buyQuantity}" pattern="#,###.####"/> ${coinname}</div>
								</div>
								<div class="ms_list_content _2">
									<div><fmt:formatNumber value="${item.fee}" pattern="#,###.####"/> ${priceUnit}</div>
								</div>
							</div>
						</c:forEach>
						<div class="page_area">
							<ui:pagination paginationInfo = "${paginationInfo}" type="customPageUser" jsFunction="fn_egov_link_page" />
							<form id="listForm" name="listForm">
								<input type="hidden" name="pageIndex" value="1"/>
							</form>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		<jsp:include page="../usdscashFrame/footer2.jsp"></jsp:include>
	</div>
	<jsp:include page="../usdscashFrame/bottom2.jsp"></jsp:include>
</body>
</html>