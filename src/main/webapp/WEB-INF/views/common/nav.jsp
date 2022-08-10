<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="tags.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbarstyle.css">
<nav class="navbar ${page eq 'subNav' ? '' : 'sticky-top' } py-0" id="nav">
		<!-- 로고가 있는 navbar -->
		<div class="container">
			<div class="box" id="logo">
				<a href="/"> <!-- 임시 로고 -->
					<img src="../../../resources/logo-home.png" alt="로고" width="100"/>
				</a>
			</div>
			<div class="box d-flex justify-content-center" id="search">
				<!-- 메인페이지에서 사용하는 검색창 -->
				<div class="p-1 position-relative" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop" style="border:1px solid #D8D8D8; border-radius: 25px; width:400px; height:48px;box-shadow: 1px 4px 7px 0px rgba(0,0,0,0.1);">
					<div class="d-inline-flex p-2 position-absolute top-50 start-50 translate-middle" style="width:366px;">
						<button class="p-0" style="background-color:transparent; border: none; width:26%; font-size: 14px;">어디든지</button>
						<span>|</span>
						<button class="p-0" style="background-color:transparent; border: none; width:32%; font-size: 14px;">언제든 일주일</button>
						<span>|</span>
						<button class="p-0" style="background-color:transparent; border: none; width:29%; font-size: 14px;">게스트 추가</button>
						<button class="p-0" style="background-color:#FF7977; border: none; border-radius: 50px; width:9%">
							<i class="bi bi-search" style="color:#FFFFFF"></i>
						</button>
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
					    <!-- 프로필 이미지 대신합니다. -->
					    <div style="border-radius: 50px">
					      <img class="acc-thumbnail" src="/resources/images/acc/sample-home.jpg" alt="프로필이미지" style="vertical-align: middle; width: 33px; height: 33px; border-radius: 50%">
					    </div>
					  </button>
					  </a>
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
/* When the user clicks on the button, toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
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
</script>
</nav>

