<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
	/* #div-wishlists {
					width: auto;
				} */
	#div-wishlists {width: auto;}
	.wishlist {
				float: left;
				margin-left: 10px;
				margin-right: 10px;
				text-align: center;
	} 
	
</style>
<title>Insert title here</title>
</head>
<body>
<div class="border">
	<div class="row mb-5">
		<h1 class="fw-bold">위시리스트</h1>
	</div>
	<div>
	<%-- <c:choose>
		<c:when test="${empty wishlists}">
			<h3 class="fw-bold">첫 번째 위시리스트 만들기</h3>
		<p>검색 중에 마음에 드는 숙소나 즐길 거리를 위시리스트에 저장하려면 하트 아이콘을 누르세요.</p>
		</c:when>
		<c:otherwise>
			<c:forEach var="wishlist" items="${wishlists}">
			
			</c:forEach>
		</c:otherwise>
	</c:choose> --%>
	<div id="div-wishlists" class="">
		<img class="wishlist" alt="숙소이미지" src="/resources/images/acc/sample-home.jpg" >
		<img class="wishlist" alt="숙소이미지" src="/resources/images/acc/sample-home.jpg" >
		<img class="wishlist" alt="숙소이미지" src="/resources/images/acc/sample-home.jpg" >
		<img class="wishlist" alt="숙소이미지" src="/resources/images/acc/sample-home.jpg" >
		<img class="wishlist" alt="숙소이미지" src="/resources/images/acc/sample-home.jpg" >
		<img class="wishlist" alt="숙소이미지" src="/resources/images/acc/sample-home.jpg" >
		<img class="wishlist" alt="숙소이미지" src="/resources/images/acc/sample-home.jpg" >
		<img class="wishlist" alt="숙소이미지" src="/resources/images/acc/sample-home.jpg" >
		<img class="wishlist" alt="숙소이미지" src="/resources/images/acc/sample-home.jpg" >
		<img class="wishlist" alt="숙소이미지" src="/resources/images/acc/sample-home.jpg" >
		<img class="wishlist" alt="숙소이미지" src="/resources/images/acc/sample-home.jpg" >
		<img class="wishlist" alt="숙소이미지" src="/resources/images/acc/sample-home.jpg" >
	</div>
	</div>
</div>

</body>
</html>