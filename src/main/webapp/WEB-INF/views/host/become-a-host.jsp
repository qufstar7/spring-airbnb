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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>일반 건물 유형 선택</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/hostingstyle.css">
</head>
<body>

	<!-- 숙소유형 선택 메인 -->
	<div class="host-box">
		<div id="left-div">
			<!-- leftDiv text -->
			<div class="align-self-center m-5">
				<div role="text" class="left-main-text">호스팅할 숙소 유형을 알려주세요</div>
			</div>
		</div>

		<!-- 오른쪽 영역 -->
		<div id="right-div">
			<!-- rightDiv header nav -->
			<div class="right-div-header">
				<nav class="navbar navbar-expand-lg navbar-light p-4">
					<div class="container-fluid flex-row-reverse">
						</button>
						<div id="navbarNav">
							<ul class="navbar-nav">
								<li class="nav-item">
									<%--
							<c:forEach var="host" items="${hosts }">
								<span>
									<div>
										<img class="" src="/resources/images/host/${host.imageName }.jpg" aria-hidden="true" >
									</div>
								</span>
							</c:forEach>
							--%> <a class="profile-btn right-nav-btn nav-link active border rounded-pill" href="">
										<div>
											<img class="sm-profile-img front-img" src="/resources/images/host/julian-wan.jpg" aria-hidden="true"> 
											<img class="sm-profile-img middle-img" src="/resources/images/host/jurica-koletic.jpg" aria-hidden="true"> 
											<img class="sm-profile-img back-img" src="/resources/images/host/michael-dam.jpg" aria-hidden="true">
										</div> 
										<span class="profile-text">슈퍼호스트에게 물어보기</span>
								</a>
								</li>
								<li class="nav-item"><a class="right-nav-btn nav-link active border rounded-pill" href="">도움말</a></li>
								<li class="nav-item"><a class="right-nav-btn nav-link active border rounded-pill" href="">저장 및 나가기</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>

			<!-- rightDiv main -->
			<div class="main-type-box align-self-center bg-white">

				<!--일반숙소유형선택 -->
				<div class="bd-highlight m-5">

					<!-- 일반숙소유형 선택버튼 -->
					<c:forEach var="type" items="${accTypes }">
						<div class="p-2 text-center">
							<button
								class="main-type-btn btn btn-outline-secondary container p-3"
								type="button" role="radio">
								<div class="float-start m-3">
									<div class="text-lg-center fw-bolder text-dark">${type.name }</div>
								</div>
								<div class="float-end">
									<div>
										<img
											src="/resources/images/acctype/maintype/${type.imageName }.jpg"
											class="main-type-img img-fluid rounded float-end"
											alt="숙소유형사진">
									</div>
								</div>
							</button>
						</div>
					</c:forEach>

				</div>

			</div>

			<!-- rightDiv footer -->
			<footer class="footer mt-auto py-3 bg-light">
				<div class="container">
					<!-- 진행상황 bar -->
					<div class="progress mb-2">
						<div class="progress-bar w-25" role="progressbar"
							aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<!-- 뒤로/다음버튼 -->
					<div class="">
						<button id="back-btn"
							class="float-start btn btn-none ms-3 fs-6 text-decoration-none text-black"
							type="button" onclick="location.href='/become-a-host/intro';">뒤로</button>
					</div>
					<div class="">
						<button id="next-btn"
							class="float-start btn btn-dark float-end me-5" type="button"
							onclick="location.href='/become-a-host/property-type'">
							다음</a>
					</div>
				</div>
			</footer>

		</div>

	</div>


	<script type="text/javascript">
		let $accMainType = $
		{
			accMainTypes
		};
		console.log($accMainType);
	</script>


</body>
</html>