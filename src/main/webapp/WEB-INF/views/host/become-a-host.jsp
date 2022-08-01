<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>일반 건물 유형 선택</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/hostingstyle.css">
</head>
<body>

<!-- 숙소유형 선택 메인 -->
<div class="selectMain">
	<div id="leftDiv" class="selectPage">
		<!-- leftDiv text -->
		<div class="align-self-center m-5">
			<div role="text" class="leftMainText">호스팅할 숙소 유형을 알려주세요</div>
		</div>
	</div>

	<!-- 오른쪽 영역 -->
	<div id="rightDiv" class="bg-white">
		<!-- rightDiv header nav -->
		<div style="height:87px;">
			<nav class="navbar navbar-expand-lg navbar-light">
			  <div class="container-fluid flex-row-reverse">
			    </button>
			    <div class="" style="font-size:4px;" id="navbarNav">
			      <ul class="navbar-nav">
			        <li class="nav-item">
			          <a class="nav-link active border rounded-pill me-3 fs-6" href="">슈퍼호스트에게 물어보기</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link active border rounded-pill me-3 fs-6" href="">도움말</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link active border rounded-pill me-3 fs-6" href="">저장및 나가기</a>
			        </li>
			      </ul>
			    </div>
			  </div>
			</nav>
		</div>



		<!-- rightDiv main -->
		<div class="houseTypeDiv align-self-center bg-white"
			style="height: 100%">

			<!--일반숙소유형선택 -->
			<div class="bd-highlight m-5">
			
				<!-- 일반숙소유형 선택버튼 -->
				<c:forEach var="mainType" items="${accMainTypes }">
				<div class="p-2">
					<button class="btn btn-outline-secondary container" style="max-width:300px;" type="button" role="radio" aria-checked="">
						<div class="float-start">
							<div>${mainType.name }</div>
						</div>
						<div class="float-end">
							<div>
								<img src="/resources/images/acctype/maintype/${mainType.imageName }" class="rounded float-end" alt="...">
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
				  <div class="progress-bar w-25" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
				</div>
				<!-- 뒤로/다음버튼 -->
				<div class="">
					<a href="/host"><span
						class="ms-3 fs-6 text-decoration-none text-black">뒤로</span></a>
					<button id="next-btn" class="btn btn-dark float-end me-5" type="button"
						onclick="location.href='/become-a-host/property-type'">
						다음</a>
				</div>
			</div>
		</footer>
		
	</div>

</div>
<script type="text/javascript">


</script>
</body>
</html>