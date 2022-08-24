<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="icon" href="../../../resources/aircnc.png">
<title>계정관리-에어씨엔씨</title>
<style type="text/css">
	#div-account span {font-size: x-large;}
	#div-main span:first-child {font-size: large;}
	#div-main span:last-child {opacity: 0.7;}
	.col-lg-4 a {text-decoration: none;}
	i {font-size: xx-large;}
	* {color: black;}
	#div-main .shadow {height: 200px;}
	.container {max-width: 1080px}
	
	/* footer css */
		html, body {
    margin: 0;
    padding: 0;
    height: 100%;
	}
	
	#body-wrapper {
	    min-height: 100%;
	    position: relative;
	    
	}
	
	#body-content {
	    padding-bottom: 496px; /* footer의 높이 */
	    
	}
	
	footer {
	    width: 100%;
	    height: 496px; /* footer의 높이 */
	    position: absolute;   
	    bottom: 0;
	    left: 0;
	    background-color: #F7F7F7;
	    border-top: 1px solid #DDDDDD !important;
	    min-width: 1128px;
	    padding-left: 300px;
	    padding-right: 300px;
	    
	}
</style>
</head>

<body>
<%@ include file="../common/nav3.jsp" %>
<div  id="body-wrapper" >
	<div class="container" id="body-content">
		<div class="row my-5" id="div-account">
			<h1 class="fw-bold">계정</h1>
			<span><strong>${LOGIN_USER.name },</strong> ${LOGIN_USER.email} <a href="profile" class="text-reset fs-5 fw-bold">프로필로 이동</a> </span>
		</div>
		<div id="div-main">
			<div class="row">
				<div class="col-lg-4 col-sm-6 col-sx-12 mb-3">
					<a href="/user/account-settings/personal-info">
						<div class="shadow p-3 mb-5 bg-body rounded-4">
							<i class="bi bi-person-lines-fill"></i>
							<div class="mt-5 d-flex align-items-start flex-column">
								<span class="fw-bold">개인정보</span>
								<span>개인정보 및 연락처를 알려주세요.</span>
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6 col-sx-12 mb-3">
					<a href="">
						<div class="shadow p-3 mb-5 bg-body rounded-4 ">
							<i class="bi bi-shield-exclamation"></i>
							<div class="mt-5 d-flex align-items-start flex-column">
								<span class="fw-bold">로그인 및 보안</span>
								<span>비밀번호를 변경하고 계정을 안전하게 보호하세요</span>
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6 col-sx-12 mb-3">
					<a href="">
						<div class="shadow p-3 mb-5 bg-body rounded-4 ">
							<i class="bi bi-cash-coin"></i>
							<div class="mt-5 d-flex align-items-start flex-column">
								<span class="fw-bold">결제 및 대금 수령</span>
								<span>결제, 대금 수령, 쿠폰, 기프트카드 및 세금 검토하기</span>
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6 col-sx-12 mb-3">
					<a href="">
						<div class="shadow p-3 mb-5 bg-body rounded-4 ">
							<i class="bi bi-megaphone"></i>
							<div class="mt-5 d-flex align-items-start flex-column">
								<span class="fw-bold">알림</span>
								<span>알림 환경설정 및 연락 방식을 선택하세요.</span>
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6 col-sx-12 mb-3">
					<a href="">
						<div class="shadow p-3 mb-5 bg-body rounded-4 ">
							<i class="bi bi-eye"></i>
							<div class="mt-5 d-flex align-items-start flex-column">
								<span class="fw-bold">개인정보 및 공개 설정</span>
								<span>연결된 앱, 공유하는 정보 및 공개 대상 관리하기</span>
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6 col-sx-12 mb-3">
					<a href="">
						<div class="shadow p-3 mb-5 bg-body rounded-4 ">
							<i class="bi bi-globe"></i>
							<div class="mt-5 d-flex align-items-start flex-column">
								<span class="fw-bold">글로벌 환경 설정</span>
								<span>기본 언어, 통화, 시간대 설정하기</span>
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6 col-sx-12 mb-3">
					<a href="">
						<div class="shadow p-3 mb-5 bg-body rounded-4 ">
							<i class="bi bi-briefcase"></i>
							<div class="mt-5 d-flex align-items-start flex-column">
								<span class="fw-bold">출장</span>
								<span>회사 이메일을 입력하면 출장에서 헤택을 누리실 수 있습니다.</span>
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6 col-sx-12 mb-3">
					<a href="">
						<div class="shadow p-3 mb-5 bg-body rounded-4 ">
							<i class="bi bi-bar-chart-line"></i>
							<div class="mt-5 d-flex align-items-start flex-column">
								<span class="fw-bold">전문 호스팅 도구</span>
								<span>에어비앤비에서 여러 숙소를 관리하신다면 전문도구를 이용해보세요.</span>
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6 col-sx-12 mb-3">
					<a href="">
						<div class="shadow p-3 mb-5 bg-body rounded-4 ">
							<i class="bi bi-gift"></i>
							<div class="mt-5 d-flex align-items-start flex-column">
								<span class="fw-bold">추천 크레딧 및 쿠폰</span>
								<span>₩0의 추천 크레딧과 쿠폰이 있습니다. 자세히 알아보기</span>
							</div>
						</div>
					</a>
				</div>
				<div  class="d-flex justify-content-center">
					계정을 비활성화 하셔야 하나요?
				</div>
				<div  class="d-flex justify-content-center mb-5">
					<a href="/user/account-delete/reasons" class="text-dark fw-bold">지금 처리하기</a>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>