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
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<link href="../resources/aircnc.png" rel="icon" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/resources/css/book.css" />
<title>확인 및 결제</title>
</head>
<body>
<%@ include file="../common/nav2.jsp" %>
<%@ include file="../user/login-register-modals.jsp" %>
<div class="container my-3">
	<!-- 왼쪽 -->
	<div class='left-box'>
		<h4>확인 및 결제</h4>
		<div class="row mb-3 my-5 px-3" >
			<div class="col border bg-white rounded">
					<div class="mb-3">
						<span style="font-weight:bold; font-size:small;">흔치 않은 기회입니다.</span>
						<p >${accommodation.user.name }님의 숙소는 보통 예약이 가득 차 있습니다.</p>
					</div>
					<div class="col">
						<img alt="다이아몬드" src="../resources/images/reservation/diamond.png">
					</div>
			</div>
		</div>
			<div class="divide">
					<h5>예약 정보</h5>
				<div class = "col border border-white bg-white">
					<span>날짜</span>
					<button type ="button" id="btn-calendar" class="btn btn-sm" style="background-color:white; border-color:white; float:right;"><u>수정</u></button>
					<br>
					<p class ="small"><fmt:formatDate value="${reservaionRegisterForm.checkInDate}" pattern="MM월dd일" /> - <fmt:formatDate value="${reservaionRegisterForm.checkOutDate}" pattern="dd일" /></p>
				</div>
				<div>
					<span>게스트</span>
					<button type ="button" class="btn btn-sm"  id="btn-guest" style="background-color:white; border-color:white; float:right;"><u>수정</u></button>
					<br>
					<span id="adult">게스트: <span id="adultCount">1</span>명</span>
				</div>
			</div>
			<!-- 달력 -->
			<div class="mb-3">
				<div class="modal" id="modal-calendar" tabindex="-1">
					<div class="modal-dialog">
				 		<div class="modal-content">
				      		<div class="modal-body">
				      			<div class="divide2">
				      				<h5>날짜선택</h5>
				      			</div>
				      			<div class="" id="days-box">
				      				<input type="text" name="checkInDate" id="checkInDate" value="" > 
									<input type="text" name="checkOutDate" id="checkOutDate" value="" >
				      			</div>
				      		</div>
				      		<div class="modal-footer">
				      			<div class="col">
					        		<button type="button" class="btn btn-sm" style="background-color:white; border-color:white;" data-bs-dismiss="modal"><u>취소</u></button>
				      			</div>
				      			<div class="col-3">
				        			<button type="button" class="btn btn-dark" data-bs-dismiss="modal">저장하기</button>
				        		</div>
				      		</div>
				  		</div>
					</div>
				</div>
			</div>
			<!-- 게스트 -->
			<div class="mb-3">
				<div class="modal" id="modal-guest" tabindex="-1">
					<div class="modal-dialog">
				 		<div class="modal-content">
					 		<div class="modal-header">
				        		<button type="button" class="btn btn-white" data-bs-dismiss="modal" ><</button>
				      		</div>
				      		<div class="modal-body">
				      			<div class="divide2">
				      				<h5>게스트</h5>
				      			</div>
				      			<div>
				      				<p><small>이 숙소의 최대 숙박 인원은 ${accommodation.guest }명(유아 포함)입니다. 반려동물을 3마리 이상 동반하는 경우, 호스트에게 알려주세요.</small></p>
				      			</div>
								<div class="rounded" id="guest">
									<div class="mb-4 row justify-content-between d-flex align-items-center guest-box" >
										<div class="col-8">
											<div class="text-start">
												성인
											</div>
										</div>
										<div class="col-4 adult">
												<button type="button"  class="btn btn-outline-dark btn-sm m_btn guestbtn adultM">-</button>
												<span class="m-2 adultCount">1</span>
												<button type="button" class="btn btn-outline-dark btn-sm p_btn guestbtn hu_p_btn">+</button>
										</div>
									</div>
									<div class="mb-4 row justify-content-between d-flex align-items-center guest-box" >
										<div class="col-8">
											<div class="text-start">
												어린이
											</div>
											<div class="text-start">
												만 2~12세
											</div>
										</div>
										<div class="col-4 adult">
												<button type="button" class="btn btn-outline-dark btn-sm m_btn guestbtn childrenM">-</button>
												<span class="m-2 childrenCount">0</span>
												<button type="button" class="btn btn-outline-dark btn-sm p_btn guestbtn hu_p_btn">+</button>
										</div>
									</div>
									<div class="mb-4 row justify-content-between d-flex align-items-center guest-box" >
										<div class="col-8">
											<div class="text-start">
												유아
											</div>
											<div class="text-start">
												만 2세 미만
											</div>
										</div>
										<div class="col-4 adult">
												<button type="button" class="btn btn-outline-dark btn-sm m_btn guestbtn infantM">-</button>
												<span class="m-2 infantCount">0</span>
												<button type="button" class="btn btn-outline-dark btn-sm p_btn guestbtn hu_p_btn">+</button>
										</div>
									</div>
									<div class="mb-4 row justify-content-between d-flex align-items-center guest-box" >
										<div class="col-8">
											<div class="text-start">
												반려 동물
											</div>
											<div class="text-start">
												보조동물을 동반하시나요?
											</div>
										</div>
										<div class="col-4 adult">
												<button type="button" class="btn btn-outline-dark btn-sm m_btn guestbtn petM">-</button>
												<span class="m-2 petCount">0</span>
												<button type="button" class="btn btn-outline-dark btn-sm p_btn guestbtn pet_p_btn">+</button>
										</div>
									</div>
									<div class="mb-4 row justify-content-between align-middle guest-box" >
										<div class="col">
											<span>이 숙소의 최대 숙박 인원은 ${acc.guest }명(유아 포함)입니다. 
											<c:choose>
												<c:when test="${acc.pet eq 0 }">
													반려동물 동반을 허용하지 않습니다.
												</c:when>
												<c:otherwise>
													반려동물을 3마리 이상 동반하는 경우, 호스트에게 알려주세요.
												</c:otherwise>
											</c:choose>
											</span>
										</div>
										
									</div>
								</div>
				      		</div>
				      		<div class="modal-footer">
				      			<div class="col">
					        		<button type="button" class="btn btn-sm" style="background-color:white; border-color:white;" data-bs-dismiss="modal"><u>취소</u></button>
				      			</div>
				      			<div class="col-3">
				        			<button type="button" class="btn btn-dark" data-bs-dismiss="modal">저장하기</button>
				        		</div>
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
							<strong>￦ <fmt:formatNumber value=" ${accommodation.price *0.3}"  maxFractionDigits="0" /> 원</strong>
							<input class="form-check-input"  type="radio" name="payment"  id="radio-left">
						</div>
					</div>
					<div class="row p-3">
						<div class-col-9>
							지금 ₩<fmt:formatNumber value=" ${accommodation.price *0.3}" maxFractionDigits="0"/>을(를) 결제하시면, 나머지 금액(₩<fmt:formatNumber value=" ${accommodation.price *0.7}"  maxFractionDigits="0" />)은 동일한 결제수단으로 
							2022년 11월 18일 자동 청구됩니다. 추가 수수료는 없습니다.
							<br>
							<button type ="button" class="btn btn-sm" id="btn-howtouse" style="background-color:white; border-color:white;"><u>상세정보</u></button>
						</div>
					</div>
				</div>
			</div>
			<!-- 상세정보 모달 -->
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
					<c:choose>
						<c:when test="${empty cards }">
							<option value="카드등록" selected>카드를 등록하세요</option>
						</c:when>
						<c:otherwise>
							<c:forEach var="card" items="${cards }">
									<option value="유저카드" selected>${card.id }</option>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				<option value="1" disabled>결제 수단 추가하기</option>
				<option value="카드추가">신용카드 또는 체크카드</option>
				<option value="카카오 결제">카카오 결제 </option>
			</select>
			<div id="insertCard">
				<!-- 카드등록 -->
				<form class="col" id="form-reservation" method="post" action="completed?no=${accommodation.accNo }" modelAttribute="reservaionRegisterForm">
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
				<input type="hidden" name="checkInDate" value='<fmt:formatDate value="${reservaionRegisterForm.checkInDate}" pattern="yyyy-MM-dd" />'>	
				<input type="hidden" name="checkOutDate" value='<fmt:formatDate value="${reservaionRegisterForm.checkOutDate}" pattern="yyyy-MM-dd" />'>
				<input type="hidden" name="adultNum" value="${reservaionRegisterForm.adultNum }">	
				<input type="hidden" name="childrenNum" value="${reservaionRegisterForm.childrenNum }">	
				<input type="hidden" name="infantNum" value="${reservaionRegisterForm.infantNum }">	
				<input type="hidden" name="petNum" value="${reservaionRegisterForm.petNum }">	
				<input type="hidden" name="totalGuest" value="${reservaionRegisterForm.totalGuest }">	
				<input type="hidden" name="totalPrice" value="${reservaionRegisterForm.totalPrice }">
				<input type="hidden" name="serviceFee" value='<fmt:formatNumber value="${accommodation.price *0.15 }" pattern="#"/>'>
				<input type="hidden" name="cleaningPrice" value="${accommodation.cleaningPrice }">
				<input type="hidden" name="price" value="${accommodation.price }">
				<input type="hidden" name="entirePay" value="${accommodation.price }">
				<input type="hidden" name="leftPay" value='<fmt:formatNumber value="${accommodation.price *0.3 }" pattern="#"/>'>
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
								    <img class="acc" src="../resources/images/acc/${accommodation.accNo }.png">
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
								<span>￦<fmt:formatNumber value="${accommodation.price }" /> × <span class="day"></span>1박</span>
								<span style="float:right"">￦<fmt:formatNumber value="${accommodation.price }" /> 원</span>
							</div>
							<div>
								<span><u>서비스 수수료</u></span>
								<span style="float:right">￦<fmt:formatNumber value="${accommodation.price *0.15 }" maxFractionDigits="0"/> 원</span>
							</div>
							<div>
								<span><u>청소비</u></span>
								<span style="float:right">￦<fmt:formatNumber value="${accommodation.cleaningPrice }" /> 원</span>
							</div>
							<hr>
							<div class="divide2">
								<span>총 합계</span>
								<span style="float:right">￦<fmt:formatNumber value="${reservaionRegisterForm.totalPrice }" /> 원</span>
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
								    <img class="acc" src="../resources/images/acc/${accommodation.accNo }.png">
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
								<span>￦<fmt:formatNumber value="${accommodation.price }" /> × 1박</span>
								<span style="float:right"">￦<fmt:formatNumber value="${accommodation.price }" />원</span>
							</div>
							<div>
								<span><u>서비스 수수료</u></span>
								<span style="float:right">￦<fmt:formatNumber value="${accommodation.price *0.15}"   maxFractionDigits="0"/>원</span>
							</div>
							<div>
								<span><u>청소비</u></span>
								<span style="float:right">￦<fmt:formatNumber value="${accommodation.cleaningPrice }" /> 원</span>
							</div>
							<div>
								<span>총 합계</span>
								<span style="float:right">￦<fmt:formatNumber value="${reservaionRegisterForm.totalPrice }" /> 원</span>
							</div>
							<hr>
							<div class="divide2">
								<div class="border bg-white border-white">
									<span>지급일: 지금</span>
									<span style="float:right"">￦<fmt:formatNumber value="${accommodation.price *0.3}"  maxFractionDigits="0"/></span>
								</div>
								<div>
									<span>지급일:<fmt:formatDate value="${accommodation.checkIn}"  /></span>
									<span style="float:right">￦<fmt:formatNumber value="${accommodation.price *0.7}"  maxFractionDigits="0"/></span>
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
	
	// 달력 모달
	let modalCalendar = new bootstrap.Modal(document.getElementById("modal-calendar"));
		$("#btn-calendar").click(function(){
			modalCalendar.show();
		});
		
	// 게스트 모달
	let modalGuest = new bootstrap.Modal(document.getElementById("modal-guest"));
		$("#btn-guest").click(function(){
			modalGuest.show();
		});
		
	// 전액결제
	$("#entire-payment").click(function(){
		$("input:radio[name='payment']:radio[id='radio-entire']").prop('checked', true);
		$(".leftDiv").hide();
		$(".entireDiv").show();
		$("#entire-payment").addClass("border-dark border-3")
		$("#left-payment").removeClass("border-dark border-3")
	});
	
	// 일부결제
	$("#left-payment").click(function(){
		$("input:radio[name='payment']:radio[id='radio-left']").prop('checked', true);
		$(".leftDiv").show();
		$(".entireDiv").hide();
		$("#entire-payment").removeClass("border-dark border-3")
		$("#left-payment").addClass("border-dark border-3")
	});
	
	// 카드추가 선택 div추가
	$("#card-select").on('change',function(){
		let result = $("#card-select option:selected").val();
		let $insert = $("#insertCard")
		if( result == "카드추가") {
			let content = '';
			content += '<div class="row" style="padding:20px">';
			content += '	<div class="col border bg-white rounded">';
			content += '			<div class="mb-3">';
			content += '				<label for="id-field" class="form-label">카드번호</label>';
			content += '				<input class="form-control" name="id" id="id-field" placeholder="0000-0000-0000-0000"/>';
			content += '			</div>';
			content += '			<div class ="row">';
			content += '				<div class="col mb-3">';
			content += '					<label for="expiryDate-field" class="form-label">만료일</label>';
			content += '					<input class="form-control" name="expiryDate" id="expiryDate-field" placeholder="MM/YY"/>';
			content += '				</div>';
			content += '				<div class="col mb-3">';
			content += '					<label for="cvv-field" class="form-label">CVV</label>';
			content += '					<input class="form-control" name="cvv" id="cvv-field" placeholder="123"/>';
			content += '				</div>';
			content += '				<div class="mb-3">';
			content += '					<label for="zipCode-field" class="form-label">우편번호</label>';
			content += '					<input class="form-control" name="zipCode" id="zipCode-field" placeholder="12345"/>';
			content += '				</div>';
			content += '				<div class="mb-3">';
			content += '					<label for="region-field" class="form-label">지역</label>';
			content += '					<input class="form-control" name="region" id="region-field" placeholder="한국"/>';
			content += '				</div>';
			content += '		</div>';
			content += '	</div>';
			content += '</div>';
			
			$insert.append(content);
		}else {
			$insert.empty();
		}
	});
	
	// 달력
/* 	let disabledDate = ('${acc.disabledDate}').split(",");
	console.log(disabledDate) 
	
	var fp1 = $("#days-box").flatpickr({
		minDate: new Date(),
		mode: "range",
		dateFormat: "Y-m-d",
		disable : disabledDate,
		"locale": "ko" ,
		wrap: true
	   });  
	
	fp1.config.onChange.push(function(selectedDates) {
 		if (selectedDates[1]==null || selectedDates[0]==null){
 			return;
 		}
 		console.log(selectedDates[0])
 		console.log(selectedDates[1])
 		
 		let indate = new Date(selectedDates[0])
 		let outdate = new Date(selectedDates[1])
 		console.log(indate)
 		console.log(outdate) 
 		
 		// 영탁
 		document.getElementById('checkInDate').value = CF_toStringByFormatting(new Date(indate));
 		document.getElementById('checkOutDate').value = CF_toStringByFormatting(new Date(outdate));
		let diffDate = Date.parse(selectedDates[1])-Date.parse(selectedDates[0]);
		
 		let day = Math.floor(diffDate / (1000 * 60 * 60 * 24));
 		$(".day").text(day);
 		$("#input-day").val(day);
 		let sum = ${accommodation.price } * day;
 		$("#day-price").text(sum.toLocaleString());
 		$("#price").val(sum);
 		
 		
 		let totalPrice = ${acc.cleaningPrice} + sum
 		$("#totalPrice").text(totalPrice.toLocaleString())
 		$("#totalPriceValue").val(totalPrice)
	})  
*/
	
	// 인원 버튼
	$(".adultM").addClass("disabled")
	$(".childrenM").addClass("disabled")
	$(".infantM").addClass("disabled")
	$(".petM").addClass("disabled")
	
	let petLimit = parseInt(${acc.pet})
	let limit = parseInt(${acc.guest})
	
	if (petLimit === 0) {
		$(".pet_p_btn").addClass("disabled")
	}
	
	
	$("#infant").hide();
	$("#pet").hide();
	$(".guestbtn").click(function() {
		
		$(function() {
			
			let adult = parseInt($(".adultCount").text())
			let children = parseInt($(".childrenCount").text())
			let infant = parseInt($(".infantCount").text())
			let pet = parseInt($(".petCount").text())
			
			$("#adultCount").text(adult + children);		
			$("#infantCount").text(infant);		
			$("#petCount").text(pet);	
			
			
			
			if (infant === 0) {
				$("#infant").hide();
			} else {
				$("#infant").show();
				
			}
			if (pet === 0) {
				$("#pet").hide();
			} else {
				$("#pet").show();
				
			}
			let total = adult + children + infant
			
			
			limitDisabled(petLimit,pet,$(".pet_p_btn"));
			limitDisabled(limit,total,$(".hu_p_btn"));
			
			
			
			if (adult === 1){
				$(".adultM").addClass("disabled")	
			} else {
				$(".adultM").removeClass("disabled")
			}
			
			disabled(children,$(".childrenM"));
			disabled(infant,$(".infantM"));
			disabled(pet,$(".petM"));
			
			$("#adultNum").val(adult)
			$("#childrenNum").val(children)
			$("#infantNum").val(infant)
			$("#petNum").val(pet)
			$("#totalGuest").val(total)
			
			
			/* if ($("#adultNum").val === 0) {
				$("#adultCount").hide
			} else {
				$("#adultCount").show();
				
			} */
		})
		
	})
	
	function disabled(num ,select) {
		if (num === 0){
			select.addClass("disabled")	
		} else {
			select.removeClass("disabled")
		}
	}
	
	function limitDisabled(limit,num,select) {
		if (limit === num) {
			select.addClass("disabled")	
		} else {
			select.removeClass("disabled")
		}
	}
	
	$(function() {
           $(".p_btn").click(function() {
               var $this = $(this);
               var target = $this.prev();
               var num = parseInt(target.text());
               num++;
			
               target.text(num);
               
           });
           $(".m_btn").click(function() {
               var $this = $(this);
               var target = $this.next();
               var num = parseInt(target.text());
               num -= ( (num === 0) ? 0 : 1 ); //0이하로는 못내려가게 한다 
			
               target.text(num);
           });
	}); 
	
	// 카카오페이 결제하기
	$("#requestPay").click(function(){
	
		IMP.init('imp72420270');
	    IMP.request_pay({
	        pg: 'kakaopay',
	        pay_method: 'card',
	        merchant_uid: 'merchant_' + new Date().getTime(),
	        name: '에어비앤비 숙소결제',
	        amount: '${accommodation.price}',
	        buyer_email: '${accommodation.user.email}',
	        buyer_name: '${accommodation.user.name}',
	        buyer_tel: '${accommodation.user.phone}',
	        buyer_addr: "${accommodation.user.address}",
	    }, function (rsp) { 
	        if (rsp.success) {
	      	  var msg = "예약이 완료되었습니다."
	      	  msg += '고유ID : ' 	+ rsp.imp_uid
	       	  msg += '거래ID : ' 	+ rsp.merchant_uid
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