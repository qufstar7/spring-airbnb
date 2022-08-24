<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
 --><!-- JavaScript Bundle with Popper -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
<script src="https://unpkg.com/@googlemaps/markerwithlabel/dist/index.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.0/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/2628157b3b.js"></script>
<!-- <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Google+Sans:400,500,700|Google+Sans+Text:400&amp;lang=ko">
<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Google+Sans+Text:400&amp;text=%E2%86%90%E2%86%92%E2%86%91%E2%86%93&amp;lang=ko"> -->
<link rel="stylesheet" type="text/css" href="/resources/css/wishlist-detail.css">
<link rel="icon" href="../../../resources/aircnc.png">
<style type="text/css">
.div-nav {max-width: 98% !important;}
</style>
<title>${wishlist.name }-에어씨엔씨</title>
</head>
<body>
<%@ include file="../common/nav3.jsp"%>
<div class="container-fluid" style="padding-right: 0px;">
	<div class="row" id="div-main">
		<div class="col-5">
			<div class="mb-4 mt-2 d-flex justify-content-between" id="div-sub">
				<button type="button" class="btn rounded-circle p-0" onclick="javascript:history.back()"><i class="bi bi-arrow-left-short fs-3"></i></button>
				<button type="button" class="btn rounded-circle" data-bs-toggle="modal" data-bs-target="#modal-change-name"><i class="bi bi-three-dots fs-3"></i></button>
			</div>
			<div class="ms-2" >
				<h2 class="fw-bold mb-3">${wishlist.name }</h2>
				<div class="mb-5">
					<button type="button" class="myButton" id="btn-date">날짜</button>
					<form id="form-hidden-conditions" class="d-none">
						<input type="text" name="wishlistNo" value="${wishlist.no}">
						<input type="date" name="startDate" id="hidden-start-date">
						<input type="date" name="endDate" id="hidden-end-date">
						<input type="text" name="guestCount" id="hidden-guest-count"> 
					</form>
					<div class="dropdown" id="dropdown-guest-count">
						<button type="button" class="myButton" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside" id="btn-guest-count">인원</button>
						<div class="dropdown-menu" id="my-dropdown-menu">
							<div class="myDropdown-menu">
								<div class="d-flex justify-content-between mb-3">
									<span style="margin-top: 8px;">성인</span>
									<div class="d-flex align-items-center">
										<button type="button" class="countButton" id="btn-adult-down"><i class="bi bi-dash-circle h3 text-black-50"></i></button>
										<input type="text" name="adultCount" value="1" readonly="readonly" style="text-align:center; width:30px; border:none; font-size:20px;"/>
										<button type="button" class="countButton" id="btn-adult-up"><i class="bi bi-plus-circle h3 text-black-50"></i></button>
									</div>
								</div>
								<div class="d-flex justify-content-between mb-3">
									<div>
										<span>어린이</span><br/>
										<small class="mb-3">만 2~12세</small>
									</div>
									<div class="d-flex align-items-center">
										<button type="button" class="countButton" id="btn-children-down"><i class="bi bi-dash-circle h3 text-black-50"></i></button>
										<input type="text" name="childrenCount" value="0"  readonly="readonly" style="text-align:center; width:30px; border:none; font-size:20px;"/>
										<button type="button" class="countButton" id="btn-children-up"><i class="bi bi-plus-circle h3 text-black-50"></i></button>
									</div>
								</div>
								<div class="d-flex justify-content-between mb-3">
									<div>
										<span>유아</span><br/>
										<small class="mb-3">만 2세 미만</small>
									</div>
									<div class="d-flex align-items-center">
										<button type="button" class="countButton" id="btn-infant-down"><i class="bi bi-dash-circle h3 text-black-50"></i></button>
										<input type="text" name="infantCount" value="0" readonly="readonly" style="text-align:center; width:30px; border:none; font-size:20px;"/>
										<button type="button" class="countButton" id="btn-infant-up"><i class="bi bi-plus-circle h3 text-black-50"></i></button>
									</div>
								</div>
							</div>
							<hr/>
							<div class="d-flex justify-content-between pe-4 mb-4">
								<button class="btn btn-link text-reset fw-bold ms-2" id="btn-reset-all-count">모두 지우기</button>
								<button class="btn btn-dark px-4 py-2 fw-bold" id="btn-change-guest-count">저장</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 위시리스트 폴더에 등록된 숙소가 없는 경우 -->
				<c:if test="${empty wishlist.accs}">
					<h4 class="mb-3">저장된 항목 없음</h4>
					<small>맘에 드는 게 있으면 하트 아이콘을 눌러 저장하세요. 다른 사람과의 여행을 계획하고 있다면 초대하세요. 함께 원하는 항목을 저장하고 투표할 수 있습니다.</small></br>
					<a href="/" class="btn btn-dark btn-lg mt-3 py-3 px-4 fs-6 fw-bold">둘러보기</a>
				</c:if>
				<!-- 위시리스트 폴더에 등록된 숙소가 있는 경우 -->
				
				<div id="tabl1">
					<c:if test="${not empty wishlist.accs}">
						<c:forEach var="acc" items="${wishlist.accs}" varStatus="loop" >
						<a href="/acc/detail?no=${acc.accNo}" style="color: black; text-decoration: none;">
							<div class="card mb-3" data-index="${loop.index}" id="card-${acc.accNo }">
							  <div class="row g-0 position-relative">
							    <div class="col-md-5">
							      <div id="carouselExampleIndicators-${acc.accNo }" class="carousel slide" data-interval="false">
									<!-- 숙소 섬네일 슬라이드쇼 -->
									<div class="carousel-indicators-class">
										<div class="carousel-indicators">
											<button type="button" data-bs-target="#carouselExampleIndicators-${acc.accNo }" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
											<button type="button" data-bs-target="#carouselExampleIndicators-${acc.accNo }" data-bs-slide-to="1" aria-label="Slide 2"></button>
											<button type="button" data-bs-target="#carouselExampleIndicators-${acc.accNo }" data-bs-slide-to="2" aria-label="Slide 3"></button>
											<button type="button" data-bs-target="#carouselExampleIndicators-${acc.accNo }" data-bs-slide-to="3" aria-label="Slide 4"></button>
											<button type="button" data-bs-target="#carouselExampleIndicators-${acc.accNo }" data-bs-slide-to="4" aria-label="Slide 5"></button>
										</div>
									</div>
									<%-- <div id="carousel-inner-${acc.accNo}"> --%>
									<div class="carousel-inner-class">
										<!-- 슬라이드쇼 이미지 -->
										<div class="carousel-inner" >
											<c:forEach items="${acc.photos }" var="photo">
												<c:if test="${photo.num eq 1 }">
											<div class="carousel-item active">
												<img class="w-100" src="/resources/images/acc/${photo.name }" alt="숙소이미지"  style="object-fit: cover; height: 200px;">
											</div>
												</c:if>
											</c:forEach>
											<c:forEach items="${acc.photos }" var="photo">
												<c:if test="${photo.num eq 2 }">
													<div class="carousel-item">
														<img class="w-100" src="/resources/images/acc/${photo.name }" alt="숙소이미지" style="object-fit: cover; height: 200px;">
													</div>
												</c:if>
											</c:forEach>
											<c:forEach items="${acc.photos }" var="photo">
												<c:if test="${photo.num eq 3 }">
													<div class="carousel-item">
														<img class="w-100" src="/resources/images/acc/${photo.name }" alt="숙소이미지" style="object-fit: cover; height: 200px;">
													</div>
												</c:if>
											</c:forEach>
											<c:forEach items="${acc.photos }" var="photo">
												<c:if test="${photo.num eq 4 }">
													<div class="carousel-item">
														<img class="w-100" src="/resources/images/acc/${photo.name }" alt="숙소이미지" style="object-fit: cover; height: 200px;">
													</div>
												</c:if>
											</c:forEach>
											<c:forEach items="${acc.photos }" var="photo">
												<c:if test="${photo.num eq 5 }">
													<div class="carousel-item">
														<img class="w-100" src="/resources/images/acc/${photo.name }" alt="숙소이미지" style="object-fit: cover; height: 200px;">
													</div>
												</c:if>
											</c:forEach>
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
							    <div class="col-md-7">
							      <div class="card-body pt-0 h-100">
							      	<div class="d-flex justify-content-between">
								        <span class="card-text text-muted">${acc.address }</span>
								        <button type="button" class="btn rounded-circle btn-delete-wishlistAcc" data-accNo="${acc.accNo}"><i id="icon-heart-${acc.accNo}" class="fa-solid fa-heart fs-4"></i></button>
							      	</div>
								    <span class="card-title">${acc.name }</span>
							        <p class="card-text text-muted" style="font-size: small;">최대 인원 ${acc.guest}명 • 침실 ${acc.room.bedroom}개 • 침대 ${acc.room.bed}개 • 욕실 ${acc.room.bathroom}개</p>
							        <div class="d-flex justify-content-between"  style="margin-top: 72px;">
						        	  <strong><i class="bi bi-star-fill"></i>${acc.reviewScore}<span class="text-black-50">(후기 ${acc.reviewCount}개)</span></strong>
						        	  <span class="fs-5"><strong>₩<fmt:formatNumber value="${acc.price}"/></strong> /박 </span>
							        </div>
							      </div>
							    </div>
							  </div>
								<hr>
							</div>
							</a>
						</c:forEach>
					</c:if>
					</div>
				</div>
				<div>
			</div>
		</div>
		<div style="position: fixed; left: 42%; padding-left: 0px;">
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
	 		$(this.label.element).find(".fa-ban").removeClass("text-white").addClass("text-dark");
	 	});
	}	
	// 마커 삭제?
	function clearOverlays(accs) {
		let objectName;
		$.each(accs, function(i, acc) {
			objectName = "acc" + acc.accNo
			markers[objectName].setMap(null); // 지도에서 삭제?
			delete markers[objectName];			// 객체에서 해당키값 삭제
		});
	}
	
	// 여기서 jstl 사용가능?
	let firstLatLng;
	let zoom;
	<c:if test="${empty wishlist.accs}">
		firstLatLng = {lat: 37.566610300000164, lng: 126.84449229999989}
		zoom = 8;
	</c:if>
	<c:if test="${not empty wishlist.accs}">
		firstLatLng = {lat: ${wishlist.accs[0].latitude}, lng: ${wishlist.accs[0].longitude}};
		zoom = 14;
	</c:if>
	let map; 
	function initMap() {
		
	    var defaultOptions = {
	        zoom: zoom,
	        center: firstLatLng,
	        disableDefaultUI: false,			// 기본UI 옵션 제거
	        zoomControl: true,				// +/- 버튼
	        options: {
	            gestureHandling: 'greedy' 	// ctrl 없이 확대/축소
	          },
	        pixelRatio: window.devicePixelRatio || 1
	        //mapTypeId: 'terrain'
	        };
	   map = new google.maps.Map(document.getElementById('googleMap'), defaultOptions);
	   createMarker(map, accs);
	   
	}
	
	let accs = new Array();
	let carouselInnerHtmls = new Array();
	let contents;
	let i = 0;
	<c:forEach var="acc" items="${wishlist.accs}">
		accs.push({accNo: ${acc.accNo}, lat: ${acc.latitude}, lng: ${acc.longitude}, name: "${acc.name}", price:${acc.price}, reviewScore:${acc.reviewScore}, reviewCount: ${acc.reviewCount}});
		contents = document.querySelectorAll(".carousel-inner-class")[i].innerHTML;  // helper 파일에서 새로 불러왔을 때도 infowWindow에 남아있도록..
		i += 1;
		carouselInnerHtmls.push(contents);
	</c:forEach>
		
	let markers = {}; // 배열이 아닌 객체로 재생성
	let marker = null;
	function createMarker(map, accs) {
		
		let acc = accs[0];
		
		 $.each(accs, function(index, acc) {
			    //google의 마커를 프로토타입으로 받았기 때문에 google marker의 옵션들도 이용 가능하다
			    let labelContent = '';
			    let priceContent = '';
		        if (acc.disabled) {
			        labelContent = '<div class="labelTest" id="label-' + acc.accNo + '">';
			        labelContent +=  '<i class="fa-solid fa-ban text-dark position-relative">';
			        labelContent +=  '  <i class="bi ban bi-heart-fill position-absolute top-0 start-100 translate-middle badge"></i>';
			        labelContent +=  '</i>';
			        labelContent +='</div>'; //이런식으로 div 추가 가능
		        	priceContent = '<span class="card-text fs-6"><strong><i class="fa-solid fa-ban text-dark"> 예약불가</strong></span>';
		        
		        } else {
			        labelContent =  '<div class="labelTest" id="label-' + acc.accNo + '"> ₩' + acc.price.toLocaleString() +' <i class="bi bi-heart-fill ps-1"></i></div>'; //이런식으로 div 추가 가능
		        	priceContent = '<span class="card-text fs-6"><strong>₩ ' + acc.price.toLocaleString() +  '</strong>/박 </span>';
		        }
		     // console.log("accNo:" + acc.accNo + " disabled: " + acc.disabled);
		        marker = new markerWithLabel.MarkerWithLabel({
			        position: {lat: acc.lat, lng: acc.lng},
			        map: map,
			        icon: ' ',  //마커의 기본 아이콘을 x. 공백을 넣으면 된다.
			        //title: acc.accNo,
			         labelContent:  labelContent, 
			        labelAnchor: new google.maps.Point(-40, -40),  //라벨의 상대적 위치를 지정함(px단위)이며 google map api의 anchor와 같은 개념이다.
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
		  	  	  $(this.label.element).find(".fa-ban").removeClass("text-dark").addClass("text-white");
		  	  	  
		  	  	  
		  	  	      carouselInnerHtml = carouselInnerHtmls[index];
		  	  	  
		  	  	      let infoWindow_content = '<a href="/acc/detail?no=' + acc.accNo + '"  style="text-decoration: none; color: black;">';
		    	      infoWindow_content += '<div class="card" style="width: 16rem;" >';
		    	  	  infoWindow_content += '<div id="carousel-info' + acc.accNo + '" class="carousel slide" data-bs-ride="carousel">';
		    	  	  infoWindow_content +=	'	<div class="carousel-indicators">';
	    	  		  infoWindow_content +=	'		<button type="button" data-bs-target="#carousel-info' + acc.accNo + '" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>';
	    	  		  infoWindow_content +=	'		<button type="button" data-bs-target="#carousel-info' + acc.accNo + '" data-bs-slide-to="1" aria-label="Slide 2"></button>';
	    	  		  infoWindow_content +=	'		<button type="button" data-bs-target="#carousel-info' + acc.accNo + '" data-bs-slide-to="2" aria-label="Slide 3"></button>';
	    	  		  infoWindow_content +=	'		<button type="button" data-bs-target="#carousel-info' + acc.accNo + '" data-bs-slide-to="3" aria-label="Slide 4"></button>';
	    	  		  infoWindow_content +=	'		<button type="button" data-bs-target="#carousel-info' + acc.accNo + '" data-bs-slide-to="4" aria-label="Slide 5"></button>';
	    	  		  infoWindow_content +=	'	</div>';
		    	  	  infoWindow_content +=	'	<div class="wishlist-icon">';
		    	  	  infoWindow_content +=	'     <span class="btn-delete-wishlistAcc" data-accNo="' + acc.accNo + '" style="position:absolute; top:10px; right:15px; z-index:2; padding:0px;">';
		    	  	  infoWindow_content += '       <i class="bi bi-suit-heart-fill" id="map-icon-heart-' + acc.accNo + '" style="font-size: x-large;"></i>';
		    	  	  infoWindow_content += '     </span>';
		    	  	  infoWindow_content += '   </div>';
		    	  	  infoWindow_content += carouselInnerHtml;
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
		    		  infoWindow_content += 	'<div class="card-body d-flex flex-column d-grid gap-1">';
	    			  infoWindow_content += 		'<span class="card-text"><i class="bi bi-star-fill"></i>' + acc.reviewScore + '(' + acc.reviewCount + ')</span>';
	    			  infoWindow_content += 		'<span class="card-text fs-6">' + acc.name + '</span>';
	    			  infoWindow_content +=  		priceContent;
	    			  infoWindow_content += 	'</div>';
	    			  infoWindow_content += '</div>';
	    			  infoWindow_content += '</a>';
			    	
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
			     // markers.push(marker);
			      markers["acc" + acc.accNo] = marker; // markers 객체에 "acc" + acc.accNo 키이름으로 marker 추가
		    })
		    return markers;
	}
	

	
	
$(function () {
	
	
	 $("#div-map").on('scroll touchmove mousewheel', function(e){
		e.preventDefault();
		e.stopPropagation(); 
		return false;
		});
	 
	 $("#tabl1").on("mouseenter", '.card', function() {			// 미래이벤트
		let accNo = $(this).attr("id").replace("card-", ""); 	
	 	//let index = $(this).data("index");
	 	//let marker = markers[index];
	 	//marker = markers[index];
	 	marker = markers["acc" + accNo];
	 	
	 	$(marker.label.element).addClass('bg-black');
	  	$(marker.label.element).css({"color":"white", "transform":"scale(1.2)", "z-index":"1"});
	  	$(marker.label.element).find(".fa-ban").removeClass("text-dark").addClass("text-white");
	  	
	 	//google.maps.event.trigger(marker, 'mouseover');
	 })
	 $("#tabl1").on("mouseleave", '.card', function() {
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
	 
	 let saveToListModal = new bootstrap.Modal(document.getElementById('modal-save-to-list'), {
		  keyboard: false
		})
	 
	 // wishlist 숙소 하트 아이콘 클릭시 발생(미래이벤트로 변경)
	 $("body").on("click", '.btn-delete-wishlistAcc', function() {
		 let accNo = $(this).attr("data-accNo");
		 $heartIcon = $("#icon-heart-" + accNo);
		 $mapHeartIcon = $("#map-icon-heart-" + accNo);
		 
		 if($heartIcon.hasClass("fa-solid") || $mapHeartIcon.hasClass("bi-suit-heart-fill")) {
			 // 위시리스트에서 숙소 삭제 구현하기
			 $.getJSON("/wishlists/delete/acc", "wishlistNo=" + ${wishlist.no} + "&accNo=" + accNo)
			 $heartIcon.removeClass("fa-solid").addClass("fa-regular").css("color", "black");
			 $mapHeartIcon.removeClass("bi-suit-heart-fill").addClass("bi-suit-heart").css("color", "black");
			 // 라벨에서 하트 없애기 구현하기
		 } else {
			 // 다시 추가
			 saveToListModal.show();
			 // 1.다른 위시리스트 폴더로 이동할 경우  2.위시리스트 폴더를 새로 만들어서 숙소를 저장할 경우
			 $("#form-create-wishlist input[name=accNo]").val(accNo); // 여기서 주는 것이 맞나?
		 }
		 
		 return false;
		 });
	 
	 
	 
	 
	 
	 let createListModal = new bootstrap.Modal(document.getElementById('modal-create-wishlist'), {
		  keyboard: false
		})
	 
	 // 위시리스트 폴더리스트 모달창에서 "새로운 위시리스트 만들기" 누를 경우
	 $("#div-create-wishlist").click(function() {
		 saveToListModal.hide();
		 createListModal.show();
		 $(":input[name=wishlistName]").val('');
	 });
	 
	 // 새로운 위시리스트 폴더 만들기
	 $(":input[name=wishlistName]").keyup(function() {
	 	if($(this).val().trim()) {
	 		$("#btn-create-wishlist").prop("disabled", false);
	 	} else {
	 		$("#btn-create-wishlist").prop("disabled", true);
	 	}
	 });
	 
	 // 빈하트 다시 클릭 -> 위시리스트 폴더 이름 생성 -> 새로 만들기 버튼
	 // 1. 새로운 이름의 위시리스트 생성
	 // 2. 빈하트를 눌렀던 숙소는 다시 위시리스트 안에 생성되고 채워진 하트로 변경
	 // 08-19 : 에어비앤비 페이지와 다르게 새로운 위시리스트 폴더로 리다이렉트로 변경
/*	 $("#btn-create-wishlist").click(function() {
		 let accNo = $(":input[name=accNo]").val();
		 $("#icon-heart-" + accNo ).removeClass("fa-regular").addClass("fa-solid").css("color", "#FF385C");
		 let querystring = $("#form-create-wishlist").serialize();
		 
			$.post("/wishlists/insert", querystring, function(result) {
				wishlists = result.wishlists;
				let content = '';
				$.each(wishlists, function() {
					content += '<div class="mt-3" style="display: flex; height: 64px;">';
					content += '  <input type="hidden" name="wishlistNo" value="' + this.no + '">';
					content += '  <img src="https://a0.muscache.com/im/pictures/da1a2f06-efb0-4079-abce-0f6fc82089e0.jpg" alt="" style="vertical-align:middle;">';
					content += '  <span class="ms-3 fw-bold" style="margin-top:20px;">' + this.name + '</span>';
					content += '</div>';
				});
				
				$("#div-wishlists").html(content);
			})
			createListModal.hide();	
			//saveToListModal.show();      
			
	 });  */
	 
	 
	$("#div-wishlists").on('click', "div", function() {
		let accNo = $(":input[name=accNo]").val();
		// 아래의 wishlistNo는 변경할 위시리스트 폴더 번호
		let wishlistNo = $(this).find('input[name="wishlistNo"]').val();
		//alert("accNo: " + accNo + " wishlistNo: " + wishlistNo); 
		$.getJSON("/wishlists/change", "wishlistNo=" + wishlistNo + "&accNo=" + accNo , function() {
		})
		createListModal.hide();
		location.reload();
	})
	
	// 현재 위시리스트 폴더 이름 변경
	 $(":input[name=changedName]").keyup(function() {
		 if($(this).val().trim()) {
		 		$("#btn-change-wishlist-name").prop("disabled", false);
		 	} else {
		 		$("#btn-change-wishlist-name").prop("disabled", true);
		 	}
	 });
	
	// 현재 위시리스트 폴더 이름 변경 버튼
	/* $("#btn-change-wishlist-name").click(function() {
		let changedName = $(":input[name=changedName]").val();
		
		 let querystring = $("#form-change-name").serialize();
		$.post("wishlists/update/wishlist", data, function(data, textStatus, req) {
			
		}) 
		
		
	}); */
	
	// 달력 test
	$('#btn-date').daterangepicker({
		
    "locale": {
        "format": "YYYY-MM-DD",
        "separator": " ~ ",
        "applyLabel": "저장",
        "cancelLabel": "모두 지우기",
        "fromLabel": "From",
        "toLabel": "To",
        "customRangeLabel": "Custom",
        "weekLabel": "W",
        "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
    },
    alwaysShowCalendars: true,
    startDate: new Date(),
    endDate: new Date(),
    minDate: new Date(), 	// 지난 날짜 disable하기
    drops: "auto"
    
}, function (start, end, label) {
    console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
    $("#btn-date").text(start.format('M월D일') + '~' + end.format('M월D일'));
    $("#hidden-start-date").val(start.format('YYYY-MM-DD'));
    $("#hidden-end-date").val(end.format('YYYY-MM-DD'));
    refreshWithConditions();
});
	
	
	
	
	
	 /* let myDropdown = new bootstrap.Dropdown(document.getElementById('dropdown-guest-count'),{
	  popperConfig: function (defaultBsPopperConfig) {
	    var newPopperConfig = {autoClose:"outside"}
	    return newPopperConfig
	  }
	}) */
	 /*
	$("#test").click(function() {
		myDropdown.show();
	}) */
	
	// data-bs-auto-close="outside" 속성은 data-bs-toggle="dropdown"이 있는 버튼 속성으로 같이 설정한다.
	
	let $inputAdultCount = $(":input[name=adultCount]");
	let $inputChildrenCount = $(":input[name=childrenCount]")
	let $inputInfantCount = $(":input[name=infantCount]");
	// 인원 드롭다운
	var myDropdownEl = document.getElementById('dropdown-guest-count')
	myDropdownEl.addEventListener('show.bs.dropdown', function (event) {
		let adultCount = parseInt($inputAdultCount.val());
		if(adultCount <= 1) {
			$inputAdultCount.val("1");
		}
	})
	// 사칙연산 + 는 자동변환안됨.
	 
	$("#btn-adult-down").click(function() {
		let adultCount = $inputAdultCount.val();
		if(adultCount <= 1) {
			$(this).css("cursor", "not-allowed");
			return false;
		} else {
			$inputAdultCount.val(adultCount - 1);
			return false;
		}
	});
	
	$("#btn-adult-up").click(function() {
		let adultCount = parseInt($inputAdultCount.val());
		if(adultCount >= 16) {
			$(this).css("cursor", "not-allowed");
			return false;
		}		
		//console.log(adultCount);
		$inputAdultCount.val(adultCount + 1);
		return false;
	});
	
	$("#btn-children-down").click(function() {
		let childrenCount =  $inputChildrenCount.val();
		if(childrenCount <= 0) {
			$(this).css("cursor", "not-allowed");
			return false;
		} else {
			$inputChildrenCount.val(childrenCount - 1);
			return false;
		}
	});
	$("#btn-children-up").click(function() {
		let childrenCount = parseInt($inputChildrenCount.val());
		if(childrenCount >= 15) {
			$(this).css("cursor", "not-allowed");
			return false;
		}	
		$inputChildrenCount.val(childrenCount + 1);
		return false;
	});
	
	$("#btn-infant-down").click(function() {
		let infantCount =  $inputInfantCount.val();
		if(infantCount <= 0) {
			$(this).css("cursor", "not-allowed");
			return false;
		} else {
			$inputInfantCount.val(infantCount - 1);
			return false;
		}
	});
	$("#btn-infant-up").click(function() {
		let infantCount = parseInt($inputInfantCount.val());
		if(infantCount >= 5) {
			$(this).css("cursor", "not-allowed");
			return false;
		}	
		$inputInfantCount.val(infantCount + 1);
		return false;
	});
	
	$("#btn-reset-all-count").click(function() {
		$inputAdultCount.val(1);
		$inputChildrenCount.val(0);
		$inputInfantCount.val(0);
		return false;
	});
	
	$("#btn-change-guest-count").click(function() {
		let totalGuestCount = parseInt($inputAdultCount.val()) + parseInt($inputChildrenCount.val());
		$("#btn-guest-count").text("인원 " + totalGuestCount + "명");
		$("#hidden-guest-count").val(totalGuestCount);
		$("h2").click();
		refreshWithConditions();
	});

///////// 날짜 or 인원 검색
	/* function refreshWithConditions() {
		let startDate = $("#hidden-start-date").val();
		let endDate = $("#hidden-end-date").val();
		
		let totalGuestCount = parseInt($inputAdultCount.val()) + parseInt($inputChildrenCount.val());
		
		let queryString = $("#form-hidden-conditions").serialize();
		
		$.getJSON("/wishlists/detail/refresh", queryString)
		 .done(function(result) {
			 var html = jQuery('<div>').html(result);
				var contents = html.find("div#indexListAjax").html();
					$("#tabl1").html(contents);
		})
	} */
	// jsp 우회해서 사용하기 ? 1.마커도 반영해야..  2. get방식도 가능?
	function refreshWithConditions() {
		
		var formData = new FormData(document.getElementById("form-hidden-conditions")); //formData 객체 생성
		//formData.append("tab", tab);
		$.ajax({
			url : "/wishlists/detail/refresh",
			type : "post",
			dataType : "text",
			data : formData,
			contentType: false,
		    processData: false,
			cache : false
	    }).done(function(result) {
			/*
				1. result는 JSP의 실행결과로 생성된 HTML 컨텐츠다.
				2. div 태그를 생성하고 $("<div>"), 그 div 태그에 응답으로 받은 HTML 컨텐츠를 담는다. 
				3. $div에서 이 div#indexListAjax 선택자에 해당하는 엘리먼트에 포함된 HTML 컨텐츠를 조회한다.
				4. tabl1에 조회한 htm 컨텐츠를 반영한다.
			*/
	     	var $div = $('<div>').html(result);    // 동적태그생성
			var contents = $div.find("div#indexListAjax").html();
			//console.log(contents);
			$("#tabl1").html("");
			$("#tabl1").html(contents);
			
			let availableAccNos = new Array();		// 예약가능한 숙소 번호 배열
			$("#tabl1").find("div.availableCard").each(function() {
				availableAccNos.push(parseInt($(this).attr("id").replace("card-", "")));
			});
			console.log("가능한번호: " + availableAccNos);
			$.each(accs, function(i, acc) {
				if(availableAccNos.indexOf(acc.accNo) >= 0) {	
					acc.disabled = false;						// 예약가능한 숙소번호배열에 위시리스트의 숙소번호가 있는 경우
				} else {			
					acc.disabled = true;						// 예약가능한 숙소번호배열에 위시리스트의 숙소번호가 없는 경우
				}
				console.log("accNo: " + acc.accNo + " disabled: " + acc.disabled );
			});
			
			// 기존 마커지우기
			clearOverlays(accs);
			initMap();
			
			
			/* $("#tabl1").find("div.card").each(function() {
				let accNo = parseInt($(this).attr("id").replace("card-", "")); // 해당 날짜와 인원수 예약가능한 숙소번호
				let index = accs.findIndex(function(acc) {
					return acc.accNo === accNo;  // accs의 배열의 요소에서 accNo 속성의 값이 우변의 accNo인 배열 요소의 인덱스를 반환한다.
				});
				if(index >= 0) {
					accs[index].disabled = false;
				} 
			})
			
			$.each(accs, function(index, acc) {
				if(!acc.hasOwnProperty('disabled')) {
					acc.disabled = true;
				}
			}) */
			
		}).fail(function (jqXHR, textStatus, errorThrown) {
			console.log("에러");
			console.log(jqXHR);
			console.log(textStatus);
			console.log(errorThrown);
		});
	}
	
	/* $(window).on('popstate', function() {
		location.href = "/wishlists";
	})  */
	
	// 캐러셀 자동슬라이드 막기
	$('.carousel').carousel({
		  interval: false,
		});
	
});
</script>

<!-- 모달 전용 -->
<script type="text/javascript">
$(function () {
	
	var modalChangeName = new bootstrap.Modal(document.getElementById('modal-change-name'));
	var modalDeleteWishlist = new bootstrap.Modal(document.getElementById('modal-delete-wishlist'));
	
	$("#a-delete-wishlist").click(function(e) {
		e.stopPropagation();
		modalChangeName.hide();
		modalDeleteWishlist.show();
	});
	
})
	
</script>
<!-- 위시리스트 폴더 이름 변경 모달 -->
<div class="modal" id="modal-change-name" tabindex="-1">
	  <div class="modal-dialog modal-dialog-centered" style="width: 400px; height: 172px;">
	    <div class="modal-content">
	      <div class="modal-header w-100 d-flex justify-content-between">
      		<div>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="vertical-align: middle;"></button>
      		</div>
      		<div>
		        <span class="modal-title fw-bold">설정</span>
      		</div>
      		<div>
		        <a href="#" id="a-delete-wishlist" class="text-dark fw-bold">삭제</a>
      		</div>
	      </div>
		  <form id="form-change-name" method="post" action="/wishlists/update/wishlist">
		      <div class="modal-body py-5 px-4">
			        <div class="form-floating">
			      		<input type="hidden" name="wishlistNo" value="${wishlist.no }">
				     	<input type="text" class="form-control" name="changedName" value="${wishlist.name}" placeholder="위시리스트이름">
				     	<label for="floatingInput">위시리스트 이름</label>
				     	<small>최대 50자</small>
					</div>
		      </div>
		      <div class="modal-footer d-flex justify-content-between">
		        <button type="button" class="btn btn-link text-reset fw-bold fs-6" data-bs-dismiss="modal" aria-label="Close">취소</button>
		        <button type="submit" class="btn btn-dark" id="btn-change-wishlist-name">저장</button>
		      </div>
		  </form>
	    </div>
	  </div>
</div>

<div class="modal" id="modal-delete-wishlist" tabindex="-1">
	  <div class="modal-dialog modal-dialog-centered" style="width: 400px; height: 172px;">
	    <div class="modal-content">
	      <div class="modal-header">
	      	<button type="button" class="btn-close" data-bs-toggle="modal" data-bs-target="#modal-change-name"></button>
	      	<span class="modal-title fw-bold w-100 text-center">위시리스트 삭제하기</span>
	      </div>
	      <div class="modal-body">
	      	<span class="m-3">${wishlist.name}(을)를 정말로 삭제하시겠어요?</span>
	      </div>
          <div class="modal-footer d-flex justify-content-between">
          	<button type="button" class="btn btn-link text-reset fw-bold fs-6" data-bs-toggle="modal" data-bs-target="#modal-change-name">취소</button>
	        <a href="/wishlists/delete?no=${wishlist.no}" class="btn btn-dark">삭제하기</a>
          </div>
	    </div>
	  </div>
</div>



<!-- 빈하트 클릭시 나타나는 Modal -->
<div class="modal fade" id="modal-save-to-list" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h5 class="modal-title fw-bold w-100 text-center">위시리스트</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div  id="div-create-wishlist" style="display: flex; height: 64px; cursor: pointer;">
      		<img src="https://a0.muscache.com/im/pictures/da1a2f06-efb0-4079-abce-0f6fc82089e0.jpg" alt="새로운 위시리스트 만들기" style="vertical-align:middle;">
      		<span class="ms-3 fw-bold" style="margin-top:20px;">새로운 위시리스트 만들기</span>
      	</div>
      	<div id="div-wishlists">
	      	<c:if test="${not empty wishlists }">
	      		<c:forEach var="wishlist" items="${wishlists}">
			      	<div id="div-wishlist-${wishlist.no}" class="mt-3" style="display: flex; height: 64px; cursor: pointer;">
		      			<input type="hidden" name="wishlistNo" value="${wishlist.no}">
		      			<c:choose>
		      			 <c:when test="${not empty wishlist.accs[0]}">
				      		<img src="/resources/images/acc/${wishlist.accs[0].imageCover}" alt="imageCover" style="vertical-align:middle; border-radius: 8px;" width="63px">
		      			 </c:when>
		      			 <c:otherwise>
		      			 	<img alt="" src="" alt="imageCover" style="vertical-align:middle; border-radius: 8px; background-color: #DDDDDD;" width="63px" >
		      			 </c:otherwise>
		      			</c:choose>
			      		<span class="ms-3 fw-bold" style="margin-top:20px;">${wishlist.name }</span>
			      	</div>
	      		</c:forEach>
	      	</c:if>
      	</div>
      </div>
    </div>
  </div>
</div>

<!-- 새로운 위시리스트 만들기 클릭시 나타나는 Modal -->
<div class="modal fade" id="modal-create-wishlist" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title fw-bold w-100 text-center fs-6">위시리스트 이름 정하기</h5>
        <button type="button" class="btn-close" data-bs-toggle="modal" data-bs-target="#modal-save-to-list"></button>
      </div>
      <form id="form-create-wishlist" method="post" action="/wishlists/insert">
      <div class="modal-body mb-4">
	      	<div class="form-floating">
	      		<input type="hidden" name="accNo">
		     	<input type="text" class="form-control" name="wishlistName" placeholder="이름">
		     	<label for="floatingInput">이름</label>
			</div>
			<small>최대 50자</small>
      </div>
      <div class="modal-footer">
        <div class="d-grid gap-2 w-100">
		  <button class="btn btn-dark fw-bold btn-lg fs-6" type="submit" id="btn-create-wishlist" disabled>새로 만들기</button>
		</div>
      </div>
      </form>
    </div>
  </div>
</div>


<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAFv4fJk64OcpfSgmByfKOlwHndkuSa0kk&callback=initMap&region=kr"></script>
</body>
</html>