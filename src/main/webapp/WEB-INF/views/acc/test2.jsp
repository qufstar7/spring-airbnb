<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
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
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700" rel="stylesheet">
<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link href="../resources/aircnc.png" rel="icon" type="image/x-icon" />
<!-- 페레스코 -->
<script type="text/javascript" src="/resources/js/fresco.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/fresco.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/detaile.css">
<!-- 달력 -->
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<title>호스트에 연락</title>
</head>
<body>
<%@ include file="../common/nav2.jsp" %> 
<%@ include file="../user/home.jsp" %>
<div class="container" style="width: 100%; margin: 0px; padding: 0px;">
	<div class="row"> 
		<div class="col-4 text-start" style="margin: 0px; padding: 0px; border: 1px solid rgb(235, 235, 235);">
			<div class="text-start" style="padding: 30px; border-bottom: 1px solid rgb(235, 235, 235); ">
				<a href="test">
					<button id="back-btn" class="text-start btn btn-none text-decoration-underline text-black border-0" type="button"><h3>받은 메시지</h3></button>
				</a>
			</div>
			<div class="text-start" style="padding: 30px; border-bottom: 1px solid rgb(235, 235, 235);">
				<a href="test2">
					<button id="back-btn" class="text-start btn btn-none text-decoration-underline text-black border-0" type="button"><h3>보낸 메시지</h3></button>
				</a>
			</div>
		</div> 
		<div class="col-8" style="margin: 0px; padding: 0px; border: 1px solid rgb(235, 235, 235); min-height: 880px;">
			<div class="text-start" style="padding: 30px; border-bottom: 1px solid rgb(235, 235, 235); height: 114.59px;">
				<h3>보낸 메시지</h3>
			</div>
			<c:if test="${empty notes }">
				<div class="text-center" style="padding: 30px; width: 400px;">
					<h6>보낸 메시지가 없습니다.</h6>
				</div>
			</c:if>
			<c:if test="${not empty notes }">
				<c:forEach items="${notes }" var="note">
					<div class="text-center" style="padding: 30px; width: 400px;">
						<h6>${note.recvUser.name }님에게 <fmt:formatDate value="${note.sendDate }"/> 
						<c:if test="${note.openDate ne null }">
							읽음
						</c:if>
						</h6>
						<p class="text-start" >${note.content }</p>
						<%-- <form action="note/add" method="post">
						<div style="padding: 30px; width: 400px;">
								<h6>답장하기</h6>
								<input type="text" class="rounded" name="content" style="width: 300px;  height: 100%; min-height: 50px;">
								<input type="hidden" name="no" value="${note.acc.accNo }">
								<input type="hidden" name="${note.sendUser }">
						</div>	
						<div>
							<button type="submit" class="btn btn-outline-dark float-end mt-2">메세지 전송하기</button>
						</div>
						</form> --%>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</div>

<!-- 답장 모달 -->
<div style="z-index: 5000;" class="modal fade" id="email-login-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered myModal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title fw-bold w-100 text-center fs-6" id="exampleModalLabel">로그인 또는 회원가입</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body m-2">
      	<div >
      		<h3 class="fw-bold fs-5" >에어비앤비에 오신 것을 환영합니다.</h3>
      	</div>
      	<div>
      		<form action="" method="post" class="needs-validation" novalidate>
	      		<div class="form-floating my-4">
			     	<input type="text" class="form-control outline" name="email" placeholder="이메일" required >
			     	<label for="floatingInput">이메일</label>
			     	<div class="invalid-feedback">
			     		<i class="fa-solid fa-circle-exclamation"></i>  이메일을 입력해주세요
			     	</div>
		    	</div>
			    <div class="d-grid gap-2 my-4">
				     <button type="button" class="btn p-2" id="btn-login-register">계속</button>
			    </div>
      		</form>
		    
      	</div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$(function() {
		
	
})
</script>
</body>
</html>