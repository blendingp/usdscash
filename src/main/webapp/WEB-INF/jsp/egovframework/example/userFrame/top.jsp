<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<style>
.not_scroll{
    overflow: hidden;
}
.button-3.w-button{
    margin-left: 20px;
    margin-right: 20px;
}
</style>
	<div class="top">
		<div class="topblock">
			<div class="mob_sidebtn" onclick="mobMenu()"><img src="/usdscash/webflow/images/menu_square_white.svg" loading="lazy" alt="" class="image-44"></div>
			<div class="logoblock" onclick="location.href='/usdscash/user/main.do'">
				<img src="/usdscash/webflow/images/sub_logo1.svg" class="logo">
			</div>
			<div class="top_menubtnlist">
				<div class="topmenubtn">
					<a href="/usdscash/user/main.do" class="topbtn <c:if test="${currentP eq 'main'}">click</c:if> w-button"><spring:message code="menu.main"/></a>
				</div>
				<div class="topmenubtn">
					<a href="/usdscash/user/main.do" class="topbtn <c:if test="${currentP eq 'trade'}">click</c:if> w-button"><spring:message code="menu.crypto"/></a>
				</div>
				<div class="topmenubtn">
					<img src="/usdscash/webflow/images/more_icon3.svg" loading="lazy" alt="" class="top_arrow">
 					<a onclick="dropToggle(this)" href="#" class="topbtn <c:if test="${currentP eq 'wallet'}">click</c:if> w-button"><spring:message code="menu.depandwith"/></a> 
					<div class="topbtn_drop">
						<a href="/usdscash/user/myasset.do" class="button-14-copy w-button"><spring:message code="menu.depandwith"/></a> 
						<%-- <a href="/usdscash/user/kmyasset.do" class="button-14-copy w-button krw_menu">KRW <spring:message code="menu.depandwith"/></a> --%> 
						<%-- <a href="/usdscash/user/transactions.do" class="button-14-copy w-button"><spring:message code="wallet.DeandWithHistory_m"/></a> 
						<a href="/usdscash/user/exchange.do" class="button-14-copy w-button"><spring:message code="wallet.menu.exchange"/></a> 
						<a href="/usdscash/user/transfer.do" class="button-14-copy w-button"><spring:message code="wallet.futuresExchange"/></a> 
						<a href="/usdscash/user/requestList.do" class="button-14-copy w-button"><spring:message code="wallet.withdrawallist"/></a> --%> 
					</div>
				</div>
				<div class="topmenubtn tall">
					<img src="/usdscash/webflow/images/more_icon3.svg" loading="lazy" alt="" class="top_arrow">
 					<a onclick="dropToggle(this)" href="#" class="topbtn <c:if test="${currentP eq 'customer'}">click</c:if> w-button"><spring:message code="menu.support"/></a> 
					<div class="topbtn_drop tall">
						<a href="/usdscash/customerService.do" class="button-14-copy w-button"><spring:message code="menu.support" /></a> 
						<a href="/usdscash/board/noticeList.do" class="button-14-copy w-button"><spring:message code="menu.notice" /></a> 
						<a href="/usdscash/board/faqList.do" class="button-14-copy w-button"><spring:message code="menu.faq"/></a> 
						<a href="/usdscash/user/helpCenter.do" class="button-14-copy w-button"><spring:message code="submitRequest" /></a> 
					</div>
					<%-- <a href="#" class="button-3 w-button servicep"><spring:message code="menu.support"/></a> --%>
				</div>
				<div class="topmenubtn tall">
					<img src="/usdscash/webflow/images/more_icon3.svg" loading="lazy" alt="" class="top_arrow">
					<a href="#" onclick="dropToggle(this)" class="topbtn <c:if test="${currentP eq 'mypage'}">click</c:if> w-button"><spring:message code="menu.mypage"/></a> 
					<div class="topbtn_drop tall">
						<a href="/usdscash/user/tradeHistory.do" class="button-14-copy w-button"><spring:message code="trade.tradeHistory"/></a>
<%-- 						<c:if test="${userLevel eq 'chong'}">  --%>
<%-- 							<a href="/usdscash/user/referells.do" class="button-14-copy w-button"><spring:message code="menu.referrals"/></a> --%>
<%-- 						</c:if>  --%>
						<a href="/usdscash/user/tradeSpotHistory.do" class="button-14-copy w-button"><spring:message code="pop.show.SpotHistory"/></a>
						<a href="/usdscash/user/fundingHistory.do" class="button-14-copy w-button"><spring:message code="menu.fundingHistory"/></a>
					</div>
				<%-- <a href="javascript:menuShow('mypageMenu')" class="button-3 w-button"><spring:message code="menu.mypage"/></a> --%> 
				</div>
			</div>
			<div class="top_leftblock">
             	<c:if test="${userIdx eq null}">
					<a href="/usdscash/login.do" class="loginbtn <c:if test="${currentP eq 'login'}">click</c:if> w-button"><spring:message code="menu.login"/></a>
					<a href="/usdscash/join.do" class="registbtn <c:if test="${currentP eq 'join'}">click</c:if> w-button"><spring:message code="menu.register"/></a>
				</c:if>
           		<c:if test="${userIdx ne null}">
           			<a href="/usdscash/user/myInfo.do" class="registbtn <c:if test="${currentP eq 'myInfo'}">click</c:if> w-button"><spring:message code="join.info"/></a> 
           			<a href="javascript:logout()" class="registbtn w-button"><spring:message code="menu.logout"/></a>
           		</c:if>
				<div class="topmenubtn2">
                	<a href="#" class="languagebtn w-button">
                		<c:if test="${lang eq null}">English</c:if>
                		<c:if test="${lang eq 'EN'}">English</c:if>
                		<c:if test="${lang eq 'KO'}">?????????</c:if>
                		<c:if test="${lang eq 'JP'}">?????????</c:if>
                		<c:if test="${lang eq 'CH'}">????????????</c:if>
                		<c:if test="${lang eq 'FC'}">Fran??ais</c:if>
                	</a><img src="/usdscash/webflow/images/more_icon3.svg" loading="lazy" alt="" class="top_arrow">
	                <div class="topbtn_drop">
	                  <a href="javascript:changeLang2('EN')" class="button-14-copy w-button">English</a>
	                  <c:if test="${userIdx ne null and isKrCode eq true}">
		                  <a href="javascript:changeLang2('KO')" class="button-14-copy w-button">?????????</a>
	                  </c:if>
	                  <a href="javascript:changeLang2('JP')" class="button-14-copy w-button">?????????</a>
	                  <a href="javascript:changeLang2('CH')" class="button-14-copy w-button">????????????</a>
	                  <a href="javascript:changeLang2('FC')" class="button-14-copy w-button"><strong>Fran??ais</strong></a>
	                </div>
	             </div> 
			</div>
		</div>
	</div>
	<div class="mob_asidepop" id="mobMenu" onclick="mobMenu()" style="z-index:99; display:none;">
		<div class="mob_asidepop_block">
			<div class="aside_profile">
				<div class="asidewarp">
					<c:if test="${userIdx ne null}">
						<img src="/usdscash/webflow/images/account_1white.svg" loading="lazy" alt="" class="image-44">
						<div class="text-block-17">
							<span class="profilename">${userName } </span><spring:message code="menu.nim"/>
						</div>
					</c:if>
					<c:if test="${userIdx eq null}">
						<div class="text-block-17" onclick="location.href='/usdscash/login.do'">
							<span><spring:message code="menu.login"/></span>
						</div>
					</c:if>
				</div>
				<c:if test="${userIdx ne null}">
					<div class="text-block-21" onclick="location.href='/usdscash/user/myInfo.do'"><spring:message code="join.info"/></div>
				</c:if>
			</div>
			<div class="asideblock">
				<div class="asidelist" onclick="location.href='/usdscash/user/main.do'">
					<div><spring:message code="menu.main"/></div>
				</div>
				<div class="asidelist additionalbtn">
					<div><spring:message code="menu.deal"/></div>
					<img src="/usdscash/webflow/images/arrow_up.svg" loading="lazy" alt="" class="image-45 menuarrow" style="transform: rotate(0deg);">
				</div>
				<div class="asidelist" onclick="location.href='/usdscash/trade.do?betMode=usdt'">
					<div><spring:message code="trade.trade"/></div>
				</div>
<!-- 				<div class="aasidedrop" style="display:none;"> -->
<!-- 					<div class="asidelist" onclick="location.href='/usdscash/trade.do?betMode=usdt'"> -->
<%-- 						<div><spring:message code="menu.futuresCoin"/></div> --%>
<!-- 					</div> -->
<!-- 					<div class="asidelist" onclick="location.href='/usdscash/trade.do?betMode=inverse'"> -->
<%-- 						<div><spring:message code="menu.spotCoin"/></div> --%>
<!-- 					</div> -->
<!-- 				</div> -->
				 <div class="asidelist additionalbtn">
					<div><spring:message code="detail.copy"/></div>
					<img src="/usdscash/webflow/images/arrow_up.svg" loading="lazy" alt="" class="image-45 menuarrow" style="transform: rotate(0deg);">
				</div>
				<div class="aasidedrop" style="display:none;">
					<div class="asidelist" onclick="location.href='/usdscash/user/traderList.do'">
						<div><spring:message code="trader.follow1"/></div>
					</div>
					<div class="asidelist" onclick="location.href='/usdscash/user/traderFollowerOrder.do'">
						<div><spring:message code="trader.myTrading"/></div>
					</div>
				</div>
				<div class="asidelist additionalbtn">
					<div><spring:message code="menu.depandwith"/></div>
					<img src="/usdscash/webflow/images/arrow_up.svg" loading="lazy" alt="" class="image-45 menuarrow" style="transform: rotate(0deg);">
				</div>
				<div class="aasidedrop" style="display:none;">
					<div class="asidelist" onclick="location.href='/usdscash/user/myasset.do'">
						<div><spring:message code="menu.depandwith"/></div>
					</div>
					<%-- <div class="asidelist" class="krw_menu" onclick="location.href='/usdscash/user/kmyasset.do'">
						<div>KRW <spring:message code="menu.depandwith"/></div>
					</div> --%>
					<%-- <div class="asidelist" onclick="location.href='/usdscash/user/transactions.do'">
						<div><spring:message code="wallet.DeandWithHistory_m"/></div>
					</div>
					<div class="asidelist" onclick="location.href='/usdscash/user/exchange.do'">
						<div><spring:message code="wallet.menu.exchange"/></div>
					</div>
					<div class="asidelist" onclick="location.href='/usdscash/user/transfer.do'">
						<div><spring:message code="wallet.futuresExchange"/></div>
					</div>
					<div class="asidelist" onclick="location.href='/usdscash/user/requestList.do'">
						<div><spring:message code="wallet.withdrawallist"/></div>
					</div> --%>
 					<div class="asidelist" onclick="location.href='/usdscash/user/p2pbuy.do'">
 						<div><spring:message code="wallet.p2p.trade_1"/></div> 
 					</div>
				</div>
				<div class="asidelist additionalbtn">
					<div><spring:message code="menu.support"/></div>
					<img src="/usdscash/webflow/images/arrow_up.svg" loading="lazy" alt="" class="image-45 menuarrow" style="transform: rotate(0deg);">
				</div>
				<div class="aasidedrop" style="display:none;">
					<div class="asidelist" onclick="location.href='/usdscash/customerService.do'">
						<div><spring:message code="menu.support"/></div>
					</div>
					<div class="asidelist" onclick="location.href='/usdscash/board/noticeList.do'">
						<div><spring:message code="menu.notice"/></div>
					</div>
					<div class="asidelist" onclick="location.href='/usdscash/board/faqList.do'">
						<div><spring:message code="menu.faq"/></div>
					</div>
					<div class="asidelist" onclick="location.href='/usdscash/user/helpCenter.do'">
						<div><spring:message code="submitRequest"/></div>
					</div>
				</div>
				<div class="asidelist additionalbtn">
					<div><spring:message code="menu.mypage"/></div>
					<img src="/usdscash/webflow/images/arrow_up.svg" loading="lazy" alt="" class="image-45 menuarrow" style="transform: rotate(0deg);">
				</div>
				<div class="aasidedrop" style="display:none;">
					<div class="asidelist" onclick="location.href='/usdscash/user/tradeHistory.do'">
						<div><spring:message code="trade.tradeHistory"/></div>
					</div>
<%-- 						<c:if test="${userLevel eq 'chong'}"> --%>
<!-- 							<div class="asidelist" onclick="location.href='/usdscash/user/referells.do'"> -->
<%-- 								<div><spring:message code="menu.referrals"/></div> --%>
<!-- 							</div> -->
<%-- 						</c:if> --%>
					<div class="asidelist" onclick="location.href='/usdscash/user/fundingHistory.do'">
						<div><spring:message code="menu.fundingHistory"/></div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	var lang = "${lang}";
	
	let exRate = 0;
	function getExchangeRate() {
		jQuery.ajax({
			type : 'get',
			url : '/usdscash/getExchangeRate.do',
			async : false,
			success : function(data) {
				exRate = Number(data.exRate);
			}
		})
	}
	
	getExchangeRate();
	setInterval(getExchangeRate, 30000);
	
	function logout() {
		$.ajax({
			type : 'post',
			url : '/usdscash/logoutProcess.do',
			success : function(data) {
				/* showPopup(data.msg, data.level); */
				if (data.result == 'success') {
					alert(data.msg);
					location.href = "/usdscash/login.do";
				}
			}
		})

	}
	/* function changeLang() {
		var clang = "KO";
		if(lang == "KO")
			clang = "EN";
		else if(lang == "EN")
			clang = "JP";
		else if(lang == "JP")
			clang = "CH";
		else if(lang == "CH")
			clang = "FC";
		
		$.ajax({
			type : 'post',
			url : '/usdscash/changeLanguage.do?lang=' + clang,
			success : function(data) {
				location.reload(true);
			}
		});
	} */
	
	function changeLang2(lang) {
		if(lang == "null")
			lang = "EN";
		
		$.ajax({
			type : 'post',
			url : '/usdscash/changeLanguage.do?lang=' + lang,
			success : function(data) {
				location.reload(true);
			}
		});
	}
	

	function ready() {
		alert("<spring:message code='pop.ServiceReady_1'/>");
	}
	
	function menuShow(id){
		if($("#"+id).css("display")=="flex"){
			$("#"+id).css("display","none");
		}else{
			$("#"+id).css("display","flex");
		}
	}
	
	function toFixedDown(val,fix){
		if(isNaN(val)) return 0;
		
		var minus = false;
		if(val < 0)
			minus = true;
		
		var num = 1;
		for(var i = 0; i < parseFloat(fix); i++){
			num *= 10;
		}
		const temp1 = (Number(val) + Number.EPSILON) * num; 
		const temp2 = Math.floor(Math.abs(temp1));
		var result = temp2 / num;
		
		if( result < 1 / num)
			result = 0;
		if(minus)
			result *= -1;
		return result.toFixed(fix);
	}
	
	function datePickerLangSet(){
		if(lang == "KO"){
			$.datepicker.setDefaults({
		        dateFormat: 'yymmdd',
		        prevText: '?????? ???',
		        nextText: '?????? ???',
		        monthNames: ['1???', '2???', '3???', '4???', '5???', '6???', '7???', '8???', '9???', '10???', '11???', '12???'],
		        monthNamesShort: ['1???', '2???', '3???', '4???', '5???', '6???', '7???', '8???', '9???', '10???', '11???', '12???'],
		        dayNames: ['???', '???', '???', '???', '???', '???', '???'],
		        dayNamesShort: ['???', '???', '???', '???', '???', '???', '???'],
		        dayNamesMin: ['???', '???', '???', '???', '???', '???', '???'],
		        showMonthAfterYear: true,
		        yearSuffix: '???'
		    });
		}
		$(function() {
		    $('.ui-datepicker').addClass('notranslate');
		});
	}
	
	function mobMenu(){
		if($("#mobMenu").css("display")=="none"){
			$("#mobMenu").css("display","flex");
			$("html, body").addClass("not_scroll");
		}else{
			$("#mobMenu").css("display","none");
			$("html, body").removeClass("not_scroll");
		}
	}
	$(function(){
		$(".topbtn").on("click",function(){
			if($(this).next().css("display") == "none"){
				$(".topbtn_drop").hide();
			}				
			$(this).next().slideToggle(200);
		});
		$(".topmenubtn2").click(function() {
			$(this).children(".topbtn_drop").slideToggle(200);
			$(this).children('img').toggleClass('open');
		});
		$(".mob_asidepop_block").on("click", function(e) {
			e.stopPropagation();
		});
		$(".additionalbtn").on(
				"click",
				function() {
					var upAngle = 180;
					if ($(this).next().css("display") == "none") {
						$(this).next().slideDown(200);
					} else {
						$(this).next().slideUp(200);
						upAngle = 0;
					}
					$(this).find(".menuarrow").css('transform',
							'rotate(' + upAngle + 'deg)');
				});
	});

	function dropToggle(node) {
		return;
		if ($(node).next().css("display") == "none") {
			$(".topbtn_drop").css("display", "none");
			$(node).next().css("display", "flex");
		} else {
			$(node).next().css("display", "none");
		}
	}

	function restrictAmount(a) {
		var regExp = /^\d*.?\d{0,5}$/;
		if (!regExp.test(a)) {
			return false;
		}
		return true;
	}
	function fmtNum(num) {
		if (num == null)
			return 0;
		num = String(num);
		if (num.length <= 3)
			return num;

		let
		decimalv = "";

		if (num.indexOf(".") != -1) {
			let
			numarr = num.split(".");
			num = numarr[0];
			decimalv = "." + numarr[1];
		}

		let
		len, point, str;
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
</html>