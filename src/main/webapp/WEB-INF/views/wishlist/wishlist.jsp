<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/fresco.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/wishlist.css">
<title>위시리스트-에어씨엔씨</title>
</head>

<body>
<%@ include file="../common/nav.jsp"%>
<div class="container-fluid"  id="main">
	<div class="row my-5">
		<h2 class="fw-bold">위시리스트</h2>
	</div>
	<div class="row">
	<c:if test="${empty wishlists}">
		<h4 class="fw-bold">첫 번째 위시리스트 만들기</h4>
		<p><small>검색 중에 마음에 드는 숙소나 즐길 거리를 위시리스트에 저장하려면 하트 아이콘을 누르세요.</small> </p>
	</c:if>
	<c:if test="${not empty wishlists}">
		<c:forEach var="wishlist" items="${wishlists}">
			<div class="col-xl-4 col-lg-3 col-md-6 col-sm-12 col-xs-12">
					<a href="/wishlists/detail?no=${wishlist.no}">
						<div class="mb-5 flex-container">
							<div class="flex-item1" >
								<div class="img-large" id="btn-open-image-modal">
									<img src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg" id="image-large">
									<h3 class="mt-2 fw-bold">${wishlist.name}</h3>
								</div>
							</div>
							<div class="flex-item">
								<div class="img-short" id="btn-open-image-modal4">
									<img src="https://a0.muscache.com/airbnb/static/destinations/o-Lisbon_480x320.jpg" class="short-img" id="image-right-top">
								</div>
								<div class="img-short short-bottom" id="btn-open-image-modal5">
									<img src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg" class="short-img" id="image-right-bottom">
								</div>
							</div>
						</div>
					</a>
			</div>
		</c:forEach>
	</c:if>
	</div>
</div>
</body>
</html>