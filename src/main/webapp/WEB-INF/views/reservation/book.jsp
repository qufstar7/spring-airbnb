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
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<link href="../resources/aircnc.png" rel="icon" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/resources/css/book.css" />
<title>확인 및 결제</title>
</head>
<body>
<%@ include file="../common/nav2.jsp" %>
<%@ include file="../user/home.jsp" %>
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
					<p class ="small"><fmt:formatDate value="${accommodation.checkIn}" pattern="MM월dd일" /> - <fmt:formatDate value="${accommodation.checkOut}" pattern="dd일" /></p>
				</div>
				<div>
					<span>게스트</span>
					<button type ="button" class="btn btn-sm"  id="btn-guest"style="background-color:white; border-color:white; float:right;"><u>수정</u></button>
					<br>
					<span>게스트 ${accommodation.guest }명</span>
				</div>
			</div>
			<div class="mb-3">
				<div class="modal" id="modal-guest" tabindex="-1">
					<div class="modal-dialog">
				 		<div class="modal-content">
				      		<div class="modal-header">
				        		<button type="button" data-bs-dismiss="modal" ><</button>
				        		<h5 class="col modal-title">게스트</h5>
				        		<p>이 숙소의 최대 숙박 인원은 10명(유아 포함)입니다.</p>
				      		</div>
				      		<div class="modal-body">
				        		<div class="totalFn">
					        		<div class="count-box">
						        		<button type="button" class="minus">빼기</button>
						        		<span class="num">0</span>
						        		<button type="button" class="plus">더하기</button>
				        			</div>
					        		<div class="count-box">
					        		    <button type="button" class="minus">빼기</button>
					        		    <span class="num">0</span>
					        		    <button type="button" class="plus">더하기</button>
					        		</div>
					        		<div class="count-box">
					        		    <button type="button" class="minus">빼기</button>
					        		    <span class="num">0</span>
					        		    <button type="button" class="plus">더하기</button>
					        		</div>
					        		<!-- 합계 -->
					        		<div class="total-area">
						        		<span>Total =</span>
						        		<strong class="count-total">0</strong>
						        	</div>
					       		</div>
				      		</div>
				      		<div class="modal-footer">
				        		<button type="button" class="btn btn-sm" style="background-color:white; border-color:white;" data-bs-dismiss="modal"><u>취소</u></button>
				      		</div>
				  		</div>
					</div>
				</div>
			</div>
			<hr/>
			<h5>결제 방식 선택하기</h5>
			<div class="divide">
				<div class ="row border  bg-white rounded-top border-dark border-3" id="entire-payment">
					<div class="row p-3">
						<div class="col-6">
							<strong>전액결재</strong>
						</div>
						<div class="col-6 text-end">
							<strong>￦<fmt:formatNumber value="${accommodation.price }" /> 원</strong>
							<input class="form-check-input"  type="radio" name="payment" id="radio-entire" checked="checked" >
						</div>
						<div class="row p-3">
							<div class-col-9>
								총액을 결제하시면 모든 절차가 완료됩니다.
							</div>
						</div>
					</div>
				</div>
				<div class ="row border bg-white rounded-bottom" id="left-payment">
					<div class="row p-3">
						<div class="col-8">
							<strong>요금 일부는 지금 결제, 나머지는 나중에 결제</strong>
						</div>
						<div class="col-4 text-end">
							<strong>￦ <fmt:formatNumber value=" ${accommodation.price *0.3}"/> 원</strong>
							<input class="form-check-input"  type="radio" name="payment"  id="radio-left">
						</div>
					</div>
					<div class="row p-3">
						<div class-col-9>
							지금 ₩<fmt:formatNumber value=" ${accommodation.price *0.3}"/>을(를) 결제하시면, 나머지 금액(₩<fmt:formatNumber value=" ${accommodation.price *0.7}"/>)은 동일한 결제수단으로 
							2022년 11월 18일 자동 청구됩니다. 추가 수수료는 없습니다.
							<br>
							<button type ="button" class="btn btn-sm" id="btn-howtouse" style="background-color:white; border-color:white;"><u>상세정보</u></button>
						</div>
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
				<button id="requestPay">결제하기</button>
			<select id="card-select" class="form-select" aria-label="Default select example">
				<option value="기본카드" selected>기본 결제 수단(카드)</option>
				<option value="1" disabled>결제 수단 추가하기</option>
				<option value="카드추가">신용카드 또는 체크카드</option>
				<option value="2" disabled>이용 불가</option>
				<option value="카카오 결제">카카오 결제 </option>
			</select>
			<div class="insertCard">
				<div class="row" style="padding:20px">
					<div class="col border bg-white rounded">
						<form class="col" id="form-reservation" method="post" action="completed" modelAttribute="reservationRegisterForm">
							<div class="mb-3">
								<label for="id-field" class="form-label">카드번호</label>
			                	<input class="form-control" name="id" id="id-field" placeholder="0000-0000-0000-0000"/>
							</div>
							<div class ="row"> 
								<div class="col mb-3">
									<label for="expiryDate-field" class="form-label">만료일</label>
                					<input class="form-control" name="expiryDate" id="expiryDate-field" placeholder="MM/YY"/>
								</div>
								<div class="col mb-3">
									<label for="cvv-field" class="form-label">CVV</label>
                					<input class="form-control" name="cvv" id="cvv-field" placeholder="123"/>
								</div>
							</div>
							<div class="mb-3">
								<label for="zipCode-field" class="form-label">우편번호</label>
                				<input class="form-control" name="zipCode" id="zipCode-field" placeholder="12345"/>
							</div>
							 <div class="mb-3">
			                	<label for="region-field" class="form-label">지역</label>
			                	<input class="form-control" name="region" id="region-field" placeholder="한국"/>
			                </div>
					</div>
				</div>
			</div>
			<hr>
			<div class="divide">
				<h5>필수 입력 정보</h5>
				<br>
				<span>호스트에게 메세지 보내기</span>
				<p>호스트에게 여행 목적과 도착 예정 시간을 알려주세요</p>
				<br>
				<div class="row">
					<div class="col-2">
						<div class="box1" style="background: #BDBDBD;">
						    <img class="profile" src="../resources/images/acc/sample-home.jpg">
						</div>
					</div>
					<div class="col">
					    <span>${accommodation.user.name }</span>
					    <p><small class="text-muted"><fmt:formatDate value="${accommodation.user.createdDate}" pattern="yyyy년MM월dd일" /></small></p>
					</div>
				</div>
				<div>
					<textarea rows="2" class="form-control" name="messageToHost"></textarea>
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
			</div>
			<div class="reservationFrom">
				<input type="hidden" name="accNo" value="${accommodation.accNo }">	
				<input type="hidden" name="checkInDate" value='<fmt:formatDate value="${accommodation.checkIn}" pattern="yyyy-MM-dd" />'>	
				<input type="hidden" name="checkOutDate" value='<fmt:formatDate value="${accommodation.checkOut}" pattern="yyyy-MM-dd" />'>
				<input type="hidden" name="totalGuest" value="${accommodation.guest }">	
				<input type="hidden" name="price" value="${accommodation.price }">
				<button type="submit" class="btn btn-lg" style="background-color:#d80765; color:white;">확인 및 결제</a>
			</div>
		</form>	
	</div>
	<!-- 오른쪽 -->
	<div class='right-box'>
		<div class="container-fixed">
			<div class="entireDiv">
				<div class="row my-5 px-5" style="padding:5px" >
					<div class ="border bg-white rounded">
						<div class="row" style="padding:15px">
							<div class="col-5">
								<div class="box2">
								    <img class="acc" src="../resources/images/acc/sample-home.jpg">
								</div>
							</div>
							<div class="col">
							    <span>${accommodation.name }</span>
							    <p>숙소 이름</p>
						        <p><small class="text-muted">★${accommodation.reviewScore }(후기 ${accommodation.reviewCount }개)</small></p>
							</div>
						</div>
						<hr/>
						<div class="divide2">
							<p><img class="aircover" src="../resources/images/reservation/aircover1.png">를 통한 예약 보호</p>
						</div>
						<hr/>
						<div class="divide2">
							<h5>요금 세부정보</h5>
							<div class="border bg-white border-white">
								<span>￦<fmt:formatNumber value="${accommodation.price }" /> × <fmt:formatDate value="${accommodation.checkIn}"  />박</span>
								<span style="float:right"">￦<fmt:formatNumber value="${accommodation.price }" /> 원</span>
							</div>
							<div>
								<span><u>서비스 수수료</u></span>
								<span style="float:right">￦<fmt:formatNumber value="${accommodation.price *0.15 }" /> 원</span>
							</div>
							<hr>
							<div class="divide2">
								<span>총 합계</span>
								<span style="float:right">총 합계</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="leftDiv">
				<div class="row my-5 px-5" style="padding:5px" >
					<div class ="border bg-white rounded">
						<div class="row" style="padding:15px">
							<div class="col-5">
								<div class="box2">
								    <img class="acc" src="../resources/images/acc/sample-home.jpg">
								</div>
							</div>
							<div class="col">
							    <span>${accommodation.name }</span>
							    <p>숙소 이름</p>
						        <p><small class="text-muted">★${accommodation.reviewScore }(후기 ${accommodation.reviewCount }개)</small></p>
							</div>
						</div>
						<hr/>
						<div class="divide2">
							<p><img class="aircover" src="../resources/images/reservation/aircover1.png">를 통한 예약 보호</p>
						</div>
						<hr/>
						<div class="divide2">
							<h5>요금 세부정보</h5>
							<div class="border bg-white border-white">
								<span>￦<fmt:formatNumber value="${accommodation.price }" /> × $2박</span>
								<span style="float:right"">￦<fmt:formatNumber value="${accommodation.price }" /></span>
							</div>
							<div>
								<span><u>서비스 수수료</u></span>
								<span style="float:right">￦<fmt:formatNumber value="${accommodation.price *0.15}" /></span>
							</div>
							<div>
								<span>총 합계</span>
								<span style="float:right">${reservation.totalPrice }</span>
							</div>
							<hr>
							<div class="divide2">
								<div class="border bg-white border-white">
									<span>지급일: 지금</span>
									<span style="float:right"">￦<fmt:formatNumber value="${accommodation.price *0.3}" /></span>
								</div>
								<div>
									<span>지급일:<fmt:formatDate value="${accommodation.checkIn}"  /></span>
									<span style="float:right">￦<fmt:formatNumber value="${accommodation.price *0.7}" /></span>
								</div>
							</div>
						</div>
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
	
	$("#entire-payment").click(function(){
		$("input:radio[name='payment']:radio[id='radio-entire']").prop('checked', true);
		$(".leftDiv").hide();
		$(".entireDiv").show();
		$("#entire-payment").addClass("border-dark border-3")
		$("#left-payment").removeClass("border-dark border-3")
	});
	$("#left-payment").click(function(){
		$("input:radio[name='payment']:radio[id='radio-left']").prop('checked', true);
		$(".leftDiv").show();
		$(".entireDiv").hide();
		$("#entire-payment").removeClass("border-dark border-3")
		$("#left-payment").addClass("border-dark border-3")
	});
	
	$("#card-select").on('change',function(){
		let result2 = $("#card-select option:selected").val();
		if( result2 == "카드추가") {
			$(".insertCard").show();
		}else {
			$(".insertCard").hide();
		}
	});
	
	$("#requestPay").click(function(){
	
		IMP.init('imp72420270');
	    IMP.request_pay({
	        pg: 'kakaopay',
	        pay_method: 'card',
	        merchant_uid: 'merchant_' + new Date().getTime(),
	        name: '결제테스트',
	        amount: ${accommodation.price},
	        buyer_email: "${accommodation.user.email}",
	        buyer_name: "${accommodation.user.name}",
	        buyer_tel: "${accommodation.user.phone}",
	        buyer_addr: "${accommodation.user.address}",
	    }, function (rsp) { 
	        if (rsp.success) {
	      	  var msg = "예약이 완료되었습니다."
	      	  msg += '고유ID : ' 	+ rsp.imp_uid
	       	  msg += '거래ID : ' 	+ rsp.merchant_uid
	       	  msg += '결제금액 : ' 	+ rsp.paid_uid
	       	  msg += '승인번호 : ' 	+ rsp.apply_uid
	        } else {
	      	  var msg = "결제에 실패했습니다."
	       	  msg += '에러내용 : ' + rsp.error_msg;
	        }
	      	  alert(msg);
	    });
	});  
})


</script>
</body>
</html>