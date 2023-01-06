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
		<div class="article">
			<div class="section">
				<div class="ad_box"></div>
				<div class="p_section">
					<div class="p_title_block">
						<div class="c_p_titleblock">
							<div class="coin_name">
								<img src="/usdscash/webflow/images2/binance_logo.svg" loading="lazy" alt="" class="coin_icon">
								<div>세이프 코인(Safe Coin)</div>
							</div>
							<div class="c_p_titlebox">
								<div>US$17,081.23</div>
								<div class="coin_rate down">↓ 4.2%</div>
								<a href="#" class="c_purchase_btn w-button">거래추가</a>
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
								<div>세이프 코인</div>
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
								<div class="p_pop_btn">
									<div>USD</div>
								</div>
							</div>
							<a href="#" class="genral_btn w-button">구매하기</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../usdscashFrame/bottom2.jsp"></jsp:include>
</body>
</html>