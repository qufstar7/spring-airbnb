<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/resources/css/deleteAccount.css">
<link rel="icon" href="../../../resources/aircnc.png">
<title>계정비활성화 - AirCnC</title>
<style type="text/css">
	input[type="radio"]:checked {
	  accent-color: rgb(251,63,111);
	}
</style>
</head>
<body>
<c:set var="step" value="reasons" />
<%@ include file="progressBar.jsp"%>
	<div class="col-3" style="margin: 0 auto;">
		<h2 class="fw-bold pb-4">계정을 비활성화하려는 이유가 무엇인가요?</h2>
		
		<div class="info d-flex justify-content-between">
			안전 또는 사생활 보호에 관한 우려가 있어요.
			<input type="radio" name="reason">
		</div>
		<div class="info d-flex justify-content-between">
			더 이상 호스팅할 수 없어요.
			<input type="radio" name="reason">
		</div>
		<div class="info d-flex justify-content-between">
			에어비앤비의 서비스 약관/커뮤니티 약속을 준수할 수 없습니다.
			<input type="radio" name="reason">
		</div>
		<div class="info d-flex justify-content-between">
			기타
			<input type="radio" name="reason" id="radio-other">
		</div>
		<div class="info d-none" id="div-hidden">
			<strong>이유</strong><br/>
			<input type="text" class="form-control mt-2" placeholder="계정을 해지하려는 이유가 무엇인가요?">
		</div>
		<div class="d-flex justify-content-end">
			<button class="btn myButton" disabled>계속하기</button>
		</div>
	</div>
<script type="text/javascript">
$(function() {
	
	$(":input[type=radio]").on('click', function() {
		$(".myButton").prop("disabled", false);
		
	    if ( $("#radio-other").prop('checked') ) {
	        $("#div-hidden").removeClass("d-none");
	    } else {
	        $("#div-hidden").addClass("d-none");
	    }
    });
	
	$(".myButton").click(function() {
		location.href="/user/account-delete/confirm";
	});

})


</script>
</body>
</html>