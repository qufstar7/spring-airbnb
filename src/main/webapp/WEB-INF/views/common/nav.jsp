<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="tags.jsp"%>
<nav class="navbar sticky-top pt-0" >
		<!-- 로고가 있는 navbar -->
		<div class="container m-auto justify-content-between align-items-center" id="nav" style="height:80px; width:100%; background-color: #FFFFFF; border-bottom:1px solid #E6E6E6">
			<div class="" id="logo-space">
				<a href="#"> <!-- 임시 로고 -->
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-easel" viewBox="0 0 16 16">
	  					<path d="M8 0a.5.5 0 0 1 .473.337L9.046 2H14a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1h-1.85l1.323 3.837a.5.5 0 1 1-.946.326L11.092 11H8.5v3a.5.5 0 0 1-1 0v-3H4.908l-1.435 4.163a.5.5 0 1 1-.946-.326L3.85 11H2a1 1 0 0 1-1-1V3a1 1 0 0 1 1-1h4.954L7.527.337A.5.5 0 0 1 8 0zM2 3v7h12V3H2z"/>
					</svg>
					
				</a>aircnc
			</div>
			<div class="d-flex justify-content-center" id="search-space">
				<div class="shadow p-1 position-relative" style="border:1px solid #E6E6E6; border-radius: 25px; width:400px; height:48px;">
					<!-- 메인페이지에서 사용하는 검색창 -->
					<div class="d-inline-flex p-2 position-absolute top-50 start-50 translate-middle" style="width:366px;">
						<button class="p-0" style="background-color:transparent; border: none; width:26%; font-size: 14px;">어디든지</button>
						<span>|</span>
						<button class="p-0" style="background-color:transparent; border: none; width:32%; font-size: 14px;">언제든 일주일</button>
						<span>|</span>
						<button class="p-0" style="background-color:transparent; border: none; width:29%; font-size: 14px;">게스트 추가</button>
						<button class="p-0" style="background-color:red; border: none; border-radius: 50px; width:9%">
							<i class="bi bi-search" style="color:#FFFFFF"></i>
						</button>
					</div>
					<!-- 숙소 상세페이지에서 사용하는 검색창 -->
					<!-- <div class="d-inline-flex p-2 position-absolute top-50 start-50 translate-middle " style="width:366px;">
						<button class="position-absolute top-50 start-50 translate-middle" style="background-color:transparent; border: none; width:80%; font-size: 14px;">
							<div class="float-start">검색 시작하기</div>
							<div class="p-0 float-end" style="background-color:red; border: none; border-radius: 50px; width:9%">
								<i class="bi bi-search" style="color:#FFFFFF"></i>
							</div>
						</button>
					</div> -->
				</div>			
			</div>
			<div class="justify-content-between" id="user-space">
				<div class="row align-items-center">
					<div class="col mx-auto">
						<button type="button" style="background-color:transparent; border: none;">호스트모드로 전환</button>
					</div>
					<div class="col-3 position-relative" style="border:1px solid #E6E6E6; border-radius: 25px; width:77px; height:42px;">
						<div class="position-absolute top-50 start-50 translate-middle">
							<button class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="background-color:transparent; border: none; width:26%;">
								<a>
									<!-- 가로줄 3개 아이콘 -->
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
				 							<path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
									</svg>
									<!-- 프로필 이미지 대신합니다. -->
									<span style="border-radius: 50px">
										<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="프로필이미지" style="vertical-align: middle; width: 35px; height: 35px; border-radius: 50%">
									</span>
								</a>
							</button>
							<!-- 읽지 않은 알람표시 -->
							<span class="position-absolute top-0 end-0 translate-middle badge border border-light rounded-circle bg-danger p-2"><span class="visually-hidden">unread messages</span></span>
							<div class="dropdown-menu dropdown-menu-end" style="">
								<!-- 로그인 하지 않았을 때 -->
								<a class="dropdown-item" href="#">로그인</a>
								<a class="dropdown-item" href="#">회원 가입</a>
								<!-- 로그인 했을 때 -->
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
					</div>
				</div>
			</div>
		</div>
		<!-- 태그와 필터가 있는 navbar -->
		<!-- home.jsp일 경우에만 나타나게 합니다. -->
		<div class="row tagFilterBar m-auto p-0" style="height: 78px; width:100%; background-color: #FFFFFF; ">
			<div class="row align-items-center text-center">
				<div class="col-10">태그 나열하는 곳</div>
				<div class="col-2 float-end">
					<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#filterModal">
						<i class="bi bi-sliders"></i>
						필터
					</button>
				</div>
			</div>
		</div>
	
	
</nav>
</script>