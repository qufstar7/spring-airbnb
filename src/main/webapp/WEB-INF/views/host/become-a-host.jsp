<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
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
<title>일반 건물 유형 선택</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/hostingstyle.css">
</head>
<body>

	<!-- 숙소유형 선택 메인 -->
	<div class="selectMain">
		<div class="selectPage" id="leftDiv">
			<!-- leftDiv text -->
			<div class="align-self-center">
				<div role="text" class="leftMainText">호스팅할 숙소 유형을 알려주세요</div>
			</div>
		</div>

		<!-- 오른쪽 영역 -->
		<div id="rightDiv" class="bg-white">
			<!-- rightDiv header nav -->
			<div style="height:87px;">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
				  <div class="container-fluid flex-row-reverse">
				    </button>
				    <div class="" style="font-size:4px;" id="navbarNav">
				      <ul class="navbar-nav">
				        <li class="nav-item">
				          <a class="nav-link active border rounded-pill me-2" href="">슈퍼호스트에게 물어보기</a>
				        </li>
				        <li class="nav-item">
				          <a class="nav-link active border rounded-pill me-2" href="">도움말</a>
				        </li>
				        <li class="nav-item">
				          <a class="nav-link active border rounded-pill me-2" href="">저장및 나가기</a>
				        </li>
				      </ul>
				    </div>
				  </div>
				</nav>
			</div>

			<!-- rightDiv main -->
			<div class="houseTypeDiv align-self-center bg-white" style="height:100%">

				<!--일반숙소유형선택 -->
				<div class="d-flex flex-column bd-highlight mb-3">
					<!-- 일반숙소유형 선택버튼 -->
					<div class="p-2 bd-highlight">					
						<button class="btn btn-outline-secondary" type="button" role="radio" aria-checked="">
							<div class="float-start">
								<div>아파트</div>
							</div>
							<div class="float-start">
								<div>
									<img> 사진
								</div>
							</div>
						</button>
					</div>
					
					<div class="p-2 bd-highlight">					
						<button class="btn btn-outline-secondary" type="button" role="radio" aria-checked="">
							<div class="float-start">
								<div>주택</div>
							</div>
							<div class="float-start">
								<div>
									<img> 사진
								</div>
							</div>
						</button>
					</div>
					
					<div class="p-2 bd-highlight">					
						<button class="btn btn-outline-secondary" type="button" role="radio" aria-checked="">
							<div class="float-start">
								<div>별채</div>
							</div>
							<div class="float-start">
								<div>
									<img> 사진
								</div>
							</div>
						</button>
					</div>
					
					<div class="p-2 bd-highlight">					
						<button class="btn btn-outline-secondary" type="button" role="radio" aria-checked="">
							<div class="float-start">
								<div>독특한 숙소</div>
							</div>
							<div class="float-start">
								<div>
									<img> 사진
								</div>
							</div>
						</button>
					</div>
					
					<div class="p-2 bd-highlight">
						<button class="btn btn-outline-secondary" type="button" role="radio" aria-checked="">
							<div class="float-start">
								<div>B&B</div>
							</div>
							<div class="float-start">
								<div>
									<img> 사진
								</div>
							</div>
						</button>
					</div>
					
					<div class="p-2 bd-highlight">
						<button class="btn btn-outline-secondary" type="button" role="radio" aria-checked="">
							<div class="float-start">
								<div>부티크 호텔</div>
							</div>
							<div class="float-end">
								<div>
									<img> 사진
								</div>
							</div>
						</button>
					</div>
										
				</div>		
						     
			</div>

			<!-- rightDiv footer -->
			<div class="" style="bottom:0; absolute;">
				<!-- 진행상황 bar -->
				<div class="border border-top border-dark my-3">
					
				</div>
				<!-- 뒤로/다음버튼 -->
				<div class="overflow-auto align-self-center">
					<a href="/host"><span class="ms-3 align-middle fs-6 text-decoration-none">뒤로</span></a>
					<button class="btn btn-dark float-end me-5" type="button" onclick="location.href='/become-a-host/property-type'">다음</a>
				</div>
			</div>
		</div>

	</div>

</body>
</html>