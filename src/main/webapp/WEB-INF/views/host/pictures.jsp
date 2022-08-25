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
<title>사진 등록</title>
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
			<video class="photoVideo" autoplay muted crossorigin="anonymous" playsinline="" preload="auto" style="object-fit: cover; object-position: 0px 25%;">
				<source src="https://a0.muscache.com/v/d6/12/d6120feb-75fc-52dd-b5bb-5755913fb756/d6120feb75fc52ddb5bb5755913fb756_4000k_1.mp4?imformat=h265" type="video/mp4; codecs=hevc">
				<source src="https://a0.muscache.com/v/d6/12/d6120feb-75fc-52dd-b5bb-5755913fb756/d6120feb75fc52ddb5bb5755913fb756_4000k_1.mp4" type="video/mp4">
			</video>
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
						
				<div role="text" class="left-photo-text">숙소 사진을 등록해주세요.</div>
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
											<img class="sm-profile-img back-img" src="/resources/images/profile/${LOGIN_USER.profileImage }" aria-hidden="true">
										</div> 
										<span class="profile-text ms-3">${LOGIN_USER.name }님의 숙소 등록하기</span>
								</a></li>
								<li class="nav-item"><a
									class="right-nav-btn nav-link active border rounded-pill"
									href="">도움말</a></li>
								<li class="nav-item"><a
									class="right-nav-btn nav-link active border rounded-pill"
									href="/host/become-a-host">저장 및 나가기</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
			
			<div class="main-box align-self-center bg-white p-4" style="display:block">
			
				<!-- 편의시설 선택 버튼 박스들 -->
				<div id="box-buttons" class="bd-highlight">
				
					<!--  선택버튼박스1 -->
					<div id="right-content-box" class="text-center" style="max-width:700px;">
						<h2 class="mb-4">
							<svg viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="height: 64px; width: 64px; fill: currentcolor;"><path d="M41.636 8.404l1.017 7.237 17.579 4.71a5 5 0 0 1 3.587 5.914l-.051.21-6.73 25.114A5.002 5.002 0 0 1 53 55.233V56a5 5 0 0 1-4.783 4.995L48 61H16a5 5 0 0 1-4.995-4.783L11 56V44.013l-1.69.239a5 5 0 0 1-5.612-4.042l-.034-.214L.045 14.25a5 5 0 0 1 4.041-5.612l.215-.035 31.688-4.454a5 5 0 0 1 5.647 4.256zm-20.49 39.373l-.14.131L13 55.914V56a3 3 0 0 0 2.824 2.995L16 59h21.42L25.149 47.812a3 3 0 0 0-4.004-.035zm16.501-9.903l-.139.136-9.417 9.778L40.387 59H48a3 3 0 0 0 2.995-2.824L51 56v-9.561l-9.3-8.556a3 3 0 0 0-4.053-.009zM53 34.614V53.19a3.003 3.003 0 0 0 2.054-1.944l.052-.174 2.475-9.235L53 34.614zM48 27H31.991c-.283.031-.571.032-.862 0H16a3 3 0 0 0-2.995 2.824L13 30v23.084l6.592-6.59a5 5 0 0 1 6.722-.318l.182.159.117.105 9.455-9.817a5 5 0 0 1 6.802-.374l.184.162L51 43.721V30a3 3 0 0 0-2.824-2.995L48 27zm-37 5.548l-5.363 7.118.007.052a3 3 0 0 0 3.388 2.553L11 41.994v-9.446zM25.18 15.954l-.05.169-2.38 8.876h5.336a4 4 0 1 1 6.955 0L48 25.001a5 5 0 0 1 4.995 4.783L53 30v.88l5.284 8.331 3.552-13.253a3 3 0 0 0-1.953-3.624l-.169-.05L28.804 14a3 3 0 0 0-3.623 1.953zM21 31a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm0 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM36.443 6.11l-.175.019-31.69 4.453a3 3 0 0 0-2.572 3.214l.02.175 3.217 22.894 5.833-7.74a5.002 5.002 0 0 1 4.707-4.12L16 25h4.68l2.519-9.395a5 5 0 0 1 5.913-3.587l.21.051 11.232 3.01-.898-6.397a3 3 0 0 0-3.213-2.573zm-6.811 16.395a2 2 0 0 0 1.64 2.496h.593a2 2 0 1 0-2.233-2.496zM10 13a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm0 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4z" fill="#222"></path></svg>
							<span class="me-5">사진을 업로드 하세요</span>
							<!-- <button class="btn btn-types" type="button" onclick="uploadBtnClick();" >업로드</button> -->
						</h2>				
						<button id="Btn1" class="uploadBox mainPhotoBox position-relative bg-white container m-auto my-3" type="button">
							<div class="m-3 position-absolute float-start btn btn-light" style="top:5px; left:5px;">커버사진</div>
							<div>
								<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
								  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
								</svg>
							</div>
							<img id="preview1" style="width:100%;height:100%;">
						</button>
						
						<div class="bg-white container m-auto my-3">
							<button id="Btn2" class="uploadBox photoBox mx-2 bg-white container" type="button">
								<div>
									<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
									  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
									</svg>
								</div>
								<img id="preview2" style="width:100%;height:100%;">
							</button>						
							<button id="Btn3" class="uploadBox photoBox mx-2 bg-white container" type="button">
								<div>	
									<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
									  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
									</svg>
								</div>
								<img id="preview3" style="width:100%;height:100%;">
							</button>
						</div>

						<div class="bg-white container m-auto my-3">						
							<button id="Btn4" class="uploadBox photoBox mx-2 bg-white container" type="button">
								<div>	
									<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
									  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
									</svg>
								</div>
								<img id="preview4" style="width:100%;height:100%;">
							</button>						
							<button id="Btn5" class="uploadBox photoBox mx-2 bg-white container" type="button">
								<div>	
									<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
									  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
									</svg>
								</div>
								<img id="preview5" style="width:100%;height:100%;">
							</button>
						</div>
					</div>
					
					<form id="photo-select-form" method="post" action="/host/submitPictures" enctype="multipart/form-data">
						<input type="file" id="photosInput1" name="photo1" accept="image/*" style="display:none;"/>
						<input type="file" id="photosInput2" name="photo2" accept="image/*" style="display:none;"/>
						<input type="file" id="photosInput3" name="photo3" accept="image/*" style="display:none;"/>
						<input type="file" id="photosInput4" name="photo4" accept="image/*" style="display:none;"/>
						<input type="file" id="photosInput5" name="photo5" accept="image/*" style="display:none;"/>
					</form>
				</div>
			</div>
			
			
			<!-- rightDiv footer -->
			<footer class="footer mt-auto pb-3 bg-light">
				<div class="container-fluid">
					<!-- 진행상황 bar -->
					<div class="progress mb-2">
						<div class="progress-bar bg-dark" style="width: 58.2%;"
							role="progressbar" aria-valuenow="58.2" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<!-- 뒤로/다음버튼 -->
					<div class="">
						<button id="back-btn"
							class="float-start btn btn-none ms-4 fs-6 text-decoration-underline text-black border-0"
							type="button" onclick="location.href='/host/facilities'"
							style="padding-top: 14px">뒤로</button>
					</div>
					<div class="">
						<button id="next-btn" class="float-start btn btn-dark float-end"
							type="submit" form="photo-select-form" style="width: 80px; height: 48px;">
							다음</a>
					</div>
				</div>
			</footer>

		</div>

	</div>
	
<script>
$(function() {
	$(".downBoxBtn").on("click", function(){
		$(".photoVideo").get(0).play();
	})
	
	$(".downBoxStopBtn").on("click", function(){
		$(".photoVideo").get(0).pause();
	})
})
</script>

<script>

$(function(){
	
	var attZone = $(".uploadBox");
	
	$("#Btn1").on("click", function(){
		$("#photosInput1").click();
	})
	$("#Btn2").on("click", function(){
		$("#photosInput2").click();
	})
	$("#Btn3").on("click", function(){
		$("#photosInput3").click();
	})
	$("#Btn4").on("click", function(){
		$("#photosInput4").click();
	})
	$("#Btn5").on("click", function(){
		$("#photosInput5").click();
	})
	
	$("#photosInput1").on("change", function(event) {
		$("#Btn1 svg").css("display", "none");
	    var file = event.target.files[0];
	    var reader = new FileReader(); 
	    reader.onload = function(e) {
	        $("#preview1").attr("src", e.target.result);
	    }
	    reader.readAsDataURL(file);
	});
	$("#photosInput2").on("change", function(event) {
		$("#Btn2 svg").css("display", "none");
	    var file = event.target.files[0];
	    var reader = new FileReader(); 
	    reader.onload = function(e) {
	        $("#preview2").attr("src", e.target.result);
	    }
	    reader.readAsDataURL(file);
	});
	$("#photosInput3").on("change", function(event) {
		$("#Btn3 svg").css("display", "none");
	    var file = event.target.files[0];
	    var reader = new FileReader(); 
	    reader.onload = function(e) {
	        $("#preview3").attr("src", e.target.result);
	    }
	    reader.readAsDataURL(file);
	});
	$("#photosInput4").on("change", function(event) {
		$("#Btn4 svg").css("display", "none");
	    var file = event.target.files[0];
	    var reader = new FileReader(); 
	    reader.onload = function(e) {
	        $("#preview4").attr("src", e.target.result);
	    }
	    reader.readAsDataURL(file);
	});
	$("#photosInput5").on("change", function(event) {
		$("#Btn5 svg").css("display", "none");
	    var file = event.target.files[0];
	    var reader = new FileReader();
	    reader.onload = function(e) {
	        $("#preview5").attr("src", e.target.result);
	    }
	    reader.readAsDataURL(file);
	});
	
	
	$("#photo-select-form").submit(function() {
		// 커버 이미지가 설정되어있는지 체크하기
		let imageFileValue = $.trim( $(":file[name=photo1]").val() );
		if (imageFileValue === "") {
			alert("커버사진을 등록해주세요.");
			return false;
		}
	})

})
</script>
</body>
</html>