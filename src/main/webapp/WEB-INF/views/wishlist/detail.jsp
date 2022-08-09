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
<script src="https://kit.fontawesome.com/2628157b3b.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
<script src="https://unpkg.com/@googlemaps/markerwithlabel/dist/index.min.js"></script>
<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Google+Sans:400,500,700|Google+Sans+Text:400&amp;lang=ko">
<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Google+Sans+Text:400&amp;text=%E2%86%90%E2%86%92%E2%86%91%E2%86%93&amp;lang=ko">
<title>${wishlist.name }-에어씨엔씨</title>
<style type="text/css">
	.carousel-inner img{ object-fit: contain;}
	#div-map {position: fixed; left: 41%;}
	#googleMap {width: 100vw; height: 100vh;}
	#div-sub button {border: none; padding: 3px;}
	#div-sub button:hover {background-color: #F5F5F5;}
	.card {border:none;}
	hr {opacity: 0.1;}
	#googleMap i {color: #FF385C;}
	.card-body i {color: #FF385C;} 
	#btn-delete-wishlist {border: none; padding: 10px;}
	#btn-delete-wishlist:hover {background-color: #F5F5F5;}
	
	.labels {
	  position: absolute;
	  top: 0;
	  left: 0;
	  /* transform: translate(-50%, -100%); */
	  background-color: white;
	  padding: 0 10px;
	  border-radius: 28px;
	  box-shadow: rgba(0, 0, 0, 0.08) 0px 0px 0px 1px,
	    rgba(0, 0, 0, 0.18) 0px 1px 2px;
	  overflow-y: auto;
	  height: 28px;
	  line-height: 28px;
	  font-weight: bold;
	  cursor: pointer;
	  transition: transform 0.15s ease-in-out;
	  font-size: 14px;
	  vertical-align: middle;
	} 
	
	/* infoWindow 스타일 */
	.gm-style .gm-style-iw-d {overflow: hidden !important;}
	
	.gm-style .gm-style-iw-c{
		border-radius: 15px;
		padding: 0px;
	}
	/* infowWindow의 x버튼과 화살표 숨김 */
	.gm-ui-hover-effect, .gm-style-iw-tc {display: none !important;}
</style>
</head>
<body>
<%@ include file="../common/nav.jsp"%>
<div class="container-fluid">
	<div class="row mb-5" id="div-main">
		<div class="col-5 border">
			<div class="my-4 d-flex justify-content-between" id="div-sub">
				<button type="button" class="btn rounded-circle p-0" onclick="javascript:history.back()"><i class="bi bi-arrow-left-short fs-3"></i></button>
				<button type="button" class="btn rounded-circle" data-bs-toggle="modal" data-bs-target="#modal-change-name"><i class="bi bi-three-dots fs-3"></i></button>
				<!-- 위시리스트 폴더 이름 변경 모달 -->
				<div class="modal" id="modal-change-name" tabindex="-1">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="btn-close border" data-bs-dismiss="modal" aria-label="Close"></button>
					        <h5 class="modal-title border text-center">설정</h5>
					        <button type="button" class="btn border">삭제</button>
					      </div>
					      <div class="modal-body">
					        <p>Modal body text goes here.</p>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					        <button type="button" class="btn btn-primary">Save changes</button>
					      </div>
					    </div>
					  </div>
				</div>
				
			</div>
			<div class="ms-2">
			<h2 class="fw-bold mb-3">${wishlist.name }</h2>
				<div class="mb-5">
					<button type="button" class="btn btn-outline-secondary rounded-pill">날짜</button>
					<button type="button" class="btn btn-outline-secondary rounded-pill">인원</button>
				</div>
				<c:forEach var="acc" items="${wishlist.accs}" varStatus="loop" >
					<div class="card mb-3" data-index="${loop.index}" id="card-${acc.accNo }">
					  <div class="row g-0">
					    <div class="col-md-4" >
					      <div id="carouselExampleIndicators-${acc.accNo }" class="carousel slide" data-interval="false">
							<!-- 숙소 섬네일 슬라이드쇼 -->
							<div class="carousel-indicators">
								<button type="button" data-bs-target="#carouselExampleIndicators-${acc.accNo }" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
								<button type="button" data-bs-target="#carouselExampleIndicators-${acc.accNo }" data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button" data-bs-target="#carouselExampleIndicators-${acc.accNo }" data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<!-- 슬라이드쇼 이미지 -->
							<div class="carousel-inner" style="border-radius: 15px;">
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
							<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators-${acc.accNo }" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators-${acc.accNo }" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					    </div>
					    <div class="col-md-8">
					      <div class="card-body">
					      	<div class="d-flex justify-content-between">
						        <span class="card-text text-muted">${acc.address }</span>
						        <button type="button" class="btn rounded-circle" id="btn-delete-wishlist"><i class="fa-solid fa-heart fs-4"></i></button>
					      	</div>
						    <h5 class="card-title">${acc.name }</h5>
					        <p class="card-text text-muted">최대 인원 2명 원룸 침대2개 욕실 1개</p>
					      </div>
					    </div>
					  </div>
					</div>
					<hr/>
				</c:forEach>
				</div>
				<div>
			</div>
		</div>
		<div id="div-map">
			<div id="googleMap"></div>
		</div>
		
	</div>

</div>
<script type="text/javascript">

	//marker의 label 스타일 초기화
	function defaultLabel(markers) {
		$.each(markers, function() {
	 		$(this.label.element).removeClass("bg-black")
	 		$(this.label.element).css({"color":"black", "transform":"scale(1.0)", "z-index":"0"});
	 	});
	}
	
	function initMap() {
		let firstAcc = {lat: ${wishlist.accs[0].latitude}, lng: ${wishlist.accs[0].longitude}};
	    var defaultOptions = {
	        zoom: 14,
	        center: firstAcc,
	        disableDefaultUI:true,			// 기본UI 옵션 제거
	       //zoomControl: true,				// +/- 버튼
	        options: {
	            gestureHandling: 'greedy' 	// ctrl 없이 확대/축소
	          }
	        //mapTypeId: 'terrain'
	        };
	   let map = new google.maps.Map(document.getElementById('googleMap'), defaultOptions);
	   
	   createMarker(map, accs);
	}
	
	let accs = new Array();
	<c:forEach var="acc" items="${wishlist.accs}" >
		accs.push({accNo: ${acc.accNo}, lat: ${acc.latitude}, lng: ${acc.longitude}, name: "${acc.name}", price:${acc.price}, reviewScore:${acc.reviewScore}, reviewCount: ${acc.reviewCount}});
	</c:forEach>
		
	let markers = [];
	let marker = null;
	function createMarker(map, accs) {
		
		let acc = accs[0];
		
		 $.each(accs, function(index, acc) {
			    //google의 마커를 프로토타입으로 받았기 때문에 google marker의 옵션들도 이용 가능하다
		        marker = new markerWithLabel.MarkerWithLabel({
			        position: {lat: acc.lat, lng: acc.lng},
			        map: map,
			        icon: ' ',  //마커의 기본 아이콘을 없에려면 공백을 넣으면 된다.
			        //title: acc.accNo,
			        labelContent: '<div class="test"> ₩' + acc.price.toLocaleString() +' <i class="bi bi-heart-fill ps-1"></i></div>', //이런식으로 div 추가 가능
			        labelAnchor: new google.maps.Point(-30, -30),  //라벨의 상대적 위치를 지정함(px단위)이며 google map api의 anchor와 같은 개념이다.
			        labelClass: "labels",      // the CSS class for the label
			        labelStyle: {opacity: 0.75},
			        labelInBackground: false,
			        draggable: false,   //마커 드래그할때 필요
			        raiseOnDrag: false, //animation 사용할때 필요
			        optimized: false    //gif사용할때 필요
			      });
			      
			     // marker.set("id", acc.accNo );
			      
			     marker.addListener('mouseover', function() {
			    	 $(this.label.element).css({"transform":"scale(1.2)"});
			     }); 
			     marker.addListener('mouseout', function() {
			    	 $(this.label.element).css({"transform":"scale(1.0)"});
			     }); 
			     // marker 클릭시 인포박스 출력하기
			     marker.addListener('click', function (event) {
			    	 
			      	let infowindow = new google.maps.InfoWindow({
			    	  arrowStyle: 2,
			    	  pixelOffset: new google.maps.Size(30, 330)
			     	}); 
				      
			      defaultLabel(markers);
			    	  
		    	  $(this.label.element).addClass('bg-black');
		  	  	  $(this.label.element).css({"color":"white", "transform":"scale(1.2)", "z-index":"1"});
		  	  	  
		    	  let infoWindow_content = '<div class="card" style="width: 16rem; height:16rem;">';
		    	  	  infoWindow_content += '<div id="carousel-info' + acc.accNo + '" class="carousel slide" data-bs-ride="carousel">';
		    	  	  infoWindow_content +=	'	<div class="carousel-indicators">';
	    	  		  infoWindow_content +=	'		<button type="button" data-bs-target="#carousel-info' + acc.accNo + '" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>';
	    	  		  infoWindow_content +=	'		<button type="button" data-bs-target="#carousel-info' + acc.accNo + '" data-bs-slide-to="1" aria-label="Slide 2"></button>';
	    	  		  infoWindow_content +=	'		<button type="button" data-bs-target="#carousel-info' + acc.accNo + '" data-bs-slide-to="2" aria-label="Slide 3"></button>';
	    	  		  infoWindow_content +=	'	</div>';
	    	  		  infoWindow_content +=	'	<div class="carousel-inner">';
	    	  		  infoWindow_content +=	'		<div class="carousel-item active">';
	    	  		  infoWindow_content +=	'	  		<img src="/resources/images/acc/sample-home.jpg" class="d-block w-100" alt="...">';
	    	  		  infoWindow_content +=	'		</div>';
	    	  		  infoWindow_content +=	'	    <div class="carousel-item">';
	    	  		  infoWindow_content +=	'	      <img src="/resources/images/acc/sample-home.jpg" class="d-block w-100" alt="...">';
	    	  		  infoWindow_content +=	'	    </div>';
	    	  		  infoWindow_content +=	'	    <div class="carousel-item">';
	    	  		  infoWindow_content +=	'	      <img src="/resources/images/acc/sample-home.jpg" class="d-block w-100" alt="...">';
	    	  		  infoWindow_content +=	'	    </div>';
	    	  		  infoWindow_content +=	'	 </div>';
	    	  		  infoWindow_content +=	'	 <button class="carousel-control-prev" type="button" data-bs-target="#carousel-info' + acc.accNo + '" data-bs-slide="prev">';
	    	  		  infoWindow_content +=	'	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>';
	    	  		  infoWindow_content +=	'	    <span class="visually-hidden">Previous</span>';
	    	  		  infoWindow_content +=	'	  </button>';
	    	  		  infoWindow_content +=	'	  <button class="carousel-control-next" type="button" data-bs-target="#carousel-info' + acc.accNo + '" data-bs-slide="next">';
	    	  		  infoWindow_content +=	'	    <span class="carousel-control-next-icon" aria-hidden="true"></span>';
	    	  		  infoWindow_content +=	'	    <span class="visually-hidden">Next</span>';
	    	  		  infoWindow_content += '  	  </button>';
	    	  		  infoWindow_content += '  	 </div>';
		    	  
		    	  /* 	  infoWindow_content += $("#carouselExampleIndicators-" + acc.accNo).closest('.col-md-4').html() */
		    		  infoWindow_content += 	'<div class="card-body d-flex flex-column">';
	    			  infoWindow_content += 		'<span class="card-text"><i class="bi bi-star-fill"></i>' + acc.reviewScore + '(' + acc.reviewCount + ')</span>';
	    			  infoWindow_content += 		'<span class="card-text fs-6">' + acc.name + '</span>';
	    			  infoWindow_content +=  		'<span class="card-text fs-6"><strong>₩ ' + acc.price.toLocaleString() +  '</strong>/박 </span>';
	    			  infoWindow_content += 	'</div>';
	    			  infoWindow_content += '</div>';
			    	
	    			/* $(infoWindow_content).find("#carouselExampleIndicators-" + acc.accNo).attr("id", "carouselExampleIndicators-" + acc.accNo + "-info" );
			    	$(infoWindow_content).find("button[data-bs-target]").each(function() {
			    		$(this).attr("data-bs-target", $(this).attr("data-bs-target") + "-info");
			    	}) */
	    			  
			    	infowindow.setContent(infoWindow_content);
			    	
			    	
			    	// 클릭할 때 다른 infowWindow는 닫고 해당 infoWindow만 출력
			    	 if (typeof(currentInfoWindow) != 'undefined') { 
	                      currentInfoWindow.close(); 
	                  }  
		            //인포윈도우가 표시될 위치
		            //infowindow.setPosition(new google.maps.LatLng(-34, 151));
		            infowindow.open(map, this);
	                currentInfoWindow = infowindow; 
	                
				}); 
			      markers.push(marker);
		    })
		    return markers;
	}
	
	
	
	
$(function () {
	 $("#div-map").on('scroll touchmove mousewheel', function(e){
		e.preventDefault();
		e.stopPropagation(); 
		return false;
		});
	 
	 $(".card").hover(function() {
		 	
	 	let index = $(this).data("index");
	 	let marker = markers[index];
	 	
	 	$(marker.label.element).addClass('bg-black');
	  	$(marker.label.element).css({"color":"white", "transform":"scale(1.2)", "z-index":"1"});
	  	
	 	//google.maps.event.trigger(marker, 'mouseover');
	 }, function() {
		 defaultLabel(markers);
	 });
	 // 외부영역 클릭시 infoWindow 닫기
	 $(document).click(function(event) {
		defaultLabel(markers);
	 	let $infoWindow = $(".gm-style .gm-style-iw-c");
	 	if (!$infoWindow.is(event.target) && !$infoWindow.has(event.target).length) {
	 		$infoWindow.hide();
	    }
	 	
	 });
	
});
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAFv4fJk64OcpfSgmByfKOlwHndkuSa0kk&callback=initMap&region=kr"></script>
</body>
</html>