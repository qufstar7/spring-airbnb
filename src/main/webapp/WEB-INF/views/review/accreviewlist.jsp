<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<!--  부트스트랩 아이콘 -->
<link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700" rel="stylesheet">
<!-- 페데리코 -->
<script type="text/javascript" src="/resources/js/fresco.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/fresco.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/detaile.css">
<style type="text/css">
</style>
<title>숙소 상세 페이지</title>
</head>
<body >
<!-- 후기 -->
<div class="d-flex justify-content-start fs-5 mt-5 mb-4">
	<i class="bi bi-star-fill"></i>
	<h3 class="fw-bold mb-3 ms-2">후기 4개</h3>
</div>
<div>
<h4>게스트가 남긴 후기</h4>
	<div class="row">
		<div class="col-10">
			<h5>Turtle Bay Floating Villa Homestay Eco House 숙소 이름 </h5>
			<p class="text-muted">7월 2022</p>
		</div>
		<div class="col-2">
			<a href="../detail?no=102">
				<img src="/resources/images/acc/1.jpg" class="rectangleImg mb-3">
			</a>							
		</div>
	</div>
	<div>
		<p>The accommodation is beautiful and as the picture shows. The decor is quaint and the room is very cosy. 
			The facilities were clean and adequate. Overall, a wonderful stay and highly recommended place… 더 보기
		</p>
	</div>
	<div class="row">
		<div class="col-1">
			<a href="../profile?no=1">
				<img src="/resources/images/profile/no-image.png" class="userImg mb-3">
			</a>
		</div>
		<div class="col">
			<p class="mb-0 ps-3"><strong>이름님, 포르투갈</strong></p>
			<span class="mb-0 ps-3 text-muted">회원가입: </span><span class="text-muted">2015</span>
		</div>
	</div>
	

<h4>호스트가 남긴 후기</h4>
	<div class="mb-5">
		<div>
			<p class="text-muted">6월2019</p>
			<p>성원에 머무르게 되어 기뻤습니다. 커뮤니케이션이 훌륭했고, 다른 호스트를 추천해 드립니다.</p>
		</div>
		<div class="row">
			<div class="col-1">
				<a href="../profile?no=1">
					<img src="/resources/images/profile/no-image.png" class="userImg mb-3">
				</a>
			</div>
			<div class="col">
				<p class="mb-0 ps-3"><strong>이름님, 포르투갈</strong></p>
				<span class="mb-0 ps-3 text-muted">회원가입: </span><span class="text-muted">2015</span>
			</div>
		</div>
	</div>
	<div class="mb-5">
		<div>
			<p class="text-muted">6월2019</p>
			<p>성원에 머무르게 되어 기뻤습니다. 커뮤니케이션이 훌륭했고, 다른 호스트를 추천해 드립니다.</p>
		</div>
		<div class="row">
			<div class="col-1">
				<a href="../profile?no=1">
					<img src="/resources/images/profile/no-image.png" class="userImg mb-3">
				</a>
			</div>
			<div class="col">
				<p class="mb-0 ps-3"><strong>이름님, 포르투갈</strong></p>
				<span class="mb-0 ps-3 text-muted">회원가입: </span><span class="text-muted">2015</span>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	</script>
</body>
</html>