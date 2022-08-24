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
<c:set var="step" value="complete" />
<%@ include file="progressBar.jsp"%>
	<div class="col-3" style="margin: 0 auto;">
		<h2 class="fw-bold pb-4 mb-0">계정이 비활성화되었습니다</h2>
		<div class="info">
			<i class="bi bi-check-circle me-2"></i>이제 프로필과 숙소 정보를 확인하실 수 없습니다.
		</div>
		<div class="info">
			<i class="bi bi-check-circle me-2"></i>향후 이 계정 또는 계정과 연결된 예약을 확인하실 수 없습니다.
		</div>
			<a href="/" class="btn myButton">닫기</a>
	</div>
</body>
</html>