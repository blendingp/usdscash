<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../adminFrame/header.jsp"></jsp:include>
</head>
<script>
function page(pageNo){
	document.listForm.pageIndex.value = pageNo;
   	document.listForm.submit();
}
</script>
<body id="page-top">
	<div id="wrapper">
		<c:import url="/0nI0lMy6jAzAFRVe0DqLOw/left.do"/>
        <div id="content-wrapper">
        	<div id="content">
				<jsp:include page="../adminFrame/top.jsp"></jsp:include>
        		<div class="container-fluid">
		            <h1 class="h3 mb-2 text-gray-800">Total Log</h1>
		            <div class="row">
		                <div class="col-lg-12">
		                    <div class="panel panel-default">
		                        <div class="panel-body">
		                        	<div class="row">
									   <form action="/usdscash/0nI0lMy6jAzAFRVe0DqLOw/account/totalLog.do" name="listForm" id="listForm">
											<input type="hidden" name="pageIndex" value="1"/>
											<input type="hidden" name="userIdx" value="${userIdx}"/>									
										</form>
									</div>
		                            <div class="table-responsive">
		                                <table class="table table-striped table-hover">
		                                    <thead>
		                                        <tr>
		                                            <th>desc</th>
		                                            <th>coinname</th>
		                                            <th>price</th>
		                                            <th>before</th>
		                                            <th>after</th>
		                                            <th>create date</th>                                                                                    
		                                            <th>????????? ??????</th>
		                                        </tr>
		                                    </thead>
		                                    <tbody>
		                                    	<c:forEach var="item" items="${list}" varStatus="i">
		                                        <tr>
		                                            <td>${item.des}</td>
		                                            <td>${item.coinname}</td>
		                                            <td><fmt:formatNumber value="${item.price}" pattern="#,###.####"/></td>
		                                            <td><fmt:formatNumber value="${item.before}" pattern="#,###.####"/></td>
		                                            <td><fmt:formatNumber value="${item.after}" pattern="#,###.####"/></td>
		                                            <td><fmt:formatDate value="${item.mdate}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
		                                            <td>${item.tablekind }</td>                                                                                     
		                                        </tr>
		                                        </c:forEach>
		                                    </tbody>
		                                </table>
		                                
		                              
		                            </div>
									<div class="row">
										<div class="col-sm-12" style="text-align:center;">
										<ul class="pagination">
											<ui:pagination paginationInfo="${pi}" type="customPage" jsFunction="page"/>
										</ul>
										</div>
									</div>
		                        </div>
		                                <div>????????? ?????? pointlog</div>
		<pre>
 -deposit ??????

 -withdraw ??????

 -withdrawDeny ????????????

 -BTCToU btc???usdt

 -UToBTC usdt???btc

 -UToP usdt???future(?????????)

 -PToU future(?????????)???usdt

 -outmoney ???????????? ??????</pre>
		                                <div>????????? ?????? coinlog</div>
		<pre>
??????-deposit/??????-withdrawal/??????-funding
??????-order
Admin?????? - adDeposit 
Admin?????? - adWithdrawal 
?????? ?????? - orderCancel 
????????? ?????? - margin 
????????? - commission 
trade : ??????(-???????????????)
tradeclose : 
?????? ??????(-???????????????), 
close??? ?????? ?????? ?????? ?????????????????? ???????????????

tradeclose2 : 
?????? ??????(-???????????????), 
??????????????? ????????? ??????????????????????????? ????????????????????? ???????????????

profit : ??????(+ ??????)

liquid : ????????????( - ????????????)</pre>                          
		                    </div>
		                </div>
		            </div>
		        </div>
	        </div>
		</div>
	</div>
<jsp:include page="../adminFrame/footer.jsp"></jsp:include>
<script>
function checkForm(){
	$("#listForm").submit();
}
</script>
</body>
</html>