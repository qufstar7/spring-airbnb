<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="../../../resources/aircnc.png">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.0/font/bootstrap-icons.css">
<!-- convenience 구글 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- 아이콘 라이브러리 -->
<!-- <script src="https://kit.fontawesome.com/2628157b3b.js"></script> -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c3af16546c33c0b90cbaea7eedb971a2"></script>
<title>Applied Coding & Computer - aircnc</title>
<style>
/* 필터 모달창 */
.modal-content {
	border-radius: 12px;
	box-shadow: 0px 21px 21px rgb(0 0 0 / 15%)
}
.modal-content h5{
	padding-left: 24px;
	padding-right: 24px;	
}
.modal-content .form-check-input {
	width: 1.55rem;
    height: 1.55rem;
    padding-top: 13px;
    padding-left: 6px;
}

.form-check-input:checked {
    background-color: black;
    border-color: black;
}
.modal-content hr {
	margin: 24px 20px;
	color:#BDBDBD;
}
.fold {
	text-decoration:none;
	font-weight: bold;
	color:black;
	padding:0;
	border:0;
	font-size:15px;
	background-color:transparent;
}
.rooms p button {
	height:40px;
	border: solid 1px #D8D8D8;
	border-radius:10px;
	
	background-color: white;
	color: black;
}
.rooms p label:hover {
	cursor:pointer;
}
.rooms p button.active {
	background-color: black;
	color: white;
}
#house button {
	border:solid 1px #D8D8D8;
	border-radius:10px;
	width: 168px;
	height: 118px;
	padding: 6px 12px;
	background-color: white;
	color: black;
}
#house button .img{
	vertical-align:top;
}
#house button .text{
	vertical-align:bottom;
}
#btn-filter-search {
	width: 163px;
	height: 48px;
}

#Self-check-in, #immediate-reservation, #super-book-option {
	width: 50px;
	height: 32px;
}

#building {
	width: 165px;
	height: 128px;
}

#filterbtn {
	font-weight: bold;
	font-size: 12px;
	background-color:#FFFFFF;
	color: black;
	
	border: solid 1px #E6E6E6;
	border-radius: 10px;
	width: 80px;
	height: 48px;
}
/* 슬라이드쇼 */
.grid-main {
  width: 100%;
  display: grid;
  grid-template-columns: repeat(2, 1fr);	/* 슬라이드쇼 1열에 2개 표시 */
  row-gap: 500px;
  column-gap: 5px;
  padding: 50px 0;
  @media screen and (max-width: 718px) {
    gap: 3px;
  }
}

.card-container {
  width: 100%;
  position: relative;
  text-decoration-line: none;
  color: black
}

.card-container::after {
  display: block;
  content: "";
}

.card-container::after {
  display: block;
  content: "";
}

.card-box {
  position: absolute;
  /* width: 100%;
  height: 100%; */
}


#map {
	position:absolute;
	z-index: -1;
	width:1530px;
	height:100%;
	left: 0px;
    top: 0px;
}
.sidebar {
  height: 100%;
  width: 50%;
  position: fixed;
  z-index: 1;
  top: 80px;
  right: 0;
  background-color: #FFFFFF;
  overflow-x: hidden;
  transition: 0.5s;
}

.sidebar a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.zoombtn-group {
  z-index:1;
  position:absolute;
  top:20px;
  right:20px;
  display: block;
  border-radius:10px;
  padding:4px;
  box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important;
  background-color: #FFFFFF;
  }
  
.zoombtn-group button { 
  font-size: 20px;
  cursor: pointer;
  background-color: transparent;
  color: black;
  padding: 0px;
  border-radius:0;
  border: none;
  
  width:40px;
  height:40px;
  display:block;
}

.zoombtn-group button:not(:last-child) {
  border-bottom: solid 1px #E6E6E6; 
}

#closebtn {
  position: relative;
  z-index:1;
  top: 18px;
  left: 32px;
  
  font-size: 15px;
  cursor: pointer;
  background-color: #FFFFFF;
  color: black;
  padding: 0px;
  border-radius: 10px;
  border: none;
  box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important;
  
  width:111px;
  height:40px;
}

#filterbtn {
  position: relative;
  z-index:1;
  top: 16px;
  left: 32px;
  
  font-size: 15px;
  cursor: pointer;
  background-color: #FFFFFF;
  color: black;
  padding: 0px;
  border-radius: 10px;
  border: none;
  box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important;
  
  width:81px;
  height:40px;
  
}
#navfilter {
	font-weight: bold;
	font-size: 14px;
	cursor: pointer;
	background-color: #FFFFFF;
	color: black;
	padding: 0px;
	background-color:#FFFFFF;
	color: black;
	
	border: solid 1px #E6E6E6;
	border-radius: 10px;
  
	width:81px;
	height:40px;
  
}
#closebtn i{
	font-size: 20px;
}
#openbtn {
  z-index:1;
  position:relative;
  top:20px;
  left:20px;
  
  font-size: 20px;
  cursor: pointer;
  background-color: #FFFFFF;
  color: black;
  padding: 0px;
  border-radius:25%;
  border: none;
  box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important;
  
  width:40px;
  height:40px;
}

#openbtn:hover, .zoombtn-group button:hover, #closebtn:hover {
  background-color: #FAFAFA;
}
#nav2 {
	top:50px;
	z-index: 2;
	height: 78px;
	width: 50%;
	background-color:#FFFFFF;
	margin:0;
}
#main {
  transition: margin-left .5s;
  padding: 0px;
  
  top: 0;
  left: 0;
  width: 50%;
}

/* filter-차트 & 슬라이더 */
::selection{
  color: #fff;
  background: #fff;
}
.wrapper{
  	top: 0px;
    left: 50px;
    position: relative;
    width: 660px;
    background: transparent;
    padding: 0px;
}
header h2{
  font-size: 24px;
  font-weight: 600;
}
header p{
  margin-top: 5px;
  font-size: 16px;
}
.price-input{
	width: 98%;
    display: flex;
    margin: 25px auto;
}
.price-input .field{
  display: flex;
  width: 100%;
  height: 45px;
  align-items: center;
}
.field input{
  width: 100%;
  height: 100%;
  outline: none;
  font-size: 19px;
  margin-left: 12px;
  border-radius: 5px;
  text-align: center;
  border: 1px solid #999;
  -moz-appearance: textfield;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
  -webkit-appearance: none;
}
.price-input .separator{
  width: 130px;
  display: flex;
  font-size: 19px;
  align-items: center;
  justify-content: center;
}
.slider{
  height: 1px;
  position: relative;
  background: transparent;
  border-radius: 5px;
}
.slider .progress{
  height: 100%;
  left: 25%;
  right: 25%;
  position: absolute;
  border-radius: 5px;
  background: transparent;
}
.range-input{
  position: relative;
  top: 5px;
}
.range-input input{
  position: absolute;
  width: 100%;
  height: 5px;
  top: -8px;
  background: none;
  pointer-events: none;
  -webkit-appearance: none;
  -moz-appearance: none;
}
input[type="range"]::-webkit-slider-thumb{
  height: 25px;
  width: 25px;
  border: solid 1px gray;
  border-radius: 50%;
  background: #fff;
  pointer-events: auto;
  -webkit-appearance: none;
  box-shadow: 0 0 6px rgba(0,0,0,0.05);
}
input[type="range"]::-moz-range-thumb{
  height: 25px;
  width: 25px;
  border: none;
  border-radius: 50%;
  background: #fff;
  pointer-events: auto;
  -moz-appearance: none;
  box-shadow: 0 0 6px rgba(0,0,0,0.05);
}

.unwish i:active {
	position:relative;
	top:1px;
}

.carousel-indicators > button {
 			border-radius: 100% !important;
    width: 8px !important;
    height: 8px !important;
    background-color: #404040 ;
    }

/*  */
@media screen and (max-width: 950px) {
	#mySidebar {width:0px;}
	#main {width:100%;}
	#nav2 {width:100%;}
	.container{padding:0}
	.grid-main {column-gap: 100px;}
}
/* 지도 마커 */
.customoverlay {position:relative;bottom:15px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}

</style>
</head>
<c:set var="page" value="subNav" />
<body>
<div class="sticky-top" style="z-index: 4;">
	<%@ include file="../common/nav.jsp"%>
	<div class="container">
	    <!-- 태그와 필터가 있는 navbar2 -->
		<div class="row tagFilterBar p-0 align-items-center" id="nav2"  style="width: 49%;">
			<div class="col-10 text-start p-0" style="font-size:14px;"><strong><!-- 숙소 10000개 --></strong></div>
			<div class="col-2 text-end">
				<button id="navfilter" type="button" data-bs-toggle="modal" data-bs-target="#filterModal">
					<i class="bi bi-sliders"></i>
					필터
				</button>
			</div>
		</div>
	</div>
</div>
<%@ include file="../user/login-register-modals.jsp" %>
<div class="container">
	<div id="main">
		<div id="accList" class="grid-main">
		<!-- acc.status = '운영중' 인 숙소만 리스트업 --> 
		<c:forEach var="acc" items="${list }">
			<div class="card-container" data-acc-no="${acc.accNo }" style="text-decoration-line: none; color: black">
				<div class="card-box p-1">
					<div class="" style="width: 300px">
									<!-- 숙소 섬네일 슬라이드쇼 시작 -->
									<!-- 아이디에 acc_no나 img_no를 사용하는게 좋을 것 같습니다. / id - 아래 3개의 버튼, prev버튼, next버튼 -->
						<div id="acc-slide${acc.accNo }" class="carousel slide" data-interval="false">
							<div class="carousel-indicators">
											<button type="button"
												data-bs-target="#acc-slide${acc.accNo }"
												data-bs-slide-to="0" class="active" aria-current="true"
												aria-label="Slide 1"></button>
											<button type="button"
												data-bs-target="#acc-slide${acc.accNo }"
												data-bs-slide-to="1" aria-label="Slide 2"></button>
											<button type="button"
												data-bs-target="#acc-slide${acc.accNo }"
												data-bs-slide-to="2" aria-label="Slide 3"></button>
											<button type="button"
												data-bs-target="#acc-slide${acc.accNo }"
												data-bs-slide-to="3" aria-label="Slide 4"></button>
											<button type="button"
												data-bs-target="#acc-slide${acc.accNo }"
												data-bs-slide-to="4" aria-label="Slide 5"></button>
							</div>
										<!-- 위시리스트 하트 버튼 -->
							<div class="wishlist-icon">
											<c:if test="${empty LOGIN_USER }">
												<a class="unwish" data-bs-toggle="modal" data-bs-target="#email-login-modal" style="position:absolute; top:15px; right:15px; z-index:2">
													<i class="bi bi-suit-heart fs-4" style="color: white;"></i>
												</a>
											</c:if>
											<c:if test="${not empty LOGIN_USER }">
												<a class="unwish"  style="position:absolute; top:15px; right:15px; z-index:2">
															<c:choose>
																<c:when test="${acc.savedWishlist eq 'Y'}">
																	<i class="wishlistIcon fa-solid fa-heart fs-4" data-accNo="${acc.accNo}" id="icon-heart-${acc.accNo}" style="color: #FF385C;"></i>												
																</c:when>
																<c:otherwise>
																	<i class="wishlistIcon fa-regular fa-heart fs-4" data-accNo="${acc.accNo}" id="icon-heart-${acc.accNo}" style="color: white;"></i>
																</c:otherwise>
															</c:choose>
												</a>
											</c:if>
							</div>
										<!-- 슬라이드쇼 이미지 /image-cover, room_image_no -->
							<div class="carousel-inner" style="border-radius: 25px;">
								<div class="carousel-item active"> 		
												<img class="acc-thumbnail rounded-0" data-acc-no="${acc.accNo }"
													src="/resources/images/acc/${acc.photos[0].name }" alt="숙소이미지"
													style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
												<img class="acc-thumbnail rounded-0"  data-acc-no="${acc.accNo }"
													src="/resources/images/acc/${acc.photos[1].name }" alt="숙소이미지"
													style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
												<img class="acc-thumbnail rounded-0"  data-acc-no="${acc.accNo }"
													src="/resources/images/acc/${acc.photos[2].name }" alt="숙소이미지"
													style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
												<img class="acc-thumbnail rounded-0"  data-acc-no="${acc.accNo }"
													src="/resources/images/acc/${acc.photos[3].name }" alt="숙소이미지"
													style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
												<img class="acc-thumbnail rounded-0"  data-acc-no="${acc.accNo }"
													src="/resources/images/acc/${acc.photos[4].name }" alt="숙소이미지"
													style="object-fit: cover; width: 300px; height: 300px;">
								</div>
											
							</div>
										
										<button class="carousel-control-prev" type="button"
											data-bs-target="#acc-slide${acc.accNo }"
											data-bs-slide="prev">
											<span class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Previous</span>
										</button>
										<button class="carousel-control-next" type="button"
											data-bs-target="#acc-slide${acc.accNo }"
											data-bs-slide="next">
											<span class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Next</span>
										</button>
						</div>
															<!-- 숙소 설명 -->
						<div class="row my-2 card-desc " data-acc-no="${acc.accNo }">
									<c:set var="address"  value="${fn:split(acc.address, ' ')}"/>
							<div class="col-8">
			
								<div class="card-title"><strong><span>${address[1]}, ${address[0]}</span>의 <span>${acc.types[0].name }</span></strong></div>
			
									<div class="card-text text-muted"><small>${acc.name }</small></div>
									<div class="card-subtitle mb-2 text-muted"><fmt:formatDate value="${acc.checkIn }" pattern="MM월 dd일"/> ~ <fmt:formatDate value="${acc.checkOut }" pattern="MM월 dd일"/></div>
									<div class="card-text pt-1">
												<strong>₩<fmt:formatNumber value="${acc.price }" /></strong>/박
									</div>
								</div>
							<div class="col-4 text-end"><i class="bi bi-star-fill"></i><span> ${acc.reviewScore }</span>(<span>${acc.reviewCount }</span>)</div>
						</div>
					</div>
				</div>
			</div>

			</c:forEach>
		</div>
	</div>
	<div id="mySidebar" class="sidebar" style="z-index:3;">
	  <!-- 접기 펼치기 버튼 -->
	  <button id="openbtn" onclick="openNav()"><i class="bi bi-chevron-left"></i></button>
	  <div class="zoombtn-group">
	  	<button type="button" onclick="zoomIn()"><i class="bi bi-plus-lg"></i></button>
	  	<button type="button" onclick="zoomOut()"><i class="bi bi-dash-lg"></i></button>
	  </div>
	  <button id="closebtn" class="d-none" onclick="closeNav()"><i class="bi bi-chevron-right"></i><strong>    목록보기</strong></button>
	  <!-- 필터 버튼 -->
	  <button id="filterbtn" class="d-none" type="button" data-bs-toggle="modal" data-bs-target="#filterModal"><i class="bi bi-sliders"></i><strong>    필터</strong></button>
	  <div id="map"></div>
	</div>
</div>
	<!-- filter modal -->
	<div class="modal fade" id="filterModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<div class="modal-content"> 
				<div class="modal-header d-flex justify-content-between" style="height:63px">
					<div>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<h6 class="modal-title text-center" id="exampleModalLabel">필터</h6>
					<div></div>
				</div>
				<div class="modal-body p-0" style="padding:0; overflow-x:hidden;">
					<form id="filter-search" method="GET" action="list">
						<!-- 태그 아이디 -->
						<input type="hidden" id="tagId-submit" value="">
						<h5 class="pt-4">
							<strong>가격 범위</strong>
						</h5>
						<p class="text-muted" style="padding:10px 25px;">평균 1박 요금은 ₩ <span><fmt:formatNumber value="${price.avg }" /></span> 입니다.</p>
						<!-- 차트 + 범위 슬라이더 -->
						<div class="p-0">
							<!-- 차트 -->
							<div id="number_format_chart"></div>
							<!-- 슬라이더 -->
							<div> 
							    <div class="wrapper">
									<div class="slider">
									  <div class="progress"></div>
									</div>
									<div class="range-input">
									  <input type="range" class="range-min" name="rangeMin" min="${price.min }" max="${price.max }" value="${price.min }" step="100">
									  <input type="range" class="range-max" name="rangeMax" min="${price.min }" max="${price.max }" value="${price.max }" step="100">
									</div>
									<div class="price-input">
									  <div class="field">
									    <label for="" style="font-size: 13px; width: 90px;">최저요금</label>
									    <input type="number" class="input-min" name="minPrice" value="${price.min }" style="padding-left:15px; padding-bottom:5px;font-size: 17px;">
								      </div>
								      <div class="separator">-</div>
								      <div class="field">
								        <label for="" style="font-size: 13px; width: 90px;">최고요금</label>
								        <input type="number" class="input-max" name="maxPrice" value="${price.max }" style="font-size: 17px;">
								      </div>
								    </div>
								</div>
							</div>
						</div>
						<hr class="my-4">
						<h5>
							<strong>숙소 유형</strong>
						</h5>
						
						<div class="row" style="padding:25px 35px;">
							<div class="form-check col-6 d-flex">
								<input class="form-check-input" type="checkbox" name="rent" value="100"
									id="accCheck"> <label class="form-check-label px-2"
									for="flexCheckDefault"> 집 전체
									<p class="fw-lighter">단독으로 사용하는 공간 전체</p>
								</label>
							</div>
							<div class="form-check col-6 d-flex">
								<input class="form-check-input" type="checkbox" name="rent" value="101" id="accCheck">
								<label class="form-check-label px-2" for="flexCheckDefault">
									개인실
									<p class="fw-lighter">집 또는 호텔의 개인실과 일부 공용 공간</p>
								</label>
							</div>
							<div class="form-check col-6 d-flex">
								<input class="form-check-input" type="checkbox" name="rent" value="102"
									id="accCheck"> <label class="form-check-label px-2"
									for="flexCheckDefault"> 다인실
									<p class="fw-lighter">다른 사람들과 함께 사용하는 다인실 및 공용 공간</p>
								</label>
							</div>
						</div>
						<hr class="my-4">
						<h5>
							<strong>침실과 침대</strong>
						</h5>
						<div class="rooms" style="padding:25px;">
							<p><strong>침실</strong></p>
							<p id="bedrooms" class="pb-3">
								<button type="button" class="bedrooms" data-bedrooms="0">
									<label class="px-2">상관없음</label>
									<input type="hidden" name="bedrooms" value="0" disabled="disabled"/>
								</button>
								<button type="button" class="bedrooms" data-bedrooms="1">
									<label class="px-2">1</label>
									<input type="hidden" name="bedrooms" value="1" disabled="disabled"/>
								</button>
								<button type="button" class="bedrooms" data-bedrooms="2">
									<label class="px-2">2</label>
									<input type="hidden" name="bedrooms" value="2" disabled="disabled"/>
								</button>
								<button type="button" class="bedrooms" data-bedrooms="3">
									<label class="px-2">3</label>
									<input type="hidden" name="bedrooms" value="3" disabled="disabled"/>
								</button>
								<button type="button" class="bedrooms" data-bedrooms="4">
									<label class="px-2">4</label>
									<input type="hidden" name="bedrooms" value="4" disabled="disabled"/>
								</button>
								<button type="button" class="bedrooms" data-bedrooms="5">
									<label class="px-2">5</label>
									<input type="hidden" name="bedrooms" value="5" disabled="disabled"/>
								</button>
								<button type="button" class="bedrooms" data-bedrooms="6">
									<label class="px-2">6</label>
									<input type="hidden" name="bedrooms" value="6" disabled="disabled"/>
								</button>
								<button type="button" class="bedrooms" data-bedrooms="7">
									<label class="px-2">7</label>
									<input type="hidden" name="bedrooms" value="7" disabled="disabled"/>
								</button>
								<button type="button" class="bedrooms" data-bedrooms="8">
									<label class="px-2">8+</label>
									<input type="hidden" name="bedrooms" value="8" disabled="disabled"/>
								</button>
							</p>
							<p><strong>침대</strong></p>
							<p id="" class="pb-3">
								<button type="button" class="beds" data-beds="0">
									<label class="px-2">상관없음</label>
									<input type="hidden" name="beds" value="0" disabled="disabled"/>
								</button>
								<button type="button" class="beds" data-beds="1">
									<label class="px-2">1</label>
									<input type="hidden" name="beds" value="1" disabled="disabled"/>
								</button>
								<button type="button" class="beds" data-beds="2">
									<label class="px-2">2</label>
									<input type="hidden" name="beds" value="2" disabled="disabled"/>
								</button>
								<button type="button" class="beds" data-beds="3">
									<label class="px-2">3</label>
									<input type="hidden" name="beds" value="3" disabled="disabled"/>
								</button>
								<button type="button" class="beds" data-beds="4">
									<label class="px-2">4</label>
									<input type="hidden" name="beds" value="4" disabled="disabled"/>
								</button>
								<button type="button" class="beds" data-beds="5">
									<label class="px-2">5</label>
									<input type="hidden" name="beds" value="5" disabled="disabled"/>
								</button>
								<button type="button" class="beds" data-beds="6">
									<label class="px-2">6</label>
									<input type="hidden" name="beds" value="6" disabled="disabled"/>
								</button>
								<button type="button" class="beds" data-beds="7">
									<label class="px-2">7</label>
									<input type="hidden" name="beds" value="7" disabled="disabled"/>
								</button>
								<button type="button" class="beds" data-beds="8">
									<label class="px-2">8+</label>
									<input type="hidden" name="beds" value="8" disabled="disabled"/>
								</button>
							</p>

							<div class="fold-content d-none">
								<p><strong>욕실</strong></p>
								<p id="" class="pb-3">
								<button type="button" class="bathrooms" data-bathroom="0">
									<label class="px-2">상관없음</label>
									<input type="hidden" name="bathrooms" value="0" disabled="disabled"/>
								</button>
								<button type="button" class="bathrooms" data-bathroom="1">
									<label class="px-2">1</label>
									<input type="hidden" name="bathrooms" value="1" disabled="disabled"/>
								</button>
								<button type="button" class="bathrooms" data-bathroom="2">
									<label class="px-2">2</label>
									<input type="hidden" name="bathrooms" value="2" disabled="disabled"/>
								</button>
								<button type="button" class="bathrooms" data-bathroom="3">
									<label class="px-2">3</label>
									<input type="hidden" name="bathrooms" value="3" disabled="disabled"/>
								</button>
								<button type="button" class="bathrooms" data-bathroom="4">
									<label class="px-2">4</label>
									<input type="hidden" name="bathrooms" value="4" disabled="disabled"/>
								</button>
								<button type="button" class="bathrooms" data-bathroom="5">
									<label class="px-2">5</label>
									<input type="hidden" name="bathrooms" value="5" disabled="disabled"/>
								</button>
								<button type="button" class="bathrooms" data-bathroom="6">
									<label class="px-2">6</label>
									<input type="hidden" name="bathrooms" value="6" disabled="disabled"/>
								</button>
								<button type="button" class="bathrooms" data-bathroom="7">
									<label class="px-2">7</label>
									<input type="hidden" name="bathrooms" value="7" disabled="disabled"/>
								</button>
								<button type="button" class="bathrooms" data-bathroom="8">
									<label class="px-2">8+</label>
									<input type="hidden" name="bathrooms" value="8" disabled="disabled"/>
								</button>
								</p>
							</div>
							<button type="button" class="fold">더 표시</button>
							</div>
						<hr class="my-4">
						
						<h5>
							<strong>건물 유형</strong>
						</h5>
						<div id="house" class="d-flex justify-content-around p-3">
						
						
						<button type="button" class="btn" id="btn-house-1" data-house="#house-1">
						<input type="hidden" name="house" id="house-1" value="2" disabled="disabled" />
							<div class="img text-start">
								<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"
									fill="currentColor" class="bi bi-house-door"
									viewBox="0 0 16 16">
						  			<path
										d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z" />
								</svg>
							</div>
							<div class="text text-start pt-4">단독 또는 다세대 주택</div>
						</button>
						
						<button type="button" class="btn" id="btn-house-2"  data-house="#house-2">
						<input type="hidden" name="house" id="house-2" value="1"  disabled="disabled" />			<!-- disabled - form에 제출되지 않음 -->
							<div class="img text-start">
								<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"
									fill="currentColor" class="bi bi-building" viewBox="0 0 16 16">
						  			<path fill-rule="evenodd"
										d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694 1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z" />
						  			<path
										d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z" />
								</svg>
							</div>
							<div class="text text-start pt-4">아파트</div>
						</button>
						
						<button type="button" class="btn" id="btn-house-3"  data-house="#house-3">
						<input type="hidden" name="house" id="house-3" value="3"  disabled="disabled" />
							<div class="img text-start">
								<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"
									fill="currentColor" class="bi bi-bank" viewBox="0 0 16 16">
						  <path
										d="m8 0 6.61 3h.89a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5H15v7a.5.5 0 0 1 .485.38l.5 2a.498.498 0 0 1-.485.62H.5a.498.498 0 0 1-.485-.62l.5-2A.501.501 0 0 1 1 13V6H.5a.5.5 0 0 1-.5-.5v-2A.5.5 0 0 1 .5 3h.89L8 0ZM3.777 3h8.447L8 1 3.777 3ZM2 6v7h1V6H2Zm2 0v7h2.5V6H4Zm3.5 0v7h1V6h-1Zm2 0v7H12V6H9.5ZM13 6v7h1V6h-1Zm2-1V4H1v1h14Zm-.39 9H1.39l-.25 1h13.72l-.25-1Z" />
						</svg>
							</div>
							<div class="text text-start pt-4">게스트용 별채</div>
						</button>
						
						<button type="button" class="btn" id="btn-house-4"  data-house="#house-4">
						<input type="hidden" name="house" id="house-4" value="6"  disabled="disabled" />
							<div class="img text-start">
								<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"
									fill="currentColor" class="bi bi-hospital" viewBox="0 0 16 16">
						    		<path
										d="M8.5 5.034v1.1l.953-.55.5.867L9 7l.953.55-.5.866-.953-.55v1.1h-1v-1.1l-.953.55-.5-.866L7 7l-.953-.55.5-.866.953.55v-1.1h1ZM13.25 9a.25.25 0 0 0-.25.25v.5c0 .138.112.25.25.25h.5a.25.25 0 0 0 .25-.25v-.5a.25.25 0 0 0-.25-.25h-.5ZM13 11.25a.25.25 0 0 1 .25-.25h.5a.25.25 0 0 1 .25.25v.5a.25.25 0 0 1-.25.25h-.5a.25.25 0 0 1-.25-.25v-.5Zm.25 1.75a.25.25 0 0 0-.25.25v.5c0 .138.112.25.25.25h.5a.25.25 0 0 0 .25-.25v-.5a.25.25 0 0 0-.25-.25h-.5Zm-11-4a.25.25 0 0 0-.25.25v.5c0 .138.112.25.25.25h.5A.25.25 0 0 0 3 9.75v-.5A.25.25 0 0 0 2.75 9h-.5Zm0 2a.25.25 0 0 0-.25.25v.5c0 .138.112.25.25.25h.5a.25.25 0 0 0 .25-.25v-.5a.25.25 0 0 0-.25-.25h-.5ZM2 13.25a.25.25 0 0 1 .25-.25h.5a.25.25 0 0 1 .25.25v.5a.25.25 0 0 1-.25.25h-.5a.25.25 0 0 1-.25-.25v-.5Z" />
						    		<path
										d="M5 1a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v1a1 1 0 0 1 1 1v4h3a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V8a1 1 0 0 1 1-1h3V3a1 1 0 0 1 1-1V1Zm2 14h2v-3H7v3Zm3 0h1V3H5v12h1v-3a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3Zm0-14H6v1h4V1Zm2 7v7h3V8h-3Zm-8 7V8H1v7h3Z" />
					    		</svg>
							</div>
							<div class="text text-start pt-4">호텔</div>
						</button>
						</div>
						
						<hr class="my-4">
						<h5>
							<strong>편의시설</strong>
						</h5>
						<div  style="padding:10px 35px;">
							<div class="row">
								<div class="col-12 pb-3 ps-0">
									<strong>필수</strong>
								</div>
								<div class="form-check col-6">
									<input class="form-check-input" type="checkbox" name="convenience" value="1"
										id="convenience-required"> <label
										class="form-check-label p-2" for="flexCheckDefault">
										무선 인터넷 </label>
								</div>
								<div class="form-check col-6">
									<input class="form-check-input" type="checkbox" name="convenience" value="2"
										id="convenience-required"> <label
										class="form-check-label p-2" for="flexCheckDefault">
										주방 </label>
								</div>
								<div class="form-check col-6">
									<input class="form-check-input" type="checkbox" name="convenience" value="3"
										id="convenience-required"> <label
										class="form-check-label p-2" for="flexCheckDefault">
										세탁기 </label>
								</div>
								<div class="form-check col-6">
									<input class="form-check-input" type="checkbox" name="convenience" value="4"
										id="convenience-required"> <label
										class="form-check-label p-2" for="flexCheckDefault">
										건조기 </label>
								</div>
								<div class="form-check col-6">
									<input class="form-check-input" type="checkbox" name="convenience" value="5"
										id="convenience-required"> <label
										class="form-check-label p-2" for="flexCheckDefault">
										에어컨 </label>
								</div>
								<div class="fold-content d-none">
									<div class="row p-3 ps-0">
										<div class="form-check col-6">
											<input class="form-check-input" type="checkbox" name="convenience" value="6"
												id="convenience-required"> <label
												class="form-check-label p-2" for="flexCheckDefault">
												난방 </label>
										</div>
										<div class="form-check col-6">
											<input class="form-check-input" type="checkbox" name="convenience" value="7"
												id="convenience-required"> <label
												class="form-check-label p-2" for="flexCheckDefault">
												업무 전용 공간 </label>
										</div>
										<div class="form-check col-6">
											<input class="form-check-input" type="checkbox" name="convenience" value="8"
												id="convenience-required"> <label
												class="form-check-label p-2" for="flexCheckDefault">
												TV </label>
										</div>
										<div class="form-check col-6">
											<input class="form-check-input" type="checkbox" name="convenience" value="9"
												id="convenience-required"> <label
												class="form-check-label p-2" for="flexCheckDefault">
												헤어드라이어 </label>
										</div>
										<div class="form-check col-6">
											<input class="form-check-input" type="checkbox" name="convenience" value="10"
												id="convenience-required"> <label
												class="form-check-label p-2" for="flexCheckDefault">
												다리미 </label>
										</div>
									</div>

									<div class="row p-3 ps-0">
										<div class="col-12 pb-3 ps-0">
											<strong>특징</strong>
										</div>
										<div class="form-check col-6">
											<input class="form-check-input" type="checkbox" name="convenience" value="11"
												id="convenience-feature"> <label
												class="form-check-label p-2" for="flexCheckDefault">
												수영장 </label>
										</div>
										<div class="form-check col-6">
											<input class="form-check-input" type="checkbox" name="convenience" value="13"
												id="convenience-feature"> <label
												class="form-check-label p-2" for="flexCheckDefault">
												자쿠지 </label>
										</div>
										<div class="form-check col-6">
											<input class="form-check-input" type="checkbox" name="convenience" value="14"
												id="convenience-feature"> <label
												class="form-check-label p-2" for="flexCheckDefault">
												건물 내 무료 주차 </label>
										</div>
										<div class="form-check col-6">
											<input class="form-check-input" type="checkbox" name="convenience" value="15"
												id="convenience-feature"> <label
												class="form-check-label p-2" for="flexCheckDefault">
												전기차 충전 시설 </label>
										</div>
										<div class="form-check col-6">
											<input class="form-check-input" type="checkbox" name="convenience" value="16"
												id="convenience-feature"> <label
												class="form-check-label p-2" for="flexCheckDefault">
												아기 침대 </label>
										</div>
										<div class="form-check col-6">
											<input class="form-check-input" type="checkbox" name="convenience" value="17"
												id="convenience-feature"> <label
												class="form-check-label p-2" for="flexCheckDefault">
												헬스장 </label>
										</div>
										<div class="form-check col-6">
											<input class="form-check-input" type="checkbox" name="convenience" value="18"
												id="convenience-feature"> <label
												class="form-check-label p-2" for="flexCheckDefault">
												바비큐 그릴 </label>
										</div>
										<div class="form-check col-6">
											<input class="form-check-input" type="checkbox" name="convenience" value="20"
												id="convenience-feature"> <label
												class="form-check-label p-2" for="flexCheckDefault">
												아침식사 </label>
										</div>
										<div class="form-check col-6">
											<input class="form-check-input" type="checkbox" name="convenience" value="22"
												id="convenience-feature"> <label
												class="form-check-label p-2" for="flexCheckDefault">
												실내 벽난로 </label>
										</div>
										<div class="form-check col-6">
											<input class="form-check-input" type="checkbox" name="convenience" value="23"
												id="convenience-feature"> <label
												class="form-check-label p-2" for="flexCheckDefault">
												흡연 가능 </label>
										</div>
									</div>
									<div class="row p-3 ps-0">	
										<div class="col-12 pb-3 ps-0">
											<strong>위치</strong> <!-- 구현 X -->
										</div>
										<div class="form-check col-6">
											<input class="form-check-input" type="checkbox" name="convenience" value="해변에 인접"
												id="convenience-location"> <label
												class="form-check-label p-2" for="flexCheckDefault">
												해변에 인접 </label>
										</div>
										<div class="form-check col-6">
											<input class="form-check-input" type="checkbox" name="convenience" value="수변에 인접"
												id="convenience-location"> <label
												class="form-check-label p-2" for="flexCheckDefault">
												수변에 인접 </label>
										</div>
									</div>
									<div class="row p-3 ps-0">
										<div class="col-12 pb-3 ps-0">
											<strong>안전</strong>
										</div>
										<div class="form-check col-6">
											<input class="form-check-input" type="checkbox" name="convenience" value="25"
												id="convenience-safe"> <label
												class="form-check-label p-2" for="flexCheckDefault">
												화재경보기 </label>
										</div>
										<div class="form-check col-6">
											<input class="form-check-input" type="checkbox" name="convenience" value="26"
												id="convenience-safe"> <label
												class="form-check-label p-2" for="flexCheckDefault">
												일산화탄소 경보기 </label>
										</div>
									</div>
								</div>
							<button type="button" class="fold col-12 text-start">더 표시</button>
							</div>
							</div>
							<hr class="my-4">
							<h5>
								<strong>예약옵션</strong>	<!-- airbnb_convenience 테이블에 있는 컬럼 -->
							</h5>
							<div class="" style="padding:25px;">
								<div
									class="form-check form-switch pb-3 ps-0 d-flex justify-content-between">
									<div>
										<label class="form-check-label" for="immediate-reservation">
											즉시 예약
											<p class="fw-lighter">호스트 승인을 기다릴 필요 없이 예약할 수 있는 숙소</p>
										</label>
									</div>
									<div>
										<input class="form-check-input" type="checkbox" name="convenience" value="29"
											id="immediate-reservation">
									</div>
								</div>
								<div
									class="form-check form-switch ps-0 d-flex justify-content-between">
									<div>
										<label class="form-check-label" for="Self-check-in">
											셀프 체크인
											<p class="fw-lighter">숙소에 도착한 후 복잡한 절차 없이 쉽게 입실할 수 있습니다.</p>
										</label>
									</div>
									<div>
										<input class="form-check-input" type="checkbox" name="convenience" value="30"
											id="Self-check-in">
									</div>
								</div>
							</div>
							<hr class="my-4">
							<div>
							<h5>
								<strong>접근성 편의</strong>	<!-- 구현X -->
							</h5>
							<div style="padding:10px 25px;">
								<p class="text-muted">호스트가 제공하고 에어비앤비에서 검토한 정보 입니다.</p>
							</div>
							<div style="padding:0px 35px;">
								<div class="row" >
									<div class="col-12 pb-3 ps-0">
										<strong>필수</strong>
									</div>
									<div class="form-check col-6">
										<input class="form-check-input" type="checkbox" value="출입구계단없음"
											name="accessibility"> <label
											class="form-check-label p-2" for="flexCheckDefault">
											게스트 출입구에 계단이나 문턱 없음 </label>
									</div>
									<div class="form-check col-6">
										<input class="form-check-input" type="checkbox" value="넓은출입구"
											name="accessibility"> <label
											class="form-check-label p-2" for="flexCheckDefault">
											너비 81cm 이상의 게스트 출입구 </label>
									</div>
									<div class="form-check col-6">
										<input class="form-check-input" type="checkbox" value="넓은주차공간"
											name="accessibility"> <label
											class="form-check-label p-2" for="flexCheckDefault">
											휠체어 접근 가능 주차 공간 </label>
									</div>
									<div class="fold-content d-none">
										<div class="row p-3 ps-0">
											<div class="form-check col-6 d-flex justify-content-between">
												<div>
													<input class="form-check-input" type="checkbox" value="출입구까지계단없음"
														name="accessibility">
												</div>
												<div>
													<label class="form-check-label p-2" for="flexCheckDefault">
														게스트 출입구까지 계단이나 문턱 없이 이동 가능 </label>
												</div>
											</div>
										</div>

										<div class="row p-3 ps-0">
											<div class="col-12 pb-3 ps-0">
												<strong>침실</strong>
											</div>
											<div class="form-check col-6">
												<input class="form-check-input" type="checkbox" value="침실계단없음"
													name="accessibility"> <label class="form-check-label p-2"
													for="flexCheckDefault"> 계단이나 문턱 없는 침실</label>
											</div>
											<div class="form-check col-6">
												<input class="form-check-input" type="checkbox" value="넓은침실문"
													name="accessibility"> <label class="form-check-label p-2"
													for="flexCheckDefault"> 너비 81cm 이상의 침실 출입구</label>
											</div>
										</div>
										<div class="row p-3 ps-0">
											<div class="col-12 pb-3 ps-0">
												<strong>욕실</strong>
											</div>
											<div class="form-check col-6">
												<input class="form-check-input" type="checkbox" value="욕실계단없음"
													name="accessibility"> <label class="form-check-label p-2"
													for="flexCheckDefault"> 계단이나 문턱 없는 욕실</label>
											</div>
											<div class="form-check col-6">
												<input class="form-check-input" type="checkbox" value="넓은욕실문"
													name="accessibility"> <label class="form-check-label p-2"
													for="flexCheckDefault"> 너비 81cm 이상의 욕실 출입구</label>
											</div>
											<div class="form-check col-6">
												<input class="form-check-input" type="checkbox" value="샤워손잡이"
													name="accessibility"> <label class="form-check-label p-2"
													for="flexCheckDefault"> 샤워실 고정 손잡이</label>
											</div>
											<div class="form-check col-6">
												<input class="form-check-input" type="checkbox" value="변기손잡이"
													name="accessibility"> <label class="form-check-label p-2"
													for="flexCheckDefault"> 변기 옆 고정 손잡이</label>
											</div>
											<div class="form-check col-6">
												<input class="form-check-input" type="checkbox" value="샤워실계단없음"
													name="accessibility"> <label class="form-check-label p-2"
													for="flexCheckDefault"> 계단이나 문턱 없는 샤워실</label>
											</div>
											<div class="form-check col-6">
												<input class="form-check-input" type="checkbox" value="욕실의자"
													name="accessibility"> <label class="form-check-label p-2"
													for="flexCheckDefault"> 샤워/목욕 의자</label>
											</div>
										</div>
										<div class="row p-3 ps-0">
											<div class="col-12 pb-3 ps-0">
												<strong>장애인용 보조 장치</strong>
											</div>
											<div class="form-check col-6">
												<input class="form-check-input" type="checkbox" value="리프트"
													name="accessibility"> <label
													class="form-check-label p-2" for="flexCheckDefault">
													천장형 또는 이동식 리프트</label>
											</div>
										</div>
									</div>
								</div>
								</div>
							<button type="button" class="fold" style="padding:0 24px">더 표시</button>
							</div>
						<hr class="my-4">
						<h5>
							<strong>최고 수준의 숙소</strong>
						</h5>
						<div class="" style="padding:25px;">
							<div
									class="form-check form-switch pb-3 ps-0 d-flex justify-content-between">
									<div>
										<label class="form-check-label" for="flexSwitchCheckDefault">
											슈퍼호스트
											<p class="fw-lighter">슈퍼호스트의 숙소에 머물러보세요
												<a href="#" style="color:black"><p><strong>더 알아보기</p></strong></a>
											</p>
											
										</label>
									</div>
									<div>
										<input class="form-check-input" type="checkbox" name="highest" value="슈퍼호스트"
											id="super-book-option">
									</div>
								</div>
								<div
									class="form-check form-switch ps-0 d-flex justify-content-between">
									<div>
										<label class="form-check-label" for="flexSwitchCheckDefault">
											셀프 체크인
											<p class="fw-lighter">숙소에 도착한 후 복잡한 절차 없이 쉽게 입실할 수 있습니다.</p>
										</label>
									</div>
									<div>
										<input class="form-check-input" type="checkbox" name="highest" value="최고셀프체크인"
											id="super-book-option">
									</div>
								</div>
						</div>
						<hr class="my-4">
						<!-- <h5>
							<strong>호스트 언어</strong>
						</h5>
						<hr class="my-4"> -->
					</div>
					<div class="modal-footer justify-content-between">
						<button id="unchecked" type="button" class="btn btn-link" style="color: black;font-weight:bold;">
							전체 해제
						</button>
						<button id="btn-filter-search" type="button" class="btn btn-dark btn-lg">
							<h6 id="result" class="m-0 mx-auto" style="font-weight:bold; text-align: center;">
								숙소 검색하기	<!-- 숙소 개수구하기 보류 -->
							</h6>
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
<script>
//숙소 카드 링크
$('.card-container img, .card-desc').click(function(event) {
	
	let accNo = $(this).attr("data-acc-no");
	location.href = "/acc/detail?no=" + accNo;
	
})
</script>
<script>
/* 카카오맵 중심 x, y좌표 */
var x = 35.855301;
var y = 130.192884;
/* list 페이지의 오른쪽 지도 구현 - 접기 펼치기 버튼 */

$("#openbtn").click(function() {
	document.getElementById("mySidebar").style.width = "100%";
	document.getElementById("mySidebar").style.left = "0";
	document.getElementById("main").style.marginLeft = "-100%";
	
	$("#openbtn").toggleClass('d-none');
	$("#closebtn").toggleClass('d-none');
	$("#filterbtn").toggleClass('d-none');
});

$("#closebtn").click(function() {
	document.getElementById("mySidebar").style.width = "50%";
	document.getElementById("mySidebar").style.left = "50%";
	document.getElementById("main").style.marginLeft= "0";
	
	$("#openbtn").toggleClass('d-none');
	$("#closebtn").toggleClass('d-none');
	$("#filterbtn").toggleClass('d-none');
	
});

/* 카카오 지도 */
var container = document.getElementById('map'); 		  //지도를 담을 영역의 DOM 레퍼런스
var options = { 										  //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(x, y), //지도의 중심좌표.
	level: 13											  //지도의 레벨(확대, 축소 정도) - 최대 14
};

var map = new kakao.maps.Map(container, options); 		  //지도 생성 및 객체 리턴
 
// 지도 레벨은 지도의 확대 수준을 의미합니다
// 지도 레벨은 1부터 14레벨이 있으며 숫자가 작을수록 지도 확대 수준이 높습니다

//지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}

// 지도에 표시할 숙소의 위도, 경도
var positions = [
				<c:forEach var='accMap' items="${list}">
					{
						title: '${accMap.name}',
				        content: '<div class="text-center"><p> ₩ ${accMap.price}</p></div>', 
				        latlng: new kakao.maps.LatLng(${accMap.latitude}, ${accMap.longitude})
				    },
				</c:forEach> 
				];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "../../../resources/images/map_marker.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(20, 20); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage, // 마커 이미지 
        clickable : true
    });

 	// 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content, // 인포윈도우에 표시할 내용
        removable : true
    });

    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    (function(marker, infowindow) {
        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
        kakao.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map, marker);
        });
    })(marker, infowindow);
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close(parseInt(marker.title));
    };
}

/* var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

//마커를 생성합니다
var marker = new kakao.maps.Marker({
position: markerPosition,
image: markerImage // 마커이미지 설정 
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);  

//커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
var content = '<div class="customoverlay">' +
'  <a href="https://map.kakao.com/link/map/11394059" target="_blank">' +
'    <span class="title">구의야구공원</span>' +
'  </a>' +
'</div>';

//커스텀 오버레이가 표시될 위치입니다 
var position = new kakao.maps.LatLng(37.54699, 127.09598);  

//커스텀 오버레이를 생성합니다
var customOverlay = new kakao.maps.CustomOverlay({
map: map,
position: position,
content: content,
yAnchor: 1 
}); */

</script>
<!-- 필터 모달창 script -->
<script type="text/javascript">
	/* 필터-차트 */
     google.charts.load('current', {packages:['corechart']});
     google.charts.setOnLoadCallback(drawStuff);

       function drawStuff() {
         var data = new google.visualization.DataTable();
         
         data.addColumn('string', 'Country');
         data.addColumn('number', '');
         data.addRows([
	         <c:forEach var='c' items="${counts}">
	           ['', ${c}],         
	         </c:forEach>
         ]);

        var options = {
          title: '',
          width: 710,
          height: 100,
          padding:0,
          colors: ['#BDBDBD'],
          backgroundColor: 'transparent',
          
          legend: 'none',
          bar: {groupWidth: '95%'},
          vAxis: { 
        	  gridlines: { count: 4, color: 'transparent' }, format: '', baselineColor:'#BDBDBD'
          },
          
          chartArea: {left:50,top:0, width: '100%', height: '100%'},
          legend: {position: 'top', right:0},
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('number_format_chart'));
        chart.draw(data, options);

     };
	/* 필터-범위 슬라이더*/
	const rangeInput = document.querySelectorAll(".range-input input"),	// 슬라이더 막대기
	priceInput = document.querySelectorAll(".price-input input"),		// 값 입력하는 창
	range = document.querySelector(".slider .progress");
	let priceGap = 1000;	// 최소 갭은 여기서 수정
	priceInput.forEach(input =>{
	    input.addEventListener("input", e =>{
	        let minPrice = parseInt(priceInput[0].value),	// 첫번째 input 의 val
	        maxPrice = parseInt(priceInput[1].value);		// 두번째 input 의 val
	        
	        if((maxPrice - minPrice >= priceGap) && maxPrice <= rangeInput[1].max){
	            if(e.target.className === "input-min"){
	                rangeInput[0].value = minPrice;
	                range.style.left = ((minPrice / rangeInput[0].max) * 100) + "%";
	            }else{
	                rangeInput[1].value = maxPrice;
	                range.style.right = 100 - (maxPrice / rangeInput[1].max) * 100 + "%";
	            }
	        }
            // console.log(minPrice+","+maxPrice);
	    });
	});
	rangeInput.forEach(input =>{
	    input.addEventListener("input", e =>{
	        let minVal = parseInt(rangeInput[0].value),
	        maxVal = parseInt(rangeInput[1].value);
	        if((maxVal - minVal) < priceGap){
	            if(e.target.className === "range-min"){
	                rangeInput[0].value = maxVal - priceGap
	            }else{
	                rangeInput[1].value = minVal + priceGap;
	            }
	        }else{
	            priceInput[0].value = minVal;
	            priceInput[1].value = maxVal;
	            range.style.left = ((minVal / rangeInput[0].max) * 100) + "%";
	            range.style.right = 100 - (maxVal / rangeInput[1].max) * 100 + "%";
	        }
	        // console.log(minVal+","+maxVal);
	    });
	});
     


$(function() {	
	/* 필터-더 표시 < 숨기기 */
	$(".fold").click(function() {
		let text = $(this).text();
		$(this).text(text === "더 표시" ? "접기" : "더 표시");
		
		$(".fold-content").toggleClass("d-none");
	});

	/* 필터-전체 해제 */
	$("#unchecked").click(function() {
		$("input:checkbox[id='accCheck']").prop("checked", false);	
		$("input:checkbox[name='convenience']").prop("checked", false);	
		$("input:checkbox[name='accessibility']").prop("checked", false);	
		$("input:checkbox[id='super-book-option']").prop("checked", false);
		$('.bedrooms').removeClass("active");
		$('.beds').removeClass("active");
		$('.bathrooms').removeClass("active");
		
		// 슬라이드
		$('input[class*="-min"]').val(${price.min })
		$('input[class*="-max"]').val(${price.max })	// 최댓값
		/* $(".input-min").val(0);
		$(".range-min").val(0);
		$(".input-max").val(10000);	
		$(".range-max").val(10000); */
		
		// 건물 유형 버튼
		$('input[id^="house-"]').prop('disabled', true);
		$('button[id^="btn-house-"]').css('background-color', 'white').css('color', 'black');
		
		// 침실, 침대, 욕실 버튼
		let bedrooms = $('.bedrooms').children('input');
		let beds = $('.beds').children('input');
		let bathrooms = $('.bathrooms').children('input');
		bedrooms.prop('disabled', true)
		beds.prop('disabled', true)
		bathrooms.prop('disabled', true)
	});
	
	/* 필터-'건물유형' 버튼 복수개 선택 */
	$('button[id^="btn-house-"]').click(function() {
		let houseId = $(this).attr("data-house");
		let disabled = $(houseId).prop('disabled');	// true, false
		
		if (disabled) {	// 비활성화
			$(houseId).prop('disabled', false); // 활성화 시킨다.
			$(this).css('background-color', 'black');
			$(this).css('color', 'white');
		} else {
			$(houseId).prop('disabled', true); // 비 활성화 시킨다.
			$(this).css('background-color', 'white');
			$(this).css('color', 'black');
		}
	})
	
	/* 필터-침실, 침대, 욕실 버튼 */		
	$('.bedrooms').click(function(){
		$('.bedrooms').removeClass("active");
		$(this).addClass("active");
		
		// 모든 input 모두 disabled를 주고 특정 input만 disabled해제
		let whole = $('.bedrooms').children('input');
		whole.prop('disabled', true)
		
		let input = $(this).children('input');
		let currentDisabled = input.prop("disabled");
		input.prop("disabled", !currentDisabled);
		
	});
	
	$(".beds").click(function() {
		$('.beds').removeClass("active");
		$(this).addClass("active");
		
		// 모든 input 모두 disabled를 주고 특정 input만 disabled해제
		let whole = $('.beds').children('input');
		whole.prop('disabled', true)
		
		let input = $(this).children('input');
		let currentDisabled = input.prop("disabled");
		input.prop("disabled", !currentDisabled);
	});
	
	$(".bathrooms").click(function() {
		$('.bathrooms').removeClass("active");
		$(this).addClass("active");
		
		// 모든 input 모두 disabled를 주고 특정 input만 disabled해제
		let whole = $('.bathrooms').children('input');
		whole.prop('disabled', true)
		
		let input = $(this).children('input');
		let currentDisabled = input.prop("disabled");
		input.prop("disabled", !currentDisabled);

	});
	
	// 필터의 검색버튼을 누를 때
	$("#btn-filter-search").click(function() {
		//searchFilter();
		$('#filter-search').trigger("submit");
		//$("#filterModal").modal("hide");
	});
	
	// 무한 스크롤 테스트
	 /* let index=0;
	 $(window).scroll(function(){
		 let $window = $(this);
		 let scrollTop = $window.scrollTop();
		 let windowHeight = $window.height();
		 let documentHeight = $(document).height();
		 
		 if (scrollTop + windowHeight + 1>= documentHeight) {
			 index++;
			 setTimeout(searchFilter,200);
		 }
		 })
	 } */
	
	// 필터 검색
	/*
	function searchFilter() {
		let $box = $('#accList').empty();
		
		$.ajax({
			type: "GET",
			url: "list/search2",
			data: $('#filter-search').serialize(),
			dataType: 'json',
			success: function(accommodations) {
				console.log(accommodations);
				$.each(accommodations, function(index, acc) {
				
					let content= "";
					content += '<div class="card-container" onclick="location.href=\'/acc/detail?no='+acc.accNo+'\'" style="text-decoration-line: none; color: black">';
					content += '<div class="card-box p-1">';
					content += '<div class="" style="width: 300px">';
									
					content += '		<div id="acc-slide'+acc.accNo+'" class="carousel slide" data-interval="false">';
					content += '			<div class="carousel-indicators">';
					content += '				<button type="button"';
					content += '					data-bs-target="#acc-slide'+acc.accNo+'"';
					content += '					data-bs-slide-to="0" class="active" aria-current="true"';
					content += '					aria-label="Slide 1"></button>';
					content += '				<button type="button"';
					content += '					data-bs-target="#acc-slide'+acc.accNo+'"';
					content += '					data-bs-slide-to="1" aria-label="Slide 2"></button>';
					content += '				<button type="button"'
					content += '					data-bs-target="#acc-slide'+acc.accNo+'"';
					content += '					data-bs-slide-to="2" aria-label="Slide 3"></button>';
					content += '			</div>';
										
					content += '			<div class="wishlist-icon">';
					content += '				</div>';
										
					content += '				<div class="carousel-inner" style="border-radius: 25px;">';
					content += '					<div class="carousel-item active">';
					content += '						<img class="acc-thumbnail rounded-0"';
					content += '									src="/resources/images/acc/'+acc.imageCover +'" alt="숙소이미지"';
					content += '									style="object-fit: cover; width: 300px; height: 300px;">';
					content += '					</div>';
					content += '					<div class="carousel-item">';
					content += '						<img class="acc-thumbnail rounded-0"';
					content += '								src="/resources/images/acc/2.jpg" alt="숙소이미지"';
					content += '								style="object-fit: cover; width: 300px; height: 300px;">';
					content += '					</div>';
					content += '					<div class="carousel-item">';
					content += '						<img class="acc-thumbnail rounded-0"';
					content += '									src="/resources/images/acc/3.jpg" alt="숙소이미지"';
					content += '									style="object-fit: cover; width: 300px; height: 300px;">';
					content += '					</div>';
					content += '				</div>';
										
					content += '				<button class="carousel-control-prev" type="button"';
					content += '						data-bs-target="#acc-slide'+acc.accNo+'"';
					content += '						data-bs-slide="prev">';
					content += '					<span class="carousel-control-prev-icon" aria-hidden="true"></span>';
					content += '					<span class="visually-hidden">Previous</span>';
					content += '				</button>';
					content += '				<button class="carousel-control-next" type="button"';
					content += '							data-bs-target="#acc-slide'+acc.accNo+'"';
					content += '							data-bs-slide="next">';
					content += '					<span class="carousel-control-next-icon" aria-hidden="true"></span>';
					content += '					<span class="visually-hidden">Next</span>';
					content += '				</button>';
					content += '			</div>';
									
					content += '			<div class="row my-2">';
					content += '				<div class="col-8">';
					content += '					<div class="card-title"><strong><span>'+acc.user.name+'</span>의 <span>'+ (acc.types[0] ? acc.types[0].name : "")+'</span></strong></div>';
					content += '					<div class="card-text text-muted" style="font-size:15px">'+acc.name+'</div>';
											
					content += '					<div class="card-subtitle mb-2 text-muted">'+acc.checkIn+' ~ '+acc.checkOut+'</div>';
					content += '					<div class="card-text pt-1">';
					content += '						<strong>₩ '+acc.price+'</strong>/박';
					content += '					</div>';
					content += '				</div>';
					content += '				<div class="col-4 text-end"><i class="bi bi-star-fill"></i><span> '+acc.reviewScore+'</span>(<span>'+acc.reviewCount+'</span>)</div>';
					content += '			</div>';
					content += '		</div>';
					content += '	</div>';
					content += '</div>';
					
					$box.append(content);
				})
			}
		});
	}
	*/
	
	/* 슬라이드 쇼 버튼 hover */
	/* $('.carousel-control-prev').hide();
	$('.carousel-control-next').hide();
	
	$('.carousel-control-prev').hover (function() {
		$('.carousel-control-prev').toggle();
	}, function() { });
	
	$('.carousel-control-next').hover (function() {
		$('.carousel-control-next').toggle();
	}, function() { }); */

})	

</script>

<!-- 위시리스트 모달 및 js -->
<script type="text/javascript">
$(function () {
	
	$(".unwish").on("click", function(e) {
		return false;
	});
	
	$(".wishlistIcon").on("click", function(e) {
		//e.preventDefault();
		let accNo = $(this).attr("data-accNo");	
		$heartIcon = $("#icon-heart-" + accNo); 
		 if($heartIcon.hasClass("fa-solid")) {
			 // 위시리스트에서 숙소 삭제 구현하기
			 $.getJSON("/delete/wishlistAcc", "accNo=" + accNo) 
			  .done(function(result) {
				  if(result.success) {
					  $heartIcon.removeClass("fa-solid").addClass("fa-regular").css("color", "white");
				  }
			  });
		 } else {
			 // 다시 추가
			 saveToListModal.show();
			 // 1.다른 위시리스트 폴더로 이동할 경우  2.위시리스트 폴더를 새로 만들어서 숙소를 저장할 경우
			 $("#form-create-wishlist input[name=accNo]").val(accNo); 
		 }
	}); 
	
	let saveToListModal = new bootstrap.Modal(document.getElementById('modal-save-to-list'), {
		  keyboard: false
		})
	
	let createListModal = new bootstrap.Modal(document.getElementById('modal-create-wishlist'), {
		  keyboard: false
		});
	
	// 위시리스트 폴더리스트 모달창에서 "새로운 위시리스트 만들기" 누를 경우
	 $("#div-create-wishlist").click(function() {
		 saveToListModal.hide();
		 createListModal.show();
		 $(":input[name=wishlistName]").val('');
	 });
	
	// 새로운 위시리스트 폴더 만들기
	 $(":input[name=wishlistName]").keyup(function() {
	 	if($(this).val().trim()) {
	 		$("#btn-create-wishlist").prop("disabled", false);
	 	} else {
	 		$("#btn-create-wishlist").prop("disabled", true);
	 	}
	 });
	
	// 기존 위시리스트 폴더에 저장
	 
	$("#div-wishlists").on('click', "div", function() {
		let accNo = $(":input[name=accNo]").val();
		$heartIcon = $("#icon-heart-" + accNo); 
		// 아래의 wishlistNo는 변경할 위시리스트 폴더 번호
		let wishlistNo = $(this).find('input[name="wishlistNo"]').val();
		//alert("accNo: " + accNo + " wishlistNo: " + wishlistNo); 
		$.getJSON("/change/wishlistAcc", "wishlistNo=" + wishlistNo + "&accNo=" + accNo)
		 .done(function(result) {
			 if(result.success) {
				console.log(result);
				saveToListModal.hide();
				$heartIcon.removeClass("fa-regular").addClass("fa-solid").css("color", "#FF385C");
			 }
		 });
		 // location.reload();
	})
})
</script>
<!-- 빈하트 클릭시 나타나는 Modal -->
<div class="modal fade" id="modal-save-to-list" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h5 class="modal-title fw-bold w-100 text-center">위시리스트</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div id="div-create-wishlist" style="display: flex; height: 64px; cursor: pointer;">
      		<img src="https://a0.muscache.com/im/pictures/da1a2f06-efb0-4079-abce-0f6fc82089e0.jpg" alt="새로운 위시리스트 만들기" style="vertical-align:middle;">
      		<span class="ms-3 fw-bold" style="margin-top:20px;">새로운 위시리스트 만들기</span>
      	</div>
      	<div id="div-wishlists">
	      	<c:if test="${not empty wishlists }">
	      		<c:forEach var="wishlist" items="${wishlists}">
			      	<div id="div-wishlist-${wishlist.no}" class="mt-3" style="display: flex; height: 64px; cursor: pointer;">
		      			<input type="hidden" name="wishlistNo" value="${wishlist.no}">
		      			<c:choose>
		      			 <c:when test="${not empty wishlist.accs[0]}">
				      		<img src="/resources/images/acc/${wishlist.accs[0].imageCover}" alt="imageCover" style="vertical-align:middle; border-radius: 8px;" width="63px">
		      			 </c:when>
		      			 <c:otherwise>
		      			 	<img alt="" src="" alt="imageCover" style="vertical-align:middle; border-radius: 8px; background-color: #DDDDDD;" width="63px" >
		      			 </c:otherwise>
		      			</c:choose>
			      		<span class="ms-3 fw-bold" style="margin-top:20px;">${wishlist.name }</span>
			      	</div>
	      		</c:forEach>
	      	</c:if>
      	</div>
      </div>
    </div>
  </div>
</div>

<!-- 새로운 위시리스트 만들기 클릭시 나타나는 Modal -->
<div class="modal fade" id="modal-create-wishlist" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title fw-bold w-100 text-center fs-6">위시리스트 이름 정하기</h5>
        <button type="button" class="btn-close" data-bs-toggle="modal" data-bs-target="#modal-save-to-list"></button>
      </div>
      <form id="form-create-wishlist" method="post" action="/wishlists/insert">
      <div class="modal-body mb-4">
	      	<div class="form-floating">
	      		<input type="hidden" name="accNo">
		     	<input type="text" class="form-control" name="wishlistName" placeholder="이름">
		     	<label for="floatingInput">이름</label>
			</div>
			<small>최대 50자</small>
      </div>
      <div class="modal-footer">
        <div class="d-grid gap-2 w-100">
		  <button class="btn btn-dark fw-bold btn-lg fs-6" type="submit" id="btn-create-wishlist" disabled>새로 만들기</button>
		</div>
      </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>