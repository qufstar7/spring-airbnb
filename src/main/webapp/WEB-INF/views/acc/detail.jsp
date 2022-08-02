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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<style type="text/css">
	* {
	  margin: 0;
	  padding: 0;
	  box-sizing: border-box;
	}
	body {
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, sans-serif;
    font-size: 14px;
    line-height: 1.43;
    color: #484848;
    background-color: #fff;
    margin: 0;
    -webkit-font-smoothing: antialiased;
    }
	.sticky {
   position: -webkit-sticky; /* 사파리 브라우저 지원 */
   position: sticky;
   top: 50px;
   padding: 10px;
	}
	.box {margin:20px auto;}
    .content {
        width: auto;
    }
    #map {
	    width:1120px;
	    height:480px;
    }
    #map2 {
	    width:1550px;
	    height:810px;
    }
    
    .main {
    	width:1200px;
    }
    .container {
    	width:1200px;
    }
    .image2 {
    	display:block;
		width:100%;
		height:auto;
    }
    #air-cover {
    
    	width: 97.5px;
    	height: 26px;
    }
    #nav-1 {
    	position: fixed;
    	height: 80px;
    	tob: 0; 
    	z-index: 1000; /*페이지의 다른 요소보다 가장 위에 나타나도록 설정*/
    	width:100%;
    }
    .progress-container {
      width: 100%;
      height: 8px;
      background: #ccc;
	}
	 
	#box {
		width: 370;
		height: 460;
	}
	.profile {
		border-radius: 70%;
		width: 40px; 
		height: 40px;
	}
	#image-large {
		width: 560px; 
		height: 498px;
		border-top-left-radius: 2em;
		border-bottom-left-radius: 2em;
	}
	#image-right-top {
		border-top-right-radius: 2em;
	}
	#image-right-bottom {
		border-bottom-right-radius: 2em;
	}
	
	.short-img {
		width: 272px; 
		height: 249px;
	}
	/* section calendar */

	.sec_cal {
	    width: 360px;
	    margin: 0 auto;
	    font-family: "NotoSansR";
	}
	
	.sec_cal .cal_nav {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    font-weight: 700;
	    font-size: 48px;
	    line-height: 78px;
	}
	
	.sec_cal .cal_nav .year-month {
	    width: 300px;
	    text-align: center;
	    line-height: 1;
	}
	
	.sec_cal .cal_nav .nav {
	    display: flex;
	    border: 1px solid #333333;
	    border-radius: 5px;
	}
	
	.sec_cal .cal_nav .go-prev,
	.sec_cal .cal_nav .go-next {
	    display: block;
	    width: 50px;
	    height: 78px;
	    font-size: 0;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	}
	
	.sec_cal .cal_nav .go-prev::before,
	.sec_cal .cal_nav .go-next::before {
	    content: "";
	    display: block;
	    width: 20px;
	    height: 20px;
	    border: 3px solid #000;
	    border-width: 3px 3px 0 0;
	    transition: border 0.1s;
	}
	
	.sec_cal .cal_nav .go-prev:hover::before,
	.sec_cal .cal_nav .go-next:hover::before {
	    border-color: #ed2a61;
	}
	
	.sec_cal .cal_nav .go-prev::before {
	    transform: rotate(-135deg);
	}
	
	.sec_cal .cal_nav .go-next::before {
	    transform: rotate(45deg);
	}
	
	.sec_cal .cal_wrap {
	    padding-top: 40px;
	    position: relative;
	    margin: 0 auto;
	}
	
	.sec_cal .cal_wrap .days {
	    display: flex;
	    margin-bottom: 20px;
	    padding-bottom: 20px;
	    border-bottom: 1px solid #ddd;
	}
	
	.sec_cal .cal_wrap::after {
	    top: 368px;
	}
	
	.sec_cal .cal_wrap .day {
	    display:flex;
	    align-items: center;
	    justify-content: center;
	    width: calc(100% / 7);
	    text-align: left;
	    color: #999;
	    font-size: 12px;
	    text-align: center;
	    border-radius:5px
	}
	
	.current.today {background: rgb(242 242 242);}
	
	.sec_cal .cal_wrap .dates {
	    display: flex;
	    flex-flow: wrap;
	    height: 290px;
	}
	
	.sec_cal .cal_wrap .day:nth-child(7n -1) {
	    color: #3c6ffa;
	}
	
	.sec_cal .cal_wrap .day:nth-child(7n) {
	    color: #ed2a61;
	}
	
	.sec_cal .cal_wrap .day.disable {
	    color: #ddd;
	}
	
</style>
<title>숙소 상세 페이지</title>
</head>
<body >
	<nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-center" id="nav-1">
		<ul class="navbar-nav me-auto">
		  <li class="nav-item">
		    <a class="nav-link" href="#btn-open-image-modal">사진</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#con">편의 시설</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#review">후기</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#map">위치</a>
		  </li>
		</ul>
	</nav>
	<div class="container" style="padding: 0px 40px;"> 
		<div class="row p-2 mb-2" style="padding-left: 80px; padding-right: 80px;">
			<div>
				<h2>${acc.name }</h2>
			</div>
			<div class="pl-1">
				<p>
					<button type="button" class="btn btn-link text-dark btn-sm"><i class="bi bi-star-fill"></i> ${acc.reviewScore } <span class="text-decoration-underline">후기 ${acc.reviewCount }개</span></button>
					<button type="button" class="btn btn-link text-decoration-underline text-dark btn-sm" id="btn-open-map-modal">${acc.address }</button>
				
					<span class="float-end">
						<button type="button" class="btn btn-link text-decoration-underline text-dark" id="btn-open-share-modal"><i class="bi bi-share-fill"></i> 공유</button>
						<button type="button" class="btn btn-link text-decoration-underline text-dark" id="btn-open-save-modal"><i class="bi bi-heart"></i> 저장</button>
					</span>
				</p>
			</div>
		</div>
	</div>
	<div class="container main" style="padding: 0px 40px;">
		<div class="row mb-5">
			<div class="col-6">
				<div class="img-large" id="btn-open-image-modal">
					<img src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg" id="image-large">
				</div>
			</div>
			<div class="col-3">
			
				<div class="img-short" id="btn-open-image-modal2">
					<img src="https://a0.muscache.com/airbnb/static/destinations/o-Rome_Piazza017_480x320.jpg" class="short-img">
				</div>
				<div class="img-short" id="btn-open-image-modal3">
					<img src="https://a0.muscache.com/airbnb/static/destinations/o-Los_Angeles_480x320.jpg" class="short-img">
				</div>
			</div>
			<div class="col-3">
			
				<div class="img-short" id="btn-open-image-modal4">
					<img src="https://a0.muscache.com/airbnb/static/destinations/o-Lisbon_480x320.jpg" class="short-img" id="image-right-top">
				</div>
				<div class="img-short" id="btn-open-image-modal5">
					<img src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg" class="short-img" id="image-right-bottom">
				</div>
			</div>
		</div>
	</div>
	<div class="container main" style="padding: 0px 40px;">
		<div class="row"> 
		
			<div class="col-8">
				<div>
					<a id="profile" href="#host">
						<img class="float-end profile" src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg">
					</a>
					<h2>덕인님이 호스팅하는 ${acc.name }</h2>
					<p>최대 인원 ${acc.guest }명<i class="bi bi-dot"></i>침실 1개<i class="bi bi-dot"></i>침대 1개<i class="bi bi-dot"></i>욕실 1개</p>
				</div>
				<hr>
				<div>
					<h3>마음껏 물놀이를 즐기세요</h1>
				</div>
				<hr>
				<div>
					<div class="mt-5 mb-2">
						<img id="air-cover" alt="" src="https://a0.muscache.com/im/pictures/51a7f002-b223-4e05-a2af-0d4838411d92.jpg">
					</div>
					<div class="mb-5">
						<p>모든 예약에는 호스트가 예약을 취소하거나 숙소 정보가 정확하지 않은 경우 또는 체크인에 문제가 있는 상황에 대비한 무료 보호 프로그램이 포함됩니다.</p>
						<button type="button" class="btn btn-link text-decoration-underline text-dark" id="btn-open-cover-modal">더 알아보기</button>
					</div>
				</div>
				<hr>
				<div class="box mt-5 mb-5">
					<h3>숙소설명</h3>
					<div class="content mb-2">
					
					<p>${acc.description }</p>
					</div>
				</div>
				<hr>
				<div class="row mt-5">
					<h3>숙박장소</h1>
					<div class="col-6" id="btn-open-image2-modal">
						<img class="image2 rounded mb-2" alt="" src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg" >
						<h5>침실공간</h5>
						<p>침대 1개</p>
					</div>
					<div class="col-6" id="btn-open-image3-modal">
						<img class="image2 rounded mb-2" alt="" src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg" >
						<h5>침실공간</h5>
						<p>침대 1개</p>
					</div>
				</div>
				<hr>
				<div class="row mt-5" id="con">
					<h3>편의시설</h3>
					<div class="col-6 mb-3"><i class="bi bi-wifi"></i> 무선인터넷</div>
					<div class="col-6 mb-3"><i class="bi bi-wifi"></i> 수영장</div>
					<div class="col-6 mb-3"><i class="bi bi-wifi"></i> 바베큐그릴</div>
					<div class="col-6 mb-3"><i class="bi bi-wifi"></i> 어쩌구</div>
					<div class="col-6 mb-3"><i class="bi bi-wifi"></i> 저쩌구</div>
					<div class="col-6 mb-3"><i class="bi bi-wifi"></i> 저쩌구리</div>
					<div class="col-6 mb-2">
						<button class="btn btn-outline-dark btn-lg" id="btn-open-con-modal">편의시설 xx개 더보기</button>
					</div>
				</div>
				<hr>
				<div class="mt-5 mb-5">
					<h2>달력</h2>
					<input type="text" id="demo" name="demo" value="01/01/2018 - 01/15/2018" />
					<div class="sec_cal">
						<div class="cal_nav">
							<a href="javascript:;" class="nav-btn go-prev">prev</a>
							<div class="year-month"></div>
							<a href="javascript:;" class="nav-btn go-next">next</a>
						</div>
						<div class="cal_wrap">
							<div class="days">
								<div class="day">MON</div>
								<div class="day">TUE</div>
								<div class="day">WED</div>
								<div class="day">THU</div>
								<div class="day">FRI</div>
								<div class="day">SAT</div>
								<div class="day">SUN</div>
							</div>
							<div class="dates"></div>
						</div>
					</div>
				</div>
				
			</div>
			<div class="col-4" >
				<div class="sticky" id="box">
					<div class="shadow-lg p-3 mb-5 bg-body rounded">
						<span><strong>₩ ${acc.price }</strong>/박</span>
						<button type="button" class="btn btn-link text-dark btn-sm"><i class="bi bi-star-fill"></i> ${acc.reviewScore } <span class="text-decoration-underline">후기 ${acc.reviewCount }개</span></button>
						<img alt="" src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg" style="width: 100%;">
					</div>
					<div class="text-center">
						<button type="button" class="btn btn-link text-decoration-underline text-dark" id="btn-open-report-modal"><i class="bi bi-flag-fill"></i> 숙소 신고하기</button>
					</div>
				</div>
				
			</div>
			<hr>
			<div class="mt-5 mb-5" id="review">
				<h4><i class="bi bi-star-fill"></i> ${acc.reviewScore } <span class="text-decoration">후기 ${acc.reviewCount }개</span></h4>
			</div>
			<hr>
			<div class="mt-5 mb-5">
				<div class="">
					<h3>호스팅 지역</h3>
				</div>
				<div class="mb-2" id="map"></div>
				<div class="mb-2">
					<h5>${acc.address }</h1>
					<p>조용한 어쩌구</p>
				</div>
			</div>
			<hr>
			<div class="row mt-5 mb-5">
				<div class="col-6 mb-2" id="host">
					<div class="row">
						<div class="col-1">
							<a id="profile" href="">
							<img class="float-start profile" src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg">
							</a>
						</div>
						<div class="col-11">
							<h3>호스트:덕인님</h3>
							<p>회원 가입일: 2019년 12월사업자 정보</p>
						</div>
					</div>
					<div class="row">
						<h6><i class="bi bi-star-fill"></i> ${acc.reviewScore } <span class="text-decoration">후기 ${acc.reviewCount }개</span></h6>
						<h6><i class="bi bi-shield-fill-check"></i> 본인인증 완료</h6>
					</div>
				</div>
				<div class="col-6 mb-2">
					<a href="">
						<button type="button" class="btn btn-outline-dark btn-lg p-2">호스트에게 연락하기</button>
					</a>
				</div>
			</div>
			<hr>
			<div class="row mt-5">
				<h3>알아두어야 할 사항</h3>
				<div class="col-4">
					<h5>숙소 이용 규칙</h5>
				</div>
				<div class="col-4">
					<h5>건강과 안전</h5>
				</div>
				<div class="col-4">
					<h5>환불 정책</h5>
				</div>
			</div>
		</div>
	</div>
	
<!-- 편의시설 모달 -->
<div class="modal" id="modal-con-acc">
	<div class="modal-dialog modal-Default">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">숙소 편의 시설</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<hr>
					<h5>욕실</h5>
					<p>
						<i class="bi bi-wifi"></i> 헤어드라이기
					</p>
					<p>
						<i class="bi bi-wifi"></i> 헤어드라이기
					</p>
				</div>
				<div class="row">
					<hr>
					<h5>욕실</h5>
					<p>
						<i class="bi bi-wifi"></i> 헤어드라이기
					</p>
					<p>
						<i class="bi bi-wifi"></i> 헤어드라이기
					</p>
				</div>
				<div class="row">
					<hr>
					<h5>욕실</h5>
					<p>
						<i class="bi bi-wifi"></i> 헤어드라이기
					</p>
					<p>
						<i class="bi bi-wifi"></i> 헤어드라이기
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 편의시설 모달 -->
<div class="modal" id="modal-report-acc">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">이 숙소를 신고하시는 이유를 알려주세요.</h4>
				<p>내용은 호스트에게 공개되지 않습니다.</p>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<form action="">
						<div>
							부정확하거나 틀린 정보가 있어요<input class="float-end" name="report" value="1" type="radio">
							<hr>
						</div>
						<div>
							실제 숙소가 아닙니다<input class="float-end" name="report" value="2" type="radio">
							<hr>
						</div>
						<div>
							사기입니다<input class="float-end" name="report" value="3" type="radio">
							<hr>
						</div>
						<div>
							불쾌합니다<input class="float-end" name="report" value="4" type="radio">
							<hr>
						</div>
						<div>
							기타<input class="float-end" name="report" value="5" type="radio">
							<hr>
						</div>
						
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 공유 모달 -->
<div class="modal" id="modal-share-acc">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title"> <strong> 가족 및 친구들과 이 장소를 공유하세요</strong></h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="row mb-3">
						<div class="col-1 rounded">
							<img class="rounded" src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg" style="width: 40px; height: 40px;">
						</div>
						<div class="col-11">
							<h4>중앙 HTA 입니다.</h4>
						</div>
					</div>
					<div class="col-6 mb-3 d-grid gap-2">
						<button class="btn btn-outline-secondary btn-lg p-3"><i class="bi bi-link"></i> 링크 복사</button>
					</div>
					<div class="col-6 mb-3 d-grid gap-2">
						<button class="btn btn-outline-secondary btn-lg p-3"><i class="bi bi-envelope"></i> 이메일</button>
					</div>
					<div class="col-6 mb-3 d-grid gap-2">
						<button class="btn btn-outline-secondary btn-lg p-3"><i class="bi bi-chat"></i> 메세지</button>
					</div>
					<div class="col-6 mb-3 d-grid gap-2">
						<button class="btn btn-outline-secondary btn-lg p-3"><i class="bi bi-whatsapp"></i> 왓츠앱</button>
					</div>
					<div class="col-6 mb-3 d-grid gap-2">
						<button onclick="shareKakao()" id="btnKakao" class="btn btn-outline-secondary btn-lg p-3"><img src="/img/icon_kakao.png" alt="카카오톡 공유" /></button>
					</div>
					<!-- <button onclick="shareKakao()">
  							<img src="/img/icon_kakao.png" alt="카카오톡 공유" />
					</button> -->
					<div class="col-6 mb-3 d-grid gap-2">
						<a id="btnFacebook" class="btn btn-outline-secondary btn-lg p-3" href="javascript:shareFacebook();"><i class="bi bi-facebook"></i> 페이스북</a>
					</div>
					<div class="col-6 mb-3 d-grid gap-2">
						<a id="btnTwitter" class="btn btn-outline-secondary btn-lg p-3" href="javascript:shareTwitter();"><i class="bi bi-twitter"></i> 트위터</a>
					</div>
					<div class="col-6 mb-3 d-grid gap-2">
						<button class="btn btn-outline-secondary btn-lg"><i class="bi bi-code-slash"></i> 삽입</button>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 위시리스트저장 모달 -->
<div class="modal" id="modal-save-acc">
	<div class="modal-dialog modal-Default">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">위시 리스트</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<hr>
					<h5>욕실</h5>
					<p>
						<i class="bi bi-wifi"></i> 헤어드라이기
					</p>
					<p>
						<i class="bi bi-wifi"></i> 헤어드라이기
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 에어커버 모달 -->
<div class="modal" id="modal-cover-acc">
	<div class="modal-dialog modal-xl">
		<div class="modal-content p-4">
			<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			<div class="modal-header">
				<div class="row">
					<div class="col-12 mb-3">
					
						<img id="air-cover" alt="" src="https://a0.muscache.com/im/pictures/51a7f002-b223-4e05-a2af-0d4838411d92.jpg">
					</div>
					<div class="col">
					
						<p class="modal-title">에어커버는 모든 예약에 적용되는 포괄적인 보호 장치입니다.</p>
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-6">
						<h5>예약 지원 보장</h5>
						<p>드물지만 체크인까지 30일 이내로 남은 시점에 호스트가 예약을 취소하는 경우, 에어비앤비에서 기존 숙소와 비슷한 숙소 또는 더 나은 숙소를 찾아드리거나 요금을 환불해 드립니다.</p>
					</div>
					<div class="col-6">
						<h5>체크인 지원 보장</h5>
						<p>숙소에 체크인할 수 없으며 호스트가 문제를 해결할 수 없는 경우, 예약한 기간 동안 머물 수 있도록 기존 숙소와 비슷한 숙소 또는 더 나은 숙소를 찾아드리거나 요금을 환불해 드립니다.</p>
					</div>
					<div class="col-6">
						<h5>숙소 정확도 보장</h5>
						<p>냉장고가 고장 났는데 호스트가 쉽게 고칠 수 없는 경우, 침실 수가 숙소 페이지에 표시된 것보다 적은 경우 등 숙박 중 언제라도 실제 숙소가 숙소 페이지 설명과 다른 것을 알게 될 경우, 문제 발견 시점으로부터 3일 이내에 신고해주세요. 에어비앤비에서 비슷한 숙소 또는 더 나은 숙소를 찾아드리거나 요금을 환불해드립니다.</p>
					</div>
					<div class="col-6">
						<h5>24시간 안전 지원 라인</h5>
						<p>안전하지 않다고 느낄 경우, 24시간 언제든 특별 교육을 받은 안전 전문 상담원의 신속한 지원을 받으실 수 있습니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 이미지 모달 -->
<div class="modal" id="modal-image-acc">
		<div class="modal-dialog modal-fullscreen">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">갤러리</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body text-center">
					<div class="row">
						<div class="">
							<img
								src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg"
								">
						</div>

						<div class="">
							<img
								src="https://a0.muscache.com/airbnb/static/destinations/o-Rome_Piazza017_480x320.jpg"
								">
						</div>
						<div class="">
							<img
								src="https://a0.muscache.com/airbnb/static/destinations/o-Los_Angeles_480x320.jpg"
								">
						</div>

						<div class="">
							<img
								src="https://a0.muscache.com/airbnb/static/destinations/o-Lisbon_480x320.jpg"
								">
						</div>
						<div class="">
							<img
								src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg"
								">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<!-- 지도 모달 -->
<div class="modal" id="modal-map-acc">
	<div class="modal-dialog modal-fullscreen">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">호스팅 지역</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-2">
						<div>
							<div class="box">
								<h4>제주도 한국</h4>
								<div class="content">
									<p>게으른 노을 인근에는
										한림항(비양도선착장) 1분
										협재해수욕장 5분
										금능해수욕장 6분
										성이시돌목장 15분
										한림오일장(4일, 9일) 5분
										금오름 10분
										패러글라이딩장 10분
										애월한담해변 10분
										등 주변에 많은 관광지가 있으며,
										유명 소품샵과 맛집, 카페들도 많이 있습니다.
										
										비밀스런 도민 맛집을 상세히 알려드립니다 :-)</p>
								</div>
							</div>
							<div class="box">
								<h4>교통편</h4>
								<div class="content">
									<p>집앞 개인주차장이 구비되어 있습니다.
									제주 특성상 개인 랜트카를 추천드리며,
									대중교통 이용시 102번, 202번 공항버스를 이용하시면 도보 5분거리에 위치합니다.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-10" id="map2"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	// 모달 객체
	let accConvenienceModal = new bootstrap.Modal(document.getElementById("modal-con-acc"));
	let accShareModal = new bootstrap.Modal(document.getElementById("modal-share-acc"));
	let accSaveModal = new bootstrap.Modal(document.getElementById("modal-save-acc"));
	let accImageModal = new bootstrap.Modal(document.getElementById("modal-image-acc"));
	let accCoverModal = new bootstrap.Modal(document.getElementById("modal-cover-acc"));
	let accReportModal = new bootstrap.Modal(document.getElementById("modal-report-acc"));
	let accMapModal = new bootstrap.Modal(document.getElementById("modal-map-acc"));
	
	// 위시리스트 저장 모달
	$("#btn-open-save-modal").click(function() {
		accSaveModal.show();
	});
	
	// 지도 모달
	$("#btn-open-map-modal").click(function() {
		accMapModal.show();
	});
	
	// 신고 모달
	$("#btn-open-report-modal").click(function() {
		accReportModal.show();
	});
	
	// 편의시설 모달
	$("#btn-open-con-modal").click(function() {
		accConvenienceModal.show();
	});
	
	// 공유 모달
	$("#btn-open-share-modal").click(function() {
		accShareModal.show();
	});
	// 어에커버 모달
	$("#btn-open-cover-modal").click(function() {
		accCoverModal.show();
	});
	// 이미지 모달
	$("#btn-open-image-modal").click(function() {
		accImageModal.show();
	});
	$("#btn-open-image-modal2").click(function() {
		accImageModal.show();
	});
	$("#btn-open-image-modal3").click(function() {
		accImageModal.show();
	});
	$("#btn-open-image-modal4").click(function() {
		accImageModal.show();
	});
	$("#btn-open-image-modal5").click(function() {
		accImageModal.show();
	});
	$("#btn-open-image2-modal").click(function() {
		accImageModal.show();
	});
	$("#btn-open-image3-modal").click(function() {
		accImageModal.show();
	});
	
	// 글 긴거 더보기
	$('.box').each(function(){
        var content = $(this).children('.content');
        var content_txt = content.text();
        var content_txt_short = content_txt.substring(0,100)+"...";
        var btn_more = $('<a href="javascript:void(0)" class="more">더보기</a>');

        
        $(this).append(btn_more);
        
        if(content_txt.length >= 100){
            content.html(content_txt_short)
            
        }else{
            btn_more.hide()
        }
        
        btn_more.click(toggle_content);

        function toggle_content(){
            if($(this).hasClass('short')){
                // 접기 상태
                $(this).html('더보기');
                content.html(content_txt_short)
                $(this).removeClass('short');
            }else{
                // 더보기 상태
                $(this).html('접기');
                content.html(content_txt);
                $(this).addClass('short');

            }
        }
    });
	
	let latitude = '${acc.longitude}'
	let longitude = '${acc.latitude}'
	
	/* console.log(latitude);
	console.log(longitude); */
	
	// 카카오 맵
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(longitude,latitude), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(longitude,latitude); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);    
	
	// 카카오 맵
	var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div 
    mapOption2 = { 
        center: new kakao.maps.LatLng(longitude,latitude), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var map2 = new kakao.maps.Map(mapContainer2, mapOption2); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(longitude,latitude); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map2);
	
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);    
	
	// 달력
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
	        "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
	        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	    },
	    "alwaysShowCalendars": true,
	    "startDate": new Date(),
	    "endDate": new Date(),
	    "drops": "auto"
	 }, function (start, end, label) {
	    console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
	});

	$("#profile").click(function() {
		$("host").focus();
	})
	
	$("#nav-1").hide();
	
	$(window).scroll(function() {
		let scrollTop = $(document).scrollTop();
		if (scrollTop > 600) {
			
			$("#nav-1").show();
		} else {
			
			$("#nav-1").hide();
			
		}
	})
	
	// 스크롤스파이
	var scrollSpy = new bootstrap.ScrollSpy(document.body, {
  		target: '#nav-1'
	})
	
	// 공유
	
	$("#btnTwitter").click(function() {
		var sendText = "개발새발"; // 전달할 텍스트
	    var sendUrl = "devpad.tistory.com/"; // 전달할 URL
	    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
	})
	$("#btnFacebook").click(function() {
		var sendUrl = "devpad.tistory.com/"; // 전달할 URL
	    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
	})
	/* $("#btnKakao").click(function() {
		 
		  // 사용할 앱의 JavaScript 키 설정
		  Kakao.init('6ec6d52326b138f515a86c55e152676c');
		 
		  // 카카오링크 버튼 생성
		  Kakao.Link.createDefaultButton({
		    container: '#btnKakao', // 카카오공유버튼ID
		    objectType: 'feed',
		    content: {
		      title: "개발새발", // 보여질 제목
		      description: "개발새발 블로그입니다", // 보여질 설명
		      imageUrl: "devpad.tistory.com/", // 콘텐츠 URL
		      link: {
		         mobileWebUrl: "devpad.tistory.com/",
		         webUrl: "devpad.tistory.com/"
		      }
		    }
		  });
		} */

		/* if (!Kakao.isInitialized()) {
			  Kakao.init('6ec6d52326b138f515a86c55e152676c');
			}
		var sendKakao = function() {
		    // 메시지 공유 함수
		  Kakao.Link.sendScrap({
		    requestUrl: 'http://localhost:80/', // 페이지 url
		    templateId:  80693, // 메시지템플릿 번호
		    templateArgs: {
		            PROFILE : ${THU} // 프로필 이미지 주소 ${PROFILE}
		      THUMB: ${THU}, // 썸네일 주소 ${THUMB}
		      TITLE: ${TITLE}, // 제목 텍스트 ${TITLE}
		      DESC: ${DESC}, // 설명 텍스트 ${DESC}
		    },
		  });
		}; */
		
		/*
	    달력 렌더링 할 때 필요한 정보 목록 

	    현재 월(초기값 : 현재 시간)
	    금월 마지막일 날짜와 요일
	    전월 마지막일 날짜와 요일
	*/

	calendarInit();
	
	function calendarInit() {

			// 날짜 정보 가져오기
			var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
			var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
			var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
			var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)

			var thisMonth = new Date(today.getFullYear(), today.getMonth(),
					today.getDate());
			// 달력에서 표기하는 날짜 객체

			var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
			var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
			var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

			// kst 기준 현재시간
			// console.log(thisMonth);

			// 캘린더 렌더링
			renderCalender(thisMonth);

			function renderCalender(thisMonth) {

				// 렌더링을 위한 데이터 정리
				currentYear = thisMonth.getFullYear();
				currentMonth = thisMonth.getMonth();
				currentDate = thisMonth.getDate();

				// 이전 달의 마지막 날 날짜와 요일 구하기
				var startDay = new Date(currentYear, currentMonth, 0);
				var prevDate = startDay.getDate();
				var prevDay = startDay.getDay();

				// 이번 달의 마지막날 날짜와 요일 구하기
				var endDay = new Date(currentYear, currentMonth + 1, 0);
				var nextDate = endDay.getDate();
				var nextDay = endDay.getDay();

				// console.log(prevDate, prevDay, nextDate, nextDay);

				// 현재 월 표기
				$('.year-month').text(currentYear + '.' + (currentMonth + 1));

				// 렌더링 html 요소 생성
				calendar = document.querySelector('.dates')
				calendar.innerHTML = '';

				// 지난달
				for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
					calendar.innerHTML = calendar.innerHTML
							+ '<div class="day prev disable">' + i + '</div>'
				}
				// 이번달
				for (var i = 1; i <= nextDate; i++) {
					calendar.innerHTML = calendar.innerHTML
							+ '<div class="day current">' + i + '</div>'
				}
				// 다음달
				for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
					calendar.innerHTML = calendar.innerHTML
							+ '<div class="day next disable">' + i + '</div>'
				}

				// 오늘 날짜 표기
				if (today.getMonth() == currentMonth) {
					todayDate = today.getDate();
					var currentMonthDate = document
							.querySelectorAll('.dates .current');
					currentMonthDate[todayDate - 1].classList.add('today');
				}
			}

			// 이전달로 이동
			$('.go-prev').on('click', function() {
				thisMonth = new Date(currentYear, currentMonth - 1, 1);
				renderCalender(thisMonth);
			});

			// 다음달로 이동
			$('.go-next').on('click', function() {
				thisMonth = new Date(currentYear, currentMonth + 1, 1);
				renderCalender(thisMonth);
			});
		}

	})
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ec6d52326b138f515a86c55e152676c"></script>
</body>
</html>