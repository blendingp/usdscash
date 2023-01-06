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