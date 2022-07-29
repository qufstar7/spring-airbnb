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
   background: orange;
	}
	.box {margin:20px auto;}
    .content {
        width:800px;
    }
</style>
<title>숙소 상세 페이지</title>
</head>
<body >
	<div class="container" style="padding: 0px 40px;"> 
		<div class="row p-2 mb-2" style="padding-left: 80px; padding-right: 80px;">
			<div>
				<h1>숙소 제목</h1>
			</div>
			<div class="pl-1">
				<p>★평점 <a href="">후기</a> <a href="">주소관련</a>
				
					<span class="float-end">
						<button type="button" class="btn btn-light" id="btn-open-share-modal">공유</button>
						<button type="button" class="btn btn-light" id="btn-open-save-modal">저장</button>
					</span>
				</p>
			</div>
		</div>
	</div>
	<div class="container" style="padding: 0px 40px;">
		<div class="row mb-5">
			<div class="col-6">
				<div class="img-large" >
					<img src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg" style="width: 560px; height: 500px;">
				</div>
			</div>
			<div class="col-3">
			
				<div class="img-short">
					<img src="https://a0.muscache.com/airbnb/static/destinations/o-Rome_Piazza017_480x320.jpg" style="width: 272px; height: 252px;">
				</div>
				<div class="img-short">
					<img src="https://a0.muscache.com/airbnb/static/destinations/o-Los_Angeles_480x320.jpg" style="width: 272px; height: 252px;">
				</div>
			</div>
			<div class="col-3">
			
				<div class="img-short">
					<img src="https://a0.muscache.com/airbnb/static/destinations/o-Lisbon_480x320.jpg" style="width: 272px; height: 252px;">
				</div>
				<div class="img-short">
					<img src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg" style="width: 272px; height: 252px;">
				</div>
			</div>
		</div>
	</div>
	<div class="container" style="padding: 0px 40px;">
		<div class="row"> 
		
			<div class="col-8">
				<div>
					<h2>Dorothy님이 호스팅하는 돔하우스</h2>
					<p>최대 인원 2명 침실 1개 침대 1개 욕실 1개</p>
				</div>
				<hr>
				<div>
					<h3>마음껏 물놀이를 즐기세요</h1>
				</div>
				<hr>
				<div>
					<h3>에어커버</h3>
					<a href="">더보기</a>
				</div>
				<hr>
				<div class="box">
					<h3>숙소설명</h3>
					<div class="content">
					
					<p>이국적인 라아 환초에 위치한 이 멋지고 넓은 저택은 친구나 가족을 위한 전용 데크와 함께 해변으로 이어지는 전용 수영장을 갖추고 있으며, 낭만적인 관문으로 안성맞춤입니다. 타의 추종을 불허하는 수중 생활, 두꺼운 녹지, 진정한 몰디브 경험을 경험해보세요.
					숙소
					약 1668평방피트에 걸쳐 펼쳐진 이 호화로운 저택에서는 하얀 모래 해변과 청록색 석호의 전망을 감상할 수 있으며, 나무 선데크로 덮인 대형 복합 단지가 있으며, 라운지와 울창한 정원이 있는 푹신한 데이베드가 있습니다.</p>
					</div>
				</div>
				<hr>
				<div>
					<h3>숙박장소</h1>
					<img alt="" src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg" class="sticky">
				</div>
				<hr>
				<div class="row">
					<h3>편의시설</h3>
					<div class="col-6 mb-2">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 무선인터넷</div>
					<div class="col-6 mb-2">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 수영장</div>
					<div class="col-6 mb-2">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 바베큐그릴</div>
					<div class="col-6 mb-2">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 어쩌구</div>
					<div class="col-6 mb-2">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 저쩌구</div>
					<div class="col-6 mb-2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 저쩌구리</div>
					<div class="col-6 mb-2">
					
						<button class="btn btn-light btn-sm" id="btn-open-con-modal">더보기</button>
					</div>
				</div>
				<hr>
				<div>
					<h1>달력 들어갈곳</h1>
				</div>
				
			</div>
			<div class="col-4">
				<div class="shadow-lg p-3 mb-5 bg-body rounded sticky">
					예약들어갈곳
					<img alt="" src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg">
				</div>
			</div>
			<hr>
			<div>
				<h1>후기</h1>
			</div>
			<hr>
			<div>
				<h1>호스팅지역 지도</h1>
			</div>
			<div>
				<h1>호스팅지역 지도</h1>
			</div>
			<div>
				<h1>호스팅지역 지도</h1>
			</div>
			<div>
				<h1>호스팅지역 지도</h1>
			</div>
			<div>
				<h1>호스팅지역 지도</h1>
			</div>
			<div>
				<h1>호스팅지역 지도</h1>
			</div>
			<div>
				<h1>호스팅지역 지도</h1>
			</div>
			<div>
				<h1>호스팅지역 지도</h1>
			</div>
			<div>
				<h1>호스팅지역 지도</h1>
			</div>
			<div>
				<h1>호스팅지역 지도</h1>
			</div>
			<div>
				<h1>호스팅지역 지도</h1>
			</div>
			<div>
				<h1>호스팅지역 지도</h1>
			</div>
			<div>
				<h1>호스팅지역 지도</h1>
			</div>
			<div>
				<h1>호스팅지역 지도</h1>
			</div>
			<div>
				<h1>호스팅지역 지도</h1>
			</div>
			<div>
				<h1>호스팅지역 지도</h1>
			</div>
			<div>
				<h1>호스팅지역 지도</h1>
			</div>
			<div>
				<h1>호스팅지역 지도</h1>
			</div>
			
		</div>
	</div>
<div class="modal" id="modal-con-acc">
	<div class="modal-dialog modal-lg">
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
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 헤어드라이기
					</p>
					<p>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 헤어드라이기
					</p>
				</div>
				<div class="row">
					<hr>
					<h5>욕실</h5>
					<p>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 헤어드라이기
					</p>
					<p>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 헤어드라이기
					</p>
				</div>
				<div class="row">
					<hr>
					<h5>욕실</h5>
					<p>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 헤어드라이기
					</p>
					<p>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 헤어드라이기
					</p>
				</div>
				
			</div>
		</div>
	</div>
</div>
<div class="modal" id="modal-share-acc">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">가족 및 친구들과 이 장소를 공유하세요</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<hr>
					<h5>욕실</h5>
					<p>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 헤어드라이기
					</p>
					<p>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 헤어드라이기
					</p>
				</div>
				<div class="row">
					<hr>
					<h5>욕실</h5>
					<p>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 헤어드라이기
					</p>
					<p>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 헤어드라이기
					</p>
				</div>
				<div class="row">
					<hr>
					<h5>욕실</h5>
					<p>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 헤어드라이기
					</p>
					<p>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 헤어드라이기
					</p>
				</div>
				
			</div>
		</div>
	</div>
</div>
<div class="modal" id="modal-save-acc">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">가족 및 친구들과 이 장소를 공유하세요</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<hr>
					<h5>욕실</h5>
					<p>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 헤어드라이기
					</p>
					<p>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 헤어드라이기
					</p>
				</div>
				<div class="row">
					<hr>
					<h5>욕실</h5>
					<p>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 헤어드라이기
					</p>
					<p>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 헤어드라이기
					</p>
				</div>
				<div class="row">
					<hr>
					<h5>욕실</h5>
					<p>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 헤어드라이기
					</p>
					<p>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
	  					<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
						</svg> 헤어드라이기
					</p>
				</div>
				
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	let accConvenienceModal = new bootstrap.Modal(document.getElementById("modal-con-acc"));
	let accShareModal = new bootstrap.Modal(document.getElementById("modal-share-acc"));
	let accSaveModal = new bootstrap.Modal(document.getElementById("modal-save-acc"));
	
	$("#btn-open-save-modal").click(function() {
		accSaveModal.show();
	});
	$("#btn-open-con-modal").click(function() {
		accConvenienceModal.show();
	});
	$("#btn-open-share-modal").click(function() {
		accShareModal.show();
	});
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
        // 아래 bind가 안 되는 이유는??
        // btn_more.bind('click',toggle_content);

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
})
</script>
</body>
</html>