<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Thu Jan 05 2023 08:07:12 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="638ff25c2ef2d24c3c5fa5d3"
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
					<div class="p_title_block">
						<div class="p_title_warp">
							<div class="pf_title_btn">
								<div class="p_title">My Portfolio</div>
								<div class="pf_toggle"></div>
								<img src="/usdscash/webflow/images2/round_arrow_1.svg"
									loading="lazy" alt="" class="ms_arrow">
								<div class="pf_c">생성</div>
								<div class="pf_c m">메인</div>
								<div class="c_portfolio_toggle _2">
									<div class="c_p_pbtn t">
										<div>All Portfolio</div>
										<div class="pf_c">생성</div>
										<div class="pf_c m">메인</div>
										<div class="p_add_btn">
											<img src="/usdscash/webflow/images2/plus.svg" loading="lazy"
												alt="" class="icon"><img
												src="/usdscash/webflow/images2/check_orange.svg"
												loading="lazy" alt="" class="icon">
										</div>
									</div>
									<div class="c_p_pbtn">
										<div>MyPortfolio</div>
										<div class="pf_c">생성</div>
										<div class="pf_c m">메인</div>
										<div class="p_add_btn">
											<img src="/usdscash/webflow/images2/plus.svg" loading="lazy"
												alt="" class="icon"><img
												src="/usdscash/webflow/images2/check_orange.svg"
												loading="lazy" alt="" class="icon">
										</div>
									</div>
									<div class="c_p_pbtn">
										<div>1Portfolio</div>
										<div class="pf_c">생성</div>
										<div class="pf_c m">메인</div>
										<div class="p_add_btn">
											<img src="/usdscash/webflow/images2/plus.svg" loading="lazy"
												alt="" class="icon"><img
												src="/usdscash/webflow/images2/check_orange.svg"
												loading="lazy" alt="" class="icon">
										</div>
									</div>
									<div class="c_p_pbtn2">
										<div>Add To New Portfolio</div>
										<div class="p_add_btn">
											<img src="/usdscash/webflow/images2/plus.svg" loading="lazy"
												alt="" class="icon">
										</div>
									</div>
								</div>
							</div>
							<div class="pf_btn_warp">
								<div class="pf_btn">
									<img src="/usdscash/webflow/images2/usds_list.png"
										loading="lazy" sizes="(max-width: 767px) 4vw, 20px"
										srcset="/usdscash/webflow/images2/usds_list-p-500.png 500w, /usdscash/webflow/images2/usds_list-p-800.png 800w, /usdscash/webflow/images2/usds_list-p-1080.png 1080w, /usdscash/webflow/images2/usds_list-p-2000.png 2000w, /usdscash/webflow/images2/usds_list.png 2000w"
										alt="" class="icon">
									<div class="c_portfolio_toggle _3">
										<div class="c_p_pbtn t">
											<div>
												메인 포트폴리오로 설정<br>
												<span class="warn">포트폴리오를 열면 이 포트폴리오가 <br>가장 먼저
													표시됩니다
												</span>
											</div>
											<div class="p_add_btn">
												<img src="/usdscash/webflow/images2/home.png" loading="lazy"
													sizes="100vw"
													srcset="/usdscash/webflow/images2/home-p-500.png 500w, /usdscash/webflow/images2/home-p-800.png 800w, /usdscash/webflow/images2/home-p-1080.png 1080w, /usdscash/webflow/images2/home-p-2000.png 2000w, /usdscash/webflow/images2/home.png 2000w"
													alt="" class="icon">
											</div>
										</div>
										<div class="c_p_pbtn">
											<div>Rename Portfolio</div>
											<div class="p_add_btn">
												<img src="/usdscash/webflow/images2/write.svg"
													loading="lazy" alt="" class="icon">
											</div>
										</div>
										<div class="c_p_pbtn">
											<div>Delete Portfolio</div>
											<div class="p_add_btn">
												<img src="/usdscash/webflow/images2/delete_1.svg"
													loading="lazy" alt="" class="icon">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="p_category">
							<div class="p_c_btnwarp">
								<div class="total_box">
									<div class="total_txt">US$ 0.00</div>
									<div>Total Profit Loss (-)</div>
								</div>
								<div class="p_c_option">
									<div class="p_rate_btn">
										<div class="p_rate_circle"></div>
									</div>
									<div>완전 희석 가치 보기</div>
									<div class="ms_q_warp">
										<img src="/usdscash/webflow/images2/question.svg"
											loading="lazy" alt="" class="ms_q_icon">
										<div class="ms_q_box _2">
											<div>
												유동성이란 암호화폐 자산이 내재가치를 반영하는 시세에서 거래될 가능성이 얼마나 되는지를 의미합니다. <br>거래소의
												유동성 측정에는 다음 요소를 고려합니다.<br>(1) 웹트래픽 및 보고된 거래량<br>(2)
												오더북 스프레드<br>(3) 거래 활동<br>(4) 거래쌍에서의 Trust Score
											</div>
										</div>
									</div>
								</div>
								<div class="pf_btn">
									<img src="/usdscash/webflow/images2/visiable_orange.svg"
										loading="lazy" alt="" class="pr_icon on"><img
										src="/usdscash/webflow/images2/invisiable.svg" loading="lazy"
										alt="" class="pr_icon off">
									<div class="pnl_hover">
										<div>내 수익률 표시설정</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="m_sc_list_box2">
						<div class="ms_list t">
							<div class="ms_list_content _1">
								<div>#</div>
								<img src="/usdscash/webflow/images2/round_arrow_1.svg"
									loading="lazy" alt="" class="ms_arrow">
							</div>
							<div class="ms_list_content _2">
								<div>코인</div>
								<img src="/usdscash/webflow/images2/round_arrow_1.svg"
									loading="lazy" alt="" class="ms_arrow">
							</div>
							<div class="ms_list_content _2">
								<div>시세</div>
								<img src="/usdscash/webflow/images2/round_arrow_1.svg"
									loading="lazy" alt="" class="ms_arrow">
							</div>
							<div class="ms_list_content _3">
								<div>1시간</div>
								<img src="/usdscash/webflow/images2/round_arrow_1.svg"
									loading="lazy" alt="" class="ms_arrow">
							</div>
							<div class="ms_list_content _3">
								<div>24시간</div>
								<img src="/usdscash/webflow/images2/round_arrow_1.svg"
									loading="lazy" alt="" class="ms_arrow">
							</div>
							<div class="ms_list_content _3">
								<div>7일</div>
								<img src="/usdscash/webflow/images2/round_arrow_1.svg"
									loading="lazy" alt="" class="ms_arrow">
							</div>
							<div class="ms_list_content _2">
								<div>시가총액</div>
								<img src="/usdscash/webflow/images2/round_arrow_1.svg"
									loading="lazy" alt="" class="ms_arrow">
							</div>
							<div class="ms_list_content _2">
								<div>FDV</div>
								<img src="/usdscash/webflow/images2/round_arrow_1.svg"
									loading="lazy" alt="" class="ms_arrow">
							</div>
							<div class="ms_list_content _4">
								<div>시총/FDV</div>
								<img src="/usdscash/webflow/images2/round_arrow_1.svg"
									loading="lazy" alt="" class="ms_arrow">
							</div>
							<div class="ms_list_content _2">
								<div>보유자산</div>
								<img src="/usdscash/webflow/images2/round_arrow_1.svg"
									loading="lazy" alt="" class="ms_arrow">
							</div>
							<div class="ms_list_content _2">
								<div>PNL(손익)</div>
								<img src="/usdscash/webflow/images2/round_arrow_1.svg"
									loading="lazy" alt="" class="ms_arrow">
							</div>
							<div class="ms_list_content _1"></div>
						</div>
						<div class="ms_list list">
							<div class="ms_list_content _1">
								<div>1</div>
							</div>
							<div class="ms_list_content _2">
								<div class="icon_warp">
									<img src="/usdscash/webflow/images2/btc.svg" loading="lazy"
										alt="" class="ms_coin_icon">
								</div>
								<div>
									비트코인 <span class="small_grey">bitcoin</span>
								</div>
							</div>
							<div class="ms_list_content _2">
								<div>US$17,064.89</div>
							</div>
							<div class="ms_list_content _3">
								<div class="rate_txt down">0.01%</div>
							</div>
							<div class="ms_list_content _3">
								<div class="rate_txt up">0.01%</div>
							</div>
							<div class="ms_list_content _3">
								<div class="rate_txt down">0.01%</div>
							</div>
							<div class="ms_list_content _2">
								<div>US$326,965,239,660</div>
							</div>
							<div class="ms_list_content _2">
								<div>US$357,139,608,000</div>
							</div>
							<div class="ms_list_content _4">
								<div>0.92</div>
							</div>
							<div class="ms_list_content _2">
								<div>
									US$326,965,239,660<br>0.0 BTC
								</div>
							</div>
							<div class="ms_list_content _2">
								<div>
									US$326,965,239,660<br>
									<span class="rate up">0%</span>
								</div>
							</div>
							<div class="ms_list_content _1">
								<div class="pnl_btn_warp">
									<div class="pnl_btn">
										<img src="/usdscash/webflow/images2/plus.svg" loading="lazy"
											alt="" class="pnl_icon">
										<div class="pnl_hover">
											<div>트랜잭션추가</div>
										</div>
									</div>
									<div class="pnl_btn">
										<img src="/usdscash/webflow/images2/toggle_right.svg"
											loading="lazy" alt="" class="pnl_icon">
										<div class="pnl_hover">
											<div>거래보기</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="ms_list more">
							<a href="#" class="m_sc_btn w-button">더보기</a>
						</div>
						<div class="page_area">
							<a href="#" class="page_btn w-button">◀</a> <a href="#"
								class="page_btn click w-button">1</a> <a href="#"
								class="page_btn w-button">2</a> <a href="#"
								class="page_btn w-button">3</a> <a href="#"
								class="page_btn w-button">4</a> <a href="#"
								class="page_btn w-button">▶</a>
						</div>
					</div>
				</div>
				<div class="p_section">
					<div class="p_title_block">
						<div class="c_p_titleblock">
							<div class="coin_name">
								<img src="/usdscash/webflow/images2/binance_logo.svg"
									loading="lazy" alt="" class="coin_icon">
								<div>비트코인(BTC)</div>
							</div>
							<div class="c_p_titlebox">
								<div>US$17,081.23</div>
								<div class="coin_rate down">↓ 4.2%</div>
								<a href="#" class="c_purchase_btn w-button">거래추가</a>
							</div>
						</div>
						<div class="p_category">
							<div class="p_c_btnwarp">
								<div class="total_box">
									<div class="total_txt">US$ 0.00</div>
									<div>Total Profit Loss (-)</div>
								</div>
							</div>
						</div>
					</div>
					<div class="m_sc_list_box2">
						<div class="ms_list t">
							<div class="ms_list_content _2">
								<div>유형</div>
							</div>
							<div class="ms_list_content _2">
								<div>시세</div>
							</div>
							<div class="ms_list_content _3">
								<div>수량</div>
							</div>
							<div class="ms_list_content _2">
								<div>날짜</div>
							</div>
							<div class="ms_list_content _2">
								<div>수수료</div>
							</div>
							<div class="ms_list_content _2">
								<div>비용</div>
							</div>
							<div class="ms_list_content _2">
								<div>진행</div>
							</div>
							<div class="ms_list_content _4">
								<div>PNL(손익)</div>
							</div>
							<div class="ms_list_content _3">
								<div>메모</div>
							</div>
							<div class="ms_list_content _3">
								<div>작업</div>
							</div>
						</div>
						<div class="ms_list list">
							<div class="ms_list_content _2">
								<div>구매</div>
							</div>
							<div class="ms_list_content _2">
								<div>US$17,064.89</div>
							</div>
							<div class="ms_list_content _3">
								<div>0.01</div>
							</div>
							<div class="ms_list_content _2">
								<div>2022-01-25 15:00</div>
							</div>
							<div class="ms_list_content _2">
								<div>US$357,139,608,000</div>
							</div>
							<div class="ms_list_content _2">
								<div>
									US$326,965,239,660<br>
								</div>
							</div>
							<div class="ms_list_content _2">
								<div>
									-<br>
								</div>
							</div>
							<div class="ms_list_content _4">
								<div class="rate_txt down">0.01%</div>
							</div>
							<div class="ms_list_content _3">
								<div>
									-<br>
								</div>
							</div>
							<div class="ms_list_content _3">
								<div>
									-<br>
								</div>
							</div>
						</div>
						<div class="ms_list more">
							<a href="#" class="m_sc_btn w-button">더보기</a>
						</div>
						<div class="page_area">
							<a href="#" class="page_btn w-button">◀</a> <a href="#"
								class="page_btn click w-button">1</a> <a href="#"
								class="page_btn w-button">2</a> <a href="#"
								class="page_btn w-button">3</a> <a href="#"
								class="page_btn w-button">4</a> <a href="#"
								class="page_btn w-button">▶</a>
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
					<img src="/usdscash/webflow/images2/usds_logo_1.svg" loading="lazy"
						alt="" class="pop_logo">
					<div class="exsit_btn">
						<img src="/usdscash/webflow/images2/wx_black.png" loading="lazy"
							sizes="100vw"
							srcset="/usdscash/webflow/images2/wx_black-p-500.png 500w, /usdscash/webflow/images2/wx_black-p-800.png 800w, /usdscash/webflow/images2/wx_black-p-1080.png 1080w, /usdscash/webflow/images2/wx_black-p-1600.png 1600w, /usdscash/webflow/images2/wx_black.png 1600w"
							alt="" class="exsit_icon">
					</div>
				</div>
				<div class="pop_general">
					<div class="w-form">
						<form id="email-form-5" name="email-form-5"
							data-name="Email Form 5" method="get">
							<div class="p_poptitle">구매하기</div>
							<div class="p_input">
								<img src="/usdscash/webflow/images2/btc.svg" loading="lazy"
									alt="" class="coin_icon">
								<div>비트코인</div>
							</div>
							<div class="p_poptitle">결재수단 선택</div>
							<div class="p_input">
								<div>결재수단</div>
								<div class="p_pop_btn">
									<img src="/usdscash/webflow/images2/usds_list.png"
										loading="lazy" sizes="100vw"
										srcset="/usdscash/webflow/images2/usds_list-p-500.png 500w, /usdscash/webflow/images2/usds_list-p-800.png 800w, /usdscash/webflow/images2/usds_list-p-1080.png 1080w, /usdscash/webflow/images2/usds_list-p-2000.png 2000w, /usdscash/webflow/images2/usds_list.png 2000w"
										alt="" class="icon">
								</div>
							</div>
							<div class="p_poptitle">지급금액</div>
							<div class="p_input">
								<input type="text" class="input w-input" maxlength="256"
									name="field-8" data-name="Field 8" placeholder="Example Text"
									id="field-8" required="">
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