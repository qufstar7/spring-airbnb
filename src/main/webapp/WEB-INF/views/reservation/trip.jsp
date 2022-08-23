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
<link href="../resources/aircnc.png" rel="icon" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/resources/css/book.css" />
<title>여행목록-에어씨앤씨</title>
</head>
<body>
<%@ include file="../common/nav2.jsp" %>
<%@ include file="../user/login-register-modals.jsp" %>
<div class="container">
	<div class="divide">
		<h1>여행</h1>
	</div>
	<div class="divide">
		<h4>예정된 예약</h4>
		<c:forEach var="reservation" items="${reservaions }">
			<c:choose>
				<c:when test="${empty reservaions }">
					<h3>예정된 예약이 없습니다.</h3>
				</c:when>
			</c:choose>
		</c:forEach>
	</div>
</div>
</body>
</html>