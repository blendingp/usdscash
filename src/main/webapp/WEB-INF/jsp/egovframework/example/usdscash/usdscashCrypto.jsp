<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Thu Jan 05 2023 08:07:12 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="638f016beb1a4d09b0d4de03"
	data-wf-site="638d805ee804c444b60a5350">
<head>
<jsp:include page="../usdscashFrame/header2.jsp"></jsp:include>
</head>
<body class="body">
	<div class="frame">
		<jsp:include page="../usdscashFrame/top2.jsp"></jsp:include>
		
		<c:if test="${coin eq null}">
			<c:set var="coinName" value="SafeCoin"/>
		</c:if>
		<c:if test="${coin ne null}">
			<c:set var="coinName" value="${coin.coinName}"/>
		</c:if>
		
		<div class="article mainCoin${coin.coinNum}">
			<div class="section">
				
				<div class="p_section">
					<div class="c_p_section1">
						<div class="c_p_titleblock">
							<div class="coin_name">
								<img src="/usdscash/webflow/images2/binance_logo.svg" loading="lazy" alt="" class="coin_icon">
								<div><spring:message code="trade.coin.${fn:toLowerCase(coinName)}"/>(${coinName})</div>
								<!-- <div class="c_btn_portfolio">
									<img src="/usdscash/webflow/images2/yellow_star.svg" loading="lazy" alt="" class="portfolio_star on">
									<img src="/usdscash/webflow/images2/grey_star.svg" loading="lazy" alt="" class="portfolio_star off">
									<div class="c_portfolio_toggle">
										<div class="c_p_pbtn">
											<div>MyPortfolio</div>
											<div class="p_add_btn">
												<img src="/usdscash/webflow/images2/plus.svg" loading="lazy" alt="" class="icon">
												<img src="/usdscash/webflow/images2/check_orange.svg" loading="lazy" alt="" class="icon">
											</div>
										</div>
										<div class="c_p_pbtn">
											<div>1Portfolio</div>
											<div class="p_add_btn">
												<img src="/usdscash/webflow/images2/plus.svg" loading="lazy" alt="" class="icon">
												<img src="/usdscash/webflow/images2/check_orange.svg" loading="lazy" alt="" class="icon">
											</div>
										</div>
										<div class="c_p_pbtn2">
											<div>Add To New Portfolio</div>
											<div class="p_add_btn">
												<img src="/usdscash/webflow/images2/plus.svg" loading="lazy" alt="" class="icon">
											</div>
										</div>
									</div>
									<div>포트폴리오에 추가하기</div>
								</div> -->
							</div>
							<div class="c_p_titlebox">
								<div class="cnow">0</div>
								<div class="coin_rate cchange">0.0%</div>
								<c:if test="${coin eq null}">
									<a href="javascript:purchaseToggle()" class="c_purchase_btn w-button"><spring:message code="wallet.p2p.buy"/></a>
								</c:if>
								<c:if test="${coin ne null}">
									<a href="javascript:ready()" class="c_purchase_btn w-button"><spring:message code="wallet.p2p.buy"/></a>
								</c:if>
							</div>
							<div class="warn"> 1.0000 USD <span class="rate up">0.0%</span> </div>
						</div>
						<div class="c_p_listblock">
							<div class="c_p_list_box">
								<div class="c_p_list_twarp">
									<div class="c_p_list">
										<div class="c_p_subject">
											<div><spring:message code="trade.24high"/></div>
										</div>
										<div class="c_p_list_txt chigh">0</div>
									</div>
								</div>
								<div class="c_p_list_twarp">
									<div class="c_p_list">
										<div class="c_p_subject">
											<div><spring:message code="trade.transactionP"/></div>
										</div>
										<div class="c_p_list_txt">0</div>
									</div>
								</div>
							</div>
							<div class="c_p_list_box">
								<div class="c_p_list">
									<div class="c_p_subject">
										<div><spring:message code="trade.24low"/></div>
									</div>
									<div class="c_p_list_txt clow">0</div>
								</div>
								<div class="c_p_list">
									<div class="c_p_subject">
										<div><spring:message code="trade.24turnover"/></div>
									</div>
									<div class="c_p_list_txt cvolume">0</div>
								</div>
							</div>
						</div>
					</div>
					<div class="c_p_section2">
						<div class="c_p_block1">
							<div class="c_chart_titlebox">
								<div class="c_chart_title">
									<spring:message code="trade.coin.${fn:toLowerCase(coinName)}"/>
									<spring:message code="trade.chart"/>(${coinName}/USD)
								</div>
							</div>
							<div class="chart"></div>
							<!-- <div class="chart_list">
								<div class="chart_listtop">
									<div class="c_list_txt">1시간</div>
									<div class="c_list_txt">24시간</div>
									<div class="c_list_txt">7일</div>
									<div class="c_list_txt">14일</div>
									<div class="c_list_txt">30일</div>
									<div class="c_list_txt end">1년</div>
								</div>
								<div class="chart_listwarp">
									<div class="c_list_txt up">+0.3%</div>
									<div class="c_list_txt down">-0.3%</div>
									<div class="c_list_txt down">-0.3%</div>
									<div class="c_list_txt down">-0.3%</div>
									<div class="c_list_txt down">-0.3%</div>
									<div class="c_list_txt end down">-0.3%</div>
								</div>
							</div> -->
						</div>
						<div class="c_p_block2">
							<div class="c_infoblock">
								<div class="c_chart_title"><spring:message code="trade.coin.${fn:toLowerCase(coinName)}"/>(${coinName}) Converter</div>
								<div class="form-block w-form">
									<form id="email-form-4" name="email-form-4">
										<div class="c_change_inpit_box">
											<div class="c_change_title">${coinName}</div>
											<input type="text" class="input w-input" name="field-7" id="field-7">
										</div>
										<div class="c_change_inpit_box">
											<div class="c_change_title">USD</div>
											<input type="text" class="input w-input" name="field-7" id="field-7">
										</div>
										<div class="c_change_txt">
											1 ${coinName} = <span class="cnow"></span><br>
										</div>
									</form>
								</div>
							</div>
							<div class="c_infoblock">
								<div class="c_chart_title">${coinName} <spring:message code="trade.statistics"/></div>
								<div class="c_info_list">
									<div><spring:message code="wallet.marketPrice"/></div>
									<div class="c_info_txt cnow">0</div>
								</div>
								<div class="c_info_list">
									<div><spring:message code="trade.24high"/></div>
									<div class="c_info_txt chigh">0</div>
								</div>
								<div class="c_info_list">
									<div><spring:message code="trade.24low"/></div>
									<div class="c_info_txt clow">0</div>
								</div>
								<div class="c_info_list">
									<div><spring:message code="trade.transactionP"/></div>
									<div class="c_info_txt">0</div>
								</div>
								<div class="c_info_list">
									<div><spring:message code="trade.24turnover"/></div>
									<div class="c_info_txt cvolume">0</div>
								</div>
								<!-- <div class="c_info_list">
									<div>역대 최고가</div>
									<div class="c_info_txt">0</div>
								</div>
								<div class="c_info_list">
									<div>역대 최저가</div>
									<div class="c_info_txt">0</div>
								</div> -->
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		<jsp:include page="../usdscashFrame/footer2.jsp"></jsp:include>
		<div class="pop purchase" id="purchasePop" style="display:none">
			<div class="p_popbox">
				<div class="pop_titleblock">
					<img src="/usdscash/webflow/images2/usds_logo_1.svg" loading="lazy" alt="" class="pop_logo">
					<div class="exsit_btn" onclick="purchaseToggle()">
						<img src="/usdscash/webflow/images2/wx_black.png" loading="lazy" sizes="100vw" srcset="/usdscash/webflow/images2/wx_black-p-500.png 500w, /usdscash/webflow/images2/wx_black-p-800.png 800w, /usdscash/webflow/images2/wx_black-p-1080.png 1080w, /usdscash/webflow/images2/wx_black-p-1600.png 1600w, /usdscash/webflow/images2/wx_black.png 1600w" alt="" class="exsit_icon">
					</div>
				</div>
				<div class="pop_general">
					<div class="w-form">
						<form id="email-form-5" name="email-form-5">
							<div class="p_poptitle"><spring:message code="wallet.coin"/></div>
							<div class="p_input">
								<c:if test="${coin eq null}">
									<c:set var="coinName" value="SafeCoin"/>
									<img src="/usdscash/webflow/images2/binance_logo.svg" loading="lazy" alt="" class="coin_icon">
								</c:if>
								<c:if test="${coin ne null}">
									<img src="/usdscash/webflow/images2/${fn:toLowerCase(coinName)}.svg" loading="lazy" alt="" class="coin_icon">
								</c:if>
								<div><spring:message code="trade.coin.${fn:toLowerCase(coinName)}"/></div>
							</div>
							<div class="p_poptitle"><spring:message code="trade.payment"/></div>
							<div class="p_input">
								<div><spring:message code="trade.accountT"/></div>
								<div class="p_pop_btn" onclick="inquiryInsert()" style="cursor:pointer">
									<div><spring:message code="newwave.wallet.acc_inq"/></div>
								</div>
							</div>
							<div class="p_poptitle"><spring:message code="trade.size"/></div>
							<div class="p_input">
								<input type="text" class="input w-input" name="field-8" id="field-8" onkeyup="SetNum(this);">
								<div class="p_pop_btn">
									<div>USD</div>
								</div>
							</div>
							<a href="#" class="genral_btn w-button"><spring:message code="wallet.p2p.buy"/></a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../usdscashFrame/bottom2.jsp"></jsp:include>
	<script>
		function purchaseToggle(){
			if($("#purchasePop").css("display") != "none"){
				$("#purchasePop").css("display", "none");
			}
			else{
				$("#purchasePop").css("display", "flex");
			}
		}
	</script>
	<script src="/usdscash/js/mainSise.js" type="text/javascript"></script>
</body>
</html>