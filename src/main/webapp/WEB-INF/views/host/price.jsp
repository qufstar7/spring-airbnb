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
<title>요금 설정</title>
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
			
			<!-- 동영상 -->
			<video class="photoVideo" autoplay muted crossorigin="anonymous" playsinline="" preload="auto" style="object-fit: cover; object-position: 0px 25%;"><source src="https://a0.muscache.com/v/9c/d4/9cd47434-c6bd-58ec-90b7-b50aa7dba461/9cd47434c6bd58ec90b7b50aa7dba461_4000k_1.mp4?imformat=h265" type="video/mp4; codecs=hevc"><source src="https://a0.muscache.com/v/9c/d4/9cd47434-c6bd-58ec-90b7-b50aa7dba461/9cd47434c6bd58ec90b7b50aa7dba461_4000k_1.mp4" type="video/mp4"></video>
			<div class="shadowBox"></div>
			<div class="downBox">
				<button class="downBoxBtn m-3" type="button">
					<div class="downBoxTextBtn">
						<div>동영상 재생하기</div>
					</div>
					<div>
						<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: white;">
							<path d="M27.024 14.273L6.008 2.013c-.461-.268-1-.342-1.517-.206A2 2 0 0 0 3 3.741V28.26a2.002 2.002 0 0 0 3.008 1.728l21.015-12.26a2.003 2.003 0 0 0 .001-3.454z">
							</path>
						</svg>
					</div>
				</button>
				<button aria-label="일시 중지" type="button" class="downBoxStopBtn">
					<span class="position-relative" s>
						<svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: white;">
							<path d="M13 1v14H9V1zM7 1v14H3V1z"></path>
						</svg>
					</span>
				</button>
						
				<div role="text" class="left-photo-text">이제 요금을 설정해 주세요.</div>
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

			<!-- mainbox -->
			<form id="price-insert-form" method="post" action="/host/submitPrice">
			<div class="main-box align-self-center bg-white p-4">
				<div class="main-middle-box m-auto" style="height:100%;">
					<div class="plusMiusBox float-end" id="guestBtnBox">
						<button id="guestMinusBtn" class="plusMinusBtn2 minusBtn" type="button" aria-label="감소">
							<span class="plusMinusIconSpan">
								<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentColor; stroke-width: 5.333333333333333; overflow: visible" aria-hidden="true" role="presentation" focusable="false">
									<path d="m2 16h28"></path>
								</svg>
							</span>
						</button>
						<div class="mx-3" id="priceInputBox">
							<input id="priceInput" type="number" min="0" max="50000000" placeholder="₩00" autocomplete="off" name="price" value="" aria-invalid="true">
						</div>
						<button id="guestPlusBtn" class="plusMinusBtn2 plusBtn" type="button" aria-label="증가">
							<span class="plusMinusIconSpan">
								<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentColor; stroke-width: 5.333333333333333; overflow: visible" aria-hidden="true" role="presentation" focusable="false">
									<path d="m2 16h28m-14-14v28"></path>
								</svg>
							</span>
						</button>						
					</div>
				    <div class="fs-5 fw-light mt-2">
					    <p class="d-inline">/</p>
					    <p class="d-inline">박</p>
				    </div>
				</div>
			</div>
		    </form>
		    		    
			<!-- 값 유효성 체크 경고문 박스 -->
<!-- 			<div id="checkAlert" class="m-0 mt-2 text-danger fw-italic fw-light" style="display: none;">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle-fill me-1" viewBox="0 0 16 16">
			  		<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
				</svg>
				<span>가격을 제대로 입력해주세요</span>
			</div> -->

			<!-- rightDiv footer -->
			<footer class="footer mt-auto pb-3 bg-light">
				<div class="container-fluid">
					<!-- 진행상황 bar -->
					<div class="progress mb-2">
						<div class="progress-bar bg-dark" style="width: 91.4%;ㅇ"
							role="progressbar" aria-valuenow="91.4" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<!-- 뒤로/다음버튼 -->
					<div class="">
						<button id="back-btn"
							class="float-start btn btn-none ms-4 fs-6 text-decoration-underline text-black border-0"
							type="button" onclick="history.go(-1)"
							style="padding-top: 14px">뒤로</button>
					</div>
					<div class="">
						<button id="next-btn" class="float-start btn btn-dark float-end"
							type="submit" form="price-insert-form" style="width: 80px; height: 48px;">
							숙소 검토하기</a>
					</div>
				</div>
			</footer>

		</div>

	</div>

<script>
$(function() {
/* 	$("#priceInput").on("keydown", function(event){
		if (event.defaultPrevented) {
			return; // default action이 취소되면 아무것도 하지 않아야 한다.
		}
		var handled = false;
		
		// 숫자 0~9 외 입력 제한
		if(event.keyCode >= 48 && event.keyCode <= 57){
			handled = false;
		} else {
			handled = true;
		}
		
		if (handled) {
			console.log(event.keyCode);
			
			// 이벤트 처리되면 이중 작업 방지
			event.preventDefault();
		}
	}) */
	
	
/* 	$("#price-insert-form").submit(function() {
		let priceValue = parseInt($(":input[name=price]").val());
		if (isEmpty(priceValue) || priceValue < 0) {
			$("#checkAlert")
					.removeClass("text-primary");
			$("#checkAlert").addClass("text-danger");
			$("#checkAlert").css('display', 'flex');
			$("#checkAlert span")
					.text("가격을 제대로 입력해주세요.");
			return false;
		}
		
	}) */
})
</script>
</body>
</html>