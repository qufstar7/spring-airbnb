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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Google+Sans:400,500,700|Google+Sans+Text:400&amp;lang=ko">
<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Google+Sans+Text:400&amp;text=%E2%86%90%E2%86%92%E2%86%91%E2%86%93&amp;lang=ko">
<title>${wishlist.name }-에어씨엔씨</title>
<style type="text/css">
	.carousel-inner img{ object-fit: contain;}
</style>
</head>
<body>
<%@ include file="../common/nav.jsp"%>
<div class="container-fluid">
	<div class="row my-5" id="div-main">
		<div class="col-7">
			<h1 class="fw-bold mb-3">${wishlist.name }</h1>
			<div>
				<div class="mb-5">
					<button type="button" class="btn btn-outline-secondary rounded-pill">날짜</button>
					<button type="button" class="btn btn-outline-secondary rounded-pill">인원</button>
				</div>
				<div>
					<div class="card mb-3">
					  <div class="row g-0">
					    <div class="col-md-4">
					      <div id="carouselExampleIndicators-4" class="carousel slide" data-interval="false">
							<!-- 숙소 섬네일 슬라이드쇼 -->
							<div class="carousel-indicators">
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<!-- 슬라이드쇼 이미지 -->
							<div class="carousel-inner" style="border-radius: 25px;">
								<div class="carousel-item active">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
							</div>
							<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					    </div>
					    <div class="col-md-8">
					      <div class="card-body">
					        <p class="card-text text-muted">강남구의 공동 주택 전체</p>
					        <h5 class="card-title">Seolleung st./Gangnam-GuestSuite101/Parking</h5>
					        <p class="card-text text-muted">최대 인원 2명 원룸 침대2개 욕실 1개</p>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
				<div>
					<div class="card mb-3">
					  <div class="row g-0">
					    <div class="col-md-4">
					      <div id="carouselExampleIndicators-4" class="carousel slide" data-interval="false">
							<!-- 숙소 섬네일 슬라이드쇼 -->
							<div class="carousel-indicators">
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<!-- 슬라이드쇼 이미지 -->
							<div class="carousel-inner" style="border-radius: 25px;">
								<div class="carousel-item active">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
							</div>
							<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					    </div>
					    <div class="col-md-8">
					      <div class="card-body">
					        <p class="card-text text-muted">강남구의 공동 주택 전체</p>
					        <h5 class="card-title">Seolleung st./Gangnam-GuestSuite101/Parking</h5>
					        <p class="card-text text-muted">최대 인원 2명 원룸 침대2개 욕실 1개</p>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
				<div>
					<div class="card mb-3">
					  <div class="row g-0">
					    <div class="col-md-4">
					      <div id="carouselExampleIndicators-4" class="carousel slide" data-interval="false">
							<!-- 숙소 섬네일 슬라이드쇼 -->
							<div class="carousel-indicators">
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<!-- 슬라이드쇼 이미지 -->
							<div class="carousel-inner" style="border-radius: 25px;">
								<div class="carousel-item active">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
							</div>
							<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					    </div>
					    <div class="col-md-8">
					      <div class="card-body">
					        <p class="card-text text-muted">강남구의 공동 주택 전체</p>
					        <h5 class="card-title">Seolleung st./Gangnam-GuestSuite101/Parking</h5>
					        <p class="card-text text-muted">최대 인원 2명 원룸 침대2개 욕실 1개</p>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
				<div>
					<div class="card mb-3">
					  <div class="row g-0">
					    <div class="col-md-4">
					      <div id="carouselExampleIndicators-4" class="carousel slide" data-interval="false">
							<!-- 숙소 섬네일 슬라이드쇼 -->
							<div class="carousel-indicators">
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<!-- 슬라이드쇼 이미지 -->
							<div class="carousel-inner" style="border-radius: 25px;">
								<div class="carousel-item active">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
							</div>
							<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					    </div>
					    <div class="col-md-8">
					      <div class="card-body">
					        <p class="card-text text-muted">강남구의 공동 주택 전체</p>
					        <h5 class="card-title">Seolleung st./Gangnam-GuestSuite101/Parking</h5>
					        <p class="card-text text-muted">최대 인원 2명 원룸 침대2개 욕실 1개</p>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
				<div>
					<div class="card mb-3">
					  <div class="row g-0">
					    <div class="col-md-4">
					      <div id="carouselExampleIndicators-4" class="carousel slide" data-interval="false">
							<!-- 숙소 섬네일 슬라이드쇼 -->
							<div class="carousel-indicators">
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<!-- 슬라이드쇼 이미지 -->
							<div class="carousel-inner" style="border-radius: 25px;">
								<div class="carousel-item active">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
							</div>
							<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					    </div>
					    <div class="col-md-8">
					      <div class="card-body">
					        <p class="card-text text-muted">강남구의 공동 주택 전체</p>
					        <h5 class="card-title">Seolleung st./Gangnam-GuestSuite101/Parking</h5>
					        <p class="card-text text-muted">최대 인원 2명 원룸 침대2개 욕실 1개</p>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
				<div>
					<div class="card mb-3">
					  <div class="row g-0">
					    <div class="col-md-4">
					      <div id="carouselExampleIndicators-4" class="carousel slide" data-interval="false">
							<!-- 숙소 섬네일 슬라이드쇼 -->
							<div class="carousel-indicators">
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<!-- 슬라이드쇼 이미지 -->
							<div class="carousel-inner" style="border-radius: 25px;">
								<div class="carousel-item active">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
							</div>
							<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					    </div>
					    <div class="col-md-8">
					      <div class="card-body">
					        <p class="card-text text-muted">강남구의 공동 주택 전체</p>
					        <h5 class="card-title">Seolleung st./Gangnam-GuestSuite101/Parking</h5>
					        <p class="card-text text-muted">최대 인원 2명 원룸 침대2개 욕실 1개</p>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
				<div>
					<div class="card mb-3">
					  <div class="row g-0">
					    <div class="col-md-4">
					      <div id="carouselExampleIndicators-4" class="carousel slide" data-interval="false">
							<!-- 숙소 섬네일 슬라이드쇼 -->
							<div class="carousel-indicators">
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<!-- 슬라이드쇼 이미지 -->
							<div class="carousel-inner" style="border-radius: 25px;">
								<div class="carousel-item active">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0" src="/resources/images/acc/sample-home.jpg" alt="숙소이미지">
								</div>
							</div>
							<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators-4" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					    </div>
					    <div class="col-md-8">
					      <div class="card-body">
					        <p class="card-text text-muted">강남구의 공동 주택 전체</p>
					        <h5 class="card-title">Seolleung st./Gangnam-GuestSuite101/Parking</h5>
					        <p class="card-text text-muted">최대 인원 2명 원룸 침대2개 욕실 1개</p>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-5 border sticky" id="div-map">
			<div id="googleMap" style="width: auto; height: 800px;"></div>
		</div>
	</div>

</div>
<script type="text/javascript">

const sample = [
	  { lat: 37.5047592, lng: 127.0415586},
	  { lat: 37.5082055, lng: 127.0363408},
	  { lat: 37.5055726, lng: 127.0294372},
	  { lat: 37.4994, lng: 127.03545},
	  { lat: 37.4916279, lng: 127.0289673},
	  { lat: 37.49479, lng: 127.03665},
	  { lat: 37.5052889, lng: 127.0258825},
	  { lat: 37.503028, lng: 127.0237718}];

	let map;
    function initMap() {
        var cityHall = {lat: 37.566554, lng: 126.978546};

        var defaultOptions = {
            zoom: 12,
            center: cityHall,
            disableDefaultUI:true,
            zoomControl: true
            //mapTypeId: 'terrain'
            };
        map = new google.maps.Map(document.getElementById('googleMap'), defaultOptions);
        
        // 지도에 마커추가 테스트
        for(let i = 0; i < sample.length ; i++) {
	        var marker = new google.maps.Marker({
	        				position: sample[i], 
	        				map,
	        				title: "Hello"
	        			});
        }

    }
    
$(function () {
	/* $("#div-map").on('scroll touchmove mousewheel', function(e){
		e.preventDefault();
		e.stopPropagation(); 
		return false;
		}) */
})
	 
	 
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAFv4fJk64OcpfSgmByfKOlwHndkuSa0kk&callback=initMap&region=kr"></script>
</body>
</html>