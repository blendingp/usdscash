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
	<div class="top_block _2">
		<div class="top_info">
			<div class="top_info_txt">
				코인:<span class="rate up">13231</span>
			</div>
			<div class="top_info_txt">
				거래소: <span class="rate down">606</span>
			</div>
			<div class="top_info_txt">
				<div class="top_info_txt">
					시가총액: <span class="rate up">US$893,187,161,950</span>
				</div>
				<div class="top_info_txt">
					<span class="rate up">0.3% ↑</span>
				</div>
			</div>
			<div class="top_info_txt">
				24시간 거래량: <span class="rate down">US$149,650,053,487</span>
			</div>
			<div class="top_info_txt">
				점유율:<span class="rate up">BTC 30%</span>
			</div>
		</div>

		<div class="top_box login">
			<c:if test="${userIdx eq null}">
				<div class="top_btn_warp">
					<a href="/usdscash/login.do" class="top_btn _2 w-button">
						<spring:message code="menu.login" />
					</a>
				</div>
				<div class="top_btn_warp">
					<a href="/usdscash/join.do" class="top_btn _2 w-button">
						<spring:message code="menu.register" />
					</a>
				</div>
			</c:if>
			<c:if test="${userIdx ne null}">
				<div class="top_btn_warp">
					<a href="javascript:logout()" class="top_btn _2 w-button">
						<spring:message code="menu.logout" />
					</a>
				</div>
			</c:if>
			<div class="top_btn_warp">
				<a href="#" class="top_btn w-button"> 
					<c:if test="${lang eq null}">EN ▼</c:if> 
					<c:if test="${lang eq 'EN'}">EN ▼</c:if>
					<c:if test="${lang eq 'KO'}">KR ▼</c:if>
				</a>
				<div class="top_toggle">
					<a href="javascript:changeLang2('EN')" class="top_toggle_btn w-button">EN</a>
					<a href="javascript:changeLang2('KO')" class="top_toggle_btn w-button">KR</a>
				</div>
			</div>
		</div>
	</div>

	<div class="top_block">
		<div class="logo" onclick="location.href='/usdscash/user/main.do'">
			<img src="/usdscash/webflow/images2/usds_logo_1.svg" loading="lazy" alt="" class="logo_img">
		</div>
		<div class="top_box">
			<div class="top_btn_warp">
				<a href="/usdscash/tradeSpot.do" class="top_btn w-button"><spring:message code="trade.trade"/></a>
				<div class="btn_deco"></div>
			</div>
			<div class="top_btn_warp">
				<a href="#" class="top_btn w-button"><spring:message code="menu.support"/></a>
				<div class="top_toggle">
					<a href="/usdscash/notice.do" class="top_toggle_btn w-button"><spring:message code="menu.notice" /></a>
					<a href="/usdscash/event.do" class="top_toggle_btn w-button"><spring:message code="menu.event" /></a> 
					<a href="/usdscash/user/helpCenter.do" class="top_toggle_btn w-button"><spring:message code="submitRequest" /></a> 
					<a href="/usdscash/faq.do" class="top_toggle_btn w-button"><spring:message code="newwave.menu.faq"/></a>
				</div>
				<div class="btn_deco"></div>
			</div>
			<div class="top_btn_warp">
				<a href="#" class="top_btn w-button"><spring:message code="menu.mypage"/></a>
				<div class="top_toggle">
					<a href="/usdscash/user/tradeHistory.do" class="top_toggle_btn w-button"><spring:message code="trade.tradeHistory"/></a> 
					<a href="javascript:menuShow('mypageMenu')" class="top_toggle_btn w-button"><spring:message code="menu.mypage"/></a> 
				</div>
				<div class="btn_deco"></div>
			</div>
		</div>
		 <div class="top_search">
			<div class="form-block w-form">
				<!-- <form id="email-form-2" name="email-form-2" data-name="Email Form 2" method="get">
					<div class="top_search_box">
						<div class="search_btn">
							<img src="/usdscash/webflow/images2/search.svg" loading="lazy" alt="" class="icon">
						</div>
						<input type="text" class="search_input w-input" maxlength="256" name="field" data-name="" placeholder="검색" id="field-5" required="">
					</div>
				</form> -->
			</div>
		</div>
		<div class="mobile_m_btn">
			<img src="/usdscash/webflow/images2/menu2.svg" loading="lazy" alt=""
				class="mobile_m_btnicon">
			<div class="moblie_menu">
				<div class="exsit_btn">
					<img src="/usdscash/webflow/images2/wx_black.png" loading="lazy" sizes="100vw" srcset="/usdscash/webflow/images2/wx_black-p-500.png 500w, /usdscash/webflow/images2/wx_black-p-800.png 800w, /usdscash/webflow/images2/wx_black-p-1080.png 1080w, /usdscash/webflow/images2/wx_black-p-1600.png 1600w, /usdscash/webflow/images2/wx_black.png 1600w" alt="" class="exsit_icon">
				</div>
				<div class="mobile_menu_btn" onclick="loaction.href='/usdscash/tradeSpot.do'">
					<div><spring:message code="trade.trade"/></div>
				</div>
				<div class="mobile_toggle_warp">
					<div class="mobile_menu_btn">
						<div>고객센터</div>
						<img src="/usdscash/webflow/images2/round_arrow_1.svg" loading="lazy" alt=""
							class="ms_arrow">
					</div>
					<div class="mobile_menu_btn">
						<div>마이페이지</div>
						<img src="/usdscash/webflow/images2/round_arrow_1.svg" loading="lazy" alt=""
							class="ms_arrow">
					</div>
					<div class="toggle_warp">
						<div class="mobile_toggle_btn">
							<div>공지사항</div>
						</div>
						<div class="mobile_toggle_btn">
							<div>이벤트</div>
						</div>
						<div class="mobile_toggle_btn">
							<div>문의하기</div>
						</div>
						<div class="mobile_toggle_btn">
							<div>자주묻는 질문</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(".top_btn_warp").hover(function() {
		$(this).children(".btn_deco").toggleClass("on")
		$(this).children(".top_toggle").toggleClass("on")
	});
</script>
<script type="text/javascript">
	var lang = "${lang}";

	let
	exRate = 0;
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
		if (lang == "null")
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

	function menuShow(id) {
		if ($("#" + id).css("display") == "flex") {
			$("#" + id).css("display", "none");
		} else {
			$("#" + id).css("display", "flex");
		}
	}

	function toFixedDown(val, fix) {
		if (isNaN(val))
			return 0;

		var minus = false;
		if (val < 0)
			minus = true;

		var num = 1;
		for (var i = 0; i < parseFloat(fix); i++) {
			num *= 10;
		}
		const
		temp1 = (Number(val) + Number.EPSILON) * num;
		const
		temp2 = Math.floor(Math.abs(temp1));
		var result = temp2 / num;

		if (result < 1 / num)
			result = 0;
		if (minus)
			result *= -1;
		return result.toFixed(fix);
	}

	function datePickerLangSet() {
		if (lang == "KO") {
			$.datepicker.setDefaults({
				dateFormat : 'yymmdd',
				prevText : '이전 달',
				nextText : '다음 달',
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ],
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
						'8월', '9월', '10월', '11월', '12월' ],
				dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				showMonthAfterYear : true,
				yearSuffix : '년'
			});
		}
		$(function() {
			$('.ui-datepicker').addClass('notranslate');
		});
	}

	function mobMenu() {
		if ($("#mobMenu").css("display") == "none") {
			$("#mobMenu").css("display", "flex");
			$("html, body").addClass("not_scroll");
		} else {
			$("#mobMenu").css("display", "none");
			$("html, body").removeClass("not_scroll");
		}
	}
	$(function() {
		$(".topbtn").on("click", function() {
			if ($(this).next().css("display") == "none") {
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