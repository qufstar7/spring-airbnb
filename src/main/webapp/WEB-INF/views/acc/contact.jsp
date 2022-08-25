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
<title>${acc.user.name }님에게 연락하기</title>
</head>
<body>
<%@ include file="../common/nav2.jsp" %> 
<%@ include file="../user/login-register-modals.jsp" %>
<div class="container">
	<div class="container main">
		<div class="row"> 
			<div class="col-8" id="main-content">
				<div class="col-12 mb-3">
					<button id="back-btn" class="text-start btn btn-none text-decoration-underline text-black border-0" type="button" onclick="history.go(-1)"><i class="bi bi-chevron-left"></i></button>
				</div>
				<div class="col-12 pb-1">
					<h4>${acc.user.name }님에게 연락하기</h4>
				</div>
				<hr>
				<div class="col-12 pb-1">
					<h4>게스트가 많이 하는 질문</h4>
				</div>
				<div class="col-12 pb-1">
					<h6>찾아가기</h6>
					<ul>
						<li>숙소 부지에 무료 주차 공간이 있습니다</li>
						<li>이 숙소의 체크인 시간은 오후 3:00부터입니다이며, 체크아웃은 오전 11:00입니다.</li>
					</ul>
					<h6>숙소 세부 정보 및 이용 규칙</h6>
					<ul>
						<li>흡연 금지. 파티나 이벤트 금지. 반려동물 동반 불가.</li>
					</ul>
					<h6>요금 설정 및 예약 가능 여부</h6>
					<ul>
						<li>체크인 30일 전까지 취소하면 전액 환불됩니다. 체크인까지 남은 기간이 30일 미만인 시점에 예약할 경우, 예약 후 48시간 이내에 취소하고 체크인까지 14일 이상이 남았다면 전액 환불되며, 그 후에는 체크인 7일 전까지 취소하면 예약금의 50%가 환불됩니다. 그 후에는 환불되지 않습니다.</li>
					</ul>
				</div>
				<hr>
				<form action="note/add" method="post" id="contact">
					<div class="col-12 pb-1 mb-2">
						<h4>질문이 더 있으신가요? 호스트에게 메시지를 보내 문의하세요.</h4>
						<textarea class="form-control rounded" name="content" style="width: 653px; height: 100%; min-height: 176px;">
						</textarea>
						<input type="hidden" name="no" value="${acc.accNo }">
					</div>
					<button type="submit" class="btn btn-outline-dark float-end">메세지 전송하기</button>
				</form>
			</div> 
			<div class="col-4" id="side">
				<div id="sticky" >
				<form id="form-reservation" method="post" action="/book/register?no=${acc.accNo }">
					<div class="row shadow-lg bg-body rounded" id="box">
						<div class="col-6 boxhd reservation" >
							<h4><strong><fmt:formatNumber value="${acc.price }"/></strong>/
								<span class="day"></span>박
							</h4>
						</div>
						<div class="row boxhd not-reservation" >
							<h4><strong>요금을 확인하려면 날짜를 입력하세요.</strong>
							</h4>
						</div>
						<div class="col-6 boxhd">
							<button type="button" class="btn btn-link text-dark btn-sm"><i class="bi bi-star-fill"></i> ${acc.reviewScore } <span class="text-decoration-underline">후기 ${acc.reviewCount }개</span></button>
						</div>
						<div class="col-12 start" >
							<div class="" id="days-box">
								<input type="text" class="text-center" placeholder="체크인 체크아웃을 설정하시오" data-input id="days">
								<input type="date" name="checkInDate" id="checkInDate" value="" >
								<input type="date" name="checkOutDate" id="checkOutDate" value="" >
								<input type="hidden" name="adultNum" id="adultNum" value="1">
								<input type="hidden" name="childrenNum" id="childrenNum" value="0">
								<input type="hidden" name="infantNum" id="infantNum" value="0">
								<input type="hidden" name="petNum" id="petNum" value="0">
								<input type="hidden" name="totalGuest" id="totalGuest" value="1">
								<input type="hidden" name="day" id="input-day" value="">
							</div>
						</div>
						<div class="m-0 p-0 text-center">
							<button type="button" class="btn btn-outline-dark p-2 text-start" id="guest-btn">
								<span id="adult">게스트: <span id="adultCount">1</span>명</span> <span id="infant">유아: <span id="infantCount">0</span>명</span> <span id="pet">반려동물: <sapn id="petCount"> 0</sapn>마리</span>
								<i class="bi bi-caret-down-fill float-end" id="down"></i>
								<i class="bi bi-caret-up-fill float-end" id="up"></i>
							</button>
							<div class="rounded" id="guest">
								<div class="mb-4 row justify-content-between d-flex align-items-center guest-box" >
									<div class="col-8">
										<div class="text-start">
											성인
										</div>
										<div class="text-start">
											만 13세 이상
										</div>
									</div>
									<div class="col-4 adult">
											<button type="button" class="btn btn-outline-dark btn-sm m_btn guestbtn adultM">-</button>
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
					  	<c:if test="${empty LOGIN_USER}">
								<!-- 로그인 하지 않았을 때 -->
							<button type="button" class="btn btn-danger p-2 mt-2 reservation r-btn" data-bs-toggle="modal" data-bs-target="#email-login-modal">예약하기</button>
						</c:if>
						<c:if test="${not empty LOGIN_USER}">
							<button type="submit" class="btn btn-danger p-2 mt-2 reservation r-btn" >예약하기</button>
						</c:if>
						<div class="mb-3 text-center mt-2">
							<span>예약 확정 전에는 요금이 청구되지 않습니다.</span>
						</div>
						<div class="row reservation">
							<div class="col-6 text-left"><p class="text-decoration-underline">₩<fmt:formatNumber value="${acc.price }"/> x <span class="day"></span>박</p></div>
							<div class="col-6 text-end"><p>₩<span id="day-price"></span>원</div>
							<input type="hidden" name="price" id="price" value="0">
						</div>
						<div class="row reservation">
							<div class="col-6"><p class="text-decoration-underline">청소비</p></div>
							<div class="col-6 text-end"><p>₩<fmt:formatNumber value="${acc.cleaningPrice }"/>원</div>
							<input type="hidden" name="serviceFee" id="serviceFee" value="${acc.cleaningPrice }">
						</div>
						<hr>
						<div class="row reservation">
							<div class="col-6"><h6>총합계</h6></div>
							<div class="col-6 text-end"><h6 >₩<span id="totalPrice"></span>원</h6></div>
							<input type="hidden" name="totalPrice" id="totalPriceValue" value="${acc.cleaningPrice }">
						</div>
					</div>
					<div class="text-center">
					<c:choose>
					  	<c:when test="${empty LOGIN_USER}">
								<!-- 로그인 하지 않았을 때 -->
								<a href="" data-bs-toggle="modal" data-bs-target="#email-login-modal">
									<button type="button" class="btn btn-link text-decoration-underline text-dark"><i class="bi bi-flag-fill"></i> 숙소 신고하기</button>
								</a>
						</c:when>
						<c:otherwise>
								<!-- 로그인 했을 때 -->
								<a href="">
									<button type="button" class="btn btn-link text-decoration-underline text-dark"><i class="bi bi-flag-fill"></i> 숙소 신고하기</button>
								</a>
						</c:otherwise>
					</c:choose>
					</div>
				</form>
				</div>
				
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	
	// 달력
	let disabledDate = ('${acc.disabledDate}').split(",");
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
 		document.getElementById('checkInDate').value = CF_toStringByFormatting(new Date(indate));
 		document.getElementById('checkOutDate').value = CF_toStringByFormatting(new Date(outdate));
		let diffDate = Date.parse(selectedDates[1])-Date.parse(selectedDates[0]);
		
 		let day = Math.floor(diffDate / (1000 * 60 * 60 * 24));
 		$(".day").text(day);
 		$("#input-day").val(day);
 		let sum = ${acc.price } * day;
 		$("#day-price").text(sum.toLocaleString());
 		$("#price").val(sum);
 		
 		
 		let totalPrice = ${acc.cleaningPrice} + sum
 		$("#totalPrice").text(totalPrice.toLocaleString())
 		$("#totalPriceValue").val(totalPrice)
	}) 
	
	function CF_toStringByFormatting(source){
		var date = new Date(source);
		const year = date.getFullYear();
		const month = CF_leftPad(date.getMonth() + 1);
		const day = CF_leftPad(date.getDate());
		return [year, month, day].join('-');
	}
	
	
	function CF_leftPad(value){
		if (Number(value) >= 10) {
			return value;
		}
		return "0" + value;
	}
	$(".reservation").hide();
	
	$("#nav-1").hide();
	$("#navR2").hide();
	
	$("#days").on('input',function(){
      if (!$("#days").empty()){
    	  $(".reservation").hide();
    	  $(".not-reservation").show();
    	  
    	  $("#navR2").hide();
	      $("#navR").show();
    	  
      } else {
    	  $(".reservation").show();
    	  $(".not-reservation").hide();
    	  $("#navR").hide();
		  $("#navR2").show();
      }

   })
   $("#checkInDate").hide();
   $("#checkOutDate").hide();
   // 인원 버튼
	$("#guest").hide();
	$("#up").hide();
	
	$("#guest-btn").click(function() {
		$("#guest").toggle();
		$("#up").toggle();
		$("#down").toggle();
	})
	
	$(".adultM").addClass("disabled")
	$(".childrenM").addClass("disabled")
	$(".infantM").addClass("disabled")
	$(".petM").addClass("disabled")
	
	let petLimit = parseInt(${acc.pet})
	let limit = parseInt(${acc.guest})
	
	if (petLimit === 0) {
		$(".pet_p_btn").addClass("disabled")
	}
	
	/* $("#adultCount").hide();
	$("#infantCount").hide();
	$("#petCount").hide(); */
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
	
$("#form-reservation").submit(function() {
		
		// 인원수
		let totalValue = $.trim($("#totalGuest").val());
		if (totalValue < 1) {
			alert("인원은 필수 입력값입니다.");
			return false;
		}
		// 날짜
		let checkIn = $.trim($("#checkInDate").val());
		if (checkIn === "") {
			alert("날짜는 필수 입력값입니다.");
			return false;
		}
		let checkOut = $.trim($("#checkOutDate").val());
		if (checkOut === "") {
			alert("날짜 필수 입력값입니다.");
			return false;
		}
		return true;
	})
	$("#form-create-wishlist").submit(function() {
		
		let titleValue = $.trim($(":input[name=wishlistName]").val());
		if (titleValue === "") {
			alert("제목은 필수 입력값입니다.");
			return false;
		}
			
		return true;
	})
	
	$("#contact").submit(function() {
		
		let userNo = ${LOGIN_USER.no}
		let hostNo = ${acc.user.no}
		if (hostNo === userNo) {
			alert("본인 숙소에는 연락을 보낼수 없습니다.");
			return false;
		}
			
		return true;
	})
	
})
</script>
</body>
</html>