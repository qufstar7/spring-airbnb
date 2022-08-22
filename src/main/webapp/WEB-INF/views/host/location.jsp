<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preload" href="${path}/resources/css/hostingstyle.css" as="style">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>숙소 위치</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/hostingstyle.css">
</head>
<body>

	<!-- 로고 홈링크 -->
	<a id="logo-link" href="/"> 
		<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-label="에어비앤비 홈페이지" role="img" focusable="false">
			<path d="M16 1c2.008 0 3.463.963 4.751 3.269l.533 1.025c1.954 3.83 6.114 12.54 7.1 14.836l.145.353c.667 1.591.91 2.472.96 3.396l.01.415.001.228c0 4.062-2.877 6.478-6.357 6.478-2.224 0-4.556-1.258-6.709-3.386l-.257-.26-.172-.179h-.011l-.176.185c-2.044 2.1-4.267 3.42-6.414 3.615l-.28.019-.267.006C5.377 31 2.5 28.584 2.5 24.522l.005-.469c.026-.928.23-1.768.83-3.244l.216-.524c.966-2.298 6.083-12.989 7.707-16.034C12.537 1.963 13.992 1 16 1zm0 2c-1.239 0-2.053.539-2.987 2.21l-.523 1.008c-1.926 3.776-6.06 12.43-7.031 14.692l-.345.836c-.427 1.071-.573 1.655-.605 2.24l-.009.33v.206C4.5 27.395 6.411 29 8.857 29c1.773 0 3.87-1.236 5.831-3.354-2.295-2.938-3.855-6.45-3.855-8.91 0-2.913 1.933-5.386 5.178-5.42 3.223.034 5.156 2.507 5.156 5.42 0 2.456-1.555 5.96-3.855 8.907C19.277 27.766 21.37 29 23.142 29c2.447 0 4.358-1.605 4.358-4.478l-.004-.411c-.019-.672-.17-1.296-.714-2.62l-.248-.6c-1.065-2.478-5.993-12.768-7.538-15.664C18.053 3.539 17.24 3 16 3zm.01 10.316c-2.01.021-3.177 1.514-3.177 3.42 0 1.797 1.18 4.58 2.955 7.044l.21.287.174-.234c1.73-2.385 2.898-5.066 2.989-6.875l.006-.221c0-1.906-1.167-3.4-3.156-3.421h-.001z"></path>
		</svg>
	</a>

	<!-- 전체 박스 -->
	<div class="host-box">

		<!-- 왼쪽 영역 -->
		<div id="left-div">
			<!-- leftDiv text -->
			<div class="align-self-center m-5">
				<div role="text" class="left-main-text">숙소 위치는 어디인가요?</div>
			</div>
		</div>

		<!-- 오른쪽 영역 -->
		<div id="right-div">
			<!-- rightDiv header nav -->

			<div id="bgMap" class="" style="height: 95vh;">

				<nav class="navbar navbar-expand-lg navbar-light pt-4 pb-3" style="z-index: 100;">
					<div class="container-fluid flex-row-reverse">
						<div id="navbarNav">
							<ul class="navbar-nav">
								<li class="nav-item nav-ask-superhost">
									<a id="locationProfileBtn" class="profile-btn right-nav-btn nav-link active rounded-pill" href="">
										<div id="locationProfileImgBox">
											<img id="locationProfileImg" class="sm-profile-img front-img" src="/resources/images/host/julian-wan.jpg" aria-hidden="true"> 
											<img id="locationProfileImg" class="sm-profile-img middle-img" src="/resources/images/host/jurica-koletic.jpg" aria-hidden="true"> 
											<img id="locationProfileImg" class="sm-profile-img back-img" src="/resources/images/host/michael-dam.jpg" aria-hidden="true">
										</div> <span id="locationProfileText" class="profile-text">${LOGIN_USER.name }님의 숙소 등록하기</span>
									</a>
								</li>
								<li class="nav-item">
									<a id="locationRightNavBtn" class="right-nav-btn nav-link active border rounded-pill" href="">도움말</a>
								</li>
								<li class="nav-item">
									<a id="locationRightNavBtn" class="right-nav-btn nav-link active border rounded-pill" href="">저장 및 나가기</a>
								</li>
							</ul>
						</div>
					</div>
				</nav>

			</div>

			<!-- 주소 입력폼 -->
			<form id="locationRegisterForm" action="submitAddress" method="post">
				<div style="z-index: 1; height: 60vh;" class="location-form border border-white rounded-4 translate-middle p-4">
					<div class="location-form-header fs-5 fw-bolder m-0 text-center pb-4 mt-3">주소를 입력하세요</div>

					<!-- 스크롤영역 -->
					<div class="location-form-scroll position-relative mt-3">
						<!-- 입력폼 -->
						<div class="rounded">
							<div class="form-floating">
								<input type="text" class="form-control ps-3" name="stateRegion" id="locationFormStateRegion" placeholder="주/도" value="">
								<label class="input-form-label fs-6 ps-3" for="locationFormStateRegion">주/도</label>
							</div>
							<div class="form-floating">
								<input type="text" class="form-control ps-3" name="city" id="locationFormCity" placeholder="도시" value="">
								<label class="input-form-label fs-6 ps-3" for="locationFormCity">도시</label>
							</div>
							<div class="form-floating">
								<input type="text" class="form-control ps-3" name="roadName" id="locationFormRoadName" placeholder="도로명 (필수)" value="">
								<label class="input-form-label fs-6 ps-3" for="locationFormRoadName">도로명 (필수)</label>
							</div>
							<div class="form-floating">
								<input type="text" class="form-control ps-3" name="specificAddress" id="locationFormSpecificAddress" placeholder="아파트이름, 동호수 등" value=""> 
								<label class="input-form-label fs-6 ps-3" for="locationFormSpecificAddress">아파트이름, 동호수 등</label>
							</div>
							<div class="form-floating">
								<input type="text" class="form-control ps-3" name="zipCode" id="locationFormZipcode" placeholder="우편번호" value="">
								<label class="input-form-label fs-6 ps-3" for="locationFormZipcode">우편번호</label>
							</div>
						</div>

						<!-- 위도, 경도 전달용 히든필드 -->
						<input class="hiddenField1" type="hidden" name="latitude" value="0">
						<input class="hiddenField2" type="hidden" name="longitude" value="0">

						<!-- 값 유효성 체크 경고문 박스 -->
						<div id="checkAlert" class="m-0 mt-2 text-danger fw-italic fw-light" style="display: none;">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle-fill me-1" viewBox="0 0 16 16">
						  		<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
							</svg>
							<span>주소를 제대로 입력해 주세요.</span>
						</div>


						<!-- 구체적인 위치 표시하기 -->
						<div class="border-top mt-4 pt-4" style="padding-bottom: 280px;">
							<div class="d-flex flex-box mb-2">
								<!-- 텍스트박스 -->
								<div>
									<div class="fs-6 fw-bold">구체적인 위치 표시하기</div>
									<span class="fw-light">게스트에게 숙소 위치를 더욱 구체적으로 알려주실 수 있습니다.</span>
								</div>
								<!-- 스위치버튼 -->
								<div class="form-check form-switch me-1">
									<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault" style="width: 50px; height: 30px">
								</div>
							</div>
							<!-- 구체적인 지도 -->
							<div class="mapSmallBox mt-3 position-absolute" style="width: 100%; max-width: 550px; height: 350px; overflow: hidden;">
								<div id="map" style="width: 100%; height: 100%"></div>
							</div>
						</div>

					</div>
					<!-- 확인 버튼 -->
					<div class="mt-4">
						<button id="check-btn" class="float-start btn btn-dark"	type="button" style="width: 80px; height: 48px;">확인</button>
					</div>
				</div>

			</form>

			<!-- rightDiv footer -->
			<footer class="footer mt-auto pb-3 bg-light" id="locationFooter">
				<div class="container-fluid">
					<!-- 진행상황 bar -->
					<div class="progress mb-2">
						<div class="progress-bar bg-dark" style="width: 33.3%;"
							role="progressbar" aria-valuenow="33.3" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<!-- 뒤로/다음버튼 -->
					<div id="">
						<button id="back-btn" class="float-start btn btn-none ms-4 text-decoration-underline text-black border-0" type="button" onclick="history.go(-1)" style="padding-top: 14px">뒤로</button>
					</div>
					<div id="">
						<button id="next-btn" class="float-start btn btn-dark float-end me-5" form="locationRegisterForm" type="submit" disabled style="width: 80px; height: 48px;">다음</button>
					</div>
				</div>
			</footer>

		</div>

	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1cab848c52c03c8f8a6cb0e9effb127a&libraries=services"></script>
	<script>
		$(function() {
			// 엔터키방지
			document.addEventListener('keydown', function(event) {
				if (event.keyCode === 13) {
					event.preventDefault();
				}
				;
			}, true);

			// 카카오맵 1
			var bgMapContainer = document.getElementById('bgMap'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표(제주도 카카오)
				draggable : false,
				disableDoubleClickZoom : true,
				level : 7
			// 지도의 확대 레벨
			};
			// 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
			var bgmap = new kakao.maps.Map(bgMapContainer, mapOption);

			// 카카오맵 2
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표(제주도 카카오)
				draggable : false,
				disableDoubleClickZoom : true,
				level : 5
			// 지도의 확대 레벨
			};
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다	

			//마커가 표시될 위치입니다 
			var markerPosition = new kakao.maps.LatLng(33.450701, 126.570667);
			//마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : markerPosition
			});

			//마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();
			// 지도 타입 컨트롤을 지도에 표시합니다
			//map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);	
			function getInfo() {
				// 지도의 현재 중심좌표를 얻어옵니다 
				var center = map.getCenter();
				// 지도의 현재 레벨을 얻어옵니다
				var level = map.getLevel();
				// 지도타입을 얻어옵니다
				var mapTypeId = map.getMapTypeId();
				// 지도의 현재 영역을 얻어옵니다 
				var bounds = map.getBounds();
				// 영역의 남서쪽 좌표를 얻어옵니다 
				var swLatLng = bounds.getSouthWest();
				// 영역의 북동쪽 좌표를 얻어옵니다 
				var neLatLng = bounds.getNorthEast();
				// 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
				var boundsStr = bounds.toString();
				var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
				message += '경도 ' + center.getLng() + ' 이고 <br>';
				message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
				message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
				message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', '
						+ swLatLng.getLng() + ' 이고 <br>';
				message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', '
						+ neLatLng.getLng() + ' 입니다';
				console.log(message);
			}

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소 입력 후 '확인' 버튼 클릭시
			// 주소 검색 후 마커,지도 이동 / 값 체크하기 / hiddenField 수정
			$("#check-btn").on("click", function() {
				// 입력한 주소 객체 생성
				var stateRegionValue = $.trim($(
						":input[name=stateRegion]").val());
				var city = $.trim($(":input[name=city]").val());
				var roadName = $
						.trim($(":input[name=roadName]").val());
				var specificAddress = $.trim($(
						":input[name=specificAddress]").val());
				var zipCode = parseInt($(":input[name=zipCode]")
						.val());
				console.log("주/도는 " + stateRegionValue);
				console.log("도시는 " + city);
				console.log("도로명주소는 " + roadName);
				console.log("상세주소는 " + specificAddress);
				console.log("우편번호는 " + zipCode);

				// 도로명주소 유효성 체크하기
				if (isEmpty(roadName)) {
					$("#checkAlert")
							.removeClass("text-primary");
					$("#checkAlert").addClass("text-danger");
					$("#checkAlert").css('display', 'flex');
					$("#checkAlert span")
							.text("도로명주소를 입력해주세요.");
					return false;
				}
				// 주소 정규식
				const myRe = /(([가-힣A-Za-z·\d~\-\.]{2,}(로|길).[\d]+)|([가-힣A-Za-z·\d~\-\.]+(읍|동)\s)[\d]+)/;
				const myArray = myRe.exec(roadName);
				console.log("myArray: " + myArray);
				if (isEmpty(myArray)) {
					$("#checkAlert")
							.removeClass("text-primary");
					$("#checkAlert").addClass("text-danger");
					$("#checkAlert").css('display', 'flex');
					$("#checkAlert span").text(
							"주소를 인식하지 못했습니다. 주소를 정확히 입력하셨나요?");
					return false;
				}
				// 제대로 된 주소 입력 시
				if (!isEmpty(roadName) && !isEmpty(myArray)) {
					$("#checkAlert").removeClass("text-danger");
					$("#checkAlert").addClass("text-primary");
					$("#checkAlert").css('display', 'flex');
					$("#checkAlert span").text("주소가 인식되었습니다.");
				}

				/*
				// 우편번호에 값이 있는지 체크하기
				if (zipCode === "") {
					$("#checkAlert").css('display', 'flex');
					$("#checkAlert span").text("우편번호를 입력해주세요.");	
				}
				// 주/도 필드에 값이 있는지 체크하기
				if (stateRegionValue === "") {
					$("#checkAlert").css('display', 'flex');
					$("#checkAlert span").text("주/도를 입력해주세요.");	
					return false;
				}		
				// 도시 필드에 올바른 값이 설정되었는지 체크하기
				if (city === "") {
					$("#checkAlert").css('display', 'flex');
					$("#checkAlert span").text("도시를 입력해주세요.");	
					return false;
				} 
				 */

				// 유효성 검사 통과시
				$("#next-btn").removeAttr("disabled");

				// 주소로 좌표 검색
				// 지도 변경, 마커 위치 변경, 값 저장
				geocoder.addressSearch(roadName, function(result, status) {
					// 정상적으로 검색이 완료됐으면 
					if (status === kakao.maps.services.Status.OK) {
						var coords = new kakao.maps.LatLng(
							result[0].y,
							result[0].x);
						console.log("coords: " + coords)
						// 결과값으로 받은 위치를 마커로 표시합니다
						if ((typeof marker === 'undefined')) {
							let marker = new kakao.maps.Marker(
								{
									map : bgmap,
									map : map,
									position : coords
								});
						} else {
							marker.setPosition(coords);
						}
						// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						map.setCenter(coords);
						bgmap.setCenter(coords);
						
						// 지도의 현재 중심좌표를 얻어옵니다 
						let center = map.getCenter();
						
						// 값 저장
						$(".hiddenField1").attr("value", center.getLat());
						$(".hiddenField2").attr("value", center.getLng());
					}
				});

			});

			// 구체적인 위치 표시하기 스위치버튼 기능 구현
			// 1. 게스트에게 숙소 위치를 구체적으로 알려줄수 있다.
			// 	  선택사항인 아파트 이름과 동호수 정보를 알려준다.
			// 2. 작은 지도를 확대한다.
			$(".form-check-input").on("click",function() {
				// checked 상태이면
				if ($(".form-check-input").is(":checked")) {
					let level = map.getLevel();
					map.setLevel(level - 2);
				}
				// checked 상태가 아니면
				if (!$(".form-check-input").is(":checked")) {
					let level = map.getLevel();
					map.setLevel(level + 2);
				}

				// 입력한 주소 객체 생성
				var stateRegionValue = $.trim($(":input[name=stateRegion]").val());
				var city = $.trim($(":input[name=city]").val());
				var roadName = $.trim($(":input[name=roadName]").val());
				var zipCode = parseInt($(":input[name=zipCode]").val());

				/*
				// 도로명주소 유효성 체크하기
				if (roadName === "") {
					alert("최소한의 주소 등록을 위한 키워드를 입력해주세요!")
					return false;
				}
				// 우편번호에 값이 있는지 체크하기
				if (zipCode === "") {
					$("#checkAlert").css('display', 'flex');
					$("#checkAlert span").text("우편번호를 입력해주세요.");	
				}
				// 주/도 필드에 값이 있는지 체크하기
				if (stateRegionValue === "") {
					$("#checkAlert").css('display', 'flex');
					$("#checkAlert span").text("주/도를 입력해주세요.");	
					return false;
				}		
				// 도시 필드에 올바른 값이 설정되었는지 체크하기
				if (city === "") {
					$("#checkAlert").css('display', 'flex');
					$("#checkAlert span").text("도시를 입력해주세요.");	
					return false;
				} 
				 */
				 
				// 구체적숙소위치알려주기여부(N/Y) 변경 함수 실행
				markSpecificLoc();
			})

			// 구체적숙소위치알려주기여부(N/Y) 변경
			// accommodation 테이블 컬럼 추가 필요 specific_loc 'N', 'Y' default 'Y'
			function markSpecificLoc() {

			}

			// empty 값 체크
			var isEmpty = function(value) {
				if (value == ""
					|| value == null
					|| value == undefined
					|| (value != null && typeof value == "object" && !Object
							.keys(value).length)) {
					return true
				} else {
					return false
				}
			};

		})
	</script>

</body>
</html>