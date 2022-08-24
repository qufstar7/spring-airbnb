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
	#a-back {
		text-decoration: none;
		color: #eb675e;
		font-weight: bolder;
	}
</style>
</head>
<body>
<c:set var="step" value="confirm" />
<%@ include file="progressBar.jsp"%>
	<div class="col-3" style="margin: 0 auto;">
		<h2 class="fw-bold pb-4 mb-0">계정을 비활성화하시겠어요?</h2>
		<span>${LOGIN_USER.email}</span>
		
		<div class="info">
			<i class="bi bi-check-circle me-2"></i>이 계정과 관련한 프로필과 숙소 정보가 삭제됩니다.
		</div>
		<div class="info">
			<i class="bi bi-check-circle me-2"></i>향후 계정 정보나 이전 예약을 확인할 수 없습니다.
		</div>
		<div class="d-flex justify-content-between">
			<div style="padding-top: 25px;">
				<a href="/user/account-delete/reasons" id="a-back"><i class="bi bi-chevron-left"></i> 뒤로</a>
			</div>
			<a href="/user/account-delete/complete" class="btn myButton" id="btn-complete-delete">계정 비활성화</a>
		</div>
	</div>
</body>
</html>