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
<title>호스트 시작하기</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/hostingstyle.css">
</head>
<body>
	<!-- 숙소유형 선택 메인 -->
	<div class="host-box">

		<!-- 로고 홈링크 -->
		<a id="logo-link" href="/"> <svg viewBox="0 0 32 32"
				xmlns="http://www.w3.org/2000/svg" aria-label="에어비앤비 홈페이지"
				role="img" focusable="false">
				<path
					d="M16 1c2.008 0 3.463.963 4.751 3.269l.533 1.025c1.954 3.83 6.114 12.54 7.1 14.836l.145.353c.667 1.591.91 2.472.96 3.396l.01.415.001.228c0 4.062-2.877 6.478-6.357 6.478-2.224 0-4.556-1.258-6.709-3.386l-.257-.26-.172-.179h-.011l-.176.185c-2.044 2.1-4.267 3.42-6.414 3.615l-.28.019-.267.006C5.377 31 2.5 28.584 2.5 24.522l.005-.469c.026-.928.23-1.768.83-3.244l.216-.524c.966-2.298 6.083-12.989 7.707-16.034C12.537 1.963 13.992 1 16 1zm0 2c-1.239 0-2.053.539-2.987 2.21l-.523 1.008c-1.926 3.776-6.06 12.43-7.031 14.692l-.345.836c-.427 1.071-.573 1.655-.605 2.24l-.009.33v.206C4.5 27.395 6.411 29 8.857 29c1.773 0 3.87-1.236 5.831-3.354-2.295-2.938-3.855-6.45-3.855-8.91 0-2.913 1.933-5.386 5.178-5.42 3.223.034 5.156 2.507 5.156 5.42 0 2.456-1.555 5.96-3.855 8.907C19.277 27.766 21.37 29 23.142 29c2.447 0 4.358-1.605 4.358-4.478l-.004-.411c-.019-.672-.17-1.296-.714-2.62l-.248-.6c-1.065-2.478-5.993-12.768-7.538-15.664C18.053 3.539 17.24 3 16 3zm.01 10.316c-2.01.021-3.177 1.514-3.177 3.42 0 1.797 1.18 4.58 2.955 7.044l.21.287.174-.234c1.73-2.385 2.898-5.066 2.989-6.875l.006-.221c0-1.906-1.167-3.4-3.156-3.421h-.001z"></path>
			</svg>
		</a>

		<!-- 왼쪽 영역 -->
		<div id="left-div">
			<!-- leftDiv text -->
			<div class="align-self-center m-5">
				<div role="text" class="left-main-text">${LOGIN_USER.name }님
					환영합니다.</div>
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
									href="" style="cursor:context-menu;">
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
										</div> <span class="profile-text">${LOGIN_USER.name }님의 숙소
											등록하기</span>
								</a></li>
								<li class="nav-item"><a
									class="right-nav-btn nav-link active border rounded-pill"
									href="">도움말</a></li>
								<li class="nav-item"><a
									class="right-nav-btn nav-link active border rounded-pill"
									href="/host">저장 및 나가기</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>

			<!-- rightDiv main -->
			<div class="main-box align-self-center bg-white">
				<form id="form-select-type">
				
					<!--일반숙소유형선택 -->
					<div id="box-buttons" class="bd-highlight">
					
						<!-- 일반숙소유형 선택버튼 -->
						<div id="right-content-box" class="text-center">
							<c:if test="${not empty userAllAcc }">
							<div class="pb-3">
								<p class="fw-bold float-start" style="font-size: 22px;">숙소 등록 완료하기</p>
								<c:forEach var="userAcc" items="${userAllAcc }">
								<button type="button" class="btn btn-types btn-maintypes bg-white container p-4 my-2">
									<!-- 집 모양 아이콘 -->														
									<span class="btn btn-secondary float-start">													
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
										  <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"/>
										</svg>													
									</span>
									
									<!-- 메인타입 + 숙소 + 등록일 -->
									<span class="text-lg-center fw-bolder text-dark float-start ms-3" style="padding-top:5px;">숙소: ${userAcc.types[0].name }<c:if test="${not empty userAcc.updatedDate }"></c:if></span>
									
									<!-- 화살표 모양 아이콘 -->
									<span class="float-end fs-5 fw-bolder"> 
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
										</svg>
									</span>
								</button>
								</c:forEach>
							</div>
							</c:if>
							
							<div class="pb-3 mb-4">
								<p class="fw-bold float-start" style="font-size: 22px;">숙소 등록 시작하기</p>
									<div class="py-3">
										
										<!-- 선택버튼 -->
										<button id="accRegister" type="button" class="btn btn-types btn-maintypes bg-white container p-4 my-2" onclick="location.href='/host/become-a-host/register'">
											<!-- 플러스 아이콘 -->														
											<span class="float-start">													
												<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
												  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
												</svg>										
											</span>
											
											<!-- 텍스트 -->
											<span class="text-lg-center fw-bolder text-dark float-start ms-3">새로운 숙소 등록하기</span>
											<!-- 화살표 모양 아이콘 -->
											<span class="float-end fs-5 fw-bolder"> 
												<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
												  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
												</svg>
											</span>
										</button>
										
										<!-- 선택버튼 -->
										<button id="accCopy" type="button" class="btn btn-types btn-maintypes bg-white container p-4 my-2" onclick="location.href=''">
											<!-- 플러스 아이콘 -->														
											<span class="float-start">													
												<svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" fill="currentColor" class="bi bi-stickies" viewBox="0 0 16 16">
												  <path d="M1.5 0A1.5 1.5 0 0 0 0 1.5V13a1 1 0 0 0 1 1V1.5a.5.5 0 0 1 .5-.5H14a1 1 0 0 0-1-1H1.5z"/>
												  <path d="M3.5 2A1.5 1.5 0 0 0 2 3.5v11A1.5 1.5 0 0 0 3.5 16h6.086a1.5 1.5 0 0 0 1.06-.44l4.915-4.914A1.5 1.5 0 0 0 16 9.586V3.5A1.5 1.5 0 0 0 14.5 2h-11zM3 3.5a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 .5.5V9h-4.5A1.5 1.5 0 0 0 9 10.5V15H3.5a.5.5 0 0 1-.5-.5v-11zm7 11.293V10.5a.5.5 0 0 1 .5-.5h4.293L10 14.793z"/>
												</svg>									
											</span>
											
											<!-- 텍스트 -->
											<span class="text-lg-center fw-bolder text-dark float-start ms-3">기존 숙소 복사하기</span>
											
											<!-- 화살표 모양 아이콘 -->
											<span class="float-end fs-5 fw-bolder"> 
												<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
												  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
												</svg>
											</span>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

<script type="text/javascript">
$(function() {

})
</script>
</body>
</html>