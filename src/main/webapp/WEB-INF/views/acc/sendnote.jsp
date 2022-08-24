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
<title>메시지</title>
</head>
<body>
<%@ include file="../common/nav2.jsp" %> 
<%@ include file="../user/login-register-modals.jsp" %>
<div class="container ml-3" style="width: 100%; padding: 0px;">
	<div class="row"> 
		<div class="col-4 text-start" style="margin: 0px; padding: 0px; border: 1px solid rgb(235, 235, 235);">
			<div class="text-start" style="padding: 30px; border-bottom: 1px solid rgb(235, 235, 235); ">
				<a href="recvnote">
					<button id="back-btn" class="text-start btn btn-none text-decoration-underline text-black border-0" type="button"><h3>받은 메시지</h3></button>
				</a>
			</div>
			<div class="text-start" style="padding: 30px; border-bottom: 1px solid rgb(235, 235, 235);">
				<a href="sendnote">
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
					<div class="text-center" style="padding: 30px; width: 100%;">
						<h6>${note.recvUser.name }님에게 <span style="font-size: 14px;"><fmt:formatDate value="${note.sendDate }" pattern="yyyy-MM-dd HH:mm:ss"/> ${note.acc.name } 
						<c:if test="${note.openDate ne null }">
							읽음
						</c:if>
						</span>
						</h6>
						<div class="mb-2 p-2 bg-light rounded" style="width: 100%; height: 100px;">
							<p class="text-start" >${note.content }</p>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
		
	
})
</script>
</body>
</html>