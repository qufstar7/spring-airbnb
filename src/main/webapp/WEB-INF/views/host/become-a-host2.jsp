<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>${mainType. } 세부 유형 선택</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/hostingstyle.css">
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
	</div>

</div>
	
	
</body>
</html>