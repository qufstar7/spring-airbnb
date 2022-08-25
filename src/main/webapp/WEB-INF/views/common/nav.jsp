<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="tags.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbarstyle.css">

<!-- 달력 -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="/resources/js/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<!-- 달력2 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<!-- html 하단에 순서로 로드 -->
<script src="js/flatpickr.js"></script>
	<!-- 언어설정을 위한 로드 -->
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

<nav class="navbar ${page eq 'subNav' ? '' : 'sticky-top' } py-0" id="nav">
		<!-- 로고가 있는 navbar -->
		<div class="container">
			<div class="box" id="logo">
				<a href="/"> <!-- 임시 로고 -->
					<img src="../../../resources/logo-home.png" alt="로고" width="100"/>
				</a>
			</div>
			<div id="search" class="box d-flex justify-content-center">
				<!-- 메인페이지에서 사용하는 검색창 -->
				<form id="search-form" method="GET" action="/acc/list">
				<div id="navSearch" class="p-1 position-relative" type="button" style="border:1px solid #D8D8D8; border-radius: 25px; width:360px; height:48px;box-shadow: 1px 4px 7px 0px rgba(0,0,0,0.1);">
					<div class="allSpace" style="width:366px; padding: 2px 0px;">
						<div class="btn-group position-static" >
							<div id="where" class="btn-group position-static">
								<button type="button" id="btn-open-where" class="btn p-0 " data-bs-toggle="dropdown" aria-expanded="false" >
									<span class="search-title">어디든지</span>	<!-- 주소만 검색 -->
									<input type="text" id="where-field" name="keyword" value=""  style="display: none; border: none !important;"/>
								</button>
								<div class="dropdown-menu m-0" style="left:55%; top: 62px;">
									<div class="" style="width:40%; float: left;">
										<h3 class="h6 p-3"><strong>최근 검색어</strong></h3>
									</div>
									<div class=" d-flex flex-wrap justify-content-center" style="width:50%; float: left;">
									<h3 class="h6 p-3" style="width:100%"><strong>대한민국 내 인기 여행지</strong></h3>
										<div style="width:30%">
											<button type="button" class="area-btn" data-area="서울">
												<img src="https://pix6.agoda.net/geo/city/14690/1_14690_02.jpg?ca=6&ce=1&s=345x345&ar=1x1" alt="" class="w-100" style="border-radius: 15px;">
												<div style="text-align: center; font-size: 13px; padding: 0 0 10px 0;">서울</div>
												
											</button>
										</div>
										<div style="width:30%">
											<button type="button" class="area-btn" data-area="제주">
												<img src="https://pix6.agoda.net/geo/city/16901/1_16901_02.jpg?ca=6&ce=1&s=345x345&ar=1x1" alt="" class="w-100" style="border-radius: 15px;">
												<div style="text-align: center; font-size: 13px; padding: 0 0 10px 0;">제주</div>
												
											</button>
										</div>
										<div style="width:30%">
											<button type="button" class="area-btn" data-area="부산">
												<img src="https://pix6.agoda.net/geo/city/17172/1_17172_02.jpg?ca=6&ce=1&s=345x345&ar=1x1" alt="" class="w-100" style="border-radius: 15px;">
												<div style="text-align: center; font-size: 13px; padding: 0 0 10px 0;">부산</div>
											</button>
										</div>
										<div style="width:30%">
											<button type="button" class="area-btn" data-area="강릉">
												<img src="https://pix6.agoda.net/geo/city/19041/1_19041_02.jpg?ca=6&ce=1&s=345x345&ar=1x1" alt="" class="w-100" style="border-radius: 15px;">
												<div style="text-align: center; font-size: 13px; padding: 0 0 10px 0;">강릉</div>
												
											</button>
										</div>
										<div style="width:30%">
											<button type="button" class="area-btn" data-area="여수">
												<img src="https://pix6.agoda.net/geo/city/213193/1_213193_02.jpg?ca=6&ce=1&s=345x345&ar=1x1" alt="" class="w-100" style="border-radius: 15px;">
												<div style="text-align: center; font-size: 13px; padding: 0 0 10px 0;">여수</div>
												
											</button>
										</div>
										<div style="width:30%">
											<button type="button" class="area-btn" data-area="경주">
												<img src="https://pix6.agoda.net/geo/city/17179/1_17179_02.jpg?ca=6&ce=1&s=345x345&ar=1x1" alt="" class="w-100" style="border-radius: 15px;">
												<div style="text-align: center; font-size: 13px; padding: 0 0 10px 0;">경주</div>
												
											</button>
										</div>
									</div>
								</div>
							</div>
							<span style="padding: 2px; color: lightgray;">|</span>
							<div id="when" class="btn-group position-static">
								<button type="button" id="btn-open-when" class="btn p-0" data-bs-toggle="dropdown" aria-expanded="false" style="">
									<span class="search-title">언제든 일주일</span>
								</button>
								<div class="dropdown-menu m-0" style="left:50%; top: 62px; padding:40px">
									<div class="ckindate" style="float:left;">
										<!-- 달력 from -->
										<label for="startDate" style="font-size:15px;">체크인</label>
										<input type="text" class="c-from" name="startDate" id="startDate" pattern="yyyy-dd-mm" value="" />
									</div>
									<div class="ckoutdate" style="float:right;">
										<!-- 달력 to -->
										<label for="endDate" style="font-size:15px;">체크아웃</label>
										<input type="text" class="c-to" name="endDate" id="endDate" pattern="yyyy-dd-mm" value="" />
									</div>
									<!-- 달력2 <input class="dateSelector" placeholder="ex) 2020-09-01" style="left: 50px"/> -->
									<!-- 달력1 <input type="text" id="demo" name="demo" value="" /> -->
								</div>
							</div>
							<span style="padding: 2px; color: lightgray;">|</span>
							<div id="who" class="btn-group position-static">
								<button type="button"  id="btn-open-who" class="btn p-0" data-bs-toggle="dropdown" aria-expanded="false" style=""><span class="search-title">게스트 추가</span></button>  <!-- onclick="searchFunction()" -->
								<div id="count-dropdown" class="dropdown-menu m-0" style="left:50%; top: 62px;">
									<ul class="list-group list-group-flush mx-3">
										<li class="list-group-item d-flex justify-content-between align-items-center">
											<div><p class="mt-3 mb-0"><strong>성인</strong></p><p class="mb-3">13세 이상</p></div>
											<div class="adultCount d-flex align-items-center">
												<button type="button" class="btn" id="adultDown"><i class="bi bi-dash-circle h3 text-black-50"></i></button>
												<input type="text" name="adult" value="0" readonly="readonly" style="text-align:center; width:30px; border:none; font-size:20px;"/>
												<button type="button" class="btn" id="adultUp"><i class="bi bi-plus-circle h3 text-black-50"></i></button>
											</div>
										</li>
										<li class="list-group-item d-flex justify-content-between align-items-center">
											<div><p class="mt-3 mb-0"><strong>어린이</strong></p><p class="mb-3">만 2~12세</p></div>
											<div class="d-flex align-items-center">
												<button type="button" class="btn" id="childDown" ><i class="bi bi-dash-circle h3 text-black-50"></i></button>
												<input type="text h4" name="child" value="0" readonly="readonly" style="text-align:center; width:30px; border:none; font-size:20px;"/>
												<button type="button" class="btn" id="childUp" ><i class="bi bi-plus-circle h3 text-black-50"></i></button>
											</div>
										</li>
										<li class="list-group-item d-flex justify-content-between align-items-center">
											<div><p class="mt-3 mb-0"><strong>유아</strong></p><p class="mb-3">만 2세 미만</p></div>
											<div class="d-flex align-items-center">
												<button type="button" class="btn" id="infantDown"><i class="bi bi-dash-circle h3 text-black-50"></i></button>
												<input type="text h4" name="infant" value="0" readonly="readonly" style="text-align:center; width:30px; border:none; font-size:20px;"/>
												<button type="button" class="btn" id="infantUp"><i class="bi bi-plus-circle h3 text-black-50"></i></button>
											</div>
										</li>
										<li class="list-group-item d-flex justify-content-between align-items-center">
											<div><p class="mt-3 mb-0"><strong>반려동물</strong></p><p class="mb-3"><a href="#" data-bs-toggle="modal" data-bs-target="#" style="color:gray;">보조동물을 동반하시나요?</a></p></div>
											<div class="d-flex align-items-center">
												<button type="button" class="btn" id="petDown"><i class="bi bi-dash-circle h3 text-black-50"></i></button>
												<input type="text h4" name="pet" value="0" readonly="readonly" style="text-align:center; width:30px; border:none; font-size:20px;"/>
												<button type="button" class="btn" id="petUp"><i class="bi bi-plus-circle h3 text-black-50"></i></button>
											</div>
										</li>
									</ul>
								</div>
							</div>
							<button id="btn-search" class="search-btn p-0" type="submit">
								<span class="material-symbols-outlined">search</span>
							</button>
						</div>
					</div>
				</div>
				</form>
			</div>
			<div class="box justify-content-between">
				<div class="row align-items-center" id="userbtn">
					<div class="col">
						<c:if test="${empty LOGIN_USER }">
							<button class="hostbtn" type="button" data-bs-toggle="modal" data-bs-target="#email-login-modal" style="width:150px;">로그인 후 호스팅하기</button>
						</c:if>
						<c:if test="${not empty LOGIN_USER }">
							<button class="hostbtn" type="button" onclick="location.href='/host/hosting'">호스트모드로 전환</button>
						</c:if>
					</div>
					<div class="dropdown col">
					  <button class="dropbtn" id="btn-toggle-mymenu">
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
							    <c:when test="${not empty LOGIN_USER && empty LOGIN_USER.profileImage}">
							    	<img class="acc-thumbnail" src="/resources/images/profile/profile-default-img.png" alt="기본프로필이미지">
							    </c:when>
							    <c:otherwise>
							      <img class="acc-thumbnail" src="/resources/images/profile/${LOGIN_USER.profileImage}" alt="프로필이미지">
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
								<a class="dropdown-item" href="/acc/recvnote"><strong>메시지</strong></a>
								<a class="dropdown-item" href="#"><strong>알림</strong></a>
								<a class="dropdown-item" href="/book/trip"><strong>여행</strong></a>
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
				</div>
			</div>
		</div>

<script>
$(function() { 
	// 숙소리스트페이지에서 map위에 dropdown 출현 
	$("#btn-toggle-mymenu").click(function() {
		
		document.getElementById("myDropdown").classList.toggle("show");   
		if (!$("#myDropdown").hasClass("show")) {
			$(".sticky-top").css('z-index', "4");
			$("#mySidebar").css('z-index', "5")
		} else {
			$(".sticky-top").css('z-index', "5")
			$("#mySidebar").css('z-index', "4")
		}
	});
	
	// dropdown외의 영역을 클릭했을 때 dropdown 닫기
	$(window).click(function(event) {
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
	});

	// list 페이지에서 z-index 설정하기
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
	
	// 어디든지를 클릭했을 때
	$("#btn-open-where").click(function() {
		$("#navSearch").css('width', "500px");
		$(".allSpace").css('width', "100%");
		$("#where").css('width', "220px").find('span.search-title').hide();
		$("#when").css('width', "109px").find('span.search-title').removeClass('fw-bold fs-6');
		$("#who").css('width', "95px").find('span.search-title').removeClass('fw-bold fs-6');
		
		$("#where-field").show().trigger("focus");
	});
	
	// 대한민국 내 인기 여행지 - 버튼 클릭  
	$(".area-btn").click(function() {
		var area = $(this).attr("data-area")
		$("#where-field").val(area);
	});
	
	// 언제든 일주일을 클릭했을 때
	$("#btn-open-when").click(function() {
		$("#navSearch").css('width', "500px");
		$(".allSpace").css('width', "100%");
		$("#where").css('width', "97px")
		$("#when").css('width', "230px").find('span.search-title').addClass('fw-bold fs-6');
		$("#who").css('width', "95px").find('span.search-title').removeClass('fw-bold fs-6');
		
		
		if ($("#where-field").val() != "") {
			$("#where").find('span.search-title').hide()
		} else {
			$("#where").find('span.search-title').show()
			$("#where-field").hide();
		}
	});
	
	// 게스트 추가를 클릭했을 때
	$("#btn-open-who").click(function() {
		$("#navSearch").css('width', "500px");
		$(".allSpace").css('width', "100%");
		$("#where").css('width', "97px").find('span.search-title').show()
		$("#when").css('width', "109px").find('span.search-title').removeClass('fw-bold fs-6');
		$("#who").css('width', "217px").find('span.search-title').addClass('fw-bold fs-6');
		
		if ($("#where-field").val() != "") {
			$("#where").find('span.search-title').hide()
		} else {
			$("#where").find('span.search-title').show()
			$("#where-field").hide();
		}
	});
// nav 검색 기능 
	$("#btn-search").click(function(){
		// 게스트추가만 클릭하고 검색한 경우 현재페이지 리다이렉션 ++ 언제든지 &&로 추가
		
		// 어디든지 검색어 & 버튼클릭	
		var whereKeyword = $("#where-field").val();

		// 언제든 일주일 - 기간 검색 (yyyy-dd-mm)
		var startDate = $("input[id='startDate']").val();
		var endDate = $("input[id='endDate']").val();
		
		// 게스트 검색
		var adultCount = parseInt($("input[name='adult']").val());
		var childCount = parseInt($("input[name='child']").val());
		var infantCount = parseInt($("input[name='infant']").val());
		var petCount = parseInt($("input[name='pet']").val());
	
		document.getElementById('#search-form').submit();
		return false;	
	})

	
	
// 게스트추가 - 카운팅
	// 성인 인원수 증감시키기
	$("#adultUp").on("click",function(){
		var inp = parseInt($("input[name='adult']").val());
		$("input[name='adult']").val(++inp);
		return false;
	})
	$("#adultDown").on("click",function(){
		var inp = parseInt($("input[name='adult']").val());
		inp--;
		inp = inp <= 1 ? 0 : inp;
		$("input[name='adult']").val(inp);
		return false; // 기본값 제거 -- 드롭다운 창 닫힘 제거
	})
	
	// 어린이 인원수 증감시키기
	$("#childUp").on("click",function(){
		// 성인 인원수가 0일 때, 어린이 인원수 증가시 성인 인원추가
		if(parseInt($("input[name='adult']").val())===0) {
			$("input[name='adult']").val(1);
		}
		
		var inp = parseInt($("input[name='child']").val());
		$("input[name='child']").val(++inp);
		
		return false;	// 기본값 제거 -- 드롭다운 창 닫힘 제거
	})
	$("#childDown").on("click",function(){
		var inp = parseInt($("input[name='child']").val());
		inp--;
		inp = inp <= 1 ? 0 : inp;
		$("input[name='child']").val(inp);
		return false;
	})
	// 유아 인원수 증감시키기
	$("#infantUp").on("click",function(){
		// 성인 인원수가 0일 때, 유아 인원수 증가시 성인 인원추가
		if(parseInt($("input[name='adult']").val())===0) {
			$("input[name='adult']").val(1);
		}
		var inp = parseInt($("input[name='infant']").val());
		$("input[name='infant']").val(++inp);
		return false;	// 기본값 제거 -- 드롭다운 창 닫힘 제거
	})
	$("#infantDown").on("click",function(){
		var inp = parseInt($("input[name='infant']").val());
		inp--;
		inp = inp <= 1 ? 0 : inp;
		$("input[name='infant']").val(inp);
		return false;
	})
	// 반려동물 수 증감시키기
	$("#petUp").on("click",function(){
		// 성인 인원수가 0일 때, 반려동물 수 증가시 성인 인원추가
		if(parseInt($("input[name='adult']").val())===0) {
			$("input[name='adult']").val(1);
		}
		var inp = parseInt($("input[name='pet']").val());
		$("input[name='pet']").val(++inp);
		return false;	// 기본값 제거 -- 드롭다운 창 닫힘 제거
	})
	$("#petDown").on("click",function(){
		var inp = parseInt($("input[name='pet']").val());
		inp--;
		inp = inp <= 1 ? 0 : inp;
		$("input[name='pet']").val(inp);
		return false;
	})
	
	
	
	<%-- // tag검색할 때 참고
	
	function searchByKeyword() {
	
		let navQueryString = $("#search-form").serialize();
		
		let $acc = $("#card-container").empty();
		
		let navXhr = new XMLHttpRequest();
		navXhr.onreadystatechange = function() {
			if (navXhr.readyState === 4 && navXhr.status === 200) {
				let jsonText = navXhr.responseText;
				let accs = JSON.parse(jsonText);
				
				
				if (accs.length == 0) {
					let content = `
						<div class="col-12">
							<p class="text-center">검색결과가 존재하지 않습니다.</p>
						</div>
					`;
					
					$acc.append(content);
				} else {
					$.each(accs, function(index, acc) {
						let content = `
							<div id="accList" class="grid-main">
							<!-- acc.status = '운영중' 인 숙소만 리스트업 --> 
							<c:forEach var="acc" items="${acc }">
								<div class="card-container" OnClick="href='/detail?no=${acc.accNo }'" style="text-decoration-line: none; color: black">
									<div class="card-box p-1">
										<div class="" style="width: 300px">
											<!-- 숙소 섬네일 슬라이드쇼 시작 -->
											<!-- 아이디에 acc_no나 img_no를 사용하는게 좋을 것 같습니다. / id - 아래 3개의 버튼, prev버튼, next버튼 -->
											<div id="acc-slide${acc.accNo }" class="carousel slide" data-interval="false">
												<div class="carousel-indicators">
													<button type="button"
														data-bs-target="#acc-slide${acc.accNo }"
														data-bs-slide-to="0" class="active" aria-current="true"
														aria-label="Slide 1"></button>
													<button type="button"
														data-bs-target="#acc-slide${acc.accNo }"
														data-bs-slide-to="1" aria-label="Slide 2"></button>
													<button type="button"
														data-bs-target="#acc-slide${acc.accNo }"
														data-bs-slide-to="2" aria-label="Slide 3"></button>
												</div>
												<!-- 위시리스트 하트 버튼 -->
												<div class="wishlist-icon">
													<c:if test="${empty LOGIN_USER }">
														<a class="unwish" href="#" data-bs-toggle="modal" data-bs-target="#email-login-modal"
															style="position:absolute; top:15px; right:15px; z-index:2">
															<span class="material-icons" style="color:white">favorite</span>
														</a>
													</c:if>
													<c:choose>
														<c:when test="${acc.accNo eq user.wishlist.no }"> <!-- wishlist 모달 넣어주기-->
															<a class="wished" href="#" style="position:absolute; top:20px; right:30px; z-index:2">
																<span class="material-icons" style="color:#FF7977">favorite</span>
															</a>
														</c:when>
														<c:otherwise>
															<a class="unwish" href="#" data-bs-toggle="modal" data-bs-target="#"	
																style="position:absolute; top:20px; right:30px; z-index:2">
																<span class="material-icons" style="color:white">favorite</span>
															</a>
														</c:otherwise>
													</c:choose>
												</div>
												<!-- 슬라이드쇼 이미지 /image-cover, room_image_no -->
												<div class="carousel-inner" style="border-radius: 25px;">
													<div class="carousel-item active"> 		
														<img class="acc-thumbnail rounded-0"
															src="/resources/images/acc/${acc.imageCover }.jpg" alt="숙소이미지"
															style="object-fit: cover; width: 300px; height: 300px;">
													</div>
													<div class="carousel-item">
														<img class="acc-thumbnail rounded-0"
															src="/resources/images/acc/2.jpg" alt="숙소이미지"
															style="object-fit: cover; width: 300px; height: 300px;">
													</div>
													<div class="carousel-item">				${acc.room.image.no }
														<img class="acc-thumbnail rounded-0"
															src="/resources/images/acc/3.jpg" alt="숙소이미지"
															style="object-fit: cover; width: 300px; height: 300px;">
													</div>
												</div>

												<button class="carousel-control-prev" type="button"
													data-bs-target="#acc-slide${acc.accNo }"
													data-bs-slide="prev">
													<span class="carousel-control-prev-icon" aria-hidden="true"></span>
													<span class="visually-hidden">Previous</span>
												</button>

												<button class="carousel-control-next" type="button"
													data-bs-target="#acc-slide${acc.accNo }"
													data-bs-slide="next">
													<span class="carousel-control-next-icon" aria-hidden="true"></span>
													<span class="visually-hidden">Next</span>
												</button>
											</div>
											<!-- 숙소 설명 -->
											<div class="row my-2">
												<div class="col-8">
													<div class="card-title"><span>${acc.user.name }</span>의 <span>${acc.types[0].name }</span></div>
													<div class="card-text text-muted">${acc.name }</div>
													<div class="card-subtitle text-muted">침대 <span>${room.bed }</span>개</div>		<!-- room_bed -->
													<div class="card-subtitle mb-2 text-muted">12월 6일 ~ 1월 3일</div>
													<div class="card-text">
														<strong>₩<fmt:formatNumber value="${acc.price }" /></strong>/월	<!-- acc_price * 선택한 날짜(default 1일) -->
													</div>
												</div>
												<div class="col-4 text-end">★<span>4.5</span>(<span>120</span>)</div>	<!-- total_score (리뷰개수) -->
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
						`;
						$acc.append(content);
					})
				}
				
			}
		}
		navXhr.open("GET", "/list?" + navQueryString);
		navXhr.send();
	} --%>
	
})

/* 언제든지-달력 */
/* 달력1
$(function () {
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

/* 달력 2
var dateSelector = document.querySelector('.dateSelector');
dateSelector.flatpickr({
	mode: "range",
	inline: true,
	minDate: "today",    
	dateFormat: "Y-m-d",
	showMonths: 1
	 disable: [
		function(date) { 
 	 		// disable every multiple of 8            
 	 		return !(date.getDate() % 8);   
 	 	}    
	] 
}); */

// 체크인, 체크아웃 달력
var fp1 = flatpickr(document.getElementById("startDate"), {
	"inline": true,
	"locale": "ko",
	"minDate" : "today"
});
var fp2 = flatpickr(document.getElementById("endDate"), {
	"inline": true,
	"locale": "ko",
	"minDate" : "today"
});

fp1.config.onChange.push(function(selectedDates) {
	fp2.config.minDate = selectedDates[0].fp_incr(1)
});


</script>
</nav>

