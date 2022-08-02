<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>확인 및 결제</title>
<style>
.left-box {
	float: left;
	width: 50%;
}

.right-box {
	float: right;
	width: 50%;
}
</style>
</head>
<body>
	<div class="container my-3">
		<div class='left-box'>
			왼쪽
			<h4>확인 및 결제</h4>
			<div class="row mb-3 my-5 px-3" >
			<div class="col border bg-white rounded">
					<div class="mb-3">
						<span style="font-weight:bold; font-size:small;">저렴한 요금</span>
						<p >검색하시는 날짜의 요금은 지난 3개월의 평균 1박 요금보다 $ 저렴합니다.</p>
					</div>
			</div>
			<h5>예약 정보</h5>
			<div class = "col border border-white bg-white">
				<span>날짜</span>
				<button type ="button" class="btn btn-sm" style="background-color:white; border-color:white;"><u>수정</u></button>
				<br>
				<p class ="small">2022-</p>	
			</div>
			<div>
				<span>게스트</span>
				<button type ="button" class="btn btn-sm" style="background-color:white; border-color:white;"><u>수정</u></button>
				<br>	
				<span>게스트 1명</span>
			</div>
			<hr/>
			<h5>결제 방식 선택하기</h5>
			<div>
				<div class ="row border border-black bg-white rounded-top">
					<div class="row">
					    <div class="col">전액 결제</div>
					    <div class="col-md-auto">₩$entirePayment</div>
					    <div class="col col-lg-1 form-check">
					    	<input class="form-check-input" type="radio" name="entirePayment" checked="checked" >
					  		<label class="form-check-label"> </label>
					    </div>
					</div>
				</div>
				<div class ="row border border-black bg-white rounded-bottom">
					<div class="row">
					   <div class= "col">요금 일부는 지금 결제, 나머지는 나중에 결제</div>
					   <div class= "col-md-auto">₩$leftPayment</div>
					   <div class="col col-lg-1 form-check">
					    	<input class="form-check-input" type="radio" name="entirePayment" >
					  		<label class="form-check-label" style="width:1px"> </label>
					   </div>
					</div>
					<div class ="border border-white bg-white">
						지금 ₩110,909을(를) 결제하시면, 나머지 금액(₩443,632)은 동일한 결제수단으로 
						2022년 11월 18일 자동 청구됩니다. 추가 수수료는 없습니다.
						<button type ="button" class="btn btn-sm" style="background-color:white; border-color:white;"><u>상세정보</u></button>
					</div>
					<div class="modal" tabindex="-1">
						<div class="modal-dialog">
					 		<div class="modal-content">
					      		<div class="modal-header">
					        		<h5 class="modal-title">이용방법</h5>
					        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      		</div>
					      		<div class="modal-body">
					        		<p>Modal body text goes here.</p>
					      		</div>
					      		<div class="modal-footer">
					        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					        		<button type="button" class="btn btn-primary">Save changes</button>
					      		</div>
					  		</div>
						</div>
					</div>
				</div>
			</div>
			<hr/>
			<h5>결제 수단</h5>
			<select class="form-select" aria-label="Default select example">
				<option value="1" selected>기본 결제 수단(카드)</option>
				<option value="2" disabled>결제 수단 추가하기</option>
				<option value="2">신용카드 또는 체크카드</option>
				<option value="3" disabled>이용 불가</option>
				<option value="3">만료된 카드</option>
			</select>
			<p>
			아래 버튼을 선택하면 호스트가 설정한 숙소 이용규칙, 에어비앤비 재예약 및 환불 정책, 분할 결제 약관에 동의하며, 
			피해에 대한 책임이 본인에게 있을 경우 에어비앤비가 결제 수단으로 청구의 조치를 취할 수 있다는 사실에 동의하는 것입니다.
			</p>
			<p>또한, 개정된 이용 약관과 결제 서비스 약관 및 개인정보 처리방침에도 동의합니다.</p>
		</div>
		<button type="button" class="btn btn-lg" style="background-color:#d80765; color:white;">확인 및 결제</button>
	</div>
	<div class='right-box'>
	오른쪽
	</div>
</div>
<script type="text/javascript">
$(function(){
	
})
</script>
</body>
</html>