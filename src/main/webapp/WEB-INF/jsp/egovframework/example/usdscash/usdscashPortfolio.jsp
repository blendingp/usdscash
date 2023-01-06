<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Thu Jan 05 2023 08:07:12 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="638ff25c2ef2d24c3c5fa5d3" data-wf-site="638d805ee804c444b60a5350">
<head>
<jsp:include page="../usdscashFrame/header2.jsp"></jsp:include>
</head>
<body class="body">
	<div class="frame">
		<jsp:include page="../usdscashFrame/top2.jsp"></jsp:include>
		<div class="article">
			<div class="section">
				<div class="ad_box"></div>
				<div class="p_section">
					<div class="p_title_block">
						<div class="p_title_warp">
							<div class="pf_title_btn">
								<div class="p_title">My Portfolio</div>
								<div class="pf_toggle"></div>
							</div>
						</div>
					</div>
					<div class="m_sc_list_box2">
						<div class="ms_list t">
							<div class="ms_list_content _2">
								<div><spring:message code="trade.symbol"/></div>
							</div>
							<div class="ms_list_content _2">
								<div><spring:message code="wallet.marketPrice"/></div>
							</div>
							<div class="ms_list_content _2">
								<div><spring:message code="trade.24high"/></div>
							</div>
							<div class="ms_list_content _2">
								<div><spring:message code="trade.24low"/></div>
							</div>
							<div class="ms_list_content _2">
								<div><spring:message code="trade.24change"/></div>
							</div>
							<div class="ms_list_content _2">
								<div><spring:message code="trade.24turnover"/></div>
							</div>
						</div>
						<div class="ms_list list" onclick="location.href='/usdscash/user/cryptoDetail.do'" style="cursor:pointer">
							<div class="ms_list_content _2">
								<div class="icon_warp"> <img src="/usdscash/webflow/images2/btc.svg" loading="lazy" alt="" class="ms_coin_icon"> </div>
								<div> 세이프코인 <span class="small_grey">Safe Coin</span> </div>
							</div>
							<div class="ms_list_content _2"> <div class="cnow"></div> </div>
							<div class="ms_list_content _2"> <div class="chigh"></div> </div>
							<div class="ms_list_content _2"> <div class="clow"></div> </div>
							<div class="ms_list_content _2"> <div class="rate_txt cchange"></div> </div>
							<div class="ms_list_content _2"> <div class="cvolume"></div> </div>
						</div>
						<div class="ms_list list mainCoin0 _1">
							<div class="ms_list_content _2">
								<div class="icon_warp"> <img src="/usdscash/webflow/images2/btc.svg" loading="lazy" alt="" class="ms_coin_icon"> </div>
								<div> 비트코인 <span class="small_grey">BTC</span> </div>
							</div>
							<div class="ms_list_content _2"> <div class="cnow"></div> </div>
							<div class="ms_list_content _2"> <div class="chigh"></div> </div>
							<div class="ms_list_content _2"> <div class="clow"></div> </div>
							<div class="ms_list_content _2"> <div class="rate_txt cchange"></div> </div>
							<div class="ms_list_content _2"> <div class="cvolume"></div> </div>
						</div>
						<div class="ms_list list mainCoin2 _2">
							<div class="ms_list_content _2">
								<div class="icon_warp"> <img src="/usdscash/webflow/images2/btc.svg" loading="lazy" alt="" class="ms_coin_icon"> </div>
								<div> 리플 <span class="small_grey">XRP</span> </div>
							</div>
							<div class="ms_list_content _2"> <div class="cnow"></div> </div>
							<div class="ms_list_content _2"> <div class="chigh"></div> </div>
							<div class="ms_list_content _2"> <div class="clow"></div> </div>
							<div class="ms_list_content _2"> <div class="rate_txt cchange"></div> </div>
							<div class="ms_list_content _2"> <div class="cvolume"></div> </div>
						</div>
						<div class="ms_list list mainCoin1 _1">
							<div class="ms_list_content _2">
								<div class="icon_warp"> <img src="/usdscash/webflow/images2/btc.svg" loading="lazy" alt="" class="ms_coin_icon"> </div>
								<div> 이더리움 <span class="small_grey">ETH</span> </div>
							</div>
							<div class="ms_list_content _2"> <div class="cnow"></div> </div>
							<div class="ms_list_content _2"> <div class="chigh"></div> </div>
							<div class="ms_list_content _2"> <div class="clow"></div> </div>
							<div class="ms_list_content _2"> <div class="rate_txt cchange"></div> </div>
							<div class="ms_list_content _2"> <div class="cvolume"></div> </div>
						</div>
						<div class="ms_list list mainCoin3 _2">
							<div class="ms_list_content _2">
								<div class="icon_warp"> <img src="/usdscash/webflow/images2/btc.svg" loading="lazy" alt="" class="ms_coin_icon"> </div>
								<div>트론<span class="small_grey">TRX</span> </div>
							</div>
							<div class="ms_list_content _2"> <div class="cnow"></div> </div>
							<div class="ms_list_content _2"> <div class="chigh"></div> </div>
							<div class="ms_list_content _2"> <div class="clow"></div> </div>
							<div class="ms_list_content _2"> <div class="rate_txt cchange"></div> </div>
							<div class="ms_list_content _2"> <div class="cvolume"></div> </div>
						</div>
						<div class="page_area">
							<a href="#" class="page_btn click w-button">1</a>
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
	<script src="/usdscash/js/mainSise.js" type="text/javascript"></script>
</body>
</html>