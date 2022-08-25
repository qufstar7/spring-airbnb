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
			<c:choose>
				<c:when test="${empty reservations }">
					<div class="border border-2">
						<img alt="" src="../resources/images/reservation/trip.png">
						<h3>예정된 예약이 없습니다.</h3>
						<a href="/" class="btn btn-lg" style="background-color:#d80765; color:white;">숙소 검색하기</a>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="reservation" items="${reservations }">
						<div class="row">
							<div class="col-4">
								<div class="border border-2 rounded-start" style="width:500px; height:250px;">
									<div class="mx-3 my-3">
										<h4>${reservation.accommodation.address }</h4>
										<p><small>${reservation.accommodation.name }</small></p>
										<hr>
									</div>
									<div class="row">
										<div class="col-5 mx-2">
											<p style="line-height: 0.5;"><fmt:formatDate value="${reservation.checkInDate}" pattern="M월d일" /> -</p>
											<p style="line-height: 0.5;"><fmt:formatDate value="${reservation.checkOutDate}" pattern="M월d일" /></p>
											<p style="line-height: 0.5;"><small><fmt:formatDate value="${reservation.checkInDate}" pattern="yyyy년" /></small></p>
										</div>
										<div class="col-2" style="border-left:1px solid; height:30px">
											<p>${reservation.accommodation.address }</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-2">
								<div class="border border-2 rounded-end" style="width:500px; height:250px;">
									<img class="acc" style="object-fit:cover;" src="../resources/images/acc/${reservation.accommodation.accNo }.png">
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
	</div>
</div>
</body>
</html>