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
<title>숙소 위치 입력</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/hostingstyle.css">
</head>
<body>
	<!-- 숙소유형 선택 메인 -->
	<div class="host-box">
		<div id="left-div">
			<!-- leftDiv text -->
			<div class="align-self-center m-5">
				<div role="text" class="left-main-text">숙소 위치는 어디인가요?</div>
			</div>
		</div>

		<!-- 오른쪽 영역 -->
		<div id="right-div">
			<!-- rightDiv header nav -->
			<div class="right-div-header">
				<nav class="navbar navbar-expand-lg navbar-light p-4">
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
										</div> <span class="profile-text">슈퍼호스트에게 물어보기</span>
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
				<div id="map" style="width:100%; height:1106px;"></div>
			</div>

			<!-- 주소 입력폼 -->
			<div
				class="location-form border border-white rounded translate-middle p-4">
				<div
					class="location-form-header fs-5 fw-bolder m-0 text-center pb-4">
					주소를 입력하세요</div>

				<!-- 스크롤영역 -->
				<div class="location-form-scroll position-relative">
					<!-- 입력폼 -->
					<div class="rounded">
						<div class="form-floating">
							<input type="text" class="form-control ps-3"
								id="locationFormStateRegion" placeholder="주/도" value="">
							<label class="input-form-label fs-6 ps-3"
								for="locationFormStateRegion">주/도</label>
						</div>
						<div class="form-floating">
							<input type="text" class="form-control ps-3"
								id="locationFormCity" placeholder="도시" value=""> <label
								class="input-form-label fs-6 ps-3" for="locationFormCity">도시</label>
						</div>
						<div class="form-floating">
							<input type="text" class="form-control ps-3"
								id="locationFormRoadName" placeholder="도로명" value=""> <label
								class="input-form-label fs-6 ps-3" for="locationFormRoadName">도시</label>
						</div>
						<div class="form-floating">
							<input type="text" class="form-control ps-3"
								id="locationFormSpecificAddress"
								placeholder="아파트이름, 동호수 등(선택사항)" value=""> <label
								class="input-form-label fs-6 ps-3"
								for="locationFormSpecificAddress">아파트이름, 동호수 등(선택사항)</label>
						</div>
						<div class="form-floating">
							<input type="text" class="form-control ps-3"
								id="locationFormZipcode" placeholder="우편번호" value=""> <label
								class="input-form-label fs-6 ps-3" for="locationFormZipcode">우편번호</label>
						</div>
					</div>

					<div class="border-top mt-4 py-4">
						<div class="d-flex flex-box">
							<!-- 구체적인 위치 표시하기 -->
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
						<div class="googleMapSmallBox mt-3 position-absolute" style="width:550px; height:280px;" style="overflow:hidden; ">
							<div id="map2" style="width: 100%; height: 100%"></div>
						</div>
					</div>
				</div>
			</div>

			<!-- rightDiv footer -->
			<footer class="footer mt-auto py-3 bg-light">
				<div class="container-fluid">
					<!-- 진행상황 bar -->
					<div class="progress mb-2">
						<div class="progress-bar bg-dark" style="width: 10%;"
							role="progressbar" aria-valuenow="10" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<!-- 뒤로/다음버튼 -->
					<div class="">
						<button id="back-btn"
							class="float-start btn btn-none ms-4 fs-6 text-decoration-underline text-black border-0"
							type="button" onclick="location.href='/host/become-a-host'"
							style="padding-top: 14px">뒤로</button>
					</div>
					<div class="">
						<button id="next-btn" class="float-start btn btn-dark float-end"
							type="button" onclick="" style="width: 80px; height: 48px;">
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
			// 구체적인 위치표시하기 스위치버튼을 클릭하면
			// 1. 게스트에게 숙소 위치를 구체적으로 알려줄수 있다.
			// 	  선택사항인 아파트 이름과 동호수 정보를 알려준다.
			// 2. 작은 지도를 확대한다.
			$(".form-check-input").on("click", function() {
				// 클래스 속성 변경
				$(".form-check-input").toggleClass("switch-btn-clicked");

				// 숙소위치알려주기여부(N/Y) 변경
				markSpecificLoc();

				// 지도확대
				smallMapExpand();
			})

			function smallMapExpand() {

			}

			function markSpecificLoc() {

			}

		})

		/* 		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(function() {
			'use strict'

			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.querySelectorAll('.needs-validation')

			// Loop over them and prevent submission
			Array.prototype.slice.call(forms).forEach(function(form) {
				form.addEventListener('submit', function(event) {
					if (!form.checkValidity()) {
						event.preventDefault()
						event.stopPropagation()
					}

					form.classList.add('was-validated')
				}, false)
			})
		})() */
	</script>
</body>
</html>