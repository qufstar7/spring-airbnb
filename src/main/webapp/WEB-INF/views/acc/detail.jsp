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
   background: orange;
	}
	.box {margin:20px auto;}
    .content {
        width: auto;
    }
    #map {
	    width:1120px;
	    height:480px;
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
</style>
<title>숙소 상세 페이지</title>
</head>
<body >
	<div class="container" style="padding: 0px 40px;"> 
		<div class="row p-2 mb-2" style="padding-left: 80px; padding-right: 80px;">
			<div>
				<h1>HTA 어쩌구 저쩌구</h1>
			</div>
			<div class="pl-1">
				<p>
					<button type="button" class="btn btn-link text-dark btn-sm"><i class="bi bi-star-fill"></i> 4.5 <span class="text-decoration-underline">후기 xxx개</span></button>
					<button type="button" class="btn btn-link text-decoration-underline text-dark btn-sm">주소관련</button>
				
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
					<img src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg" style="width: 560px; height: 498px;">
				</div>
			</div>
			<div class="col-3">
			
				<div class="img-short">
					<img src="https://a0.muscache.com/airbnb/static/destinations/o-Rome_Piazza017_480x320.jpg" style="width: 272px; height: 249px;">
				</div>
				<div class="img-short">
					<img src="https://a0.muscache.com/airbnb/static/destinations/o-Los_Angeles_480x320.jpg" style="width: 272px; height: 249px;">
				</div>
			</div>
			<div class="col-3">
			
				<div class="img-short">
					<img src="https://a0.muscache.com/airbnb/static/destinations/o-Lisbon_480x320.jpg" style="width: 272px; height: 249px;">
				</div>
				<div class="img-short">
					<img src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg" style="width: 272px; height: 249px;">
				</div>
			</div>
		</div>
	</div>
	<div class="container main" style="padding: 0px 40px;">
		<div class="row"> 
		
			<div class="col-8">
				<div>
					<h2>덕인님이 호스팅하는 중앙HTA</h2>
					<p>최대 인원 2명 침실 1개 침대 1개 욕실 1개</p>
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
					
					<p>이국적인 라아 환초에 위치한 이 멋지고 넓은 저택은 친구나 가족을 위한 전용 데크와 함께 해변으로 이어지는 전용 수영장을 갖추고 있으며, 낭만적인 관문으로 안성맞춤입니다. 타의 추종을 불허하는 수중 생활, 두꺼운 녹지, 진정한 몰디브 경험을 경험해보세요.
					숙소
					약 1668평방피트에 걸쳐 펼쳐진 이 호화로운 저택에서는 하얀 모래 해변과 청록색 석호의 전망을 감상할 수 있으며, 나무 선데크로 덮인 대형 복합 단지가 있으며, 라운지와 울창한 정원이 있는 푹신한 데이베드가 있습니다.</p>
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
				<div class="row mt-5">
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
					<input type="text" id="demo" name="demo" value="01/01/2018 - 01/15/2018" />
				</div>
				
			</div>
			<div class="col-4">
				<div class="shadow-lg p-3 mb-5 bg-body rounded sticky">
					예약들어갈곳
					<img alt="" src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg" style="width: 100%;">
				</div>
			</div>
			<hr>
			<div class="mt-5 mb-5">
				<h1>후기</h1>
			</div>
			<hr>
			<div class="mt-5 mb-5">
				<div class="">
					<h3>호스팅 지역</h3>
				</div>
				<div id="map" class="mb-2"></div>
				<div class="mb-2">
					<h5>서울시 종로구</h1>
					<p>조용한 어쩌구</p>
				</div>
			</div>
			<hr>
			<div class="mt-5 mb-5">
				<h3>호스트:덕인님</h3>
				<p>회원 가입일: 2019년 12월사업자 정보</p>
			</div>
			<hr>
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

<!-- 공유 모달 -->
<div class="modal" id="modal-share-acc">
	<div class="modal-dialog modal-Default">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title"><strong>가족 및 친구들과 이 장소를 공유하세요</strong></h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="row">
						<div class="col-1">
							<img src="https://a0.muscache.com/airbnb/static/destinations/o-Paris_480x320.jpg" style="width: 40px; height: 40px;">
						</div>
						<div class="col-11">
							<h4>중앙 HTA 입니다.</h4>
						</div>
					</div>
					<div class="col-6 p-3 mb-1 bg-body rounded text-center">
						<button class="btn btn-light btn-lg">링크 복사</button>
					</div>
					<div class="col-6 p-3 mb-1 bg-body rounded text-center">
						<button class="btn btn-light btn-lg">링크 복사</button>
					</div>
					<div class="col-6 p-3 mb-1 bg-body rounded text-center">
						<button class="btn btn-light btn-lg">링크 복사</button>
					</div>
					<div class="col-6 p-3 mb-1 bg-body rounded text-center">
						<button class="btn btn-light btn-lg">링크 복사</button>
					</div>
					<div class="col-6 p-3 mb-1 bg-body rounded text-center">
						<button class="btn btn-light btn-lg">링크 복사</button>
					</div>
					<div class="col-6 p-3 mb-1 bg-body rounded text-center">
						<button class="btn btn-light btn-lg">링크 복사</button>
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
				<h4 class="modal-title">가족 및 친구들과 이 장소를 공유하세요</h4>
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
				<div class="modal-body">
					<div class="row text-center">
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
<script type="text/javascript">
$(function() {
	// 모달 객체
	let accConvenienceModal = new bootstrap.Modal(document.getElementById("modal-con-acc"));
	let accShareModal = new bootstrap.Modal(document.getElementById("modal-share-acc"));
	let accSaveModal = new bootstrap.Modal(document.getElementById("modal-save-acc"));
	let accImageModal = new bootstrap.Modal(document.getElementById("modal-image-acc"));
	let accCoverModal = new bootstrap.Modal(document.getElementById("modal-cover-acc"));
	
	// 위시리스트 저장 모달
	$("#btn-open-save-modal").click(function() {
		accSaveModal.show();
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
	
	// 카카오 맵
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.5729183,126.992214), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.5729183,126.992214), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 지도 타입 컨트롤을 지도에 표시합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	// 마커가 표시될 위치입니다 
    var markerPosition  = new kakao.maps.LatLng(37.5729183,126.992214); 

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
	
	function getInfo() {
    // 지도의 현재 중심좌표를 얻어옵니다 
    var center = map.getCenter(); 
    
    // 지도의 현재 레벨을 얻어옵니다
    var level = map.getLevel();
    
    // 지도타입을 얻어옵니다
    var mapTypeId = map.getMapTypeId(); 
    
    // 지도의 현재 영역을 얻어옵니다 
    var bounds = map.getBounds();
    
    // 영역의 남서쪽 좌표를 얻어옵니다 
    var swLatLng = bounds.getSouthWest(); 
    
    // 영역의 북동쪽 좌표를 얻어옵니다 
    var neLatLng = bounds.getNorthEast(); 
    
    // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
    var boundsStr = bounds.toString();
    
    
    var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
    message += '경도 ' + center.getLng() + ' 이고 <br>';
    message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
    message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
    message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng() + ' 이고 <br>';
    message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng() + ' 입니다';
    
    // 개발자도구를 통해 직접 message 내용을 확인해 보세요.
    // ex) console.log(message);
    
 
	}
	
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
	
})

</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ec6d52326b138f515a86c55e152676c"></script>
</body>
</html>