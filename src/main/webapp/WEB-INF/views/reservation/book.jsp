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
<link href="../resources/aircnc.png" rel="icon" type="image/x-icon" />
<title>확인 및 결제</title>
<style>
.left-box {
	float: left;
	width: 50%;
}

.right-box {
	float: right;
	width: 50%;
	height: 600px;
}
.divide {
	padding : 15px;
}
.divide2 {
	padding : 5px;
}
.container-fixed {
	position : fixed;
	top : 30px;
}
.modal-title {
	text-align : center;
}
.box {
    width: 50px;
    height: 50px; 
    border-radius: 70%;
    overflow: hidden;
}
.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.box2 {
     width: 120px;
    height: 105px; 
    border-radius: 10%;
    overflow: hidden;
}
.acc {
    width: 100%;
    height: 100%;
    object-fit: full;
}

</style>
</head>
<body>
<div class="container my-3">
	<!-- 왼쪽 -->
	<div class='left-box'>
		<h4>확인 및 결제</h4>
		<div class="row mb-3 my-5 px-3" >
			<div class="col border bg-white rounded">
					<div class="mb-3">
						<span style="font-weight:bold; font-size:small;">저렴한 요금</span>
						<p >검색하시는 날짜의 요금은 지난 3개월의 평균 1박 요금보다 $ 저렴합니다.</p>
					</div>
			</div>
		</div>
			<div class="divide">
					<h5>예약 정보</h5>
				<div class = "col border border-white bg-white">
					<span>날짜</span>
					<button type ="button" class="btn btn-sm" style="background-color:white; border-color:white; float:right;"><u>수정</u></button>
					<br>
					<p class ="small">2022-</p>	
				</div>
				<div>
					<span>게스트</span>
					<button type ="button" class="btn btn-sm" style="background-color:white; border-color:white; float:right;"><u>수정</u></button>
					<br>	
					<span>게스트 1명</span>
				</div>
			</div>
			<hr/>
			<h5>결제 방식 선택하기</h5>
			<div class="divide">
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
					   <div class="col">요금 일부는 지금 결제, 나머지는 나중에 결제</div>
					   <div class="col-md-auto" style="float:right">₩$leftPayment</div>
					   <div class="col col-lg-1 form-check" style="float:right">
					    	<input class="form-check-input" type="radio" name="entirePayment" >
					  		<label class="form-check-label" style="width:1px"> </label>
					   </div>
					</div>
					<div class ="border border-white bg-white">
						지금 ₩110,909을(를) 결제하시면, 나머지 금액(₩443,632)은 동일한 결제수단으로 
						2022년 11월 18일 자동 청구됩니다. 추가 수수료는 없습니다.
						<br>
						<button type ="button" class="btn btn-sm" id="btn-howtouse" style="background-color:white; border-color:white;"><u>상세정보</u></button>
					</div>
				</div>
			</div>
			<div class="modal" id="modal-how-to-use" tabindex="-1">
				<div class="modal-dialog">
			 		<div class="modal-content">
			      		<div class="modal-header">
			        		<button type="button" data-bs-dismiss="modal" ><</button>
			        		<h5 class="col modal-title">이용방법</h5>
			      		</div>
			      		<div class="modal-body">
			        		<p>요금의 일부만 지금 결제하고 잔액은 나중에 결제할 수 있습니다.</p>
			        		<p>별도의 수수료가 부과되지 않습니다.</p>
			        		<br>
			        		<p><strong>총 요금의 일부만 지금 결제하세요</strong></p>
			        		<p>총 요금의 일부만 결제하여 예약을 확정하세요</p>
			        		<br>
			        		<p><strong>잔액은 체크인 전에 결제하세요</strong></p>
			        		<p>2회차 결제일에 잔액이 기존의 결제 수단으로 부과됩니다.</p>
			        		<br>
			        		<p><strong>자동으로 결제됩니다.</strong></p>
			        		<p>잔액 결제일 3일 전에 알림을 보내드리니 걱정하지 마세요.</p>
			      		</div>
			      		<div class="modal-footer">
			        		<button type="button" class="btn btn-sm" style="background-color:white; border-color:white;" data-bs-dismiss="modal"><u>취소</u></button>
			      		</div>
			  		</div>
				</div>
			</div>
			<hr/>
			<h5>결제 수단</h5>
			<a href="/book/register" class="btn btn-outline-primary">카드등록</a>
			<div class="dropdown">
			  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
			   기본 결제 수단 (카드 번호)
			  </button>
			  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
			    <li><a class="dropdown-item" href="#">기본 결제 수단(카드)</a></li>
			    <li><a class="dropdown-item" href="#" disabled>결제 수단 추가하기</a></li>
			    <li><a class="dropdown-item" href="#">신용카드 또는 체크카드</a></li>
			    <li><a class="dropdown-item" href="#" disabled>이용 불가</a></li>
			    <li><a class="dropdown-item" href="#">만료된 카드</a></li>
			  </ul>
			</div>
			<select class="form-select" aria-label="Default select example">
				<option value="1" selected>기본 결제 수단(카드)</option>
				<option value="2" disabled>결제 수단 추가하기</option>
				<option value="2">신용카드 또는 체크카드</option>
				<option value="3" disabled>이용 불가</option>
				<option value="3" disabled>만료된 카드 </option>
			</select>
			<hr>
			<div class="divide">
				<h5>필수 입력 정보</h5>
				<br>
				<span>호스트에게 메세지 보내기</span>
				<p>호스트에게 여행 목적과 도착 예정 시간을 알려주세요</p>
				<br>
				<div class="row">
					<div class="col-2">
						<div class="box" style="background: #BDBDBD;">
						    <img class="profile" src="../resources/images/acc/sample-home.jpg">
						</div>
					</div>
					<div class="col">
					    <span>호스트 이름</span>
					    <p><small class="text-muted">가입일</small></p>
					</div>
				</div>
				<div>
					<textarea rows="2" class="form-control" name="hostMessage"></textarea>
				</div>
			</div>
			<hr>
			<div class="divide">
				<h5>환불 정책</h5>
				<span>8월 11일 오후 12:00 전에 취소하면 부분 환불을 받으실 수 있습니다.
				 그 이후에 취소하면 예약 대금이 환불되지 않습니다.</span>
			</div>
			<hr>
			<div class="divide">
				<p><small class="text-muted">
				아래 버튼을 선택하면 호스트가 설정한 숙소 이용규칙, 에어비앤비 재예약 및 환불 정책, 분할 결제 약관에 동의하며, 
				피해에 대한 책임이 본인에게 있을 경우 에어비앤비가 결제 수단으로 청구의 조치를 취할 수 있다는 사실에 동의하는 것입니다.
				</small></p>
				<p><small class="text-muted">또한, 개정된 이용 약관과 결제 서비스 약관 및 개인정보 처리방침에도 동의합니다.</small></p>
				<button type="button" class="btn btn-lg" style="background-color:#d80765; color:white;">확인 및 결제</button>
			</div>
	</div>
	<!-- 오른쪽 -->
	<div class='right-box'>
		<div class="container-fixed">
			<div class="row my-5 px-5" style="padding:5px" >
				<div class ="border bg-white rounded">
					<div class="row" style="padding:15px">
						<div class="col-5">
							<div class="box2">
							    <img class="acc" src="../resources/images/acc/sample-home.jpg">
							</div>
						</div>
						<div class="col">
						    <span>캠핑카</span>
						    <p>숙소 이름</p>
					        <p><small class="text-muted">★$4.75(후기 $106개)</small></p>
						</div>
					</div>
					<hr/>
					<div class="divide2">
						<p>에어커버를 통한 예약 보호</p>
					</div>
					<hr/>
					<div class="divide2">
						<h5>요금 세부정보</h5>
						<div class="border bg-white border-white">
							<span>￦$240,000 × $2박</span>
							<span style="float:right"">￦$240,000*2</span>
						</div>
						<div>
							<span>서비스 수수료</span>
							<span style="float:right">$0.15</span>
						</div>
						<div>
							<span>총 합계</span>
							<span style="float:right">총 합계</span>
						</div>
						<hr>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	let modalHowToUse = new bootstrap.Modal(document.getElementById("modal-how-to-use"));
	
	$("#btn-howtouse").click(function(){
		modalHowToUse.show();
	});
})
</script>
</body>
</html>