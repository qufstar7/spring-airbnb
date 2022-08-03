<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.0/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c3af16546c33c0b90cbaea7eedb971a2"></script>
<title>Applied Coding & Computer - aircnc</title>
<style>
.grid-main {
  width: 100%;
  display: grid;
  grid-template-columns: repeat(2, 1fr);	/* 슬라이드쇼 1열에 2개 표시 */
  row-gap: 30px;
  column-gap: 5px;
  @media screen and (max-width: 718px) {
    gap: 3px;
  }
}

.card-container {
  width: 100%;
  position: relative;
  text-decoration-line: none;
  color: black
}

.card-container::after {
  display: block;
  content: "";
}

.card-box {
  position: absolute;
  width: 100%;
  height: 100%;
}


#map {
	position:absolute;
	z-index: -1;
	width:1530px;
	height:100%;
	left: 0px;
    top: 0px;
}
.sidebar {
  height: 100%;
  width: 50%;
  position: fixed;
  z-index: 1;
  top: 80px;
  right: 0;
  background-color: #FFFFFF;
  overflow-x: hidden;
  transition: 0.5s;
}

.sidebar a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.btn-group {
  z-index:1;
  position:absolute;
  top:20px;
  right:20px;
  display: block;
  border-radius:10px;
  padding:4px;
  box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important;
  background-color: #FFFFFF;
  }
  
.btn-group button { 
  font-size: 20px;
  cursor: pointer;
  background-color: transparent;
  color: black;
  padding: 0px;
  border-radius:0;
  border: none;
  
  width:40px;
  height:40px;
  display:block;
}

.btn-group button:not(:last-child) {
  border-bottom: solid 1px #E6E6E6; 
}

#closebtn {
  position: relative;
  z-index:1;
  top: 18px;
  left: 32px;
  
  font-size: 15px;
  cursor: pointer;
  background-color: #FFFFFF;
  color: black;
  padding: 0px;
  border-radius: 10px;
  border: none;
  box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important;
  
  width:111px;
  height:40px;
}

#filterbtn {
  position: relative;
  z-index:1;
  top: 16px;
  left: 32px;
  
  font-size: 15px;
  cursor: pointer;
  background-color: #FFFFFF;
  color: black;
  padding: 0px;
  border-radius: 10px;
  border: none;
  box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important;
  
  width:81px;
  height:40px;
  
}
#navfilter {
	font-weight: bold;
	font-size: 14px;
	cursor: pointer;
	background-color: #FFFFFF;
	color: black;
	padding: 0px;
	background-color:#FFFFFF;
	color: black;
	
	border: solid 1px #E6E6E6;
	border-radius: 10px;
  
	width:81px;
	height:40px;
  
}
#closebtn i{
	font-size: 20px;
}
#openbtn {
  z-index:1;
  position:relative;
  top:20px;
  left:20px;
  
  font-size: 20px;
  cursor: pointer;
  background-color: #FFFFFF;
  color: black;
  padding: 0px;
  border-radius:25%;
  border: none;
  box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important;
  
  width:40px;
  height:40px;
}

#openbtn:hover, .btn-group button:hover, #closebtn:hover {
  background-color: #FAFAFA;
}
#nav {
	top:50px;
	z-index: 2000;
	height: 78px;
	width: 50%;
	background-color:#FFFFFF;
	margin:0;
}
#main {
  transition: margin-left .5s;
  padding: 0px;
  
  top: 0;
  left: 0;
  width: 50%;
}

/*  */
@media screen and (max-width: 950px) {
	#mySidebar {width:0px;}
	#main {width:100%;}
}
</style>
</head>
<c:set var="page" value="subNav" />
<body>
<div class="sticky-top">
	<%@ include file="../common/nav.jsp"%>
	<div class="container">
	    <!-- 태그와 필터가 있는 navbar2 -->
		<div class="row tagFilterBar p-0 align-items-center" id="nav">
			<div class="col-10 text-start p-0" style="font-size:14px;"><strong>숙소 10000개</strong></div>
			<div class="col-2 text-end">
				<button id="navfilter" type="button" data-bs-toggle="modal" data-bs-target="#filterModal">
					<i class="bi bi-sliders"></i>
					필터
				</button>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div id="main">
		<div class="grid-main">
			<a class="card-container" href="#" style="text-decoration-line: none; color: black">
				<div class="card-box p-1">
					<div class="" style="width: 300px">
						<!-- 숙소 섬네일 슬라이드쇼 시작 -->
						<!-- 아이디에 acc_no나 img_no를 사용하는게 좋을 것 같습니다. / id - 아래 3개의 버튼, prev버튼, next버튼 -->
						<div id="carouselExampleIndicators" class="carousel slide"
							data-interval="false">
							<div class="carousel-indicators">
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<!-- 슬라이드쇼 이미지 -->
							<div class="carousel-inner" style="border-radius: 25px;">
								<div class="carousel-item active">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
							</div>

							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleIndicators"
								data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>

							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleIndicators"
								data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
						<!-- 숙소 설명 -->
						<div class="row my-2">
							<div class="col-8">
								<div class="card-title">애월읍, 제주시의 캠핑카</div>
								<div class="card-text">비치보이스,Boy21</div>
								<div class="card-subtitle mb-2 text-muted">퀸 침대 1개</div>
								<div class="card-subtitle mb-2 text-muted">12월 6일 ~ 1월 3일</div>
								<div class="card-text">
									<strong>₩<fmt:formatNumber value="6343393" /></strong>/월
								</div>
							</div>
							<div class="col-4 text-end">★4.5(120)</div>
						</div>
					</div>
				</div>
			</a> <a class="card-container" href="#" style="text-decoration-line: none; color: black">
				<div class="class="card-box p-1">
					<div class="" style="width: 300px">
						<!-- 숙소 섬네일 슬라이드쇼 시작 -->
						<!-- 아이디에 acc_no나 img_no를 사용하는게 좋을 것 같습니다. / id - 아래 3개의 버튼, prev버튼, next버튼 -->
						<div id="carouselExampleIndicators-1" class="carousel slide"
							data-interval="false">
							<div class="carousel-indicators">
								<button type="button"
									data-bs-target="#carouselExampleIndicators-1"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators-1"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators-1"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<!-- 슬라이드쇼 이미지 -->
							<div class="carousel-inner" style="border-radius: 25px;">
								<div class="carousel-item active">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
							</div>

							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleIndicators-1"
								data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>

							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleIndicators-1"
								data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
						<!-- 숙소 설명 -->
						<div class="row my-2">
							<div class="col-8">
								<div class="card-title">애월읍, 제주시의 캠핑카</div>
								<div class="card-text">비치보이스,Boy21</div>
								<div class="card-subtitle mb-2 text-muted">퀸 침대 1개</div>
								<div class="card-subtitle mb-2 text-muted">12월 6일 ~ 1월 3일</div>
								<div class="card-text">
									<strong>₩<fmt:formatNumber value="6343393" /></strong>/월
								</div>
							</div>
							<div class="col-4 text-end">★4.5(120)</div>
						</div>
					</div>
				</div>
			</a><a class="card-container" href="#" style="text-decoration-line: none; color: black">
				<div class="class="card-box p-1">
					<div class="" style="width: 300px">
						<div id="carouselExampleIndicators-2" class="carousel slide"
							data-interval="false">
							<!-- 숙소 섬네일 슬라이드쇼 -->
							<div class="carousel-indicators">
								<button type="button"
									data-bs-target="#carouselExampleIndicators-2"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators-2"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators-2"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<!-- 슬라이드쇼 이미지 -->
							<div class="carousel-inner" style="border-radius: 25px;">
								<div class="carousel-item active">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleIndicators-2"
								data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleIndicators-2"
								data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
						<!-- 숙소 설명 -->
						<div class="row my-2">
							<div class="col-8">
								<div class="card-title">애월읍, 제주시의 캠핑카</div>
								<div class="card-text">비치보이스,Boy21</div>
								<div class="card-subtitle mb-2 text-muted">퀸 침대 1개</div>
								<div class="card-subtitle mb-2 text-muted">12월 6일 ~ 1월 3일</div>
								<div class="card-text">
									<strong>₩<fmt:formatNumber value="6343393" /></strong>/월
								</div>
							</div>
							<div class="col-4 text-end">★4.5(120)</div>
						</div>
					</div>
				</div>
			</a> <a class="card-container" href="#" style="text-decoration-line: none; color: black">
				<div class="class="card-box p-1">
					<div class="" style="width: 300px">
						<div id="carouselExampleIndicators-3" class="carousel slide"
							data-interval="false">
							<!-- 숙소 섬네일 슬라이드쇼 -->
							<div class="carousel-indicators">
								<button type="button"
									data-bs-target="#carouselExampleIndicators-3"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators-3"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators-3"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<!-- 슬라이드쇼 이미지 -->
							<div class="carousel-inner" style="border-radius: 25px;">
								<div class="carousel-item active">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleIndicators-3"
								data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleIndicators-3"
								data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
						<!-- 숙소 설명 -->
						<div class="row my-2">
							<div class="col-8">
								<div class="card-title">애월읍, 제주시의 캠핑카</div>
								<div class="card-text">비치보이스,Boy21</div>
								<div class="card-subtitle mb-2 text-muted">퀸 침대 1개</div>
								<div class="card-subtitle mb-2 text-muted">12월 6일 ~ 1월 3일</div>
								<div class="card-text">
									<strong>₩<fmt:formatNumber value="6343393" /></strong>/월
								</div>
							</div>
							<div class="col-4 text-end">★4.5(120)</div>
						</div>
					</div>
				</div>
			</a>
		</div>
		<div id="mySidebar" class="sidebar" style="z-index:2001;">
		  <!-- 접기 펼치기 버튼 -->
		  <button id="openbtn" onclick="openNav()"><i class="bi bi-chevron-left"></i></button>
		  <div class="btn-group">
		  	<button type="button" onclick="zoomIn()"><i class="bi bi-plus-lg"></i></button>
		  	<button type="button" onclick="zoomOut()"><i class="bi bi-dash-lg"></i></button>
		  </div>
		  <button id="closebtn" class="d-none" onclick="closeNav()"><i class="bi bi-chevron-right"></i><strong>    목록보기</strong></button>
		  <!-- 필터모달은 아직 미구현 -->
		  <button id="filterbtn" class="d-none" type="button" data-bs-toggle="modal" data-bs-target="#filterModal"><i class="bi bi-sliders"></i><strong>    필터</strong></button>
		  <div id="map"></div>
		</div>
	</div>
</div>


<script>
/* list 페이지의 오른쪽 지도 구현 - 접기 펼치기 버튼 */

$("#openbtn").click(function() {
	document.getElementById("mySidebar").style.width = "100%";
	document.getElementById("mySidebar").style.left = "0";
	document.getElementById("main").style.marginLeft = "-100%";
	
	$("#openbtn").toggleClass('d-none');
	$("#closebtn").toggleClass('d-none');
	$("#filterbtn").toggleClass('d-none');
})

$("#closebtn").click(function() {
	document.getElementById("mySidebar").style.width = "50%";
	document.getElementById("mySidebar").style.left = "50%";
	document.getElementById("main").style.marginLeft= "0";
	
	$("#openbtn").toggleClass('d-none');
	$("#closebtn").toggleClass('d-none');
	$("#filterbtn").toggleClass('d-none');
})

/* 카카오 지도 */
var container = document.getElementById('map'); 		  //지도를 담을 영역의 DOM 레퍼런스
var options = { 										  //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(35.855301, 128.192884), //지도의 중심좌표.
	level: 12											  //지도의 레벨(확대, 축소 정도) - 최대 14
};

var map = new kakao.maps.Map(container, options); 		  //지도 생성 및 객체 리턴
 
// 지도 레벨은 지도의 확대 수준을 의미합니다
// 지도 레벨은 1부터 14레벨이 있으며 숫자가 작을수록 지도 확대 수준이 높습니다

//지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}

</script>
</body>
</html>