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
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<!-- /* 숙소 검색창이 없는 nav 입니다. */ -->


<nav class="navbar sticky-top py-0 d-flex justify-content-center" id="nav">
		<!-- 로고가 있는 navbar -->
		<div class="div-nav" style="display: flex; width: 100%; justify-content: space-between; max-width: 1440px;">
			<div class="box" id="logo">
				<a href="/"> <!-- 임시 로고 -->
					<img src="../../../resources/logo-home.png" alt="로고" width="100"/>
				</a>
			</div>
			<div class="box">
				<div class="row align-items-center" id="userbtn">
					<div class="col">
						<button class="hostbtn" type="button">호스트모드로 전환</button>
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
	
	
})
</script>
</nav>

