<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
<html data-wf-page="638efbc5f9d564f728754fb5" data-wf-site="638d805ee804c444b60a5350">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../usdscashFrame/header2.jsp"></jsp:include>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body class="body">
	<div class="frame">
		<jsp:include page="../usdscashFrame/top2.jsp"></jsp:include>
		<div class="article">
			<div class="section">
				
				<div class="p_section">
					<div class="p_title_block">
						<div class="p_title_warp">
							<div class="p_title">Trust Score 기준 상위 암호화폐 거래소 순위</div>
						</div>
						<div class="g_warn">현재 암호화폐 거래소 546곳을 추적하고 있으며 총 24시간 거래량은
							52십억$, 24시간 내 변동폭은 4.43%입니다. 현재 최대 암호화폐 거래소 3곳은 바이낸스 (Binance),
							지닥스 (GDAX), 게이트 (Gate.io)입니다.</div>
						<div class="p_category">
							<div class="p_c_btnwarp">
								<div class="p_c_btn" onclick="conDisplay()">
									<div>모든 국가</div>
								</div>
								<div class="p_c_toggle" style="display:none;" id="country">
									<div class="p_c_toggle_warp">
										<div class="form-block w-form">
											<form id="email-form-2" name="email-form-2"
												data-name="Email Form 2" method="get">
												<div class="c_search_box">
													<div class="search_btn">
														<img src="/usdscash/webflow/images2/search.svg" loading="lazy" alt="" class="icon">
													</div>
													<input type="text" class="search_input w-input" maxlength="256" name="field-6" data-name="Field 6" placeholder="검색" id="field-6" required="">
												</div>
											</form>
										</div>
										<a id="w-node-_37c42ec2-42fa-2e4d-8363-d60418c4f2a4-28754fb5" href="#" class="p_c_togglebtn w-button">All</a> 
										<a id="w-node-e536c1c0-5c3e-ce57-3076-41bd214f8c10-28754fb5" href="#" class="p_c_togglebtn w-button">All</a> 
										<a id="w-node-_37c42ec2-42fa-2e4d-8363-d60418c4f2a4-28754fb5" href="#" class="p_c_togglebtn w-button">All</a>
										<a id="w-node-_37c42ec2-42fa-2e4d-8363-d60418c4f2a4-28754fb5" href="#" class="p_c_togglebtn w-button">All</a>
										<a id="w-node-_37c42ec2-42fa-2e4d-8363-d60418c4f2a4-28754fb5" href="#" class="p_c_togglebtn w-button">All</a>
										<a id="w-node-_37c42ec2-42fa-2e4d-8363-d60418c4f2a4-28754fb5" href="#" class="p_c_togglebtn w-button">All</a>
										<a id="w-node-_37c42ec2-42fa-2e4d-8363-d60418c4f2a4-28754fb5" href="#" class="p_c_togglebtn w-button">All</a>
										<a id="w-node-_37c42ec2-42fa-2e4d-8363-d60418c4f2a4-28754fb5" href="#" class="p_c_togglebtn w-button">All</a>
										<a id="w-node-_37c42ec2-42fa-2e4d-8363-d60418c4f2a4-28754fb5" href="#" class="p_c_togglebtn w-button">All</a>
										<a id="w-node-_37c42ec2-42fa-2e4d-8363-d60418c4f2a4-28754fb5" href="#" class="p_c_togglebtn w-button">All</a>
										<a id="w-node-_37c42ec2-42fa-2e4d-8363-d60418c4f2a4-28754fb5" href="#" class="p_c_togglebtn w-button">All</a>
										<a id="w-node-_37c42ec2-42fa-2e4d-8363-d60418c4f2a4-28754fb5" href="#" class="p_c_togglebtn w-button">All</a>
										<a id="w-node-_37c42ec2-42fa-2e4d-8363-d60418c4f2a4-28754fb5" href="#" class="p_c_togglebtn w-button">All</a>
										<a id="w-node-_37c42ec2-42fa-2e4d-8363-d60418c4f2a4-28754fb5" href="#" class="p_c_togglebtn w-button">All</a>
										
									</div>
								</div>
							</div>
						</div>
					</div>
					<div>
						<div class="m_sc_list_box2">
							<div class="ms_list t">
								<div class="ms_list_content _1">
									<div>#</div>
									<img src="/usdscash/webflow/images2/round_arrow_1.svg" loading="lazy" alt=""
										class="ms_arrow">
								</div>
								<div class="ms_list_content _2">
									<div>코인</div>
									<img src="/usdscash/webflow/images2/round_arrow_1.svg" loading="lazy" alt=""
										class="ms_arrow">
								</div>
								<div class="ms_list_content _2">
									<div>
										<strong>Trust Score</strong>
									</div>
									<img src="/usdscash/webflow/images2/round_arrow_1.svg" loading="lazy" alt=""
										class="ms_arrow">
								</div>
								<div class="ms_list_content _2">
									<div>
										<strong>Reserve Data</strong>
									</div>
									<img src="/usdscash/webflow/images2/round_arrow_1.svg" loading="lazy" alt=""
										class="ms_arrow">
								</div>
								<div class="ms_list_content _2">
									<div>
										<strong>24시간 거래대금 (정규화)</strong>
									</div>
									<img src="/usdscash/webflow/images2/round_arrow_1.svg" loading="lazy" alt=""
										class="ms_arrow">
								</div>
								<div class="ms_list_content _2">
									<div>24시간 거래량</div>
									<img src="/usdscash/webflow/images2/round_arrow_1.svg" loading="lazy" alt=""
										class="ms_arrow">
								</div>
								<div class="ms_list_content _2">
									<div>
										<strong>방문수 (SimilarWeb)</strong>
									</div>
									<img src="/usdscash/webflow/images2/round_arrow_1.svg" loading="lazy" alt=""
										class="ms_arrow">
								</div>
							</div>
							<div class="ms_list list">
								<div class="ms_list_content _1">
									<div>1</div>
								</div>
								<div class="ms_list_content _2">
									<div class="icon_warp">
										<img src="/usdscash/webflow/images2/binance_logo.svg" loading="lazy" alt=""
											class="ms_coin_icon">
									</div>
									<a href="#" class="ms_list_link">바이낸스(Binance) <span
										class="small_grey">중앙화</span></a>
								</div>
								<div class="ms_list_content _2">
									<div class="trust_graph list">
										<div class="trust_graph_bar"></div>
									</div>
									<div class="list-trust">10</div>
								</div>
								<div class="ms_list_content _2">
									<div class="data_r">사용 가능</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$357,139,608,000</div>
								</div>
							</div>
							<div class="ms_list list">
								<div class="ms_list_content _1">
									<div>1</div>
								</div>
								<div class="ms_list_content _2">
									<div class="icon_warp">
										<img src="/usdscash/webflow/images2/binance_logo.svg" loading="lazy" alt=""
											class="ms_coin_icon">
									</div>
									<a href="#" class="ms_list_link">바이낸스(Binance) <span
										class="small_grey">중앙화</span></a>
								</div>
								<div class="ms_list_content _2">
									<div class="trust_graph list">
										<div class="trust_graph_bar"></div>
									</div>
									<div class="list-trust">10</div>
								</div>
								<div class="ms_list_content _2">
									<div class="data_r no">이용불가</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$357,139,608,000</div>
								</div>
							</div>
							<div class="ms_list list">
								<div class="ms_list_content _1">
									<div>1</div>
								</div>
								<div class="ms_list_content _2">
									<div class="icon_warp">
										<img src="/usdscash/webflow/images2/binance_logo.svg" loading="lazy" alt=""
											class="ms_coin_icon">
									</div>
									<a href="#" class="ms_list_link">바이낸스(Binance) <span
										class="small_grey">중앙화</span></a>
								</div>
								<div class="ms_list_content _2">
									<div class="trust_graph list">
										<div class="trust_graph_bar"></div>
									</div>
									<div class="list-trust">10</div>
								</div>
								<div class="ms_list_content _2">
									<div class="data_r no">이용불가</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$357,139,608,000</div>
								</div>
							</div>
							<div class="ms_list list">
								<div class="ms_list_content _1">
									<div>1</div>
								</div>
								<div class="ms_list_content _2">
									<div class="icon_warp">
										<img src="/usdscash/webflow/images2/binance_logo.svg" loading="lazy" alt=""
											class="ms_coin_icon">
									</div>
									<a href="#" class="ms_list_link">바이낸스(Binance) <span
										class="small_grey">중앙화</span></a>
								</div>
								<div class="ms_list_content _2">
									<div class="trust_graph list">
										<div class="trust_graph_bar"></div>
									</div>
									<div class="list-trust">10</div>
								</div>
								<div class="ms_list_content _2">
									<div class="data_r no">이용불가</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$357,139,608,000</div>
								</div>
							</div>
							<div class="ms_list list">
								<div class="ms_list_content _1">
									<div>1</div>
								</div>
								<div class="ms_list_content _2">
									<div class="icon_warp">
										<img src="/usdscash/webflow/images2/binance_logo.svg" loading="lazy" alt=""
											class="ms_coin_icon">
									</div>
									<a href="#" class="ms_list_link">바이낸스(Binance) <span
										class="small_grey">중앙화</span></a>
								</div>
								<div class="ms_list_content _2">
									<div class="trust_graph list">
										<div class="trust_graph_bar"></div>
									</div>
									<div class="list-trust">10</div>
								</div>
								<div class="ms_list_content _2">
									<div class="data_r no">이용불가</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$357,139,608,000</div>
								</div>
							</div>
							<div class="ms_list list">
								<div class="ms_list_content _1">
									<div>1</div>
								</div>
								<div class="ms_list_content _2">
									<div class="icon_warp">
										<img src="/usdscash/webflow/images2/binance_logo.svg" loading="lazy" alt=""
											class="ms_coin_icon">
									</div>
									<a href="#" class="ms_list_link">바이낸스(Binance) <span
										class="small_grey">중앙화</span></a>
								</div>
								<div class="ms_list_content _2">
									<div class="trust_graph list">
										<div class="trust_graph_bar"></div>
									</div>
									<div class="list-trust">10</div>
								</div>
								<div class="ms_list_content _2">
									<div class="data_r no">이용불가</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$357,139,608,000</div>
								</div>
							</div>
							<div class="ms_list list">
								<div class="ms_list_content _1">
									<div>1</div>
								</div>
								<div class="ms_list_content _2">
									<div class="icon_warp">
										<img src="/usdscash/webflow/images2/binance_logo.svg" loading="lazy" alt=""
											class="ms_coin_icon">
									</div>
									<a href="#" class="ms_list_link">바이낸스(Binance) <span
										class="small_grey">중앙화</span></a>
								</div>
								<div class="ms_list_content _2">
									<div class="trust_graph list">
										<div class="trust_graph_bar"></div>
									</div>
									<div class="list-trust">10</div>
								</div>
								<div class="ms_list_content _2">
									<div class="data_r no">이용불가</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$357,139,608,000</div>
								</div>
							</div>
							<div class="ms_list list">
								<div class="ms_list_content _1">
									<div>1</div>
								</div>
								<div class="ms_list_content _2">
									<div class="icon_warp">
										<img src="/usdscash/webflow/images2/binance_logo.svg" loading="lazy" alt=""
											class="ms_coin_icon">
									</div>
									<a href="#" class="ms_list_link">바이낸스(Binance) <span
										class="small_grey">중앙화</span></a>
								</div>
								<div class="ms_list_content _2">
									<div class="trust_graph list">
										<div class="trust_graph_bar"></div>
									</div>
									<div class="list-trust">10</div>
								</div>
								<div class="ms_list_content _2">
									<div class="data_r no">이용불가</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$357,139,608,000</div>
								</div>
							</div>
							<div class="ms_list list">
								<div class="ms_list_content _1">
									<div>1</div>
								</div>
								<div class="ms_list_content _2">
									<div class="icon_warp">
										<img src="/usdscash/webflow/images2/binance_logo.svg" loading="lazy" alt="" class="ms_coin_icon">
									</div>
									<a href="#" class="ms_list_link">바이낸스(Binance) <span class="small_grey">중앙화</span></a>
								</div>
								<div class="ms_list_content _2">
									<div class="trust_graph list">
										<div class="trust_graph_bar"></div>
									</div>
									<div class="list-trust">10</div>
								</div>
								<div class="ms_list_content _2">
									<div class="data_r no">이용불가</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$357,139,608,000</div>
								</div>
							</div>
							<div class="ms_list list">
								<div class="ms_list_content _1">
									<div>1</div>
								</div>
								<div class="ms_list_content _2">
									<div class="icon_warp">
										<img src="/usdscash/webflow/images2/binance_logo.svg" loading="lazy" alt="" class="ms_coin_icon">
									</div>
									<a href="#" class="ms_list_link">바이낸스(Binance) <span class="small_grey">중앙화</span></a>
								</div>
								<div class="ms_list_content _2">
									<div class="trust_graph list">
										<div class="trust_graph_bar"></div>
									</div>
									<div class="list-trust">10</div>
								</div>
								<div class="ms_list_content _2">
									<div class="data_r no">이용불가</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$357,139,608,000</div>
								</div>
							</div>
							<div class="ms_list list">
								<div class="ms_list_content _1">
									<div>1</div>
								</div>
								<div class="ms_list_content _2">
									<div class="icon_warp">
										<img src="/usdscash/webflow/images2/binance_logo.svg" loading="lazy" alt="" class="ms_coin_icon">
									</div>
									<a href="#" class="ms_list_link">바이낸스(Binance) <span class="small_grey">중앙화</span></a>
								</div>
								<div class="ms_list_content _2">
									<div class="trust_graph list">
										<div class="trust_graph_bar"></div>
									</div>
									<div class="list-trust">10</div>
								</div>
								<div class="ms_list_content _2">
									<div class="data_r no">이용불가</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$155,305,059</div>
								</div>
								<div class="ms_list_content _2">
									<div>US$357,139,608,000</div>
								</div>
							</div>
							<div class="ms_list more">
								<a href="#" class="m_sc_btn w-button">더보기</a>
							</div>
							<div class="page_area">
								<a href="#" class="page_btn w-button">◀</a> 
								<a href="#" class="page_btn click w-button">1</a> 
								<a href="#" class="page_btn w-button">2</a> 
								<a href="#" class="page_btn w-button">3</a> 
								<a href="#" class="page_btn w-button">4</a> 
								<a href="#" class="page_btn w-button">▶</a>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		<jsp:include page="../usdscashFrame/footer2.jsp"></jsp:include>
		<!-- <div class="popup" id="popDiv">
			<c:forEach var="item" items="${notilist}">
				<div class="main_noticepop" id="popupn${item.bidx}"
					style="display: none;">
					<div class="mainpop_block">
						<div class="main_popfeild" style="word-break: break-all; line-height: normal;">${item.text}</div>
						<div class="warp2">
							<a href="#" onclick="closepopupn(${item.bidx})"
								class="mainpopbtn w-button"><spring:message
									code="pop.withdrawRequest_5" /></a>
							<div class="form-block-15 w-form">
								<label class="w-checkbox checkbox-field"> <input
									type="checkbox" id="popupnc${item.bidx}"
									class="w-checkbox-input checkbox-3"> <span
									class="checkbox-label w-form-label" for="checkbox"> <spring:message
											code="menu.24nonshow" />
								</span>
								</label>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div> -->
		<div class="pop m_popup">
			<div class="m_pop">
				<div class="m_pop_box">
					<div>This is some text inside of a div block.</div>
				</div>
				<div class="pop_btn_warp">
					<a href="#" class="today_btn w-button">오늘 하루 보지 않기</a>
					<div class="popx">
						<img src="/usdscash/webflow/images2/wx_black.png" loading="lazy" sizes="100vw"
							srcset="/usdscash/webflow/images2/wx_black-p-500.png 500w, /usdscash/webflow/images2/wx_black-p-800.png 800w, /usdscash/webflow/images2/wx_black-p-1080.png 1080w, /usdscash/webflow/images2/wx_black-p-1600.png 1600w, /usdscash/webflow/images2/wx_black.png 1600w"
							alt="" class="popx_img">
					</div>
				</div>
			</div>
		</div>
	</div>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=636de9ea5f52266a6d1606f1" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="js/webflow2.js" type="text/javascript"></script>
  <!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
</body>
  <script>
  function conDisplay(){ 	
	    var con = document.getElementById("country"); 	
	    if(con.style.display=='none'){ 		
	    	con.style.display = 'flex'; 	
	    }else{ 		
	    	con.style.display = 'none'; 	
	    } 
	}
			//메뉴
			function ready() {
				alert("<spring:message code='pop.ServiceReady_1'/>");
			}

			function notiCloseCheck() {
				var allClose = true;
				$.each($(".main_noticepop"), function(index, item) {
					if ($(item).css("display") == 'flex')
						allClose = false;
				})
				if (allClose) {
					$("#popDiv").css("display", "none");
				}
			}

			getCookieMobile();
			function getCookieMobile() {
				var cookiedata = document.cookie;
				let
				lang = 1;
				<c:forEach var="result" items="${notilist}">
				if (cookiedata.indexOf("popupn${result.bidx}=done") < 0) {
					$("#popDiv").css('display', 'flex');
					$("#popupn${result.bidx}").css('display', 'flex');
				} else {
					$("#popupn${result.bidx}").css('display', 'none');
				}

				</c:forEach>
				notiCloseCheck();
			}
			function closepopupn(pidx) {
				var ck = $("#popupnc" + pidx).is(":checked");
				if (ck) {
					setCookieMobile("popupn" + pidx, "done", 1);
				}
				$("#popupn" + pidx).hide();
				notiCloseCheck();
			}

			function setCookieMobile(name, value, expiredays) {
				var todayDate = new Date();
				todayDate.setDate(todayDate.getDate() + expiredays);
				document.cookie = name + "=" + encodeURI(value)
						+ "; path=/; expires=" + todayDate.toGMTString() + ";"
			}

			function fmtNum(num) {
				if (num == null)
					return 0;
				if (num.length <= 3)
					return num;

				var decimalv = "";

				if (num.indexOf(".") != -1) {
					var numarr = num.split(".");
					num = numarr[0];
					decimalv = "." + numarr[1];
				}

				var len, point, str;
				let
				min = "";

				num = num + "";
				if (num.charAt(0) == '-') {
					num = num.substr(1);
					min = "-";
				}

				point = num.length % 3;
				str = num.substring(0, point);
				len = num.length;

				while (point < len) {
					if (str != "")
						str += ",";
					str += num.substring(point, point + 3);
					point += 3;
				}
				return min + str + decimalv;
			}

			function getSymbol(symbol) {
				switch (symbol) {
				case "BTCUSDT":
				case "BTC":
				case "BTCUSD":
					return 0;
				case "ETHUSDT":
				case "ETH":
				case "ETHUSD":
					return 1;
				case "XRPUSDT":
				case "XRP":
				case "XRPUSD":
					return 2;
				case "TRXUSDT":
				case "TRX":
				case "TRXUSD":
					return 3;
				case "DOGEUSDT":
				case "DOGE":
				case "DOGEUSD":
					return 4;
				default:
					break;
				}
			}

			var coinArr = new Array('BTCUSDT', 'ETHUSDT', 'XRPUSDT', 'TRXUSDT'); // 코인 변수명 
			var fPrice = new Object;

			var wsAPIUri = "wss://fstream.binance.com/stream?streams=";
			for (i = 0; i < coinArr.length; i++) {
				if (i == 0) {
					wsAPIUri += coinArr[i].toLowerCase() + '@kline_1m';
				} else {
					wsAPIUri += '/' + coinArr[i].toLowerCase() + '@kline_1m';
				}
				wsAPIUri += '/' + coinArr[i].toLowerCase() + '@ticker';
			}

			var websocket2;

			function initAPI() {
				websocket2 = new WebSocket(wsAPIUri);
				websocket2.onopen = function(evt) {
					console.log("connect OK");
					onAPIOpen(evt);
				};
				websocket2.onmessage = function(evt) {
					onAPIMessage(evt);
				};
				websocket2.onerror = function(evt) {
					onAPIError(evt);
				};
				websocket2.onclose = function(evt) {
					console.log("API 재접속");
					setTimeout("initAPI()", 1000);
				};
			}
			function onAPIOpen(evt) {
				console.log('APIOPEN---------------')
			}
			function onAPIMessage(evt) {
				let
				jdata = JSON.parse(evt.data);
				let
				stream = jdata.stream;

				if (stream.slice(-7) === '@ticker') {
					var symbol = stream.slice(0, -7).toUpperCase();
					var cnum = getSymbol(jdata.data.s);
					$(".mainCoin" + cnum).find(".chigh").html(jdata.data.h);
					$(".mainCoin" + cnum).find(".clow").html(jdata.data.l);
				}
				if (stream.slice(-9) === '@kline_1m') {
					try {
						fPrice[jdata.data.s] = jdata.data.k['c'];
						let
						arr = new Array(5);
						let
						coin = [ 'BTC', 'ETH', 'XRP', 'TRX', 'DOGE' ];
						for (i = 0; i < coin.length; i++) {
							let
							sym = coin[i];
							let
							type;
							sym === 'BTC' ? type = 0 : sym === 'ETH' ? type = 1
									: sym === 'XRP' ? type = 2
											: sym === 'TRX' ? type = 3
													: sym === 'DOGE' ? type = 4
															: '';
							for (key in fPrice) {
								if (key === sym + 'USDT') {
									arr[type] = fPrice[key];
								}
							}
						}
						for (var k = 0; k < 5; k++) {
							$(".mainCoin" + k).find(".cnow").html(arr[k]);

						}
					} catch (e) {
						console.log(stream, " kline err", e);
					}
				}
			}
			window.addEventListener("load", initAPI, false);
		</script>
</html>