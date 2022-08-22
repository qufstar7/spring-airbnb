<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preload" href="${path}/resources/css/hostingstyle.css"
	as="style">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>등록 완료</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/hostingstyle.css">
</head>
<body>

	<!-- 로고 홈링크 -->
	<a id="logo-link" href="/">
		<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"	aria-label="에어비앤비 홈페이지" role="img" focusable="false">
			<path d="M16 1c2.008 0 3.463.963 4.751 3.269l.533 1.025c1.954 3.83 6.114 12.54 7.1 14.836l.145.353c.667 1.591.91 2.472.96 3.396l.01.415.001.228c0 4.062-2.877 6.478-6.357 6.478-2.224 0-4.556-1.258-6.709-3.386l-.257-.26-.172-.179h-.011l-.176.185c-2.044 2.1-4.267 3.42-6.414 3.615l-.28.019-.267.006C5.377 31 2.5 28.584 2.5 24.522l.005-.469c.026-.928.23-1.768.83-3.244l.216-.524c.966-2.298 6.083-12.989 7.707-16.034C12.537 1.963 13.992 1 16 1zm0 2c-1.239 0-2.053.539-2.987 2.21l-.523 1.008c-1.926 3.776-6.06 12.43-7.031 14.692l-.345.836c-.427 1.071-.573 1.655-.605 2.24l-.009.33v.206C4.5 27.395 6.411 29 8.857 29c1.773 0 3.87-1.236 5.831-3.354-2.295-2.938-3.855-6.45-3.855-8.91 0-2.913 1.933-5.386 5.178-5.42 3.223.034 5.156 2.507 5.156 5.42 0 2.456-1.555 5.96-3.855 8.907C19.277 27.766 21.37 29 23.142 29c2.447 0 4.358-1.605 4.358-4.478l-.004-.411c-.019-.672-.17-1.296-.714-2.62l-.248-.6c-1.065-2.478-5.993-12.768-7.538-15.664C18.053 3.539 17.24 3 16 3zm.01 10.316c-2.01.021-3.177 1.514-3.177 3.42 0 1.797 1.18 4.58 2.955 7.044l.21.287.174-.234c1.73-2.385 2.898-5.066 2.989-6.875l.006-.221c0-1.906-1.167-3.4-3.156-3.421h-.001z"></path>
		</svg>
	</a>

	<!-- 전체 박스 -->
	<div class="host-box">
	
		<!-- 왼쪽 영역 -->
		<div id="left-div">
			<!-- leftDiv text -->
			<div class="align-self-center m-5">
				<div role="text" class="left-main-text">새로운 숙소 페이지를 확인하세요!</div>
				<div class="fs-6 fw-light text-white">축하드립니다! 호스트 숙소가 성공적으로 저장되었습니다.</div>
			</div>
		</div>

		<!-- 오른쪽 영역 -->
		<div id="right-div">
			<!-- rightDiv header nav -->
			<div class="right-div-header">
				<nav class="navbar navbar-expand-lg navbar-light pt-4 pb-3 bg-white" style="z-index:100;">
					<div class="container-fluid flex-row-reverse">
						<div id="navbarNav">
							<ul class="navbar-nav">
								<li class="nav-item nav-ask-superhost"><a
									class="profile-btn right-nav-btn nav-link active border rounded-pill"
									href="">
										<div>
											<img class="sm-profile-img front-img"
												src="/resources/images/host/julian-wan.jpg"
												aria-hidden="true"> <img
												class="sm-profile-img middle-img"
												src="/resources/images/host/jurica-koletic.jpg"
												aria-hidden="true"> <img
												class="sm-profile-img back-img"
												src="/resources/images/host/michael-dam.jpg"
												aria-hidden="true">
										</div> <span class="profile-text">${LOGIN_USER.name }님의 숙소 등록하기</span>
								</a></li>
								<li class="nav-item"><a
									class="right-nav-btn nav-link active border rounded-pill"
									href="">도움말</a></li>
								<li class="nav-item"><a
									class="right-nav-btn nav-link active border rounded-pill"
									href="">저장 및 나가기</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>




			<!-- rightDiv main -->
			<div class="main-box align-self-center bg-white">
				<div class="phoneBox">
					<div class="phoneScroll m-0">
						<!-- 스크롤영역 -->
						<div class="position-relative">
							<!-- 사진 -->
							<div class="phoneImage" >
								<img class="phoneThumbnail" src="/resources/images/acc/${acc.imageCover }">
							</div>
							<!-- 이름 -->
							<h1 class="PhoneName border-bottom fs-2 fw-bold mx-4 py-4">
								${acc.name }
							</h1>
							<!-- 유저 -->
							<div class="phoneUser border-bottom mx-4 py-4">
								<h2 class="fs-4 fw-bold">
									${acc.user.name }님의 숙소, ${types[0].name} ${types[1].name} ${types[2].name}
								</h2>
								<div>
									<img class="rounded-circle float-start" src="/resources/images/profile/${acc.user.profileImage }"  alt="${acc.user.profileImage }">
								</div>
							</div>
							<!-- Guests 페이지 -->
							<div class="border-bottom fs-5 mx-4 py-4">
								최대 인원 ${acc.guest }명 · 
								침실수 ${room.bedroom }개 · 
								침대수 ${room.bed }개 · 
								욕실수 ${room.bathroom }개
							</div>
							<!-- 설명 -->
							<div class="phoneDescription border-bottom mx-4 py-4">
								${acc.description }
							</div>
							<!-- 편의시설 -->
							<div class="fs-5 mx-4 pt-4">
								<div class="fs-5 fw-bold">편의시설</div>
									<c:forEach var="c" items="${cons }" end="4">
									<ul class="fs-6 phoneConveniencesUl">
										<li class="phoneConveniencesList">
											<div>${c.convenience.name }</div>
											<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
											<span class="material-symbols-outlined">
											${c.convenience.iconName }
											</span>
									</ul>
									</c:forEach>
									
									<c:if test="${not empty cons[5] }">
										<c:forEach var="c" items="${cons }" begin="5" varStatus="vs">
										<c:if test="${vs.last }">
											<c:set var="leftover" value="${vs.index -4}" />
										</c:if>
										</c:forEach>
									<div class="border-bottom fs-6 fw-lighter pb-4" style="color:#717171;">+ 그 밖의 편의시설 ${leftover}개</div>
									</c:if>
							</div>
							<!-- 위치 -->
							<div class="fs-5 mx-4 py-4">
								<div class="fs-5 fw-bold">위치</div>
								<div class="mt-2 py-2">${acc.address }</div>
								<!-- 안내문 -->
								<div class="" style="font-size:13px;color:#717171;">
									숙소 주소는 에어비앤비 
									<a class="text-reset" href="">개인정보 처리방침</a>
									에 따라 예약을 완료한 게스트에게만 공개됩니다.
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			

			<!-- rightDiv footer -->
			<footer class="footer mt-auto py-3 bg-light">
				<div class="container-fluid">
					<!-- 진행상황 bar -->
					<div class="progress mb-2">
						<div class="progress-bar bg-dark" style="width: 100%;" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<!-- 뒤로/다음버튼 -->
					<div class="">
						<button id="back-btn" class="float-start btn btn-none ms-4 fs-6 text-decoration-underline text-black border-0" type="button" onclick="history.go(-1)" style="padding-top: 14px">뒤로</button>
					</div>
					<div class="">
						<button id="next-btn" type="button" onclick="location.href='/host/profile'" class="float-start btn btn-dark float-end me-5" style="width: 180px; height: 48px;">
							숙소 등록 완료하기
						</button>
					</div>
				</div>
			</footer>

		</div>

	</div>
<script>
$(function(){
	var $ul = $(".phoneConveniencesUl").length;
	
	console.log($ul);
	
	if($ul > 5) {
		
	}
})
</script>
</body>
</html>