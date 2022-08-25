<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="/resources/css/book.css" />
<title>예약완료</title>
</head>
<body>
<%@ include file="../common/nav2.jsp" %>
<%@ include file="../user/login-register-modals.jsp" %>
<div class="container">
	<!-- 왼쪽 -->
	<div class="left-box">
		<div class="divide">
			<h3><Strong>예약이 확정되었습니다!</Strong></h3>
			<p>이메일(으)로 세부정보를 보냈습니다.</p>
		</div>
		<div class="divide">
			<div class="row">
					<h5><strong>호스트 소개</strong></h5>
				<div class="col-1" style="padding : 5px">
					<div class="box1" style="background: #BDBDBD;">
					    <img class="profile" src="../resources/images/acc/sample-home.jpg">
					</div>
				</div>
				<div class="col">
				    <span>궁금한 사항은 언제든 ${accommodation.user.name }에게 문의하실 수 있습니다.</span>
				</div>
				<div>
					<textarea rows="4" class="form-control" name="messageToHost" placeholder="안녕하세요. 여행이 예정되어있습니다."></textarea>
					<br>
					<button type="submit" class="btn btn-outline-dark">메시지 보내기</button>
				</div>
			</div>
		</div>
		<div class="divide">
			<div>
				<h5><strong>마지막 단계: 여행 계획 공유하기</strong></h5>
				<p>여행 일정표를 다른 사람과 공유해 보세요.</p>
			</div>
			<div>
				<input type="text" style="width:200px; height:55px; border-radius:5px;" name="companion" placeholder="이메일 주소 입력">
				<div style="margin-top:20px">
					<a href="/" class="btn btn-dark">제출하기</button>
                	<a href="/" class="btn btn-outline-dark">건너뛰기</a>
                </div>
			</div>
		</div>
		<div class="divide">
			<div class="row">
				<h5>알아두어야 할 사항</h5>
				<br>
				<br>
				<div class="col">
					<p><strong>숙소 이용규칙</strong></p>
					<p><small><i class="bi bi-clock"></i>  체크인: 오후 3:00이후</small></p>
					<p><small><i class="bi bi-clock"></i>  체크아웃 시간: 오전 11:00</small></p>
					<p><small><i class="bi bi-bell-fill"></i>  키패드(으)로 셀프 체크인</small></p>
					<p><small><i class="fa-solid fa-ban-smoking"></i> 흡연 금지</small></p>
					<p><small><i class="fa-thin fa-champagne-glasses"></i> 파티나 이벤트 금지</small></p>
					<p><small><i class="fa-solid fa-paw"></i> 반려동물 동반 가능</small></p>
				</div>
				<div class="col">
					<p><strong>안전 및 숙소 정보</strong></p>
					<p><small><i class="bi bi-check-circle-fill"></i> 일사화탄소 경보기</small></p>
					<p><small><i class="bi bi-check-circle-fill"></i> 화재경보기</small></p>
				</div>
			</div>
		</div>
	</div>
		 
	
	<!-- 오른쪽 -->
	<div class="right-box">
		<div class="container-fixed">
			<div class="row my-5 px-5" style="padding:5px" >
				<div class ="border bg-white rounded">
					<div class="box-acc">
					    <img class="acc" src="../resources/images/acc/sample-home.jpg">
					</div>
					<div>
						<h5>${accommodation.name}</h5>
					</div>
					<div>
						<p><fmt:formatDate value="${reservaionRegisterForm.checkInDate}" pattern="MM월dd일" />~<fmt:formatDate value="${reservaionRegisterForm.checkOutDate}" pattern="dd일" />
						· 게스트 ${reservaionRegisterForm.adultNum }명
						</p>
					</div>
					<hr>
					<div class="divide2">
						<span>총 합계</span>
						<span style="float:right">￦<fmt:formatNumber value="${reservaionRegisterForm.totalPrice }" /> 원</span>
					</div>
					<hr>
					<div class="divide2">
						<span style="float:right">지급완료</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){

})
</script>
</body>
</html>