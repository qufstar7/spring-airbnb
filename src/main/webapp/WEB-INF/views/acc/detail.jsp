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
<link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700" rel="stylesheet">
<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link href="../resources/aircnc.png" rel="icon" type="image/x-icon" />
<!-- 페레스코 -->
<script type="text/javascript" src="/resources/js/fresco.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/fresco.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/detaile.css">
<!-- 달력 -->
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<title>${acc.name }</title>
</head>
<body >
<c:set var="menu" value="detaile"/>
	<!-- 스파이스크롤 -->
	<nav class="navbar navbar-expand-lg navbar-white bg-white border-bottom justify-content-between" id="nav-1">
		<div class="col-3">
			<ul class="navbar-nav me-auto">
			  <li class="nav-item">
			    <a class="nav-link" href="#btn-open-image-modal">사진</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#con">편의 시설</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#review">후기</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#map">위치</a>
			  </li>
			</ul>
		</div>
		<div class="row align-items-center" id="navR">
				<!-- 날짜 입력 안했을때 -->
				<div class="col-10 p-2 text-end ndate" style="width: 320px;">
					<h6>요금을 확인하려면 날짜를 입력하세요.</h6>
					<button type="button" style="font-size: 12px;" class="btn btn-link text-decoration-underline text-dark openReviewModal"><i class="bi bi-star-fill"></i> ${acc.reviewScore }<span class="text-decoration-underline"> · 후기 ${acc.reviewCount }개</span></button>
				</div>
				<div class="col-2 p-3 text-end ndate" style="width: 200px;" >
					<button type="button" class="btn btn-danger r-btn text-white text-center" id="days-focus" style="width: 100%">예약가능 여부 보기</button>
				</div>
		</div>
		<div class="row align-items-center" id="navR2">
			<!-- 날짜 입력 했을때 -->
			<div class="col-10 p-2 text-end" style="width: 320px;">
				<h4><strong><fmt:formatNumber value="${acc.price }"/></strong>/박</h4>
				<button type="button" style="font-size: 12px;" class="btn btn-link text-decoration-underline text-dark openReviewModal"><i class="bi bi-star-fill"></i> ${acc.reviewScore }<span class="text-decoration-underline"> · 후기 ${acc.reviewCount }개</span></button>
			</div>
			<div class="col-2 p-3 text-end" style="width: 200px;" >
				<c:if test="${empty LOGIN_USER}">
						<!-- 로그인 하지 않았을 때 -->
					<button type="button" class="btn btn-danger r-btn text-white text-center" data-bs-toggle="modal" data-bs-target="#email-login-modal" style="width: 100%">예약하기</button>
				</c:if>
				<c:if test="${not empty LOGIN_USER}">
					<button class="btn btn-danger r-btn text-white text-center" form="form-reservation" style="width: 100%">예약하기</button>
				</c:if>
			</div>
		</div> 
	</nav>
 	<%@ include file="../common/nav2.jsp" %> 
	<%@ include file="../user/login-register-modals.jsp" %>
	<div class="container"> 
		<!-- 타이틀 -->
		<div class="row p-2 mb-2" id="top-div" >
			<div>
				<span class="title"><strong>${acc.name }</strong></span>
			</div>
			<div class="pl-1">
				<p>
					<!-- 상단 리뷰 모달 -->
					<c:choose>
						<c:when test="${acc.reviewCount == 0 }">
							<span></span>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-link text-decoration-underline text-dark openReviewModal" id="btn-open-review-modal"><i class="bi bi-star-fill"></i> ${acc.reviewScore }<span class="text-decoration-underline"> · 후기 ${acc.reviewCount }개</span></button>
						</c:otherwise>
					</c:choose>
					<button type="button" class="btn btn-link text-decoration-underline text-dark btn-sm" id="btn-open-map-modal">${acc.address }</button>
					<span class="float-end" id="append-save">
						<button type="button" class="btn btn-link text-decoration-underline text-dark" id="btn-open-share-modal"><i class="bi bi-share-fill"></i> 공유</button>
						<c:choose>
					  	<c:when test="${empty LOGIN_USER}">
								<!-- 로그인 하지 않았을 때 -->
							<button type="button" class="btn btn-link text-decoration-underline text-dark" data-bs-toggle="modal" data-bs-target="#email-login-modal"><i id="icon-heart-${acc.accNo}" class="fa-regular fa-heart fs-6"></i> 저장</button>
						</c:when>
						<c:otherwise>
								<!-- 로그인 했을 때 -->
							<c:choose>
								<c:when test="${not empty wishlistAccNo.accNo  }">
									<a href="delete?accNo=${acc.accNo }&wishlistNo=${wishlistAccNo.wishlist.no }" class="btn btn-link text-decoration-underline text-dark btn-delete-wishlistAcc" ><i id="icon-heart-${acc.accNo}" class="fa-solid fa-heart fs-6 " style="color: #FF385C;"></i> <span id="saveList">저장 목록</span></a>
								</c:when>
								<c:when test="${empty wishlistAccNo.accNo }">
									<button type="button" class="btn btn-link text-decoration-underline text-dark btn-open-save-modal" id="save-btn"><i id="icon-heart-${acc.accNo}" class="fa-regular fa-heart fs-6"></i> 저장</button>
								</c:when>
							</c:choose>
							<%-- <c:set var="flag" value="N" />
							<c:forEach items="${wishlistAccNo }" var="wishlist">
								<c:choose>
									<c:when test="${empty wishlist.accNo }">
										<c:set var="flag" value="Y" />
										<button type="button" class="btn btn-link text-decoration-underline text-dark btn-open-save-modal" ><i id="icon-heart-${acc.accNo}" class="fa-regular fa-heart fs-6"></i> 저장</button>
									</c:when>
									<c:when test="${wishlist.accNo eq acc.accNo and flag eq 'N' }">
										<c:set var="flag" value="Y" />
										<a href="delete?accNo=${acc.accNo }&wishlistNo=${wishlist.wishlist.no}" class="btn btn-link text-decoration-underline text-dark btn-delete-wishlistAcc" ><i id="icon-heart-${acc.accNo}" class="fa-solid fa-heart fs-6 " style="color: #FF385C;"></i> <span id="saveList">저장 목록</span></a>
									</c:when>
									<c:when test="${wishlist.accNo ne acc.accNo and flag eq 'N' }">
										<c:set var="flag" value="Y" />
										<button type="button" class="btn btn-link text-decoration-underline text-dark btn-open-save-modal" ><i id="icon-heart-${acc.accNo}" class="fa-regular fa-heart fs-6"></i> 저장</button>
									</c:when>
								</c:choose>
							</c:forEach> --%>
						</c:otherwise>
					  </c:choose>
					</span>
				</p>
			</div>
		</div>
	</div>
	<div class="container main">
		<!-- 커버사진 -->
		<div class="row mb-5 flex-container">
			<c:forEach items="${acc.photos }" var="photo">
				<c:if test="${photo.num eq '1' }">
					<div class="flex-item1" >
						<div class="img-large" id="btn-open-image-modal">
							<a href="#"><img src="/resources/images/acc/${photo.name }" alt="이미지" id="image-large"></a>
						</div>
					</div>
				</c:if>
			</c:forEach>
			<div class="flex-item" id="centerimg">
				<c:forEach items="${acc.photos }" var="photo">
					<c:if test="${photo.num eq '2' }"> 
						<div class="img-short" id="btn-open-image-modal2">
							<a href="#"><img src="/resources/images/acc/${photo.name }" alt="이미지" class="short-img"></a>
						</div>
					</c:if> 
					<c:if test="${photo.num eq '3' }">
						<div class="img-short short-bottom" id="btn-open-image-modal3">
							<a href="#"><img src="/resources/images/acc/${photo.name }" alt="이미지" class="short-img"></a>
						</div>
					</c:if>
				</c:forEach>
			</div> 
			<div class="flex-item">
				<c:forEach items="${acc.photos }" var="photo">
					<c:if test="${photo.num eq '4' }"> 
						<div class="img-short" id="btn-open-image-modal4">
							<a href="#"><img src="/resources/images/acc/${photo.name }" alt="이미지" class="short-img" id="image-right-top"></a>
						</div>
					</c:if>
					<c:if test="${photo.num eq '5' }"> 
						<div class="img-short short-bottom" id="btn-open-image-modal5">
							<a href="#"><img src="/resources/images/acc/${photo.name }" alt="이미지" class="short-img" id="image-right-bottom"></a>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="container main">
		<div class="row"> 
			<div class="col-8" id="main-content">
				<div class="pb-1">
					<a id="profile" href="#host">
						<c:if test="${empty acc.user.profileImage }">
							<img class="float-end profile" src="/resources/images/profile/profile-default-img.png">
						</c:if>
						<c:if test="${not empty acc.user.profileImage }">
							<img class="float-end profile" src="/resources/images/profile/${acc.user.profileImage }">
						</c:if>
					</a>
					<h4>${acc.user.name }님이 호스팅하는 ${acc.name }</h4>
					<p>최대 인원 ${acc.guest }명<i class="bi bi-dot">
					
					</i>침실 ${acc.room.bedroom }개<i class="bi bi-dot"></i>침대 ${acc.room.bed }개<i class="bi bi-dot"></i>욕실 ${acc.room.bathroom }개</p>
				</div>
				<hr>
				<div class="pt-3 pb-2">
					<c:forEach items="${Boast }" var="boast">
						<c:choose>
							<c:when test="${boast.conNo eq '14' }">
								<div class="mb-3">
									<h6><i class="bi bi-paragraph"></i> 무료 주차 혜택을 누리세요</h6>
									<span>해당 지역에서 무료 주차가 가능한 몇 안 되는 숙소 중 하나입니다.</span>
								</div>
							</c:when>
							<c:when test="${boast.conNo eq '30' }">
								<div class="mb-3">
									<h6><i class="bi bi-door-closed"></i> 셀프 체크인</h6>
									<span>열쇠 보관함을 이용해 체크인하세요.</span>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${acc.checkinScore ge 4.5 }">
						<div class="mb-3">
							<h6><i class="bi bi-key"></i> 순조로운 체크인 과정</h6>
							<span>최근 숙박한 게스트 중 90%가 체크인 과정에 별점 5점을 준 숙소입니다.</span>
						</div>
					</c:if>
					<c:if test="${acc.locationScore ge 4.5 }">
						<div class="mb-3">
							<h6><i class="bi bi-signpost"></i> 훌륭한 숙소 위치</h6>
							<span>최근 숙박한 게스트 중 90%가 위치에 별점 5점을 준 숙소입니다.</span>
						</div>
					</c:if>
					<div class="mb-3">
						<h6><i class="bi bi-bookmark-check"></i> 체크인 30일전까진 무료로 취소가 가능합니다.</h6>
					</div>
				</div>
				<hr>
				<div>
					<div class="mt-5 mb-3">
						<img id="air-cover" alt="" src="https://a0.muscache.com/im/pictures/51a7f002-b223-4e05-a2af-0d4838411d92.jpg">
					</div>
					<div class="mb-5">
						<p>모든 예약에는 호스트가 예약을 취소하거나 숙소 정보가 정확하지 않은 경우 또는 체크인에 문제가 있는 상황에 대비한 무료 보호 프로그램이 포함됩니다.</p>
						<button type="button" class="btn btn-link text-decoration-underline text-dark" id="btn-open-cover-modal">더 알아보기</button>
					</div>
				</div>
				<hr>
				<c:if test="${not empty acc.description }">
					<div class="contentbox2 mt-5 mb-5">
						<div class="content2 mb-2" style="white-space:  pre-line;">
							<p style="white-space:  pre-line; font-size: 16px;" >${acc.description }</p>
						</div>
						<button type="button" class="btn btn-link text-decoration-underline text-dark btn-sm" id="btn-open-description-modal">더보기 <i class="bi bi-chevron-right"></i></button>
					</div>
					<hr>
				</c:if>
				<div class="row mt-5">
					<h4>숙박장소</h4>
					<div class="col-4 mt-3 mb-3 rounded place-box" >
						<span class="material-symbols-outlined">
						bed
						</span>
						<div>
							<c:if test="${acc.room.bedroom gt 0 }">
							<div>
								<span>침실 ${acc.room.bedroom }개</span>
							</div>
							</c:if>
							<c:if test="${acc.room.bed gt 0 }">
							<div>
								<span>침대 ${acc.room.bed }개</span>
							</div>
							</c:if>
						</div>
					</div>
					<!-- <div class="col-6" id="btn-open-image2-modal">
						<img class="image2 rounded mb-2" alt="" src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg" >
						<h5>침실공간</h5>
						<span>침대 1개</span>
					</div>
					<div class="col-6" id="btn-open-image3-modal">
						<img class="image2 rounded mb-2" alt="" src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg" >
						<h5>침실공간</h5>
						<span>침대 1개</span>
					</div> -->
				</div>
				<hr>
				<div class="row mt-5 mb-5" id="con">
					<span class="mb-3 ">
						<h4>숙소 편의시설</h4>
					</span>
					<c:forEach items="${acc.conveniences }" var="accConvenience" end="5">
						<div class="col-6 mb-2 convenience align-items-center">
							<p><span class="material-symbols-outlined"> ${accConvenience.convenience.iconName }</span> ${accConvenience.convenience.name }</p>
						</div>
					</c:forEach>
					<div class="col-6 mb-2">
						<button class="btn btn-outline-dark btn-lg" id="btn-open-con-modal">편의시설 전체보기</button>
					</div>
				</div>
				<!-- <hr>
				<div class="mt-5 mb-5">
					<h4>체크아웃 날짜를 선택하세요.</h4>
					<input type="text" name="sdate" id="sdate" value="" />
					<input type="text" name="edate" id="edate" value="" />
					<div class="single">
						<h1>1개 짜리</h1>
						<input id="datepicker" type="text">
					</div>
					
					<div class="row double">
						<div class="col-6">
							<input id="datepicker1" class="input-inline" type="hidden">  
						
						</div>
						<div class="col-6">
							<input id="datepicker2" class="input-inline" type="hidden">
						
						</div>
					</div>
				</div> -->
			</div> 
			<div class="col-4" id="side">
				<div id="sticky" >
				<form id="form-reservation" method="post" action="/book/register?no=${acc.accNo }" modelAttribute="reservationRegisterForm">
					<div class="row shadow-lg bg-body rounded" id="box">
						<div class="col-6 boxhd reservation" >
							<h4><strong><fmt:formatNumber value="${acc.price }"/></strong>/
								<span class="day"></span>박
							</h4>
						</div>
						<div class="row boxhd not-reservation" >
							<h4><strong>요금을 확인하려면 날짜를 입력하세요.</strong>
							</h4>
						</div>
						<div class="col-6 boxhd">
							<button type="button" class="btn btn-link text-dark btn-sm"><i class="bi bi-star-fill"></i> ${acc.reviewScore } <span class="text-decoration-underline">후기 ${acc.reviewCount }개</span></button>
						</div>
						<div class="col-12 start" >
							<div class="" id="days-box">
								<input type="text" class="text-center" placeholder="체크인 체크아웃을 설정하시오" data-input id="days">
								<input type="text" name="checkInDate" id="checkInDate" value="" > 
								<input type="text" name="checkOutDate" id="checkOutDate" value="" >
								<input type="hidden" name="adultNum" id="adultNum" value="1">
								<input type="hidden" name="childrenNum" id="childrenNum" value="0">
								<input type="hidden" name="infantNum" id="infantNum" value="0">
								<input type="hidden" name="petNum" id="petNum" value="0">
								<input type="hidden" name="totalGuest" id="totalGuest" value="1">
								<input type="hidden" name="day" id="input-day" value="">
							</div>
						</div>
						<div class="m-0 p-0 text-center">
							<button type="button" class="btn btn-outline-dark p-2 text-start" id="guest-btn">
								<span id="adult">게스트: <span id="adultCount">1</span>명</span> <span id="infant">유아: <span id="infantCount">0</span>명</span> <span id="pet">반려동물: <sapn id="petCount"> 0</sapn>마리</span>
								<i class="bi bi-caret-down-fill float-end" id="down"></i>
								<i class="bi bi-caret-up-fill float-end" id="up"></i>
							</button>
							<div class="rounded" id="guest">
								<div class="mb-4 row justify-content-between d-flex align-items-center guest-box" >
									<div class="col-8">
										<div class="text-start">
											성인
										</div>
										<div class="text-start">
											만 13세 이상
										</div>
									</div>
									<div class="col-4 adult">
											<button type="button" class="btn btn-outline-dark btn-sm m_btn guestbtn adultM">-</button>
											<span class="m-2 adultCount">1</span>
											<button type="button" class="btn btn-outline-dark btn-sm p_btn guestbtn hu_p_btn">+</button>
									</div>
								</div>
								<div class="mb-4 row justify-content-between d-flex align-items-center guest-box" >
									<div class="col-8">
										<div class="text-start">
											어린이
										</div>
										<div class="text-start">
											만 2~12세
										</div>
									</div>
									<div class="col-4 adult">
											<button type="button" class="btn btn-outline-dark btn-sm m_btn guestbtn childrenM">-</button>
											<span class="m-2 childrenCount">0</span>
											<button type="button" class="btn btn-outline-dark btn-sm p_btn guestbtn hu_p_btn">+</button>
									</div>
								</div>
								<div class="mb-4 row justify-content-between d-flex align-items-center guest-box" >
									<div class="col-8">
										<div class="text-start">
											유아
										</div>
										<div class="text-start">
											만 2세 미만
										</div>
									</div>
									<div class="col-4 adult">
											<button type="button" class="btn btn-outline-dark btn-sm m_btn guestbtn infantM">-</button>
											<span class="m-2 infantCount">0</span>
											<button type="button" class="btn btn-outline-dark btn-sm p_btn guestbtn hu_p_btn">+</button>
									</div>
								</div>
								<div class="mb-4 row justify-content-between d-flex align-items-center guest-box" >
									<div class="col-8">
										<div class="text-start">
											반려 동물
										</div>
										<div class="text-start">
											보조동물을 동반하시나요?
										</div>
									</div>
									<div class="col-4 adult">
											<button type="button" class="btn btn-outline-dark btn-sm m_btn guestbtn petM">-</button>
											<span class="m-2 petCount">0</span>
											<button type="button" class="btn btn-outline-dark btn-sm p_btn guestbtn pet_p_btn">+</button>
									</div>
								</div>
								<div class="mb-4 row justify-content-between align-middle guest-box" >
									<div class="col">
										<span>이 숙소의 최대 숙박 인원은 ${acc.guest }명(유아 포함)입니다. 
										<c:choose>
											<c:when test="${acc.pet eq 0 }">
												반려동물 동반을 허용하지 않습니다.
											</c:when>
											<c:otherwise>
												반려동물을 3마리 이상 동반하는 경우, 호스트에게 알려주세요.
											</c:otherwise>
										</c:choose>
										</span>
									</div>
									
								</div>
							</div>
						</div>
					  	<c:if test="${empty LOGIN_USER}">
								<!-- 로그인 하지 않았을 때 -->
							<button type="button" class="btn btn-danger p-2 mt-2 reservation r-btn" data-bs-toggle="modal" data-bs-target="#email-login-modal">예약하기</button>
						</c:if>
						<c:if test="${not empty LOGIN_USER}">
							<button type="submit" class="btn btn-danger p-2 mt-2 reservation r-btn" >예약하기</button>
						</c:if>
						<div class="mb-3 text-center mt-2">
							<span>예약 확정 전에는 요금이 청구되지 않습니다.</span>
						</div>
						<div class="row reservation">
							<div class="col-6 text-left"><p class="text-decoration-underline">₩<fmt:formatNumber value="${acc.price }"/> x <span class="day"></span>박</p></div>
							<div class="col-6 text-end"><p>₩<span id="day-price"></span>원</div>
							<input type="hidden" name="price" id="price" value="0">
						</div>
						<div class="row reservation">
							<div class="col-6"><p class="text-decoration-underline">청소비</p></div>
							<div class="col-6 text-end"><p>₩<fmt:formatNumber value="${acc.cleaningPrice }"/>원</div>
							<input type="hidden" name="serviceFee" id="serviceFee" value="${acc.cleaningPrice }">
						</div>
						<hr>
						<div class="row reservation">
							<div class="col-6"><h6>총합계</h6></div>
							<div class="col-6 text-end"><h6 >₩<span id="totalPrice"></span>원</h6></div>
							<input type="hidden" name="totalPrice" id="totalPriceValue" value="${acc.cleaningPrice }">
						</div>
					</div>
					<div class="text-center">
					<c:choose>
					  	<c:when test="${empty LOGIN_USER}">
								<!-- 로그인 하지 않았을 때 -->
								<a href="" data-bs-toggle="modal" data-bs-target="#email-login-modal">
									<button type="button" class="btn btn-link text-decoration-underline text-dark"><i class="bi bi-flag-fill"></i> 숙소 신고하기</button>
								</a>
						</c:when>
						<c:otherwise>
								<!-- 로그인 했을 때 -->
								<a href="">
									<button type="button" class="btn btn-link text-decoration-underline text-dark"><i class="bi bi-flag-fill"></i> 숙소 신고하기</button>
								</a>
						</c:otherwise>
					</c:choose>
					</div>
				</form>
				</div>
				
			</div>
			<hr>
								
			<!-- 후기 하단 -->
			<div class="mt-5 mb-5" id="review">
				<c:choose>
					<c:when test="${acc.reviewCount == 0 }">
						<h4>후기 (아직) 없음</h4>
						<p class="mt-3">여행에 차질이 없도록 최선을 다해 도와드리겠습니다. <br/> 모든 예약은 에어비앤비의 게스트 환불 정책에 따라 보호를 받습니다.</p>
					</c:when>
					<c:otherwise>
						<div class="border bg-light p-3 mb-3">
							<div class="mb-4" id="box-score">
								<h4><i class="bi bi-star-fill"></i> <span>${acc.reviewScore }</span><span>점</span>
								<span class="text-decoration"> · 후기 ${acc.reviewCount }</span><span>개</span></h4>
							</div>
							<div class="row">
								<div class="col-6">
									<div>
										<div class="box-score-bar">
											<div class="row">
												<div class="col-6">
													<p class="avgName">청결도</p>
												</div>
												<div class="col-3 barBox">
													<div class="scoreBarleft">
														<div id="bar-clean-avg" style="width: ${acc.cleanScore * 20 }%;">
														</div>
													</div>
												</div>
												<div class="col-1">
													<strong><span>${acc.cleanScore }</span></strong>
												</div>											
											</div>
										</div>
										<div class="box-score-bar">
											<div class="row">
												<div class="col-6">
													<p class="avgName">의사소통</p>
												</div>
												<div class="col-3 barBox">
													<div class="scoreBarleft">
														<div id="bar-communication-avg" style="width: ${acc.communicationScore * 20 }%;">
														</div>
													</div>
												</div>
												<div class="col-1">
													<strong><span>${acc.communicationScore }</span></strong>
												</div>
											</div>
										</div>
										<div class="box-score-bar">
											<div class="row">
												<div class="col-6">
													<p class="avgName">체크인</p>
												</div>
												<div class="col-3 barBox">
													<div class="scoreBarleft">
														<div id="bar-checkin-avg" style="width: ${acc.checkinScore * 20 }%;">
														</div>
													</div>
												</div>
												<div class="col-1">
													<strong><span>${acc.checkinScore }</span></strong>
												</div>
											</div>
										</div>										
									</div>
								</div>
								<div class="col-6">
									<div>
										<div class="box-score-bar">
											<div class="row">
												<div class="col-6">
													<p class="avgName">정확성</p>
												</div>
												<div class="col-3 barBox">
													<div class="scoreBarleft">
														<div id="bar-accuracy-avg" style="width: ${acc.accuracyScore * 20 }%;">
														</div>
													</div>
												</div>
												<div class="col-1">
														<strong><span>${acc.accuracyScore }</span></strong>
												</div>											
											</div>
										</div>
										<div class="box-score-bar">
											<div class="row">
												<div class="col-6">
													<p class="avgName">위치</p>
												</div>
												<div class="col-3 barBox">
													<div class="scoreBarleft">
														<div id="bar-location-avg" style="width: ${acc.locationScore * 20 }%;">
														</div>
													</div>
												</div>
												<div class="col-1">
													<strong><span>${acc.locationScore }</span></strong>
												</div>
											</div>
										</div>
										<div class="box-score-bar">
											<div class="row">
												<div class="col-6">
													<p class="avgName">가격 대비 만족도</p>
												</div>
												<div class="col-3 barBox">
													<div class="scoreBarleft">
														<div id="bar-value-avg" style="width: ${acc.valueScore * 20 }%;">
														</div>
													</div>
												</div>
												<div class="col-1">
													<strong><span>${acc.valueScore }</span></strong>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="box-under-review">
							<!-- 리뷰 6개 오는 공간 -->
						</div>
						<div>
							<button type="button" class="btn btn-outline-dark openReviewModal">후기 ${acc.reviewCount }개 모두 보기</button>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<hr>
			<!-- 후기 하단 끝 -->

			<div class="mt-5 mb-5">
				<div class="">
					<h4>호스팅 지역</h4>
				</div>
				<div class="mb-2" id="map"></div>
				<div class="contentbox2">
					<h5>${acc.address }</h1>
					<div class="content2 mb-2" style="white-space:  pre-line;">
						<pre style="white-space:  pre-line;">${acc.description }</pre>
					</div>
					<button type="button" class="btn btn-link text-decoration-underline text-dark btn-sm" id="btn-open-map-modal2">더보기 <i class="bi bi-chevron-right"></i></button>
				</div>
			</div>
			<hr>
			<div class="row mt-5 mb-5">
				<div class="row mb-2" id="host">
					<div class="row mb-3">
						<div class="col-1">
							<a id="profile" href="">
								<c:if test="${empty acc.user.profileImage }">
									<img class="float-end profile" src="/resources/images/profile/profile-default-img.png">
								</c:if>
								<c:if test="${not empty acc.user.profileImage }">
									<img class="float-end profile" src="/resources/images/profile/${acc.user.profileImage }">
								</c:if>
							</a>
						</div>
						<div class="col-11">
							<h4>호스트: ${acc.user.name }님</h4>
							<span>회원 가입일: <fmt:formatDate value="${acc.user.createdDate }"/> </span>
						</div>
					</div>
				</div>
				<div class="col-6">
					<div class="row">
						<div class="col-4">
							<p><i class="bi bi-star-fill"></i> ${acc.reviewScore } 후기 ${acc.reviewCount }개</p>
						</div>
						<div class="col-4">
							<p><i class="bi bi-shield-fill-check"></i> 본인인증 완료</p>
						</div>
					</div>
					<div class="contentbox3 mt-2 mb-2">
					<div class="content3 mb-2" style="white-space:  pre-line;">
						<p>${acc.user.description }</p>
					</div>
				</div>
				</div>
				<div class="col-6 mb-2">
					<p>응답률: 100%</p>
					<p>응답 시간: 1시간 이내</p>
					<c:choose>
					  	<c:when test="${empty LOGIN_USER}">
								<!-- 로그인 하지 않았을 때 -->
								<a href="" data-bs-toggle="modal" data-bs-target="#email-login-modal">
									<button type="button" class="btn btn-outline-dark btn-lg p-2">호스트에게 연락하기</button>
								</a>
						</c:when>
						<c:otherwise>
								<!-- 로그인 했을 때 -->
								<a href="contact?no=${acc.accNo }">
									<button type="button" class="btn btn-outline-dark btn-lg p-2">호스트에게 연락하기</button>
								</a>
						</c:otherwise>
					  </c:choose>
				</div>
			</div>
			<hr>
			<div class="row mt-5 mb-5">
				<h4>알아두어야 할 사항</h4>
				<div class="col-4">
					<h6>숙소 이용 규칙</h6>
					<p><i class="bi bi-alarm-fill"></i> 체크인: 오후 4:00 - 오후 11:00</p>
					<p><i class="bi bi-alarm-fill"></i> 체크아웃 시간: 오전 11:00</p>
					<p><i class="bi bi-door-closed"></i> 열쇠 보관함(으)로 셀프 체크인</p>
					<p><i class="bi bi-x-octagon"></i> 흡연 금지</p>
					<p><i class="bi bi-x-octagon"></i> 어린이와 유아에게 적합하지 않음</p>
				</div>
				<div class="col-4">
					<h6>건강과 안전</h6>
					<p>에어비앤비 코로나19 방역 수칙을 준수하셔야 합니다.</p>
					<p>출입이 제한되지 않는 수영장/온수 욕조</p>
				</div> 
				<div class="col-4">
					<h6>환불 정책</h6>
					<p>30일 전까지 무료 환불 가능</p>
				</div>
			</div>
		</div>
	</div>
	
<footer class="bg-light" style="width: 100%;  border-top: 1px solid #E2E2E2; padding-top: 20px;">
	<div class="row" style="margin-left: 390px; margin-right: 390px; padding-top: 20px; ">
		<div class="col-3">
			<h6>에어비앤비지원</h6>
			<p>에어커버</p>
			<p>안전 정보</p>
			<p>장애인 지원</p>
			<p>예약 취소 옵션</p>
			<p>에어비앤비의 코로나19 대응 방안</p>
			<p>이웃 민원 신고</p>
		</div>
		<div class="col-3">
			<h6>커뮤니티</h6>
			<p>Airbnb.org: 재난 구호 숙소</p>
			<p>아프간 난민 지원</p>
			<p>차별 철폐를 위한 노력</p>
		</div>
		<div class="col-3">
			<h6>호스팅</h6>
			<p>호스팅 시작하기</p>
			<p>호스트를 위한 에어커버</p>
			<p>호스팅 자료 둘러보기</p>
			<p>커뮤니티 포럼 방문하기</p>
			<p>책임감 있는 호스팅</p>
		</div>
		<div class="col-3">
			<h6>에어비앤비</h6>
			<p>뉴스룸</p>
			<p>새로운 기능에 대해 알아보기</p>
			<p>에어비앤비 공동창업자의 메시지</p>
			<p>채용정보</p>
			<p>투자자 정보</p>
		</div>
		<hr class="mt-3">
		<div>
			<p style="font-size: 14px;">© 2022 Aircnc, Inc.·개인정보 처리방침·이용약관·사이트맵·한국의 변경된 환불 정책·회사 세부정보 언어 선택 한국어 (KR) 통화 선택 ₩ KRW</p>
		</div>
	</div>
</footer>
<!-- 편의시설 모달 -->
<div class="modal" id="modal-con-acc">
	<div class="modal-dialog modal-Default">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">숙소 편의 시설</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<c:forEach items="${cons }" var="con">
					<div class="row">
						<h6 class="mb-3 mt-3">${con.name }</h6>
						<c:forEach items="${acc.conveniences }" var="accConvenience">
							<c:choose>
								<c:when test="${accConvenience.convenience.type eq con.no }">
									<p><span class="material-symbols-outlined"> ${accConvenience.convenience.iconName }</span>  ${accConvenience.convenience.name }</p>
									<hr>
								</c:when>
							</c:choose>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<!-- 편의시설 모달 -->
<div class="modal" id="modal-report-acc">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">이 숙소를 신고하시는 이유를 알려주세요.</h4>
				<p>내용은 호스트에게 공개되지 않습니다.</p>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<form action="">
						<div class="mb-2">
							부정확하거나 틀린 정보가 있어요<input class="float-end" name="report" value="1" type="radio">
							<hr>
						</div>
						<div class="mb-2">
							실제 숙소가 아닙니다<input class="float-end" name="report" value="2" type="radio">
							<hr>
						</div>
						<div class="mb-2">
							사기입니다<input class="float-end" name="report" value="3" type="radio">
							<hr>
						</div>
						<div class="mb-2">
							불쾌합니다<input class="float-end" name="report" value="4" type="radio">
							<hr>
						</div>
						<div class="mb-2">
							기타<input class="float-end" name="report" value="5" type="radio">
							<hr>
						</div>
						
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 공유 모달 -->
<div class="modal" id="modal-share-acc">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title"> <strong> 가족 및 친구들과 이 장소를 공유하세요</strong></h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="row mb-3 d-flex align-items-center">
						<div class="col-2 rounded">
							<c:forEach items="${acc.photos }" var="photo">
								<c:if test="${photo.num eq '1' }">
									<img class="rounded" src="/resources/images/acc/${photo.name }" style="width: 64px; height: 64px;">
								</c:if>
							</c:forEach>
						</div>
						<div class="col-10">
							<span>
								<p>${acc.name }</p>
							</span>
						</div>
					</div>
					
					<input type="text" id="text" value="https://localhost/detail?no=${acc.accNo }" style="display: none;"/>
					<div class="col-6 mb-3 d-grid gap-2">
						<button type="button" id="btnUrl" class="btn btn-outline-secondary btn-lg p-3" onclick="fn_final()"><i class="bi bi-link"></i> 링크 복사</button>
					</div>
					<!-- <div class="col-6 mb-3 d-grid gap-2">
						<button type="button" class="btn btn-outline-secondary btn-lg p-3"><i class="bi bi-envelope"></i> 이메일</button>
					</div>
					<div class="col-6 mb-3 d-grid gap-2">
						<button type="button" class="btn btn-outline-secondary btn-lg p-3"><i class="bi bi-chat"></i> 메세지</button>
					</div>
					<div class="col-6 mb-3 d-grid gap-2">
						<button type="button" class="btn btn-outline-secondary btn-lg p-3"><i class="bi bi-whatsapp"></i> 왓츠앱</button>
					</div> -->
					<div class="col-6 mb-3 d-grid gap-2">
						<a type="button" id="create-kakaotalk-sharing-btn" class="btn btn-outline-secondary btn-lg p-3"><img
					    src="https://developers.kakao.com/assets/img/about/logos/kakaotalksharing/kakaotalk_sharing_btn_medium.png"
					    alt="카카오톡 공유 보내기 버튼" style="width: 20px; height: 20px"
					  		/> 카카오톡</a>
					</div> 
					
					<div class="col-6 mb-3 d-grid gap-2">
						<a id="btnFacebook" class="btn btn-outline-secondary btn-lg p-3" href="javascript:shareFacebook();"><i class="bi bi-facebook"></i> 페이스북</a>
					</div>
					<div class="col-6 mb-3 d-grid gap-2">
						<a id="btnTwitter" class="btn btn-outline-secondary btn-lg p-3" href="javascript:shareTwitter();"><i class="bi bi-twitter"></i> 트위터</a>
					</div>
					<!-- <div class="col-6 mb-3 d-grid gap-2">
						<button class="btn btn-outline-secondary btn-lg"><i class="bi bi-code-slash"></i> 삽입</button>
					</div> -->
					
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 위시리스트저장 모달 -->
<div class="modal" id="modal-save-acc">
	<div class="modal-dialog modal-Default">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">위시 리스트</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="row mb-3 align-items-center" id="div-wishlists">
						<div class="mt-3" style="display: flex; height: 64px;">
							<button type="button" class="btn" id="btn-open-save2-modal" style="width: 90px; height: 78px;"><i class="bi bi-plus h3" style="width: 64px; height: 64px;"></i></button>
							<span class="ms-3 fw-bold" style="margin-top:20px;">새로운 위시리스트 만들기</span>
						</div>
						<c:forEach items="${wishlists }" var="wishlist">
							<div class="mt-3" style="display: flex; height: 64px;">
								<form action="save">
									<input type="hidden" name="wishlistNo" value="${wishlist.no }">
									<input type="hidden" name="accNo" value="${acc.accNo }">
										<c:if test="${not empty wishlist.wishlistImage }">
											<button type="submit" class="rounded" style="width: 64px; height: 64px; border: 0px;" >
												<img class="rounded" src="/resources/images/acc/${wishlist.wishlistImage.imageName }" style="width: 64px; height: 64px;" >
											</button>
										</c:if>
										<c:if test="${empty wishlist.wishlistImage }">
											<button type="submit" class="btn btn btn-secondary" style="width: 64px; height: 64px; padding: 0;">
												
											</button>
										</c:if>
									<span class="ms-3 fw-bold" style="margin-top:20px;">${wishlist.name }</span>
								</form>
							</div>
						</c:forEach>
					</div> 
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 위시리스트2 -->
<div class="modal" id="modal-save2-acc">
	<div class="modal-dialog modal-Default">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">위시 리스트</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<div class="row  p-3">
					<form action="insert" method="get" id="form-create-wishlist">
						<div class="row mb-3 align-items-center">
							<input class="form-control rounded" type="text" placeholder="이름을 입력하시오" maxlength='50'  name="wishlistName">
							<small>최대 50자</small>
							<input type="hidden" name="accNo" value="${acc.accNo }">
						</div>
						<div class="row mb-3 align-items-center">
							<button type="submit" class="btn btn-dark" id="btn-create-wishlist">새로 만들기</button>
						</div>
					</form>					
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 에어커버 모달 -->
<div class="modal" id="modal-cover-acc">
	<div class="modal-dialog modal-xl">
		<div class="modal-content p-4">
			<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			<div class="modal-header">
				<div class="row">
					<div class="col-12 mb-3">
					
						<img id="air-cover" alt="" src="https://a0.muscache.com/im/pictures/51a7f002-b223-4e05-a2af-0d4838411d92.jpg">
					</div>
					<div class="col">
					
						<p class="modal-title">에어커버는 모든 예약에 적용되는 포괄적인 보호 장치입니다.</p>
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-6">
						<h5>예약 지원 보장</h5>
						<p>드물지만 체크인까지 30일 이내로 남은 시점에 호스트가 예약을 취소하는 경우, 에어비앤비에서 기존 숙소와 비슷한 숙소 또는 더 나은 숙소를 찾아드리거나 요금을 환불해 드립니다.</p>
					</div>
					<div class="col-6">
						<h5>체크인 지원 보장</h5>
						<p>숙소에 체크인할 수 없으며 호스트가 문제를 해결할 수 없는 경우, 예약한 기간 동안 머물 수 있도록 기존 숙소와 비슷한 숙소 또는 더 나은 숙소를 찾아드리거나 요금을 환불해 드립니다.</p>
					</div>
					<div class="col-6">
						<h5>숙소 정확도 보장</h5>
						<p>냉장고가 고장 났는데 호스트가 쉽게 고칠 수 없는 경우, 침실 수가 숙소 페이지에 표시된 것보다 적은 경우 등 숙박 중 언제라도 실제 숙소가 숙소 페이지 설명과 다른 것을 알게 될 경우, 문제 발견 시점으로부터 3일 이내에 신고해주세요. 에어비앤비에서 비슷한 숙소 또는 더 나은 숙소를 찾아드리거나 요금을 환불해드립니다.</p>
					</div>
					<div class="col-6">
						<h5>24시간 안전 지원 라인</h5>
						<p>안전하지 않다고 느낄 경우, 24시간 언제든 특별 교육을 받은 안전 전문 상담원의 신속한 지원을 받으실 수 있습니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 이미지 모달 -->
<div class="modal" id="modal-image-acc">
	<div class="modal-dialog modal-fullscreen" style="width: 100%">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body text-center mb-0">
				<div>
					<c:forEach items="${acc.photos }" var="photo">
						<div class="">
							<a href="/resources/images/acc/${photo.name }" class="fresco" data-fresco-group="web">
							<img id="img-${photo.num }" src="/resources/images/acc/${photo.name }" class="modal-img mb-2" style="width: 800px; height: 600px;"></a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 
<div class="modal" id="modal-image-acc">
	<div class="modal-dialog modal-fullscreen">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body text-center mb-0">
				<div class="flex-container2">
					<div class="flex-item2"></div>
					<div class="flex-item2">
						<div class="flex-item3"></div>
						<div class="flex-item3"></div>
					</div>
					<div class="flex-item2"></div>
					<div class="flex-item2"></div>
				
				</div>
			</div>
		</div>
	</div>
</div> -->

<!-- <div class="modal" id="modal-image-acc">
	<div class="modal-dialog modal-fullscreen">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body text-center mb-0 contain">
				 <div class="images">
				  <div class="imageFlex1">
				    <img src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg">
				    <img src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg">
				    <img src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg">
				    <img src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg">
				    <img src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg">
				    <img src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg">
				  </div>
				</div>
				<div class="images">
				  <div class="imageFlex2">
				    <img src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg">
				    <img src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg">
				    <img src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg">
				    <img src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg">
				    <img src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg">
				  </div>
				</div>
			</div>
		</div>
	</div>
</div>  -->
<!-- <div class="modal" id="modal-image-acc">
	<div class="modal-dialog modal-fullscreen">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body text-center mb-0">
					<div class="grid-container">

						<article id="3685" class="location-listing">

							<a class="location-title" href="#"> San Francisco </a>

							<div class="location-image">
								<a href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/san-fransisco-768x432.jpg" class="fresco" data-fresco-group="web"> <img width="300" height="169"
									src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/san-fransisco-768x432.jpg"
									alt="san francisco">
								</a>

							</div>

						</article>
						<article id="3685" class="location-listing">

							<a class="location-title" href="#"> San Francisco </a>

							<div class="location-image">
								<a href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/san-fransisco-768x432.jpg" class="fresco" data-fresco-group="web"> <img width="300" height="169"
									src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/san-fransisco-768x432.jpg"
									alt="san francisco">
								</a>

							</div>

						</article>

					</div>
				</div>
		</div>
	</div>
</div> -->

	<!-- 지도 모달 -->
<div class="modal" id="modal-map-acc">
	<div class="modal-dialog modal-fullscreen" style="width: 100%;">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">호스팅 지역</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-2">
						<div>
							<div class="contentbox3 mb-3">
								<h4>${acc.address }</h4>
								<div class="content3" style="white-space:  pre-line;">
									<p style="white-space: pre-line;">${acc.description }</p>
								</div>
							</div> 
							<div class="contentbox3 mb-3">
								<h4>교통편</h4>
								<div class="content3" style="white-space:  pre-line;">
									<p>${acc.trafficDescription }</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-10" id="map2"></div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 리뷰 모달 -->
<div class="modal" id="modal-review-acc">
	<div class="modal-dialog modal-dialog-scrollable modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div>
					<div class="row">
						<div class="col-4">
							<div>
								<div class="mb-4" id="box-score">
									<h4><i class="bi bi-star-fill"></i> <span>${acc.reviewScore }</span><span>점</span>
									<span class="text-decoration"> · 후기 ${acc.reviewCount }</span><span>개</span></h4>
								</div>
								<div class="box-score-bar">
									<div class="row">
										<div class="col-4">
											<p class="avgName">청결도</p>
										</div>
										<div class="col-4 barBox">
											<div class="scoreBarleft">
												<div id="bar-clean-avg" style="width: ${acc.cleanScore * 20 }%;">
												</div>
												<span>${acc.cleanScore }</span>
											</div>
										</div>
									</div>
								</div>
								<div class="box-score-bar">
									<div class="row">
										<div class="col-4">
											<p class="avgName">정확성</p>
										</div>
										<div class="col-4 barBox">
											<div class="scoreBarleft">
												<div id="bar-accuracy-avg" style="width: ${acc.accuracyScore * 20 }%;">
												</div>
												<span>${acc.accuracyScore }</span>
											</div>
										</div>
									</div>
								</div>
								<div class="box-score-bar">
									<div class="row">
										<div class="col-4">
											<p class="avgName">의사소통</p>
										</div>
										<div class="col-4 barBox">
											<div class="scoreBarleft">
												<div id="bar-communication-avg" style="width: ${acc.communicationScore * 20 }%;">
												</div>
												<span>${acc.communicationScore }</span>
											</div>
										</div>
									</div>
								</div>
								<div class="box-score-bar">
									<div class="row">
										<div class="col-4">
											<p class="avgName">위치</p>
										</div>
										<div class="col-4 barBox">
											<div class="scoreBarleft">
												<div id="bar-location-avg" style="width: ${acc.locationScore * 20 }%;">
												</div>
												<span>${acc.locationScore }</span>
											</div>
										</div>
									</div>
								</div>
								<div class="box-score-bar">
									<div class="row">
										<div class="col-4">
											<p class="avgName">체크인</p>
										</div>
										<div class="col-4 barBox">
											<div class="scoreBarleft">
												<div id="bar-checkin-avg" style="width: ${acc.checkinScore * 20 }%;">
												</div>
												<span>${acc.checkinScore }</span>
											</div>
										</div>
									</div>
								</div>
								<div class="box-score-bar">
									<div class="row">
										<div class="col-4">
											<p class="avgName">가격 대비 만족도</p>
										</div>
										<div class="col-4 barBox">
											<div class="scoreBarleft">
												<div id="bar-value-avg" style="width: ${acc.valueScore * 20 }%;">
												</div>
												<span>${acc.valueScore }</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-8">
			     			<div class="row">
			     				<div class="col-12">
									<div class="row mb-5">
										<div class="col-12">
											<div id="box-review">
												<div>
													<div class="search-box mb-3">
														<i class="bi bi-search"></i>
														<input type="search" placeHolder="후기 검색" class="searchKeyword" id="search-keyword" name="keyword"/> 
													</div>
												</div>
												<div id="box-show-reviews">
													<!-- 리뷰 리스트 -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal" id="modal-description-acc">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">숙소 설명</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<p style="white-space:  pre-line;">${acc.description }</p>
      </div>
		</div>
	</div>
</div>

<script type="text/javascript">
function clip(){

	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	console.log(url)
	$("textarea").text(url);
	console.log($("textarea").text())
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("URL이 복사되었습니다.")
}

$(function() {
	// 모달 객체
	let accConvenienceModal = new bootstrap.Modal(document.getElementById("modal-con-acc"));
	let accShareModal = new bootstrap.Modal(document.getElementById("modal-share-acc"));
	let accSaveModal = new bootstrap.Modal(document.getElementById("modal-save-acc"));
	let accSave2Modal = new bootstrap.Modal(document.getElementById("modal-save2-acc"));
	let accImageModal = new bootstrap.Modal(document.getElementById("modal-image-acc"));
	let accCoverModal = new bootstrap.Modal(document.getElementById("modal-cover-acc"));
	let accReportModal = new bootstrap.Modal(document.getElementById("modal-report-acc"));
	let accMapModal = new bootstrap.Modal(document.getElementById("modal-map-acc"));
	let accReviewModal = new bootstrap.Modal(document.getElementById("modal-review-acc"));
	let accdescriptionModal = new bootstrap.Modal(document.getElementById("modal-description-acc"));

	// 위시리스트 저장 모달
	$(".btn-open-save-modal").click(function() {
		accSaveModal.show();
	}); 
	// 위시리스트2 저장 모달
	$("#btn-open-save2-modal").click(function() {
		accSaveModal.hide();
		accSave2Modal.show();
	});
	
	// 숙소 설명 모달
	$("#btn-open-description-modal").click(function() {
		accdescriptionModal.show();
	});
	
	// 지도 모달
	$("#btn-open-map-modal").click(function() {
		accMapModal.show();
		relayout()
	});
	$("#btn-open-map-modal2").click(function() {
		accMapModal.show();
		relayout()
	});
	
	// 신고 모달
	$("#btn-open-report-modal").click(function() {
		accReportModal.show();
	});
	
	// 편의시설 모달
	$("#btn-open-con-modal").click(function() {
		accConvenienceModal.show();
	});
	
	// 공유 모달
	$("#btn-open-share-modal").click(function() {
		accShareModal.show();
	});
	// 어에커버 모달
	$("#btn-open-cover-modal").click(function() {
		accCoverModal.show();
	});
	// 이미지 모달
	$("#btn-open-image-modal").click(function() {
		accImageModal.show();
		$("#img-1").focus();
	});
	$("#btn-open-image-modal2").click(function() {
		accImageModal.show();
		$("#img-2").focus();
	});
	$("#btn-open-image-modal3").click(function() {
		accImageModal.show();
		$("#img-3").focus();
	});
	$("#btn-open-image-modal4").click(function() {
		accImageModal.show();
		$("#img-4").focus();
	});
	$("#btn-open-image-modal5").click(function() {
		accImageModal.show();
		$("#img-5").focus();
	});
	$("#btn-open-image2-modal").click(function() {
		accImageModal.show();
	});
	$("#btn-open-image3-modal").click(function() {
		accImageModal.show();
	});
	
	$("#checkInDate").hide();
	$("#checkOutDate").hide();
	
	// 리뷰 리스트 모달
	let $reviewBox = $("#box-show-reviews");
	
	let currentPage = 1;			// 조회할 페이지 번호
	let canRequest = true;			// ajax요청 가능 ㅇ여부,  데이터를 조회했을 때 10개 미만으로 조회되면 다음 페이지가 존재하지 않으므로 ajax요청을 하지 못하게 한다.
	
	$(".openReviewModal").click(function() {
		currentPage = 1;
		canRequest = true;
		$reviewBox.empty();
		
		getReviews();
		accReviewModal.show();
	})
	
	// 무한 스크롤 기능
	$('#modal-review-acc .modal-body').scroll(function() {
		let documentHeight = $("#modal-review-acc .modal-body #box-review").height()	// 전체 리뷰 길이
		let contentBodyHeight = $("#modal-review-acc .modal-body").height()				// 모달 바디 길이
		let contentBodyScrollTop = $("#modal-review-acc .modal-body").scrollTop()		// 스크롤해서 올린 길이
		
		if (canRequest && (contentBodyHeight + contentBodyScrollTop + 50 >= documentHeight)) {			
			currentPage++;			
			getReviews();
		}
	})

	// 숙소 번호에 해당하는 리뷰를 가져온다.
	function getReviews() {
		let params = new URLSearchParams(document.location.search);
		let no = params.get("no");
		
		let data = {no:no, page: currentPage};
		let text = $("#search-keyword").val()
		if (text != '') {
			data['keyword'] = text;
		}
		
		$.ajax({
			type: 'GET',
			url: "../review/reviews",				// no / accNo 같음
			data: data,
			dataType: 'json',
			success: function(data) {
				let reviews = data.items;
				console.log(reviews);
				if (reviews.length <  10) {
					canRequest = false;
				}
				
				if (currentPage == 1 && reviews.length == 0) {
					let rcontent2 = '';
					rcontent2 += '<p class="text-center"><strong>'+  $("#search-keyword").val() +'에 대한 검색결과가 없습니다.</strong></p>';
					rcontent2 += '<p class="text-center">다른 언어에서 번역된 후기는 나타나지 않습니다. 원문으로 검색해 주세요.</p>';

					$reviewBox.html(rcontent2);
				} else {

					$.each(reviews, function(index, review) {
						let content = '';
						content += '<div class="row-4 mb-3">';
						content += '	<img src="/resources/images/profile/'+ (review.user.profileImage ? review.user.profileImage : "no-image.png") +'" id="user-image">';
						content += '	<span class="noMargin reviewContent"><strong>' + review.user.name + '</strong></span>';
						content += '	<span class="noMargin reviewContent">' + review.createdDate + '</span>';
						content += '</div>';
						content += '<div class="row-8 mb-5 boxReviewContent">';
						content += '	<p class="reviewContent">'+ review.content +' </p>';
						content += '</div>';
						
						
						$reviewBox.append(content);
					})		
				}
				
				// 글 긴거 더보기
			   $(".boxReviewContent").each(function(){
			        let rcontent = $(this).filter(':not(:has(a.more))').children('.reviewContent');
			        let rcontent_txt = rcontent.text();
			        let rcontent_txt_short = rcontent_txt.substring(0,100)+"...";
			        let btn_more = $('<a href="javascript:void(0)" class="more link-dark">더보기 <i class="bi bi-chevron-right"></i></a>');

			        $(this).append(btn_more);
			        
			        if(rcontent_txt.length >= 100){
			            rcontent.html(rcontent_txt_short)
			            
			        }else{
			            btn_more.hide()
			        }
			        
			        btn_more.click(toggle_content);

			        function toggle_content(){
			            if($(this).hasClass('short')){
			                // 접기 상태
			                $(this).html('더보기');
			                rcontent.html(rcontent_txt_short)
			                $(this).removeClass('short');
			            }else{
			                // 더보기 상태
			                $(this).html('접기');
			                rcontent.html(rcontent_txt);
			                $(this).addClass('short');

			            }
			        }
			    });
			}
		})

	}
	
	// 숙소 상세 하단 리뷰(6개) 조회 용도입니다.
	let $reviewBoxUnder = $("#box-under-review");
	$(document).ready(function(){
		let params = new URLSearchParams(document.location.search);
		let no = params.get("no");
		
		$.ajax({
			type: 'GET',		
			url: "../review/reviews",				
			data: {no:no},
			dataType: 'json',
			success: function(data) {
				let reviews = data.items;
				console.log(reviews);

				let contentUnder = '<div class="row">';
				$.each(reviews, function(index, review) {
					
					if (index > 5) {
						return false;
					}
					
					contentUnder += '	<div class="col-6 mb-4">';
					contentUnder += '		<div class="row mb-3">';
					contentUnder += '			<div class="col-1">';
					contentUnder += '				<img src="/resources/images/profile/'+ (review.user.profileImage ? review.user.profileImage : "no-image.png") +'" id="user-image">';
					contentUnder += '			</div>';
					contentUnder += '			<div class="col-4 ps-3">';
					contentUnder += '				<h4 class="noMargin reviewContent"><strong>'+ review.user.name + '</strong></h4>';
					contentUnder += '				<span class="noMargin reviewContent">'+ review.createdDate + '</span>';
					contentUnder += '			</div>';
					
					contentUnder += '		</div>';
					contentUnder += '		<div class="row">'
					contentUnder += '			<div class="col pe-5 underBoxReviewContent">';
					contentUnder += '				<p class="reviewContent mb-0 underReviewContent">'+ review.content +'</p>';
					contentUnder += '			</div>';
					contentUnder += '		</div>';
					contentUnder += '	</div>';
				})		
				
				contentUnder += '</div>';
				$reviewBoxUnder.append(contentUnder);
				
			   $(".underBoxReviewContent").each(function(){
			        let underContent = $(this).children('.underReviewContent:not(:has(a.more))');
			        let underContent_txt = underContent.text();
			        let underContent_txt_short = underContent_txt.substring(0,30)+"...";
			        let btn_more = $('<a href="javascript:void(0)" class="more link-dark"><strong>더보기<i class="bi bi-chevron-right"></strong></i></a>');

			        $(this).append(btn_more);
			        
			        if(underContent_txt.length >= 30){
			        	underContent.html(underContent_txt_short)
			            
			        }else{
			            btn_more.hide()
			        }
			        
			        btn_more.click(function() {
			        	currentPage = 1;
			    		canRequest = true;
			    		$reviewBox.empty();
			    		
			    		getReviews();
			    		accReviewModal.show();
			        });

			        
			    });
			}
		})
		
	});
	
	
	// 리뷰 모달창의 검색 기능입니다.
	$("#search-keyword").keydown(function(e){
		if (e.keyCode == 13) {
			currentPage = 1;
			canRequest = true;
			$reviewBox.empty();
			
			getReviews();
		}
	}) 
	
	

	/* console.log(latitude);
	console.log(longitude); */
	
	// 카카오 맵
	// 불러올 숙소 위치
	let latitude = '${acc.longitude}'
	let longitude = '${acc.latitude}'
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(longitude,latitude), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(longitude,latitude); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null); 
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	
	// 카카오 맵
	var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div 
    mapOption2 = { 
        center: new kakao.maps.LatLng(longitude,latitude), // 지도의 중심좌표
        level: 3	 // 지도의 확대 레벨
    };

	var map2 = new kakao.maps.Map(mapContainer2, mapOption2); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(longitude,latitude); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map2);
	
	
	// 모달창 등에 지도사용시 다시불러오기 필요
	function relayout() {   
		
		// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
	    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
	    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
	    map2.relayout();
		
		var moveLatLon = new kakao.maps.LatLng(longitude,latitude);
	    
	    // 지도 중심을 이동 시킵니다
	    map2.setCenter(moveLatLon);
	    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
	    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
	    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
	}
	
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);    
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl2 = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map2.addControl(mapTypeControl2, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl2 = new kakao.maps.ZoomControl();
	map2.addControl(zoomControl2, kakao.maps.ControlPosition.RIGHT);

	
	// 달력
	let disabledDate = ('${acc.disabledDate}').split(",");
	console.log(disabledDate) 
	
	/* var fp2 = $("#checkInDate").flatpickr({
		minDate: new Date(),
		dateFormat: "Y-m-d",
		disable : disabledDate,
		"locale": "ko" ,
	});  
	var fp3 = $("#checkOutDate").flatpickr({
		minDate: new Date(),
		dateFormat: "Y-m-d",
		disable : disabledDate,
		"locale": "ko" ,
	});   */
	
	var fp1 = $("#days-box").flatpickr({
		minDate: new Date(),
		mode: "range",
		dateFormat: "Y-m-d",
		disable : disabledDate,
		"locale": "ko" ,
		wrap: true
	   });  
	fp1.config.onChange.push(function(selectedDates) {
 		if (selectedDates[1]==null || selectedDates[0]==null){
 			return;
 		}
 		console.log(selectedDates[0])
 		console.log(selectedDates[1])
 		
 		let indate = new Date(selectedDates[0])
 		let outdate = new Date(selectedDates[1])
 		console.log(indate)
 		console.log(outdate) 
 		
 		// 영탁
 		document.getElementById('checkInDate').value = CF_toStringByFormatting(new Date(indate));
 		document.getElementById('checkOutDate').value = CF_toStringByFormatting(new Date(outdate));
		let diffDate = Date.parse(selectedDates[1])-Date.parse(selectedDates[0]);
		
 		let day = Math.floor(diffDate / (1000 * 60 * 60 * 24));
 		$("#input-day").val(day);
 		let sum = ${acc.price } * day;
 		$("#day-price").text(sum.toLocaleString());
 		$("#price").val(sum);
 		
 		
 		let totalPrice = ${acc.cleaningPrice} + sum
 		$("#totalPrice").text(totalPrice.toLocaleString())
 		$("#totalPriceValue").val(totalPrice)
	}) 
	
   	$(".reservation").hide();
	
	$("#nav-1").hide();
	$("#navR2").hide();
	
	$("#days").on('input',function(){
      if (!$("#days").empty()){
    	  $(".reservation").hide();
    	  $(".not-reservation").show();
    	  
    	  $("#navR2").hide();
	      $("#navR").show();
    	  
      } else {
    	  $(".reservation").show();
    	  $(".not-reservation").hide();
    	  $("#navR").hide();
		  $("#navR2").show();
      }

   })
	
   $("#profile").click(function() {
			$("host").focus();
		})

		

		$(window).scroll(function() {
			let scrollTop = $(document).scrollTop();
			if (scrollTop > 600) {
				$("#nav-1").show();
			} else {

				$("#nav-1").hide();
			}
			
			/* if (scrollTop > 2100 && $("#days").empty()) {
				$("#navR").show();
				
			} else {

				$("#navR").hide();
			} */
			/* if (scrollTop > 2100) {
					
				} else{
					
					
				}
			} else {
				$("#navR2").hide();
				$("#navR").hide();
			} */
		})
		
   
	/* $("#edate").flatpickr({
		minDate: new Date(),
		defaultDate : new Date(),
		inline: true,	
		 mode: "range",
		 disable : ["2022-08-16", "2022-08-17"],
		"locale": "ko" 
	}); */
	/* let disabledDays = ["2022-8-9","2022-8-24","2022-8-26"];
       function disableAllTheseDays(date) {
    	    var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
    	    for (i = 0; i < disabledDays.length; i++) {
    	        if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
    	            return [false];
    	        }
    	    }
    	    return [true];
    	}
		$(document).ready(function(){       
	       $( "#sdate" ).datepicker({
	            changeMonth: true,
	            changeYear: true,
	            showMonthAfterYear: true,
	            minDate: new Date(),
	            dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
	            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	            dateFormat:'yy-mm-dd',
	            beforeShowDay: disableAllTheseDays,
	            onSelect: function(dateText, inst) {
	                var date = $(this).val();
	                $("#start").text(date);
	           }
	        });
	       $( "#edate" ).datepicker({
	            changeMonth: true,
	            changeYear: true,
	            showMonthAfterYear: true,
	            minDate: new Date(),
	            dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
	            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	            dateFormat:'yy-mm-dd',
	            beforeShowDay: disableAllTheseDays,
	            onSelect: function(dateText, inst) {
	                var date = $(this).val();
	 	            $("#end").text(date);
	 	            
	           }
	        });
	       
	       $('#sdate').datepicker("option", "maxDate", $("#edate").val());
	       $('#sdate').datepicker("option", "onClose", function (selectedDate){
	           $("#edate").datepicker( "option", "minDate", selectedDate );
	           });
	       
	       $('#edate').datepicker();
	       $('#edate').datepicker("option", "minDate", $("#sdate").val());
	       $('#edate').datepicker("option", "onClose", function (selectedDate){
	           $("#sdate").datepicker( "option", "maxDate", selectedDate );
	          });
		       
		});
		
		$("#edate").on(function(){    
			alert("이벤트발생");
			let sdd = $("#sdate").val;
		   	let edd = $("#edate").val;
		   	let date1 = new Date(sdd);
			let date2 = new Date(edd);
			let diffDate = date1.getTime() - date2.getTime();
			  
			let day = Math.abs(diffDate / (1000 * 60 * 60 * 24)); // 밀리세컨 * 초 * 분 * 시 = 일
			console.log(day);
			if(sdd && edd){
		   		$("#day").text(day); 
			}
		}) */
		
		
		/* function call(){
		    let sdd = $("#sdate").val;
		    let edd = $("#edate").val;
		    let date1 = new Date(sdd);
			let date2 = new Date(edd);
			let diffDate = date1.getTime() - date2.getTime();
			  
			let day = Math.abs(diffDate / (1000 * 60 * 60 * 24)); // 밀리세컨 * 초 * 분 * 시 = 일
		 if(sdd && edd){
		    $("#day").text(day);
		 }
		}  */
		/* function call(){
		    var sdd = $("#sdate").val;
		    var edd = $("#edate").val;
		    console.log(sdd);
		    console.log(sdd);
		    var ar1 = sdd.split('-');
		    var ar2 = edd.split('-');
		    var da1 = new Date(ar1[0], ar1[1], ar1[2]);
		    var da2 = new Date(ar2[0], ar2[1], ar2[2]);
		    var dif = da2 - da1;
		    var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
		    var cMonth = cDay * 30;// 월 만듬
		    var cYear = cMonth * 12; // 년 만듬
		 if(sdd && edd){
		    document.getElementById('day').value = parseInt(dif/cDay)
		 }
		} 
		 */
		
		
		// 스크롤스파이
		var scrollSpy = new bootstrap.ScrollSpy(document.body, {
			target : '#nav-1'
		})

		// 공유
		$("#btnTwitter").click(
				function() {
					var sendText = "aircnc"; // 전달할 텍스트
					var sendUrl = "https://localhost/detail?no="+${acc.accNo}; // 전달할 URL
					window.open("https://twitter.com/intent/tweet?text="
							+ sendText + "&url=" + sendUrl);
				})
		$("#btnFacebook").click(
				function() {
					var sendUrl = "https://localhost/detail?no="+${acc.accNo}; // 전달할 URL
					window.open("http://www.facebook.com/sharer/sharer.php?u="
							+ sendUrl);
				})

	$("#days-focus").click(function() {
		$("#days").focus();
	})
				
	// 인원 버튼
	$("#guest").hide();
	$("#up").hide();
	
	$("#guest-btn").click(function() {
		$("#guest").toggle();
		$("#up").toggle();
		$("#down").toggle();
	})
	
	$(".adultM").addClass("disabled")
	$(".childrenM").addClass("disabled")
	$(".infantM").addClass("disabled")
	$(".petM").addClass("disabled")
	
	let petLimit = parseInt(${acc.pet})
	let limit = parseInt(${acc.guest})
	
	if (petLimit === 0) {
		$(".pet_p_btn").addClass("disabled")
	}
	
	/* $("#adultCount").hide();
	$("#infantCount").hide();
	$("#petCount").hide(); */
	$("#infant").hide();
	$("#pet").hide();
	$(".guestbtn").click(function() {
		
		$(function() {
			
			let adult = parseInt($(".adultCount").text())
			let children = parseInt($(".childrenCount").text())
			let infant = parseInt($(".infantCount").text())
			let pet = parseInt($(".petCount").text())
			
			$("#adultCount").text(adult + children);		
			$("#infantCount").text(infant);		
			$("#petCount").text(pet);	
			
			
			
			if (infant === 0) {
				$("#infant").hide();
			} else {
				$("#infant").show();
				
			}
			if (pet === 0) {
				$("#pet").hide();
			} else {
				$("#pet").show();
				
			}
			let total = adult + children + infant
			
			
			limitDisabled(petLimit,pet,$(".pet_p_btn"));
			limitDisabled(limit,total,$(".hu_p_btn"));
			
			
			
			if (adult === 1){
				$(".adultM").addClass("disabled")	
			} else {
				$(".adultM").removeClass("disabled")
			}
			
			disabled(children,$(".childrenM"));
			disabled(infant,$(".infantM"));
			disabled(pet,$(".petM"));
			
			$("#adultNum").val(adult)
			$("#childrenNum").val(children)
			$("#infantNum").val(infant)
			$("#petNum").val(pet)
			$("#totalGuest").val(total)
			
			
			/* if ($("#adultNum").val === 0) {
				$("#adultCount").hide
			} else {
				$("#adultCount").show();
				
			} */
		})
		
	})
	
	function disabled(num ,select) {
		if (num === 0){
			select.addClass("disabled")	
		} else {
			select.removeClass("disabled")
		}
	}
	
	function limitDisabled(limit,num,select) {
		if (limit === num) {
			select.addClass("disabled")	
		} else {
			select.removeClass("disabled")
		}
	}
	
	
	function CF_toStringByFormatting(source){
		var date = new Date(source);
		const year = date.getFullYear();
		const month = CF_leftPad(date.getMonth() + 1);
		const day = CF_leftPad(date.getDate());
		return [year, month, day].join('-');
	}
	
	
	function CF_leftPad(value){
		if (Number(value) >= 10) {
			return value;
		}
		return "0" + value;
	}
	
	
	$(function() {
           $(".p_btn").click(function() {
               var $this = $(this);
               var target = $this.prev();
               var num = parseInt(target.text());
               num++;
			
               target.text(num);
               
           });

           $(".m_btn").click(function() {
               var $this = $(this);
               var target = $this.next();
               var num = parseInt(target.text());
               num -= ( (num === 0) ? 0 : 1 ); //0이하로는 못내려가게 한다 
			
               target.text(num);
           });
	});
	
	$("#form-reservation").submit(function() {
		
		// 인원수
		let totalValue = $.trim($("#totalGuest").val());
		if (totalValue < 1) {
			alert("인원은 필수 입력값입니다.");
			return false;
		}
		// 날짜
		let checkIn = $.trim($("#checkInDate").val());
		if (checkIn === "") {
			alert("날짜는 필수 입력값입니다.");
			return false;
		}
		let checkOut = $.trim($("#checkOutDate").val());
		if (checkOut === "") {
			alert("날짜 필수 입력값입니다.");
			return false;
		}
		return true;
	})
	$("#form-create-wishlist").submit(function() {
		
		let titleValue = $.trim($(":input[name=wishlistName]").val());
		if (titleValue === "") {
			alert("제목은 필수 입력값입니다.");
			return false;
		}
			
		return true;
	})
	
	
	
	// 글 긴거 더보기
	$('.contentbox3').each(function(){
        var content = $(this).children('.content3');
        var content_txt = content.text();
        var content_txt_short = content_txt.substring(0,100)+"...";
        var btn_more = $('<a href="javascript:void(0)" class="more link-dark">더보기 <i class="bi bi-chevron-right"></i></a>');

        
        $(this).append(btn_more);
        
        if(content_txt.length >= 100){
            content.html(content_txt_short)
            
        }else{
            btn_more.hide()
        }
        
        btn_more.click(toggle_content);

        function toggle_content(){
            if($(this).hasClass('short')){
                // 접기 상태
                $(this).html('더보기');
                content.html(content_txt_short)
                $(this).removeClass('short');
            }else{
                // 더보기 상태
                $(this).html('접기');
                content.html(content_txt);
                $(this).addClass('short');

            }
        }
    });
	
	$('.contentbox2').each(function(){
        var content = $(this).children('.content2');
        var content_txt = content.text();
        var content_txt_short = content_txt.substring(0,200)+"...";
        
        if(content_txt.length >= 200){
            content.html(content_txt_short)
            
        }
    });
	
	
	
	
		
	Kakao.Share.createDefaultButton({
	    container: '#create-kakaotalk-sharing-btn',
	    objectType: 'feed',
	    content: {
	      title: 'aircnc',
	      description: '${acc.name}',
	      imageUrl:
		  		'https://localhost/resources/logo-home.png',
	      link: {
	        mobileWebUrl: 'https://localhost/acc/detail?no='+${acc.accNo },
	        webUrl: 'https://localhost/acc/detail?no='+${acc.accNo },
	      },
	    },   
	    buttons: [
	      {
	        title: '웹으로 보기',
	        link: {
	          mobileWebUrl: 'https://localhost/acc/detail?no='+${acc.accNo },
	          webUrl: 'https://localhost/acc/detail?no='+${acc.accNo },
	        },
	      },
	      {
	        title: '앱으로 보기',
	        link: {
	          mobileWebUrl: 'https://localhost/detail?no=${acc.accNo }',
	          webUrl: 'https://localhost/detail?no=${acc.accNo }',
	        },
	      },
	    ],
	  })  
	
	  /* $("#btn-create-wishlist").click(function() {
		 let accNo = ${acc.accNo }
		 $("#save-btn").remove()
		 
		 let querystring = $("#form-create-wishlist").serialize();
		 
			$.post("/acc/insert", querystring, function(result) {
				wishlists = result.wishlists;
				$("#div-wishlists > div").remove();
				let content = '';
				content += '<div class="mt-3" style="display: flex; height: 64px;">';
				content += '<button type="button" class="btn" id="btn-open-save2-modal" style="width: 90px; height: 78px;"><i class="bi bi-plus h3" style="width: 64px; height: 64px;"></i></button>';
				content += '<span class="ms-3 fw-bold" style="margin-top:20px;">새로운 위시리스트 만들기</span>';
				content += '</div>';
				
				$.each(wishlists, function() {
					if (this.wishlistImage != null) {
						
						content += '<div class="mt-3" style="display: flex; height: 64px;">';
						content += '<form action="save">';
						content += '<input type="hidden" name="wishlistNo" value="' + this.no + '">';
						content += '<input type="hidden" name="accNo" value="'+accNo+'">';
						content += '<button type="submit" class="btn" >';
						content += '<img class="rounded" src="/resources/images/acc/' +this.wishlistImage.imageName + '" style="width: 64px; height: 64px;">';
						content += '</button>';
						content += '<span class="ms-3 fw-bold" style="margin-top:20px;">' + this.name + '</span>';
						content += '</form>';
						content += '</div>';
					}
					
					if (this.wishlistImage === null) {
						content += '<div class="mt-3" style="display: flex; height: 64px;">';
						content += '<form action="save">';
						content += '<input type="hidden" name="wishlistNo" value="' + this.no + '">';
						content += '<input type="hidden" name="accNo" value="'+accNo+'">';
						content += '<button type="submit" class="btn btn btn-secondary" style="width: 64px; height: 64px;">';
						content += '</button>';
						content += '<span class="ms-3 fw-bold" style="margin-top:20px;">' + this.name + '</span>';
						content += '</form>';
						content += '</div>';
					}
					
				});
				
				$("#div-wishlists").html(content);
				let spanContent = '<a href="delete?accNo='+ accNo +'&wishlistNo='+result.wishlistNo.wishlist.no+'" class="btn btn-link text-decoration-underline text-dark btn-delete-wishlistAcc" ><i id="icon-heart-'+ accNo +'" class="fa-solid fa-heart fs-6 " style="color: #FF385C;"></i> <span id="saveList">저장 목록</span></a>';
				$("#append-save").append(spanContent);
			})
			accSave2Modal.hide();	
			accSaveModal.show();	
			//saveToListModal.show();
	 }); */
	  
	
})

// 링크복사
function fn_final() {
			var url = document.getElementById('text');
			url.style.display='block';	// 숨겨둔 input 태그 block처리
			url.select();	// 복사할 text 블럭
			document.execCommand('copy');	// 드레그된 text 클립보드에 복사
			url.style.display='none';	// 다시 숨기기
			alert("주소 복사가 완료되었습니다.");
	    }
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ec6d52326b138f515a86c55e152676c"></script>
<script src="https://cdn.jsdelivr.net/npm/clipboard@2.0.6/dist/clipboard.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</body>
</html>