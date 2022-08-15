<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="tags.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbarstyle.css">
<!-- 달력 -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<!-- 달력2 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<!-- html 하단에 순서로 로드 -->
<script src="js/flatpickr.js"></script>
	<!-- 언어설정을 위한 로드 -->
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>


<nav class="navbar py-0" id="nav">
		<!-- 로고가 있는 navbar -->
		<div class="container">
			<div class="box" id="logo">
				<a href="/"> <!-- 임시 로고 -->
					<img src="../../../resources/logo-home.png" alt="로고" width="100"/>
				</a>
			</div>
			<div id="search" class="box d-flex justify-content-center">
				<!-- 메인페이지에서 사용하는 검색창 -->
				<div id="navSearch" class="p-1 position-relative" type="button" style="border:1px solid #D8D8D8; border-radius: 25px; width:360px; height:48px;box-shadow: 1px 4px 7px 0px rgba(0,0,0,0.1);">
					<div class="allSpace" style="width:366px; padding: 2px 0px;">
						<div class="btn-group position-static" >
							<div id="where" class="btn-group position-static">
								<button type="button" class="btn p-0" data-bs-toggle="dropdown" aria-expanded="false" onclick='searchFn()'>
									<strong>어디든지</strong>	<!-- 주소만 검색 -->
									<input type="text" name="" value="" style="background-color:transparent; border:none; display:none;"/>
								</button>
								<div class="dropdown-menu m-0" style="left:55%; top: 62px;">
									<div class="" style="width:40%; float: left;">
									<h3 class="h6 p-3">최근 검색어</h3>
									</div>
									<div class=" d-flex flex-wrap justify-content-center" style="width:50%; float: left;">
									<h3 class="h6 p-3" style="width:100%">지역으로 검색하기</h3>
										<div style="width:30%"><a class="dropdown-item" href="#"><img src="https://a0.muscache.com/pictures/f9ec8a23-ed44-420b-83e5-10ff1f071a13.jpg" alt="" class="w-100"><p>컨텐츠1</p></a></div>
										<div style="width:30%"><a class="dropdown-item" href="#"><img src="https://a0.muscache.com/pictures/f9ec8a23-ed44-420b-83e5-10ff1f071a13.jpg" alt="" class="w-100"><p>컨텐츠2</p></a></div>
										<div style="width:30%"><a class="dropdown-item" href="#"><img src="https://a0.muscache.com/pictures/f9ec8a23-ed44-420b-83e5-10ff1f071a13.jpg" alt="" class="w-100"><p>컨텐츠3</p></a></div>
										<div style="width:30%"><a class="dropdown-item" href="#"><img src="https://a0.muscache.com/pictures/f9ec8a23-ed44-420b-83e5-10ff1f071a13.jpg" alt="" class="w-100"><p>컨텐츠4</p></a></div>
										<div style="width:30%"><a class="dropdown-item" href="#"><img src="https://a0.muscache.com/pictures/f9ec8a23-ed44-420b-83e5-10ff1f071a13.jpg" alt="" class="w-100"><p>컨텐츠5</p></a></div>
										<div style="width:30%"><a class="dropdown-item" href="#"><img src="https://a0.muscache.com/pictures/f9ec8a23-ed44-420b-83e5-10ff1f071a13.jpg" alt="" class="w-100"><p>컨텐츠6</p></a></div>
									</div>
								</div>
							</div>
							<span style="padding: 2px; color: lightgray;">|</span>
							<div id="when" class="btn-group position-static">
								<button type="button" class="btn p-0" data-bs-toggle="dropdown" aria-expanded="false" style="" onclick='dateFn()'>
									<strong>언제든 일주일</strong>
								</button>
								<div class="dropdown-menu m-0" style="left:50%; top: 62px;">
									<input class="dateSelector" placeholder="ex) 2020-09-01" style="left: 50px"/>
									<!-- 달력1 <input type="text" id="demo" name="demo" value="" /> -->
								</div>
							</div>
							<span style="padding: 2px; color: lightgray;">|</span>
							<div id="who" class="btn-group position-static">
								<button type="button" class="btn p-0" data-bs-toggle="dropdown" aria-expanded="false" style=""onclick='countFn()'>게스트 추가</button>  <!-- onclick="searchFunction()" -->
								<div id="count-dropdown" class="dropdown-menu m-0" style="left:50%; top: 62px;">
									<ul class="list-group list-group-flush mx-3">
										<li class="list-group-item d-flex justify-content-between align-items-center">
											<div><p class="mt-3 mb-0"><strong>성인</strong></p><p class="mb-3">13세 이상</p></div>
											<div class="adultCount d-flex align-items-center">
												<button type="button" class="btn" id="adultDown"><i class="bi bi-dash-circle h3 text-black-50"></i></button>
												<input type="text" name="adultCount" value="0" readonly="readonly" style="text-align:center; width:30px; border:none; font-size:20px;"/>
												<button type="button" class="btn" id="adultUp"><i class="bi bi-plus-circle h3 text-black-50"></i></button>
											</div>
										</li>
										<li class="list-group-item d-flex justify-content-between align-items-center">
											<div><p class="mt-3 mb-0"><strong>어린이</strong></p><p class="mb-3">만 2~12세</p></div>
											<div class="d-flex align-items-center">
												<button type="button" class="btn" ><i class="bi bi-dash-circle h3 text-black-50"></i></button>
												<input type="text h4" name="result" value="0" readonly="readonly" style="text-align:center; width:30px; border:none; font-size:20px;"/>
												<button type="button" class="btn" ><i class="bi bi-plus-circle h3 text-black-50"></i></button>
											</div>
										</li>
										<li class="list-group-item d-flex justify-content-between align-items-center">
											<div><p class="mt-3 mb-0"><strong>유아</strong></p><p class="mb-3">만 2세 미만</p></div>
											<div class="d-flex align-items-center">
												<button type="button" class="btn" onclick=''><i class="bi bi-dash-circle h3 text-black-50"></i></button>
												<input type="text h4" name="result" value="0" readonly="readonly" style="text-align:center; width:30px; border:none; font-size:20px;"/>
												<button type="button" class="btn" onclick=''><i class="bi bi-plus-circle h3 text-black-50"></i></button>
											</div>
										</li>
										<li class="list-group-item d-flex justify-content-between align-items-center">
											<div><p class="mt-3 mb-0"><strong>반려동물</strong></p><p class="mb-3"><a href="#" data-bs-toggle="modal" data-bs-target="#" style="color:gray;">보조동물을 동반하시나요?</a></p></div>
											<div class="d-flex align-items-center">
												<button type="button" class="btn" onclick=''><i class="bi bi-dash-circle h3 text-black-50"></i></button>
												<input type="text h4" name="result" value="0" readonly="readonly" style="text-align:center; width:30px; border:none; font-size:20px;"/>
												<button type="button" class="btn" onclick=''><i class="bi bi-plus-circle h3 text-black-50"></i></button>
											</div>
										</li>
									</ul>
								</div>
							</div>
							<button class="search-btn p-0">
								<span class="material-symbols-outlined">search</span>
							</button>
						</div>
					</div>
				</div>
				<!-- 클릭하면 커지는 검색창 Offcanvas 
				<div class="p-1 position-relative overlay" type="" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop" style="width:370px; height:48px;">
					<div class="d-inline-flex p-2 position-absolute top-50 start-50 translate-middle" style="width:366px;">
						<button class="p-0" style="background-color:transparent; border: none; width:29%; font-size: 16px;">숙소</button>
						
						<button class="p-0" style="background-color:transparent; border: none; width:35%; font-size: 16px;">체험</button>
						
						<button class="p-0" style="background-color:transparent; border: none; width:32%; font-size: 16px;">온라인 체험</button>
					</div>
					
				</div>
				-->
				
					<!-- 숙소 상세페이지에서 사용하는 검색창 -->
					<!--
					<div class="shadow p-1 position-relative" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop" style="border:1px solid #E6E6E6; border-radius: 25px; width:400px; height:48px;">
					<div class="d-inline-flex p-2 position-absolute top-50 start-50 translate-middle " style="width:366px;">
						<button class="position-absolute top-50 start-50 translate-middle" style="background-color:transparent; border: none; width:80%; font-size: 14px;">
							<div class="float-start">검색 시작하기</div>
							<div class="p-0 float-end" style="background-color:red; border: none; border-radius: 50px; width:9%">
								<i class="bi bi-search" style="color:#FFFFFF"></i>
							</div>
						</button>
					</div> 
				</div> -->	
			</div>
			<div class="box justify-content-between">
				<div class="row align-items-center" id="userbtn">
					<div class="col">
						<button class="hostbtn" type="button">호스트모드로 전환</button>
					</div>
					<div class="dropdown col">
					  <button onclick="myFunction()" class="dropbtn">
					  <a>
					  	<div>
					    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
					      <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
					    </svg>
					    </div>
					    <!-- 프로필 -->
					    <div style="border-radius: 50px">
					   		<c:choose>
							    <c:when test="${empty LOGIN_USER}">
							    	<svg xmlns="http://www.w3.org/2000/svg" width="33" height="33" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16" style="width:36px; color:#6E6E6E">
									  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
									  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
									</svg>
							    </c:when>
							    <c:otherwise>
							      <img class="acc-thumbnail" src="/resources/images/acc/sample-home.jpg" alt="프로필이미지">
							    </c:otherwise>
					    	</c:choose>
					    </div>
					  </button>
					  </a>
					  <!-- 프로필 드롭다운 -->
					  <div id="myDropdown" class="dropdown-content">
					  <c:choose>
					  	<c:when test="${empty LOGIN_USER}">
								<!-- 로그인 하지 않았을 때 -->
								<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#email-login-modal">로그인</a>
								<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#email-login-modal">회원 가입</a>
						</c:when>
						<c:otherwise>
								<!-- 로그인 했을 때 -->
								<a class="dropdown-item" href="#"><strong>메시지</strong></a>
								<a class="dropdown-item" href="#"><strong>알림</strong></a>
								<a class="dropdown-item" href="#"><strong>여행</strong></a>
								<a class="dropdown-item" href="/wishlists"><strong>위시리스트</strong></a>
								<hr style="width:180px; margin: 10px auto;">
								<a class="dropdown-item" href="/host">숙소 호스트 되기</a>
								<a class="dropdown-item" href="/user/account-settings">계정</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="/logout">로그아웃</a>
						</c:otherwise>
					  </c:choose>
					  </div>
					</div>
					<!-- <div class="col-3 position-relative" style="border:1px solid #E6E6E6; border-radius: 25px; width:77px; height:42px;">
						<div class="position-absolute top-50 start-50 translate-middle">
							<button class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="background-color:transparent; border: none; width:26%;">
								<a>
									가로줄 3개 아이콘
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
				 							<path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
									</svg>
									프로필 이미지 대신합니다.
									<span style="border-radius: 50px">
										<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="프로필이미지" style="vertical-align: middle; width: 35px; height: 35px; border-radius: 50%">
									</span>
								</a>
							</button>
							읽지 않은 알람표시
							<span class="position-absolute top-0 end-0 translate-middle badge border border-light rounded-circle bg-danger p-2"><span class="visually-hidden">unread messages</span></span>
							<div class="dropdown-menu dropdown-menu-end" style="">
								로그인 하지 않았을 때
								<a class="dropdown-item" href="#">로그인</a>
								<a class="dropdown-item" href="#">회원 가입</a>
								로그인 했을 때
								<a class="dropdown-item" href="#"><strong>메시지</strong></a>
								<a class="dropdown-item" href="#"><strong>알림</strong></a>
								<a class="dropdown-item" href="#"><strong>여행</strong></a>
								<a class="dropdown-item" href="#"><strong>위시리스트</strong></a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="/host">숙소 호스트 되기</a>
								<a class="dropdown-item" href="#">계정</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">로그아웃</a>
							</div>
							</div>
					</div> -->
				</div>
			</div>
		</div>

<script>
/* 숙소리스트페이지에서 map위에 dropdown 출현 */
function myFunction() {
   document.getElementById("myDropdown").classList.toggle("show");   
   if (!$("#myDropdown").hasClass("show")) {
      $(".sticky-top").css('z-index', "4");
      $("#mySidebar").css('z-index', "5")
   } else {
      $(".sticky-top").css('z-index', "5")
      $("#mySidebar").css('z-index', "4")
   }
}
/* 드롭다운 바깥을 클릭했을 때 드롭다운이 닫힘 */
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
  
}
function searchFn() {
	$("#navSearch").css('width', "500px");
	$(".allSpace").css('width', "100%");
	$("#where").css('width', "220px");
	
	$("#when").css('width', "109px");
	$("#who").css('width', "95px");
	
	$('#where').find('strong').show();
	$('#where').find('input').hide();
	
	$('#where').find('strong').toggle();
	
	if ($('#where').find('input').show()) {
		let currentDisabled = $('#where').find('input').prop("disabled");
		$('#where').find('input').prop("disabled", !currentDisabled);
	}
}
function dateFn() {
	$("#navSearch").css('width', "500px")
	$(".allSpace").css('width', "100%");
	$("#when").css('width', "230px");
	
	$("#where").css('width', "97px");
	$("#who").css('width', "95px");
	
}
function countFn() {
	$("#navSearch").css('width', "500px")
	$(".allSpace").css('width', "100%");
	$("#who").css('width', "217px");
	
	$("#where").css('width', "97px");
	$("#when").css('width', "109px");
}
/* (테스트) 드롭다운 클릭해도 닫히지 않게 
function searchFunction() {
	 document.getElementById("count-dropdown").classList.toggle("show");
}
document.getElementById("count-dropdown").onclick = function(event) {
	if (event.target.matches('.btn')) {
    var dropdowns = document.getElementsByClassName("dropdown-menu");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
} */

/* 언제든지-달력 */
/* $(function () {
    $('#demo').daterangepicker({
        "locale": {
            "format": "YYYY-MM-DD",
            "separator": " ~ ",
            "applyLabel": "확인",
            "cancelLabel": "취소",
            "fromLabel": "From",
            "toLabel": "To",
            "customRangeLabel": "Custom",
            "weekLabel": "W",
            "daysOfWeek": ["월", "화", "수", "목", "금", "토", "일"],
            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            "firstDay": 1
        },
        "startDate": "2020-10-21",
        "endDate": "2020-10-23",
        "drops": "down"
    }, function (start, end, label) {
        console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
    });
}); */

var dateSelector = document.querySelector('.dateSelector');
dateSelector.flatpickr({
	mode: "range",
	inline: true,
	minDate: "today",    
	dateFormat: "Y-m-d",
	showMonths: 1
	/* disable: [
		function(date) { 
 	 		// disable every multiple of 8            
 	 		return !(date.getDate() % 8);   
 	 	}    
	] */
});


/* 게스트추가 - 카운트 */
$(document).ready(function(){
	var inp =$("input[name='adultCount']").val();
	$("#adultUp").on("click",function(){
		setTimeout(function(){
		if (inp == 300)
		{
			inp;
		}
		else{inp ++;}
		$("input[name='adultCount']").val(inp);
		},500);
	});
	$("#adultDown").on("click",function(){
		setTimeout(function(){
		if (inp == 100)
		{
			inp;
		}
		else if(inp <= 300)
		{
			inp--;
		}
		$("input[name='adultCount']").val(inp);
		},500);
	});
});

/* function count(type)  {
  // 결과를 표시할 element
  const adult = document.getElementById('result-adult');
  // 현재 화면에 표시된 값
  let numberAdult = adult.innerText;
  
  // 더하기/빼기
	if(type === 'plus') {
		number = parseInt(numberAdult) + 1;
	} else if(type === 'minus')  {
		number = parseInt(numberAdult) - 1;
	}
	// 결과 출력
	resultElement.innerText = numberAdult;
}
 */
</script>
</nav>

