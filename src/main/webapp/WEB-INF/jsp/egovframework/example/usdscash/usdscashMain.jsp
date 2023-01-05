<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Thu Jan 05 2023 08:07:12 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="638ec077d218a81aa36ce5b0" data-wf-site="638d805ee804c444b60a5350">
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
							<div class="p_title">암호화폐 시세</div>
						</div>
						<!-- <div class="g_warn"> 현재 전 세계 암호화폐 시가총액은 $890십억이며, 최근 24시간 내 변동폭은<span class="rate down"> -1.9%↓</span>입니다. </div> -->
					</div>
					<div class="m_sc_list_box2">
						<div class="ms_list t">
							<div class="ms_list_content _1">
								<div>#</div>
							</div>
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
							<div class="ms_list_content _1"> <div>1</div> </div>
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
							<div class="ms_list_content _1"> <div>2</div> </div>
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
							<div class="ms_list_content _1"> <div>3</div> </div>
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
							<div class="ms_list_content _1"> <div>4</div> </div>
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
							<div class="ms_list_content _1"> <div>5</div> </div>
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
		<div class="pop m_popup">
			<div class="m_pop">
				<div class="m_pop_box">
					<div>This is some text inside of a div block.</div>
				</div>
				<div class="pop_btn_warp">
					<a href="#" class="today_btn w-button">오늘 하루 보지 않기</a>
					<div class="popx"> <img src="/usdscash/webflow/images2/wx_black.png" loading="lazy" sizes="100vw" srcset="/usdscash/webflow/images2/wx_black-p-500.png 500w, /usdscash/webflow/images2/wx_black-p-800.png 800w, /usdscash/webflow/images2/wx_black-p-1080.png 1080w, /usdscash/webflow/images2/wx_black-p-1600.png 1600w, /usdscash/webflow/images2/wx_black.png 1600w" alt="" class="popx_img"> </div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../usdscashFrame/bottom2.jsp"></jsp:include>
	<script>
		function conDisplay(){ 	
		    var con = document.getElementById("country"); 	
		    if(con.style.display=='none'){ 		
		    	con.style.display = 'flex'; 	
		    }else{ 		
		    	con.style.display = 'none'; 	
		    } 
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
				$(".mainCoin" + cnum).find(".cvolume").html(jdata.data.v);
				$(".mainCoin" + cnum).find(".chigh").html(jdata.data.h);
				$(".mainCoin" + cnum).find(".clow").html(jdata.data.l);
				$(".mainCoin" + cnum).find(".cchange").html(jdata.data.P+"");
				$(".mainCoin" + cnum).find(".cchange").removeClass("down");
				$(".mainCoin" + cnum).find(".cchange").removeClass("up");
				if(jdata.data.P < 0){
					$(".mainCoin" + cnum).find(".cchange").addClass("down");
				}
				else if(jdata.data.P > 0){
					$(".mainCoin" + cnum).find(".cchange").addClass("up");
				}
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
</body>
</html>