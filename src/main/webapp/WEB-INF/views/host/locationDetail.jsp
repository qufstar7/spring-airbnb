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
<title>주소의 상세 정보</title>
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
				<div role="text" class="left-main-text">핀의 위치가 정확한가요?</div>
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
			<div class="main-box align-self-center bg-white" style="overflow:hidden;">
				<!-- 구글지도배경 -->
				<div id="map" style="width:100%; height:1100px;"></div>
			</div>

			<!-- 주소 입력폼 -->
			<form id="locationRegisterForm" action="insertLocation" method="post">
			<div
				class="location-form border border-white rounded-4 translate-middle p-4">
				<div
					class="location-form-header fs-5 fw-bolder m-0 text-center pb-4 mt-3">
					주소를 입력하세요</div>

				<!-- 스크롤영역 -->
				<div class="location-form-scroll position-relative mt-3">
					<!-- 입력폼 -->
					<div class="rounded">
						<div class="form-floating">
							<input type="text" class="form-control ps-3" name="stateRegion"
								id="locationFormStateRegion" placeholder="주/도" value="">
							<label class="input-form-label fs-6 ps-3"
								for="locationFormStateRegion">주/도</label>
						</div>
						<div class="form-floating">
							<input type="text" class="form-control ps-3" name="city"
								id="locationFormCity" placeholder="도시" value=""> <label
								class="input-form-label fs-6 ps-3" for="locationFormCity">도시</label>
						</div>
						<div class="form-floating">
							<input type="text" class="form-control ps-3" name="roadName"
								id="locationFormRoadName" placeholder="도로명" value=""> <label
								class="input-form-label fs-6 ps-3" for="locationFormRoadName">도로명</label>
						</div>
						<div class="form-floating">
							<input type="text" class="form-control ps-3" name="specificAddress"
								id="locationFormSpecificAddress"
								placeholder="아파트이름, 동호수 등(선택사항)" value=""> <label
								class="input-form-label fs-6 ps-3"
								for="locationFormSpecificAddress">아파트이름, 동호수 등(선택사항)</label>
						</div>
						<div class="form-floating">
							<input type="text" class="form-control ps-3" name="zipCode"
								id="locationFormZipcode" placeholder="우편번호" value=""> <label
								class="input-form-label fs-6 ps-3" for="locationFormZipcode">우편번호</label>
						</div>
					</div>
					
					
					<!-- 값 유효성 체크 경고문 박스 -->
					<div id="checkAlert" class="m-0 mt-2 text-danger fw-italic fw-light" style="display:none;">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle-fill me-1" viewBox="0 0 16 16">
						  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
						</svg>
						<span>주소를 제대로 입력해 주세요.</span>
					</div>
					
					
					<!-- 구체적인 위치 표시하기 -->
					<div class="border-top mt-4 pt-4" style="padding-bottom:50px;">
						<div class="d-flex flex-box mb-2">
							<!-- 텍스트박스 -->
							<div>
								<div class="fs-6 fw-bold">구체적인 위치 표시하기</div>
								<span class="fw-light">게스트에게 숙소 위치를 더욱 구체적으로 알려주실 수 있습니다.</span>
							</div>
							<!-- 스위치버튼 -->
							<div class="form-check form-switch me-1">
								<input class="form-check-input" type="checkbox" role="switch"
									id="flexSwitchCheckDefault" style="width: 50px; height: 30px">
							</div>
						</div>
						<!-- 구체적인 지도 -->
						<div class="mapSmallBox mt-3 position-absolute" style="width:550px; height:280px; overflow:hidden;">
							<div id="map2" style="width: 100%; height: 100%"></div>
						</div>
					</div>
					
				</div>
				<!-- 확인 버튼 -->
				<div class="mt-4">
					<button id="check-btn" class="float-start btn btn-dark"
						type="button" style="width: 80px; height: 48px;">
						확인</a>
				</div>
			</div>
			</form>

			<!-- rightDiv footer -->
			<footer class="footer mt-auto pb-3 bg-light">
				<div class="container-fluid">
					<!-- 진행상황 bar -->
					<div class="progress mb-2">
						<div class="progress-bar bg-dark" style="width: 33.3%;"
							role="progressbar" aria-valuenow="33.3" aria-valuemin="0"
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
							type="submit" onclick="location.href='/host/locationDetail'" style="width: 80px; height: 48px;">
							다음</a>
					</div>
				</div>
			</footer>

		</div>

	</div>


	<!-- 지도를 넣기 위해 발급키 불러오기 -->
	<script async="" defer=""
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDUhECXdl4AVt1OdrUikgEBIzOd5VFE0Fk&callback=initMap"
		type="text/javascript">		
	</script>

	<!-- 좌표입력 후 지도 객체 생성 -->
	<script>
		function initMap() {
			var location = {
				lat : 37.5729484,
				lng : 126.9922309
			};
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 12,
				center : location,
				scrollwheel : false,
				disableDefaultUI : true,
				disableDoubleClickZoom: true,
				draggable: false,
				clickable: false
			});
			var marker = new google.maps.Marker({
				position : location,
				map : map,
			});

			var map2 = new google.maps.Map(document.getElementById('map2'), {
				zoom : 18,
				center : location,
				scrollwheel : false,
				disableDoubleClickZoom: true,
				clickableIcons : false,
			});
			var marker2 = new google.maps.Marker({
				position : location,
				map : map2,
			});

			google.maps.event.addDomListener(window, "load", initMap);
		}
	</script>

	<script type="text/javascript">
		$(function() {
			// 값 체크하기
			let $alert = $("#liveAlert");
			console.log($alert.val());
			$("#check-btn").on("click", function() {
				// 주/도 필드에 값이 있는지 체크하기
				console.log("check-btn 클릭!");
				let stateRegionValue = $.trim( $(":input[name=stateRegion]").val() );
				if (stateRegionValue === "") {
					$("#checkAlert").css('display', 'flex');
					$("#checkAlert span").text("주/도를 입력해주세요.");	
					return false;
				}
				
				// 도시 필드에 올바른 값이 설정되었는지 체크하기
				let city = $.trim( $(":input[name=city]").val() );
				if (city === "") {
					$("#checkAlert").css('display', 'flex');
					$("#checkAlert span").text("도시를 입력해주세요.");	
					return false;
				}
				
				// 도로명이 작성 되어있는지 체크하기
				let roadName = $.trim( $(":input[name=roadName]").val() );
				if (roadName === "") {
					$("#checkAlert").css('display', 'flex');
					$("#checkAlert span").text("도로명을 입력해주세요.");	
					return false;
				}
				
				// 우편번호에 값이 있는지 체크하기
				let zipCode = parseInt($(":input[name=price]").val());
				if (zipCode === "") {
					$("#checkAlert").css('display', 'flex');
					$("#checkAlert span").text("우편번호를 입력해주세요.");	
					return false;
				}
				return true;
			});
			
			
			// 구체적인 위치표시하기 스위치버튼을 클릭하면
			// 1. 게스트에게 숙소 위치를 구체적으로 알려줄수 있다.
			// 	  선택사항인 아파트 이름과 동호수 정보를 알려준다.
			// 2. 작은 지도를 확대한다.
			$(".form-check-input").on("click", function() {
				// 클래스 속성 변경
				$(".form-check-input").toggleClass("switch-btn-clicked");

				// 구체적숙소위치알려주기여부(N/Y) 변경 함수 실행
				markSpecificLoc();

				// 지도확대 함수 실행
				smallMapExpand();
			})
			// 구체적숙소위치알려주기여부(N/Y) 변경
			function markSpecificLoc() {
				
			}
			// 지도확대
			function smallMapExpand() {
				
			}
			
			// 다음버튼 클릭시 ajax로 페이지 변경 (핀위치조정 페이지)
			$("#next-btn").click(function() {
				correctPinLocation();
			})
			
			// ajax 핀위치조정 페이지
			function correctPinLocation() {
				
			}
			
		})
	</script>
	
</body>
</html>