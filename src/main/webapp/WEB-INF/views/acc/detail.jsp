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
<!-- 페레스코 -->
<script type="text/javascript" src="/resources/js/fresco.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/fresco.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/detaile.css">
<!-- 달력 -->
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<title>숙소 상세 페이지</title>
</head>
<body >
<c:set var="menu" value="detaile"/>
	<nav class="navbar navbar-expand-lg navbar-white bg-white border-bottom" id="nav-1">
		<div class="col"></div>
		<div class="col-6">
			<ul class="navbar-nav me-auto justify-content-center">
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
		<div class="col"></div>
	</nav>
	<%@ include file="../common/nav2.jsp" %>
	<div class="container"> 
		<div class="row p-2 mb-2" id="top-div" >
			<div>
				<span class="title"><strong>${acc.name }</strong></span>
			</div>
			<div class="pl-1">
				<p>
					<button type="button" class="btn btn-link text-dark btn-sm"><i class="bi bi-star-fill"></i> ${acc.reviewScore } <span class="text-decoration-underline">후기 ${acc.reviewCount }개</span></button>
					<button type="button" class="btn btn-link text-decoration-underline text-dark btn-sm" id="btn-open-map-modal">${acc.address }</button>
				
					<span class="float-end">
						<button type="button" class="btn btn-link text-decoration-underline text-dark" id="btn-open-share-modal"><i class="bi bi-share-fill"></i> 공유</button>
						<button type="button" class="btn btn-link text-decoration-underline text-dark" id="btn-open-save-modal"><i class="bi bi-heart"></i> 저장</button>
					</span>
				</p>
			</div>
		</div>
	</div>
	<div class="container main">
		<div class="row mb-5 flex-container">
			<div class="flex-item1" >
				<div class="img-large" id="btn-open-image-modal">
					<a href="#"><img src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg" id="image-large"></a>
				</div>
			</div>
			<div class="flex-item" id="centerimg">
				<div class="img-short" id="btn-open-image-modal2">
					<a href="#"><img src="https://a0.muscache.com/airbnb/static/destinations/o-Rome_Piazza017_480x320.jpg" class="short-img"></a>
				</div>
				<div class="img-short short-bottom" id="btn-open-image-modal3">
					<a href="#"><img src="https://a0.muscache.com/airbnb/static/destinations/o-Los_Angeles_480x320.jpg" class="short-img"></a>
				</div>
				
			</div> 
			<div class="flex-item">
				<div class="img-short" id="btn-open-image-modal4">
					<a href="#"><img src="https://a0.muscache.com/airbnb/static/destinations/o-Lisbon_480x320.jpg" class="short-img" id="image-right-top"></a>
				</div>
				<div class="img-short short-bottom" id="btn-open-image-modal5">
					<a href="#"><img src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg" class="short-img" id="image-right-bottom"></a>
				</div>
				
			</div>
		</div>
	</div>
	<div class="container main">
		<div class="row"> 
		
			<div class="col-8" id="main-content">
				<div>
					<a id="profile" href="#host">
						<img class="float-end profile" src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg">
					</a>
					<h4>덕인님이 호스팅하는 ${acc.name }</h4>
					<p>최대 인원 ${acc.guest }명<i class="bi bi-dot"></i>침실 1개<i class="bi bi-dot"></i>침대 1개<i class="bi bi-dot"></i>욕실 1개</p>
				</div>
				<hr>
				<div>
					<div class="mb-2">
						<h6><i class="bi bi-door-closed"></i> 셀프 체크인</h6>
						<span>열쇠 보관함을 이용해 체크인하세요.</span>
					</div>
					<div class="mb-2">
						<h6><i class="bi bi-door-closed"></i> 셀프 체크인</h6>
						<span>열쇠 보관함을 이용해 체크인하세요.</span>
					</div>
					<div class="mb-2">
						<h6><i class="bi bi-door-closed"></i> 셀프 체크인</h6>
						<span>열쇠 보관함을 이용해 체크인하세요.</span>
					</div>
				</div>
				<hr>
				<div>
					<div class="mt-5 mb-2">
						<img id="air-cover" alt="" src="https://a0.muscache.com/im/pictures/51a7f002-b223-4e05-a2af-0d4838411d92.jpg">
					</div>
					<div class="mb-5">
						<p>모든 예약에는 호스트가 예약을 취소하거나 숙소 정보가 정확하지 않은 경우 또는 체크인에 문제가 있는 상황에 대비한 무료 보호 프로그램이 포함됩니다.</p>
						<button type="button" class="btn btn-link text-decoration-underline text-dark" id="btn-open-cover-modal">더 알아보기</button>
					</div>
				</div>
				<hr>
				<div class="contentbox mt-5 mb-5">
					<div class="content mb-2">
						<p>${acc.description }</p>
					</div>
				</div>
				<hr>
				<div class="row mt-5">
					<h4>숙박장소</h4>
					<div class="col-6" id="btn-open-image2-modal">
						<img class="image2 rounded mb-2" alt="" src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg" >
						<h5>침실공간</h5>
						<span>침대 1개</span>
					</div>
					<div class="col-6" id="btn-open-image3-modal">
						<img class="image2 rounded mb-2" alt="" src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg" >
						<h5>침실공간</h5>
						<span>침대 1개</span>
					</div>
				</div>
				<hr>
				<div class="row mt-5 mb-5" id="con">
					<span class="mb-3">
						<h4>숙소 편의시설</h4>
					</span>
					<c:forEach items="${acc.conveniences }" var="accConvenience">
						<div class="col-6 mb-2"><p><span class="material-symbols-outlined"> ${accConvenience.convenience.iconName }</span> ${accConvenience.convenience.name }</p></div>
					</c:forEach>
					<div class="col-6 mb-2">
						<button class="btn btn-outline-dark btn-lg" id="btn-open-con-modal">편의시설 xx개 더보기</button>
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
				<div class="sticky" >
					<div class="row shadow-lg bg-body rounded" id="box">
						<div class="col-7 boxhd" >
							<h4><strong><fmt:formatNumber value="${acc.price }"/></strong>/
								<span class="day"></span>박
							</h4>
						</div>
						<div class="col-5 boxhd">
							<button type="button" class="btn btn-link text-dark btn-sm"><i class="bi bi-star-fill"></i> ${acc.reviewScore } <span class="text-decoration-underline">후기 ${acc.reviewCount }개</span></button>
						</div>
						<div class="col-12 start" >
							<label>체크인 체크아웃</label>
							<input placeholder="ex) 2020-09-01" id="days"/>
							<!-- <span>체크인</span>
							<span id="start"></span> -->
						</div>
						<!-- <div class="col-6 end" >
							<span>체크아웃</span>
							<span id="end"></span>
						</div> -->
						<button type="button" class="btn btn-outline-dark p-2 mb-2" id="guest-btn">인원:<span id="adultCount"> 0</span> 어린이:<span id="childrenCount"> 0</span> 유아:<span id="infantCount"> 0</span> 반려동물:<sapn id="petCount"> 0</sapn></button>
						<div class="rounded" id="guest">
							<div class="mb-4 row justify-content-between align-middle guest-box" >
								<div class="col-4">
									성인
								</div>
								<div class="col-4 " id="adult">
										<button class="btn m_btn guestbtn">-</button>
										<span class="adultCount">0</span>
										<button class="btn p_btn guestbtn">+</button>
								</div>
							</div>
							<div class="mb-4 row justify-content-between align-middle guest-box" >
								<div class="col-4">
									어린이
								</div>
								<div class="col-4 " id="adult">
										<button class="btn m_btn guestbtn">-</button>
										<span class="childrenCount">0</span>
										<button class="btn p_btn guestbtn">+</button>
								</div>
							</div>
							<div class="mb-4 row justify-content-between align-middle guest-box" >
								<div class="col-4">
									유아
								</div>
								<div class="col-4 " id="adult">
										<button class="btn m_btn guestbtn">-</button>
										<span class="infantCount">0</span>
										<button class="btn p_btn guestbtn">+</button>
								</div>
							</div>
							<div class="mb-4 row justify-content-between align-middle guest-box" >
								<div class="col-4">
									반려
								</div>
								<div class="col-4 " id="adult">
										<button class="btn m_btn guestbtn">-</button>
										<span class="petCount ">0</span>
										<button class="btn p_btn guestbtn">+</button>
								</div>
							</div>
						</div>
						<button type="button" class="btn btn-outline-dark p-2 mb-2" id="guest-btn">예약하기</button>
						<div class="row justify-content-between">
							<div class="col-6"><p>₩<fmt:formatNumber value="${acc.price }"/> x <span class="day"></span>박</p></div>
							<div class="col-5"><p>₩<span id="day-price"></span> 원</div>
						</div>
						<div class="row justify-content-between">
							<div class="col-6"><p>청소비</p></div>
							<div class="col-5"><p>₩<fmt:formatNumber value="${acc.cleaningPrice }"/> 원</div>
						</div>
						<div class="row justify-content-between">
							<div class="col-6"><p>W ${acc.price } x 1박</p></div>
							<div class="col-5"><p>${acc.price } 원</p></div>
						</div>
						<hr>
						<div class="row justify-content-between">
							<div class="col-6"><h6>총합계</h6></div>
							<div class="col-5"><h6>₩${acc.price } 원</h6></div>
						</div>
					</div>
					<div class="text-center">
						<button type="button" class="btn btn-link text-decoration-underline text-dark" id="btn-open-report-modal"><i class="bi bi-flag-fill"></i> 숙소 신고하기</button>
					</div>
				</div>
				
			</div>
			<hr>
			<div class="mt-5 mb-5" id="review">
				<h4><i class="bi bi-star-fill"></i> ${acc.reviewScore } <span class="text-decoration">후기 ${acc.reviewCount }개</span></h4>
			</div>
			<hr>
			<div class="mt-5 mb-5">
				<div class="">
					<h4>호스팅 지역</h4>
				</div>
				<div class="mb-2" id="map"></div>
				<div class="mb-2 content">
					<h5>${acc.address }</h1>
					<div class="content">
						<p>${acc.description }</p>
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
								<img class="float-start profile" src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg" >
							</a>
						</div>
						<div class="col-11">
							<h4>호스트:덕인님</h4>
							<span>회원 가입일: <fmt:formatDate value="${acc.user.createdDate }"/> </span>
						</div>
					</div>
				</div>
				<div class="col-6">
					<div class="row">
						<div class="col-3">
							<p><i class="bi bi-star-fill"></i> ${acc.reviewScore } 후기 ${acc.reviewCount }개</p>
						</div>
						<div class="col-4">
							<p><i class="bi bi-shield-fill-check"></i> 본인인증 완료</p>
						</div>
					</div>
				</div>
				<div class="col-6 mb-2">
					<p>응답률: 100%</p>
					<p>응답 시간: 1시간 이내</p>
					<a href="">
						<button type="button" class="btn btn-outline-dark btn-lg p-2">호스트에게 연락하기</button>
					</a>
				</div>
			</div>
			<hr>
			<div class="row mt-5">
				<h4>알아두어야 할 사항</h4>
				<div class="col-4">
					<h6>숙소 이용 규칙</h6>
				</div>
				<div class="col-4">
					<h6>건강과 안전</h6>
				</div>
				<div class="col-4">
					<h6>환불 정책</h6>
				</div>
			</div>
		</div>
	</div>
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
						<h6 class="mb-3">${con.name }</h6>
						<c:forEach items="${acc.conveniences }" var="accConvenience">
							<c:choose>
								<c:when test="${accConvenience.convenience.type eq con.no }">
									<p><span class="material-symbols-outlined"> ${accConvenience.convenience.iconName }</span>  ${accConvenience.convenience.name }</p>
									<hr>
								</c:when>
								<c:otherwise>
								</c:otherwise>
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
					<div class="row mb-3">
						<div class="col-2 rounded">
							<img class="rounded" src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg" style="width: 64px; height: 64px;">
						</div>
						<div class="col-10">
							<span>
								<p>${acc.name }</p>
							</span>
						</div>
					</div>
					<div class="col-6 mb-3 d-grid gap-2">
						<button class="btn btn-outline-secondary btn-lg p-3"><i class="bi bi-link"></i> 링크 복사</button>
					</div>
					<div class="col-6 mb-3 d-grid gap-2">
						<button class="btn btn-outline-secondary btn-lg p-3"><i class="bi bi-envelope"></i> 이메일</button>
					</div>
					<div class="col-6 mb-3 d-grid gap-2">
						<button class="btn btn-outline-secondary btn-lg p-3"><i class="bi bi-chat"></i> 메세지</button>
					</div>
					<div class="col-6 mb-3 d-grid gap-2">
						<button class="btn btn-outline-secondary btn-lg p-3"><i class="bi bi-whatsapp"></i> 왓츠앱</button>
					</div>
					<div class="col-6 mb-3 d-grid gap-2">
						<button onclick="" id="btnKakao" class="btn btn-outline-secondary btn-lg p-3"><img src="" alt="카카오톡 공유" /></button>
					</div>
					<!-- <button onclick="shareKakao()">
  							<img src="/img/icon_kakao.png" alt="카카오톡 공유" />
					</button> -->
					<div class="col-6 mb-3 d-grid gap-2">
						<a id="btnFacebook" class="btn btn-outline-secondary btn-lg p-3" href="javascript:shareFacebook();"><i class="bi bi-facebook"></i> 페이스북</a>
					</div>
					<div class="col-6 mb-3 d-grid gap-2">
						<a id="btnTwitter" class="btn btn-outline-secondary btn-lg p-3" href="javascript:shareTwitter();"><i class="bi bi-twitter"></i> 트위터</a>
					</div>
					<div class="col-6 mb-3 d-grid gap-2">
						<button class="btn btn-outline-secondary btn-lg"><i class="bi bi-code-slash"></i> 삽입</button>
					</div>
					
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
					<h6>욕실</h6>
					<p>
						<i class="bi bi-wifi"></i> 헤어드라이기
					</p>
					<hr>
					<p>
						<i class="bi bi-wifi"></i> 헤어드라이기
					</p>
					<hr>
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
	<div class="modal-dialog modal-fullscreen">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body text-center mb-0">
				<div>
					<div class="">
						<a href="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg" class="fresco" data-fresco-group="web">
						<img class="img-fluid" src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg"></a>
					</div>
					<div class="">
						<a href="https://a0.muscache.com/airbnb/static/destinations/o-Rome_Piazza017_480x320.jpg" class="fresco" data-fresco-group="web">
							<img class="img-fluid"  src="https://a0.muscache.com/airbnb/static/destinations/o-Rome_Piazza017_480x320.jpg">
						</a>
					</div>
					<div class="">
						<a href="https://a0.muscache.com/airbnb/static/destinations/o-Los_Angeles_480x320.jpg" class="fresco" data-fresco-group="web">
						<img class="img-fluid"  src="https://a0.muscache.com/airbnb/static/destinations/o-Los_Angeles_480x320.jpg"></a>
					</div>
					<div class="">
						<a href="https://a0.muscache.com/airbnb/static/destinations/o-Lisbon_480x320.jpg" class="fresco" data-fresco-group="web">
						<img class="img-fluid"  src="https://a0.muscache.com/airbnb/static/destinations/o-Lisbon_480x320.jpg"></a>
					</div>
					<div class="">
						<a href="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg" class="fresco" data-fresco-group="web">
						<img class="img-fluid"  src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg"></a>
					</div>
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
	<div class="modal-dialog modal-fullscreen">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">호스팅 지역</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-2">
						<div>
							<div class="contentbox">
								<h4>${acc.address }</h4>
								<div class="content">
									<p>${acc.description }</p>
								</div>
							</div>
							<div class="contentbox">
								<h4>교통편</h4>
								<div class="content">
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
<script type="text/javascript">


$(function() {
	// 모달 객체
	let accConvenienceModal = new bootstrap.Modal(document.getElementById("modal-con-acc"));
	let accShareModal = new bootstrap.Modal(document.getElementById("modal-share-acc"));
	let accSaveModal = new bootstrap.Modal(document.getElementById("modal-save-acc"));
	let accImageModal = new bootstrap.Modal(document.getElementById("modal-image-acc"));
	let accCoverModal = new bootstrap.Modal(document.getElementById("modal-cover-acc"));
	let accReportModal = new bootstrap.Modal(document.getElementById("modal-report-acc"));
	let accMapModal = new bootstrap.Modal(document.getElementById("modal-map-acc"));
	
	// 위시리스트 저장 모달
	$("#btn-open-save-modal").click(function() {
		accSaveModal.show();
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
	});
	$("#btn-open-image-modal2").click(function() {
		accImageModal.show();
	});
	$("#btn-open-image-modal3").click(function() {
		accImageModal.show();
	});
	$("#btn-open-image-modal4").click(function() {
		accImageModal.show();
	});
	$("#btn-open-image-modal5").click(function() {
		accImageModal.show();
	});
	$("#btn-open-image2-modal").click(function() {
		accImageModal.show();
	});
	$("#btn-open-image3-modal").click(function() {
		accImageModal.show();
	});
	
	// 글 긴거 더보기
	$('.contentbox').each(function(){
        var content = $(this).children('.content');
        var content_txt = content.text();
        var content_txt_short = content_txt.substring(0,100)+"...";
        var btn_more = $('<a href="javascript:void(0)" class="more">더보기</a>');

        
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
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);    
	
	// 카카오 맵
	var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div 
    mapOption2 = { 
        center: new kakao.maps.LatLng(longitude,latitude), // 지도의 중심좌표
        level: 5	 // 지도의 확대 레벨
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
	}
	
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);    
	
	// 달력
	
	var fp1 = $("#days").flatpickr({
		minDate: new Date(),
		defaultDate : new Date(),
		mode: "range",
		dateFormat: "Y-m-d",
		disable : ["2022-08-16", "2022-08-17"],
		"locale": "ko" 
	  	
	   });  
	  	fp1.config.onChange.push(function(selectedDates) {
	  		if (selectedDates[1]==null || selectedDates[0]==null){
	  			return;
	  		}
	  		let diffDate = Date.parse(selectedDates[1])-Date.parse(selectedDates[0])
	  		let day = Math.floor(diffDate / (1000 * 60 * 60 * 24))
	  		$(".day").text(day)
	  		let sum = ${acc.price } * day
	  		$("#day-price").text(sum.toLocaleString())
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
		
		
		
		$("#profile").click(function() {
			$("host").focus();
		})

		$("#nav-1").hide();

		$(window).scroll(function() {
			let scrollTop = $(document).scrollTop();
			if (scrollTop > 600) {

				$("#nav-1").show();
			} else {

				$("#nav-1").hide();

			}
		})

		$("#guest").hide();
		
		$("#guest-btn").click(function() {
			$("#guest").toggle();
		})
		
		// 스크롤스파이
		var scrollSpy = new bootstrap.ScrollSpy(document.body, {
			target : '#nav-1'
		})

		// 공유

		$("#btnTwitter").click(
				function() {
					var sendText = "aircnc"; // 전달할 텍스트
					var sendUrl = "devpad.tistory.com/"; // 전달할 URL
					window.open("https://twitter.com/intent/tweet?text="
							+ sendText + "&url=" + sendUrl);
				})
		$("#btnFacebook").click(
				function() {
					var sendUrl = "devpad.tistory.com/"; // 전달할 URL
					window.open("http://www.facebook.com/sharer/sharer.php?u="
							+ sendUrl);
				})
		/* $("#btnKakao").click(function() {
			 
			  // 사용할 앱의 JavaScript 키 설정
			  Kakao.init('6ec6d52326b138f515a86c55e152676c');
			 
			  // 카카오링크 버튼 생성
			  Kakao.Link.createDefaultButton({
			    container: '#btnKakao', // 카카오공유버튼ID
			    objectType: 'feed',
			    content: {
			      title: "개발새발", // 보여질 제목
			      description: "개발새발 블로그입니다", // 보여질 설명
			      imageUrl: "devpad.tistory.com/", // 콘텐츠 URL
			      link: {
			         mobileWebUrl: "devpad.tistory.com/",
			         webUrl: "devpad.tistory.com/"
			      }
			    }
			  });
			} */

		/* if (!Kakao.isInitialized()) {
			  Kakao.init('6ec6d52326b138f515a86c55e152676c');
			}
		var sendKakao = function() {
		    // 메시지 공유 함수
		  Kakao.Link.sendScrap({
		    requestUrl: 'http://localhost:80/', // 페이지 url
		    templateId:  80693, // 메시지템플릿 번호
		    templateArgs: {
		            PROFILE : ${THU} // 프로필 이미지 주소 ${PROFILE}
		      THUMB: ${THU}, // 썸네일 주소 ${THUMB}
		      TITLE: ${TITLE}, // 제목 텍스트 ${TITLE}
		      DESC: ${DESC}, // 설명 텍스트 ${DESC}
		    },
		  });
		}; */

		
		$(".guestbtn").click(function() {
			
			
			$("#adultCount").text($(".adultCount").text());		
			$("#childrenCount").text($(".childrenCount").text());		
			$("#infantCount").text($(".infantCount").text());		
			$("#petCount").text($(".petCount").text());		
			$(function() {
				$("#adultCount").text($(".adultCount").text());		
				$("#childrenCount").text($(".childrenCount").text());		
				$("#infantCount").text($(".infantCount").text());		
				$("#petCount").text($(".petCount").text());		
			})
		})
		
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
		
       
		
		       
})


</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ec6d52326b138f515a86c55e152676c"></script>
</body>
</html>