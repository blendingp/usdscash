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
				
				<div class="p_section">
					<div class="p_title_block">
						<div class="p_title_warp">
							<div class="p_title"><spring:message code="menu.crypto"/> <spring:message code="wallet.marketPrice"/></div>
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
							<c:set var="coinName" value="SafeCoin"/>
							<div class="ms_list_content _1"> <div>1</div> </div>
							<div class="ms_list_content _2">
								<div class="icon_warp"> <img src="/usdscash/webflow/images2/binance_logo.svg" loading="lazy" alt="" class="ms_coin_icon"> </div>
								<div> <spring:message code="trade.coin.${fn:toLowerCase(coinName)}"/> <span class="small_grey">${coinName}</span> </div>
							</div>
							<div class="ms_list_content _2"> <div class="cnow"></div> </div>
							<div class="ms_list_content _2"> <div class="chigh"></div> </div>
							<div class="ms_list_content _2"> <div class="clow"></div> </div>
							<div class="ms_list_content _2"> <div class="rate_txt cchange"></div> </div>
							<div class="ms_list_content _2"> <div class="cvolume"></div> </div>
						</div>
						<c:forEach var="coinL" items="${coinlist}" varStatus="i">
							<c:set var="coinName" value="${coinL.coinName}"/>
							<div class="ms_list list mainCoin${coinL.coinNum}" onclick="location.href='/usdscash/user/cryptoDetail.do?coinNum=${coinL.coinNum}'" style="cursor:pointer">
								<div class="ms_list_content _1"> <div>${i.index+2}</div> </div>
								<div class="ms_list_content _2">
									<div class="icon_warp"> <img src="/usdscash/webflow/images2/${fn:toLowerCase(coinL.coinName)}.svg" loading="lazy" alt="" class="ms_coin_icon"> </div>
									<div><spring:message code="trade.coin.${fn:toLowerCase(coinName)}"/><span class="small_grey">${coinName}</span>
									</div>
								</div>
								<div class="ms_list_content _2"> <div class="cnow"></div> </div>
								<div class="ms_list_content _2"> <div class="chigh"></div> </div>
								<div class="ms_list_content _2"> <div class="clow"></div> </div>
								<div class="ms_list_content _2"> <div class="rate_txt cchange"></div> </div>
								<div class="ms_list_content _2"> <div class="cvolume"></div> </div>
							</div>
						</c:forEach>
						<div class="page_area">
							<a href="#" class="page_btn click w-button">1</a>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		<jsp:include page="../usdscashFrame/footer2.jsp"></jsp:include>
		<div class="pop m_popup" id="popDiv">
			<c:forEach var="item" items="${notilist}">
				<div class="m_pop" id="popupn${item.bidx}" style="display: none;">
					<div class="m_pop_box">
						<div style="word-break: break-all; line-height: normal;">${item.text}</div>
					</div>
					<div class="pop_btn_warp">
						<a href="#" onclick="closepopupn24('${item.bidx}')" class="today_btn w-button"><spring:message code="menu.24nonshow" /></a>
						<div class="popx" onclick="closepopupn('${item.bidx}')"> <img src="/usdscash/webflow/images2/wx_black.png" loading="lazy" sizes="100vw" srcset="/usdscash/webflow/images2/wx_black-p-500.png 500w, /usdscash/webflow/images2/wx_black-p-800.png 800w, /usdscash/webflow/images2/wx_black-p-1080.png 1080w, /usdscash/webflow/images2/wx_black-p-1600.png 1600w, /usdscash/webflow/images2/wx_black.png 1600w" alt="" class="popx_img"> </div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="../usdscashFrame/bottom2.jsp"></jsp:include>
	<script>
	function notiCloseCheck(){
		var allClose = true;
		$.each($(".m_pop"), function(index, item){
	 		if($(item).css("display") != 'none') allClose = false;
		})
		if(allClose){
			$("#popDiv").css("display","none");
		}
	}

	getCookieMobile ();
	function getCookieMobile () {
	    var cookiedata = document.cookie;
	    let lang = 1;
	    <c:forEach var="result" items="${notilist}">
	        if ( cookiedata.indexOf("popupn${result.bidx}=done") < 0){    
	        	$("#popDiv").css('display','flex');
	            $("#popupn${result.bidx}").css('display' ,'block');    
	        }else {
	            $("#popupn${result.bidx}").css('display' ,'none');
	        }            
	                
	    </c:forEach>
	    notiCloseCheck();
	}
	function closepopupn(pidx){
	    $("#popupn"+pidx).hide();
	    notiCloseCheck();
	}
	function closepopupn24(pidx){
		setCookieMobile( "popupn"+pidx , "done" , 1);
	    $("#popupn"+pidx).hide();
	    notiCloseCheck();
	}

	function setCookieMobile ( name, value, expiredays ) {    
	    var todayDate = new Date();
	    todayDate.setDate( todayDate.getDate() + expiredays );
	    document.cookie = name + "=" + encodeURI(value)  + "; path=/; expires=" + todayDate.toGMTString() + ";"
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
	</script>
	<script src="/usdscash/js/mainSise.js" type="text/javascript"></script>
</body>
</html>