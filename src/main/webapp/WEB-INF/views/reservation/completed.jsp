<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>예약완료</title>
</head>
<style>
.left-box {
	float: left;
	width: 50%;
}

.right-box {
	float: right;
	width: 50%;
	height: 600px;
}
</style>
<body>
<%@ include file="../common/nav2.jsp" %>
<div class="container">
	<!-- 왼쪽 -->
	<div class="left-box">
		<div>
			<h1>예약이 확정되었습니다.</h1>
			<p>이메일(으)로 세부정보를 보냈습니다.</p>
		</div>
		<div class="divide">
				<h5>필수 입력 정보</h5>
				<br>
				<span>호스트에게 메세지 보내기</span>
				<p>호스트에게 여행 목적과 도착 예정 시간을 알려주세요</p>
				<br>
				<div class="row">
					<div class="col-2">
						<div class="box" style="background: #BDBDBD;">
						    <img class="profile" src="../resources/images/acc/sample-home.jpg">
						</div>
					</div>
					<div class="col">
					    <span>${accommodation.user.name }</span>
					    <p><small class="text-muted"><fmt:formatDate value="${accommodation.user.createdDate }" /></small></p>
					</div>
				</div>
		
	</div>
	
	<!-- 오른쪽 -->
	<div class="right-box">
	
	</div>
</div>
</body>
</html>