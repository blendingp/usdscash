<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<!--  Last Published: Tue Jun 29 2021 05:48:49 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="62b186c2f7e8877e2d12526e" data-wf-site="62b1125ac4d4d60ab9c62f81">
<head>
<meta charset="utf-8">
<title><spring:message code="menu.submitrequest" /></title>
<meta content="account setting" property="og:title">
<meta content="account setting" property="twitter:title">
<jsp:include page="../usdscashFrame/header2.jsp"></jsp:include>
</head>
<body class="body">
	<div class="frame">
			<jsp:include page="../usdscashFrame/top2.jsp" />
			<div class="article">
				<div class="banner">
					<div class="b_img custermer">
						<div class="b_box">
							<h1 class="heading">
								<spring:message code="submitRequest" />
							</h1>
						</div>
					</div>
				</div>
				<div class="custermer_container">
					<div class="c_section1">
						<div class="form-block w-form">
							<form id="contactForm" name="contactForm" method="post" enctype="multipart/form-data" class="form-6">
								<h2 class="c_title">상담신청 정보 입력</h2>
								<div class="question_box2">
									<!-- <div class="q_warp">
                  <div class="q_title">상담분류</div><select id="field" name="field" data-name="Field" class="q_input w-select">
                    <option value="">상담분류</option>
                    <option value="First">보험상품 문의</option>
                    <option value="Second">보험료계산 / 청약 문의</option>
                    <option value="Third">사이트 이용 문의</option>
                    <option value="Another option">기타</option>
                  </select>
                </div>
                <div class="q_warp">
                  <div class="q_title">이름</div><input type="text" class="q_input w-input" maxlength="256" name="field-3" data-name="Field 3" placeholder="Example Text" id="field-3" required="">
                </div>
                <div class="q_warp">
                  <div class="q_title">생년월일</div><input type="text" class="q_input w-input" maxlength="256" name="field-3" data-name="Field 3" placeholder="Example Text" id="field-3" required="">
                </div>
                <div class="q_warp">
                  <div class="q_title">성별</div>
                  <div class="check_box">
                    <div class="check_area"><img src="../images/check_whitesmokesvg.svg" loading="lazy" alt="" class="check_icon"></div>
                    <div>남자</div>
                  </div>
                  <div class="check_box">
                    <div class="check_area"><img src="../images/check_whitesmokesvg.svg" loading="lazy" alt="" class="check_icon"></div>
                    <div>여자</div>
                  </div>
                </div> -->
									<!-- <div class="q_warp">
                  <div class="q_title">연락처</div><input type="text" class="q_input w-input" maxlength="256" name="field-3" data-name="Field 3" placeholder="Example Text" id="field-3" required="">
                </div> -->
									<div class="q_warp">
										<div class="q_title">
											<spring:message code="support.subject" />
										</div>
										<input type="text" value="${ title}" class="q_input w-input"
											maxlength="256" name="title"
											placeholder='<spring:message code="support.subject" />'
											id="title">
									</div>
									<!-- <div class="q_warp">
                  <div class="q_title">이메일주소</div><input type="text" class="q_input w-input" maxlength="256" name="field-3" data-name="Field 3" placeholder="Example Text" id="field-3" required="">
                  <div>@</div><select id="field-5" name="field-5" data-name="Field 5" class="q_input w-select">
                    <option value="">Select one...</option>
                    <option value="First">First choice</option>
                    <option value="Second">Second choice</option>
                    <option value="Third">Third choice</option>
                  </select>
                </div> -->
									<!-- <div class="q_warp">
                  <div class="q_title">상담(예약)시간</div>
                  <div class="q_warp2"><select id="field-6" name="field-6" data-name="Field 6" class="q_input w-select">
                      <option value="Another option">09시~10시</option>
                    </select>
                    <div class="faq_n">* 익영업일의 선택하신 시간대에 답변을 드립니다.</div>
                  </div>
                </div> -->
									<div class="q_warp">
										<div class="q_title">
											<spring:message code="support.description" />
										</div>
										<div class="q_warp2">
											<textarea
												placeholder='<spring:message code="support.description" />'
												maxlength="5000" id="content" name="content"
												class="textarea w-input"></textarea>
											<!-- <div class="faq_n">(최대 1,000자 입력 가능, 현재<span class="txt_count">1000</span>자 입력)<br>‍<br>* 고객님의 개인정보 보호를 위해 불필요한 개인정보는 입력하지 마십시오.<br>* 타인의 동의없는 개인정보 또한 입력하시면 안됩니다.</div> -->
										</div>
									</div>
								</div>
								<h2 class="c_title">정보 제공 동의</h2>
								<div class="question_box">
									<div class="q_term_tbtn">
										<div class="q_term_warp">
											<div>
												상담 신청을 위한 개인정보 <strong class="bold-text">수집 · 이용 ·
													제공</strong>에 동의하십니까?
											</div>
											<div class="q_term_btnarea">
												<div class="q_term_btn _1 click">
													<div>예</div>
												</div>
												<div class="q_term_btn _2">
													<div>아니오</div>
												</div>
											</div>
										</div>
										<div class="q_btn">
											<div>접기</div>
											<img src="../images/toggle_b.svg" loading="lazy" alt=""
												class="q_arrow">
										</div>
									</div>
									<div class="q_term_toggle">
										<div>
											고객님의 의견에 성실히 답변을 드리기 위해서 아래와 같이 고객님의 개인정보를 수집 · 이용 · 제공하는데 대한
											동의를 받고자 합니다.<strong class="bold-text"><br>※ 동의를
												거부할 수 있으나, 거부 시 해당 서비스를 이용하실 수 없습니다.</strong>
										</div>
										<div class="q_term_txt">
											<div class="faq_term">
												개인(신용)정보의 수집 · 이용에 관한 사항<br>
												<br>1. 개인정보의 수집 · 이용 목적<br>본인확인, 금융상품 가입정보 확인,
												보험상품 및 가입안내<br>
												<br>2. 수집하는 개인정보의 항목필수 수집정보 : 이름, 생년월일, 성별, 이메일 및 연락처 중
												택1(상담방법 선택에 따라)<br>
												<br>3. 수집하는 개인정보의 이용 및 보유기간NH농협생명이 수집한 개인정보는 관계법령 등의
												규정에 의하여 기록 · 보존되고, 기간이 경과할 경우 개인정보보호법 등에서 정하는 바에 따라
												파기됩니다.개인(신용)정보의 제공에 관한 사항1. 개인정보를 제공받는 자 및 이용목적NH농협생명 콜센터
												수탁업체 직원(보험가입상담을 위하여)NH농협생명 관련 채널의 보험모집인(보험가입 안내를 위하여)2. 수집이용
												제공하는 개인정보 항목전화번호(휴대번호)3. 제공받는자의 개인정보의 이용 및 보유기간보험가입상담의 경우
												이용기간은 수집 · 이용동의일로부터 2개월 보유기간은 수집 · 이용 동의일로부터 1년
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="general_btn_area">
							<a href="javascript:submitForm()" class="genral_btn w-button">
							<spring:message code="support.submit" /></a>
						</div>
					</div>
				</div>
			</div>


			<%-- <div class="frame5">
				<jsp:include page="../userFrame/customerBanner.jsp"></jsp:include>
				<div class="custermer_listblock">
					<div class="custermer_titlewarp">
						<div class="title6"><spring:message code="submitRequest" /></div>
 					</div>
					<div class="form-block-6 w-form">
						<input type="text" value="${ title}" class="text-field-11 w-input" maxlength="100" name="title"  placeholder="<spring:message code="support.subject" />" id="title">
						<textarea placeholder="<spring:message code="support.description" />" maxlength="5000" id="content" name="content"  class="textarea w-input"></textarea>
						<div class="title2"><spring:message code="support.image" /></div>
						<div class="fileblock">
							<input type="file" name="files" accept="image/*;" id="files" multiple="" style="display: none;"> 
							<span onclick="$('#files').click();" class="button-11 w-button"><spring:message code="support.addFile" /></span>
							<div class="file_uploadbox" id="fileList">
								<div class="fileselect_block" id="notselect" style="display:flex;">
									<div class="fileselect1">
										<div class="text7"><spring:message code="menu.fileNoSelect"/></div>
									</div>
									<div class="deletebtn_box">
										<img src="/usdscash/webflow/images2/wx.png" loading="lazy" sizes="(max-width: 479px) 100vw, (max-width: 767px) 4vw, 20px" srcset="/usdscash/webflow/images2/wx-p-800.png 800w, /usdscash/webflow/images2/wx-p-1080.png 1080w, /usdscash/webflow/images2/wx.png 1600w" alt="" class="deletebtn_icon">
										<a href="#" class="deletebtn w-button"></a>
									</div>
								</div>
							</div>
						</div>
						<button type="button" onclick="javascript:submitForm()" class="submit-button-3 w-button"><spring:message code="support.submit" /></button>
					</div>
				</div>
			</div> --%>
			
			<jsp:include page="../usdscashFrame/footer2.jsp"></jsp:include>
		</form>
	</div>
	<script
		src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=615fe8348801178bd89ede05"
		type="text/javascript"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
</body>
<script>
	var fileIdx = 0;
	var fileList = [];
	$("input[name=files]").on("change",function() {
		var files = this.files;
		if (files.length > 5 || fileList.length >= 5) {
			alert("<spring:message code='menu.fileupFail'/>");
			return;
		}
		Array.prototype.push.apply(fileList, files);
		var $fileList = $("#fileList");
		for (var i = 0; i < files.length; i++) {
			$("#notselect").css("display","none");
			$fileList.append("<div class='fileselect_block'> <div class='fileselect1'> <div class='text7' style='overflow: hidden; text-overflow:ellipsis;  width: 510px;'>"+files[i].name+"</div> </div> <div class='deletebtn_box'> <img src='/usdscash/webflow/images2/wx.png' loading='lazy' sizes='(max-width: 479px) 100vw, (max-width: 767px) 4vw, 20px' srcset='/usdscash/webflow/images2/wx-p-800.png 800w, /usdscash/webflow/images2/wx-p-1080.png 1080w, /usdscash/webflow/images2/wx.png 1600w' alt='' class='deletebtn_icon'> <a href='#' onclick='delFile(this)' class='deletebtn w-button'></a> </div> </div>");
			fileIdx++;
		}
	});
	function SetNum(obj) {
		val = obj.value;
		re = /[^0-9]/gi;
		obj.value = val.replace(re, "");
	}
	function delFile(self) {
		var $file = $(self).parent().parent();
		var fileIdx = $file.index()-1;
		$file.remove();
		fileList.splice(fileIdx, 1);
		if(fileList.length == 0)
			$("#notselect").css("display","flex");
	}
	function submitForm() {
		var form = $("#contactForm")[0];
		var data = new FormData(form);
		for (var i = 0; i < fileList.length; i++) {
			data.append("uploadFiles", fileList[i]);
		}
		$.ajax({
			type : 'post',
			url : '/usdscash/contactInsert.do',
			data : data,
			processData : false,
			contentType : false,
			success : function(data) {
				if (data.result != 'fail') {
					alert("<spring:message code='menu.inquiryComplete'/>");
					location.reload();
				} else {
					alert(data.msg);
				}
			},
			error : function(e) {
				console.log('ajaxError' + JSON.stringify(e));
			}
		})
	}
</script>
</html>