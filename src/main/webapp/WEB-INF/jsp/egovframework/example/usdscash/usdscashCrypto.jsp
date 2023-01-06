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
		<div class="article">
			<div class="section">
				<div class="ad_box"></div>
				<div class="p_section">
					<div class="c_p_section1">
						<div class="c_p_titleblock">
							<div class="coin_name">
								<img src="/usdscash/webflow/images2/binance_logo.svg" loading="lazy" alt="" class="coin_icon">
								<div>세이프 코인(Safe Coin)</div>
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
								<div>US$17,081.23</div>
								<div class="coin_rate down">↓ 4.2%</div>
								<a href="javascript:purchaseToggle()" class="c_purchase_btn w-button">구매하기</a>
							</div>
							<div class="warn"> 1.00000000000 Safe Coin <span class="rate up">0.01%↑</span> </div>
							<div class="coin_graph">
								<div class="coin_graph_bar"></div>
							</div>
							<div class="coin_graph_area">
								<div>US$16,906.82</div>
								<div>24시간 범위</div>
								<div>US$17,362.29</div>
							</div>
						</div>
						<div class="c_p_listblock">
							<div class="c_p_list_box">
								<div class="c_p_list_twarp">
									<div class="c_p_list">
										<div class="c_p_subject">
											<div>시가총액</div>
											<div class="ms_q_warp">
												<img src="/usdscash/webflow/images2/question.svg" loading="lazy" alt="" class="ms_q_icon">
												<div class="ms_q_box">
													<div> 유동성이란 암호화폐 자산이 내재가치를 반영하는 시세에서 거래될 가능성이 얼마나 되는지를 의미합니다. <br>거래소의 유동성 측정에는 다음 요소를 고려합니다.<br>(1) 웹트래픽 및 보고된 거래량<br>(2) 오더북 스프레드<br>(3) 거래 활동<br>(4) 거래쌍에서의 Trust Score </div>
												</div>
											</div>
										</div>
										<div class="c_p_list_txt">US$327,144,153,209</div>
										<img src="/usdscash/webflow/images2/round_arrow_1.svg" loading="lazy" alt="" class="ms_arrow">
									</div>
								</div>
							</div>
							<div class="c_p_list_box">
								<div class="c_p_list">
									<div class="c_p_subject">
										<div>24시간 거래대금</div>
										<div class="ms_q_warp">
											<img src="/usdscash/webflow/images2/question.svg" loading="lazy" alt="" class="ms_q_icon">
											<div class="ms_q_box">
												<div> 유동성이란 암호화폐 자산이 내재가치를 반영하는 시세에서 거래될 가능성이 얼마나 되는지를 의미합니다. <br>거래소의 유동성 측정에는 다음 요소를 고려합니다.<br>(1) 웹트래픽 및 보고된 거래량<br>(2) 오더북 스프레드<br>(3) 거래 활동<br>(4) 거래쌍에서의 Trust Score </div>
											</div>
										</div>
									</div>
									<div class="c_p_list_txt">US$327,144,153,209</div>
								</div>
							</div>
						</div>
					</div>
					<div class="c_p_section2">
						<div class="c_p_block1">
							<div class="c_chart_titlebox">
								<div class="c_chart_title">세이프 코인 가격 차트(Safe Coin/USD)</div>
								<div>최근 업데이트: 10:11AM UTC. 통화: USD.</div>
							</div>
							<div class="chart"></div>
							<div class="chart_list">
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
							</div>
						</div>
						<div class="c_p_block2">
							<div class="c_infoblock">
								<div class="c_chart_title">Safe Coin > USD 환전하기</div>
								<div class="form-block w-form">
									<form id="email-form-4" name="email-form-4">
										<div class="c_change_inpit_box">
											<div class="c_change_title">Safe Coin</div>
											<input type="text" class="input w-input" name="field-7" id="field-7">
										</div>
										<div class="c_change_inpit_box">
											<div class="c_change_title">USD</div>
											<input type="text" class="input w-input" name="field-7" id="field-7">
										</div>
										<div class="c_change_txt">
											1 Safe Coin = US$16,968.93<br>
										</div>
									</form>
								</div>
							</div>
							<div class="c_infoblock">
								<div class="c_chart_title">Safe Coin 가격 통계</div>
								<div class="c_info_list">
									<div>시세</div>
									<div class="c_info_txt">US$16,972.67</div>
								</div>
								<div class="c_info_list">
									<div>24시간 저가 / 24시간 고가</div>
									<div class="c_info_txt">US$16,972.67 / US$16,972.67</div>
								</div>
								<div class="c_info_list">
									<div>7일 저가 / 7일 고가</div>
									<div class="c_info_txt">US$16,972.67 / US$16,972.67</div>
								</div>
								<div class="c_info_list">
									<div>거래대금</div>
									<div class="c_info_txt">US$16,972.67</div>
								</div>
								<div class="c_info_list">
									<div>시가총액 순위</div>
									<div class="c_info_txt">#1</div>
								</div>
								<div class="c_info_list">
									<div>시가총액</div>
									<div class="c_info_txt">US$16,972.67</div>
								</div>
								<div class="c_info_list">
									<div>시가총액 점유율</div>
									<div class="c_info_txt">36.67%</div>
								</div>
								<div class="c_info_list">
									<div>거래대금/시가총액</div>
									<div class="c_info_txt">0.0601</div>
								</div>
								<div class="c_info_list">
									<div>역대 최고가</div>
									<div class="c_info_txt">
										US$16,972.67<span class="rate up"> -75.4%</span>
									</div>
								</div>
								<div class="c_info_list">
									<div>역대 최저가</div>
									<div class="c_info_txt">
										US$16,972.67 <span class="rate down">-75.4%</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="ad_box"></div>
			</div>
		</div>
		<jsp:include page="../usdscashFrame/footer2.jsp"></jsp:include>
		<div class="pop portfolio">
			<div class="pop_warn">
				<div class="pop_titleblock">
					<div>New Portfolio</div>
					<div class="exsit_btn">
						<img src="/usdscash/webflow/images2/wx_black.png" loading="lazy" sizes="100vw" srcset="/usdscash/webflow/images2/wx_black-p-500.png 500w, /usdscash/webflow/images2/wx_black-p-800.png 800w, /usdscash/webflow/images2/wx_black-p-1080.png 1080w, /usdscash/webflow/images2/wx_black-p-1600.png 1600w, /usdscash/webflow/images2/wx_black.png 1600w" alt="" class="exsit_icon">
					</div>
				</div>
				<div class="pop_general">
					<div class="w-form">
						<form id="email-form-3" name="email-form-3">
							<div class="genral_inpit">
								<input type="text" class="input2 w-input" name="field-6" id="field-6">
							</div>
							<div class="genral_btnwarp">
								<a href="#" class="genral_btn_pop _2 w-button">Cancle</a>
								<a href="#" class="genral_btn_pop w-button">Create</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="pop purchase" id="purchasePop">
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
</body>
</html>