<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="deposit_warp2">
	<div class="btnarea">
		<a href="/usdscash/user/myasset.do" class="menubtn w-button refmyasset"><spring:message code="wallet.property"/></a>
		<a href="/usdscash/user/wallet.do" class="menubtn w-button refwallet"><spring:message code="wallet.deposit"/></a>
		<a href="/usdscash/user/walletWithdraw.do" class="menubtn w-button refwithdraw"><spring:message code="wallet.withdrawal"/></a>
		<a href="/usdscash/user/transactions.do" class="menubtn w-button reftransactions"><spring:message code="wallet.DeandWithHistory_m"/></a>
		<a href="/usdscash/user/exchange.do" class="menubtn w-button refexchange"><spring:message code="wallet.menu.exchange"/></a>
		<a href="/usdscash/user/transfer.do" class="menubtn w-button reftransfer"><spring:message code="wallet.futuresExchange"/></a>
		<a href="/usdscash/user/requestList.do" class="menubtn w-button refrequestList"><spring:message code="wallet.withdrawallist"/></a>
	</div>
</div>
<script type="text/javascript">
	function init() {
		if (!$(".ref" + "${refPage}").hasClass("click")) {
			$(".ref" + "${refPage}").addClass("click");
		}
	}
	init();
</script>