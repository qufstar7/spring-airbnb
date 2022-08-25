<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/cbcad42a26.js" crossorigin="anonymous"></script>
<link rel="icon" href="../../../resources/aircnc.png">
<title>${user.name}님의 프로필 -에어씨앤씨</title>
<style type="text/css">
	/* .col-3 * {text-align: left;		} */
	
	.pop:hover { text-decoration: underline;
				}
	#div-language div{
				display: inline-block;
				border: 1px solid;	
				border-radius:30px;
				padding: 10px;
					}
	#div-language span {
				font-size: large;
				padding: 10px 20px;		
				}	 
	.userImg {
 			width: 55px;
			height: 55px;  		
			border-radius: 100%;	
   	}
	.rectangleImg {
			width: 90px;
			height: 55px;
			overflow: hidden;
			border-radius: 20%;
	}
</style>
</head>
<body>
<%@ include file="../common/nav3.jsp" %>
	<div class="container">
	<div class="p-5">
		<div class="row">
			<div class="col-4">
				<div class="border rounded-3 p-4">
					<div class=" text-center mb-2">
						<img class="rounded-circle" src="/resources/images/profile/${not empty user.profileImage ? user.profileImage : 'profile-default-img.png'}" alt="프로필사진" width="180">
					</div>
					<div class="text-center mb-5">
						<button type="button" class="btn btn-link fw-bold fs-6" data-bs-toggle="modal" data-bs-target="#modal-change-profileImg" style="color: black;">사진 업데이트하기</button>
					</div>
					<div class="mb-2 fs-4">
						<i class="bi bi-star fw-bold"></i>
						<span class="pop fw-bold fs-6" id="pop-review" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="bottom">후기 ${user.reviewCount}개</span>
					</div>
					<div class="mb-4 fs-4">
						<i class="bi bi-shield-check fw-bold"></i>
						<span class="pop fw-bold fs-6" id="pop-certification" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="bottom">본인 인증 완료</span>
					</div>
					<hr style="opacity: 0.2;" />
					<div class="my-4">
						<h3 class="fs-4 fw-bold">${user.name} 인증 완료</h3>
					</div>
					<div class="d-flex justify-content-start mb-3 fs-5">
						<i class="bi bi-check-lg fw-bold"></i>
						<span class="ms-3 fs-6">신분증</span>
					</div>
					<div class="d-flex justify-content-start  mb-3  fs-5">	
						<i class="bi bi-check-lg fw-bold"></i>
						<span class="ms-3 fs-6">이메일 주소</span>
					</div>
					<div class="d-flex justify-content-start mb-3  fs-5">
						<i class="bi bi-check-lg fw-bold"></i>
						<span class="ms-3 fs-6">전화번호</span>
					</div>
					<div>
						<p>계정 정보 인증을 통해 더욱 안전한 에어비앤비 커뮤니티를 만들 수 있는 방법에 대해 자세히 알아보세요.</p>
					</div>
				</div>
			</div>
			<div class="col ms-5 ps-5">
				<h2 class="fw-bold">안녕하세요. 저는 ${user.name}입니다.</h2>
				<p>회원가입: <fmt:formatDate value="${user.createdDate }" pattern="yyyy"/> </p>
				<button class="btn btn-link text-dark fw-bold fs-6 p-0" id="btn-change-profile">프로필 수정하기</button>
				<div class="mt-5" id="div-profile">
					<h3 class="fw-bold mb-4">소개</h3>
					<p class="fs-5 mb-4" id="p-description">${user.description}</p>
					<div class="d-flex justify-content-start mb-3 fs-5">
						<i class="bi bi-house-door-fill"></i>
						<span class="ms-2">거주지: <span id="span-address">${not empty user.address ? user.address : "주소를 설정해주세요."}</span></span>
					</div>
					<div class="d-flex justify-content-start mb-3 fs-5">
						<i class="bi bi-calendar-heart"></i><!-- Date 형식을 다시 String 으로 -->
						<span class="ms-2">생일:  <span id="span-birthday"><fmt:formatDate value="${user.birthDate}" pattern="yyyy.MM.dd"/></span></span>
					</div>
				</div>
				<!-- 프로필 수정하기 -->
				<div class="mt-5 d-none" id="div-update-profile">
					<form id="form-profile" method="post" action="/user/update" enctype="multipart/form-data">
						<label for="textarea-description" class="form-label fs-5">소개</label>
						<textarea class="form-control mb-5 fs-5" name="description" rows="4" id="textarea-description">${user.description}</textarea>
						<label for="input-location" class="form-label fs-5">위치</label>
						<input type="text" class="form-control mb-5 p-2 fs-5" name="address" id="input-address" value="${user.address }" />
						<label for="language" class="form-label fs-5 mb-3">생일</label>
						<input type="date" class="form-control mb-5 p-2 fs-5" name="birthDate" id="input-birthday" value="<fmt:formatDate value="${user.birthDate}" pattern="yyyy-MM-dd"/>" />
						
						
						<div class="d-flex justify-content-between mt-5">
							<button type="button" class="btn btn-link text-reset fs-5 fw-bold" id="btn-cancel">취소</button>
							<button type="submit" class="btn btn-dark btn-lg px-4" id="btn-update-profile">저장</button>
						</div>
					</form>	
				</div>
				<hr class="mt-4"/>
				
				<!-- 후기 탭 -->
				<div id="box-review-tab-all">
					<div class="d-flex justify-content-start fs-5 mt-5 mb-4" id="tab-review-count">
					</div>	
					
					<!-- 탭 버튼 -->			
					<ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
					</ul>
					
					<!-- 탭 리뷰 컨텐츠 -->
					<!-- 게스트가 남긴 리뷰 시작 -->
					<div class="tab-content" id="myTabContent">
					    <div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="tab-leave-guest">
							<div class="mb-5" id="box-review-guest">
							</div>				    			    
					    </div>
					    
				 	<!-- 호스트가 남긴 후기 시작 -->
					    <div class="tab-pane " id="profile" role="tabpanel" aria-labelledby="tab-leave-host">
							<div class="mb-5" id="box-review-host">
							</div>
						</div>
					</div>
					<!-- box-review-tab-all 끝 (후기 끝) -->
				</div>
				
				<!-- user가 guest일 때 사용하는 것 -->
				<div class="mb-5" id="guestbox-review-host" >
				</div>
			</div>
		</div>
	</div>
	</div>
	
	
<!-- 프로필사진 변경 모달. airbnb는 페이지전환이 되지만 모달로 대체-->
<!-- Modal -->
<div class="modal fade" id="modal-change-profileImg" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title  fw-bold w-100 text-center"">프로필 사진 변경하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center p-5">
        <h4>프로필 사진</h4>
        <div>
	        <p>얼굴이 나온 프로필 사진을 통해서 다른 호스트와 게스트에게 나를 알릴 수 있습니다. 
	        모든 에어비앤비 호스트는 프로필 사진이 있어야 합니다. 
	        에어비앤비는 게스트에게 프로필 사진을 요청하지 않지만, 호스트는 요청할 수 있습니다. 
	        호스트가 게스트에게 사진을 요청하는 경우에도, 예약이 확정된 후에만 사진을 볼 수 있습니다.
	        </p>
        </div>
        <form id="form-profileImg" action="/user/update" method="post" enctype="multipart/form-data" >
	        <div>
	        <c:choose>
	        	<c:when test="${not empty user.profileImage}">
			        <img class="rounded-circle" src="/resources/images/profile/${user.profileImage}" width="180">
	        	</c:when>
	        	<c:otherwise>
	        		<img class="rounded-circle" src="/resources/images/profile/profile-default-img.png" width="180">
	        	</c:otherwise>
	        </c:choose>
	        
	        
	        </div>
	        <div class="d-grid gap-2 my-4">
	        	<input type="file" name="profileImg" id="input-change-profileImg" class="d-none" accept="image/gif, image/jpeg, image/png" />
	        	<button type="button" class="btn btn-dark p-3 fs-5 fw-bold" id="btn-change-profileImg"><i class="bi bi-person-bounding-box"></i> 사진 변경하기</button>
	        </div>
        </form>
        <div>
        	<button type="button" class="btn btn-link text-reset fw-bold fs-5" data-bs-dismiss="modal" aria-label="Close">나중에 할게요</button>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$(function () {
	
	// 문서의 모든 팝오버를 활성화
	  $('[data-toggle="popover"]').popover();
	
	$("#pop-review").popover({
		html : true,
		content : function () {
			return '후기를 통해 Youna님에 대해 더 알아보세요. 후기는 실제 숙박이 이뤄진 예약의 게스트나 호스트만 작성할 수 있습니다. <a href="">후기보기</a>';
		}
	});
	
	$("#pop-certification").popover({
		html : true,
		content : function () {
			return 'Youna님은 본인 인증에 필요한 정보를 제출하셨습니다. <a href="">이용 방법</a>';
		}
	})
	
	// 프로필 사진 수정 버튼 연결
	$("#btn-change-profileImg").click(function() {
		// hidden된 input 필드 클릭
		$("#input-change-profileImg").click();
	});
	// input필드의 값이 변경될 때마다
	$("#input-change-profileImg").change(function() {
		$("#form-profileImg").submit();
	});
	
	$("#btn-change-profile").click(function() {
		$("#div-update-profile").removeClass("d-none");
		//$(this).addClass("disabled");
		//$(this).css({"cursor":"not-allowed", "color": "rgb(221, 221, 221)"});
		$(this).css("cursor","not-allowed").addClass("text-opacity-25");
		$("#div-profile").addClass("d-none");
	});
	
	$("#btn-cancel").click(function() {
		$("#div-update-profile").addClass("d-none");
		//$("#btn-change-profile").removeClass("disabled");  
		$("#btn-change-profile").css("cursor", "pointer").removeClass("text-opacity-25");
		
		$("#div-profile").removeClass("d-none");
	});
	

// 경우의 수
// 1. 받은 리뷰 0개
// 2. 받은 리뷰 : 호스트에게만 받음 (ites)
// 3. 받은 리뷰 : 게스트에게만 받음 ()
// 4. 받은 리뷰 : 게스트와 호스트 둘 다에게 받음
	// 유저의 리뷰 리스트를 불러온다.

	let $allTabBox = $("#box-review-tab-all");		// 전체 탭박스이다. 1번일 경우 다른 컨텐츠는 존재하지 않으며, 텍스트 링크만 존재한다.
	let $myTabContent = $("#myTabContent");			// 전체 탭내용 박스이다. 3 4일 때 존재한다.
	let $myTab = $("#myTab");						// tab 버튼이다. 1번 2번이라면 hide한다.
	let $reviewCount = $("#tab-review-count");		// 리뷰 갯수이다.
	let $hostReviewBox = $("#box-review-host");				// 호스트가 적은 리뷰이다. (host, tab)
	let $guestReviewBox = $("#box-review-guest");			// 게스트가 적은 리뷰이다. (host, tab)
	let $guestBoxReviewBox = $("#guestbox-review-host");	// 호스트가 적은 리뷰이다. (guest, div)

	$.ajax({
		type: 'GET',							// HTTP 요청 방식			// 참고 : [{}]는 배열 형태의 데이터를 받는다. 
		url: "../review/profile",				// 요청 URL
		dataType: 'json',						// 서버로부터 받을 것으로 예상되는 응답메세지의 컨텐츠 타입
		success: function(data) {	
			let item = data.item;
			if (item.userType === 'Y') {	// host
				let guestReviews = item.guestReviews;
				let hostReviews = item.hostReviews;
				
				// 호스트이며, 게스트/호스트에게 받은 후기가 없다.
				if (guestReviews.length == 0 && hostReviews.length == 0) {
					$myTab.hide();
					
					let empty1 = '';
					empty1 += '<h4 class="fw-bold mb-3 ms-2">후기 '+ (guestReviews.length + hostReviews.length) +'개</h4>';
					empty1 += '<a href="https://localhost/user/sentReview" class="text-dark fw-bold p-0 mt-1 ms-2">(내가 작성한 후기)</a>';
					
					$allTabBox.html(empty1);
					return;
				}
				
				// 후기 n개 부분
				let reviewCount1 = '';
					reviewCount1 += '<div class="d-flex justify-content-start fs-5 mt-5 mb-4" id="tab-review-count">';
					reviewCount1 += '	<i class="bi bi-star-fill"></i>';
					reviewCount1 += '	<h4 class="fw-bold mb-3 ms-2">후기 '+ (guestReviews.length + hostReviews.length) +'개</h4>';
					reviewCount1 += '	<a href="https://localhost/user/sentReview" class="text-dark fw-bold fs-6 p-0 mt-1 ms-2">(내가 작성한 후기)</a>';
					reviewCount1 += '</div>';
				
				$reviewCount.html(reviewCount1);
				
				// 호스트의 tab title 부분
				let tabTitle = '';
					tabTitle += '<li class="nav-item" role="presentation">';
					tabTitle += '	<button class="nav-link active" id="btn-review-guest" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">게스트가 남긴 후기('+guestReviews.length+'개)</button>';
					tabTitle += '</li>';
					tabTitle += '<li class="nav-item" role="presentation">';
					tabTitle += '	<button class="nav-link" id="btn-review-host" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">호스트의 후기('+hostReviews.length+'개)</button>';
					tabTitle += '</li>';
					
				$myTab.html(tabTitle);
				
				// 호스트이며, 게스트 / 호스트에게 받은 후기가 하나라도 있다.
				$.each(guestReviews, function(index, review) {

					if (review.deleted == 'Y') {
						let guestReview = '';
						guestReview += '<div class="boxReviewContent">';
						guestReview += '	<p class="reviewContent mb-0">'+ (review.content) +'</p>';
						guestReview += '</div>';
					} else {
						let guestReview = '';
						guestReview += '<div class="row">';
						guestReview += '	<div class="col-10">';
						guestReview += '		<h5><a class="text-dark fw-bold p-0 mt-1" href="../acc/detail?no='+ (review.accommodation.accNo) +'">'+(review.accommodation.name)+'</a></h5>';
						guestReview += '		<p class="text-muted">'+ (review.createdDate) +'</p>';
						guestReview += '	</div>';
						guestReview += '	<div class="col-2">';
						guestReview += '		<a href="../acc/detail?no='+ (review.accommodation.accNo) +'">';
						guestReview += '			<img src="/resources/images/acc/'+ (review.accommodation.imageCover) +'" class="rectangleImg mb-3">';
						guestReview += '		</a>';
						guestReview += '	</div>';
						guestReview += '</div>';
						guestReview += '<div class="boxReviewContent">';
						guestReview += '	<p class="reviewContent mb-0">'+ (review.content) +'</p>';
						guestReview += '</div>';
						guestReview += '<div class="row mt-3 mb-5">';
						guestReview += '	<div class="col-1">';
						guestReview += '		<a href="#">';
						guestReview += '			<img src="/resources/images/profile/'+ (review.user.profileImage ? review.user.profileImage : "profile-default-img.png") +'" class="userImg mb-3">'; 
						guestReview += '		</a>';
						guestReview += '	</div>';
						guestReview += '	<div class="col">';
						guestReview += '		<p class="mb-0 ps-3"><strong>'+ (review.user.name) +'님, '+ (review.user.address ? review.user.address : "") +'</strong></p>';
						guestReview += '		<span class="mb-0 ps-3 text-muted">회원가입: </span><span class="text-muted">'+ (review.user.createdDate) +'</span>';
						guestReview += '	</div>';
						guestReview += '</div>';
	
						$guestReviewBox.append(guestReview);
					}
				})
				
				
				$.each(hostReviews, function(index, review) {
					
					if (review.deleted == 'Y') {
						let guestReview = '';
						guestReview += '<div class="boxReviewContent">';
						guestReview += '	<p class="reviewContent mb-0">'+ (review.content) +'</p>';
						guestReview += '</div>';
					} else {
						let hostReview = '';
						hostReview += '<div class="boxReviewContent">';
						hostReview += '		<p class="text-muted">'+ (review.createdDate) +'</p>';
						hostReview += '		<p class="reviewContent mb-0">'+ (review.content) +'</p>';
						hostReview += '</div>';
						hostReview += '<div class="row">';
						hostReview += '		<div class="col-1">';
						hostReview += '			<a href="#">';
						hostReview += '				<img src="/resources/images/profile/'+ (review.user.profileImage ? review.user.profileImage : "profile-default-img.png") +'" class="userImg mb-3">';
						hostReview += '			</a>';
						hostReview += '		</div>';
						hostReview += '		<div class="col  mt-3 mb-5">';
						hostReview += '			<p class="mb-0 ps-3"><strong>'+ (review.user.name) +'님, '+ (review.user.address ? review.user.address : "") +'</strong></p>';
						hostReview += '			<span class="mb-0 ps-3 text-muted">회원가입: </span><span class="text-muted">'+ (review.user.createdDate) +'</span>';
						hostReview += '		</div>';
						hostReview += '</div>';
	
						$hostReviewBox.append(hostReview);
					}
				})
				
			} else {						// guest
				let reviews = item.reviews;
				$myTab.hide();
			
				// 게스트이며, 호스트에게 받은 후기가 없다.
				if (reviews.length == 0) {
					let empty2 = '';
					empty2 += '<h4 class="fw-bold mb-3 ms-2">후기 '+ (reviews.length) +'개</h4>';
					empty2 += '<a href="https://localhost/user/sentReview" class="text-dark fw-bold p-0 mt-1 ms-2">(내가 작성한 후기)</a>';
					
					$allTabBox.html(empty2);
					return;
				} 
				
				// 게스트이며, 호스트가 작성한 리뷰가 있다. 
					let reviewCount2 = '';
					reviewCount2 += '<div class="d-flex justify-content-start fs-5 mt-5 mb-4" id="tab-review-count">';
					reviewCount2 += '	<i class="bi bi-star-fill"></i>';
					reviewCount2 += '	<h4 class="fw-bold mb-3 ms-2">후기 '+ (reviews.length) +'개</h4>';
					reviewCount2 += '	<a href="https://localhost/user/sentReview" class="text-dark fw-bold fs-6 p-0 mt-1 ms-2">(내가 작성한 후기)</a>';
					reviewCount2 += '</div>';
					
					$reviewCount.html(reviewCount2);
					
				$.each(reviews, function(index, review) {
					if (review.deleted == 'Y') {
						let guestReview = '';
						guestReview += '<div class="boxReviewContent">';
						guestReview += '	<p class="reviewContent mb-0">'+ (review.content) +'</p>';
						guestReview += '</div>';
					} else {
						let content1=''
						content1 += '<div class="boxReviewContent">';
						content1 += '	<p class="text-muted">'+ (review.createdDate) +'</p>';
						content1 += '	<p class="reviewContent mb-0">'+ (review.content) +'</p>';
						content1 += '</div>';
						content1 += '<div class="row">';
						content1 += '	<div class="col-1">';
						content1 += '		<a href="#">';
						content1 += '			<img src="/resources/images/profile/'+ (review.user.profileImage ? review.user.profileImage : "profile-default-img.png") +'" class="userImg mb-3">';
						content1 += '		</a>';
						content1 += '	</div>';
						content1 += '	<div class="col mt-3 mb-5">';
						content1 += '		<p class="mb-0 ps-3"><strong>'+ (review.user.name) +' 님, '+(review.user.address)+'</strong></p>';
						content1 += '		<span class="mb-0 ps-3 text-muted">회원가입: </span><span class="text-muted">'+ (review.user.createdDate) +'</span>';
						content1 += '	</div>';
						content1 += '</div>';
						
						$guestBoxReviewBox.append(content1);
					}
				})
			}
			
			   $(".boxReviewContent").each(function(){
			        let rcontent = $(this).children('.reviewContent');
			        let rcontent_txt = rcontent.text();
			        let rcontent_txt_short = rcontent_txt.substring(0,100)+"...";
			        let btn_more = $('<a href="javascript:void(0)" class="more link-dark mt-0">더보기 <i class="bi bi-chevron-right"></i></a>');

			        $(this).append(btn_more);
			        
			        if(rcontent_txt.length >= 100){
			            rcontent.html(rcontent_txt_short)
			            
			        }else{
			            btn_more.hide()
			        }
			        
			        btn_more.click(toggle_content);

			        function toggle_content(){
			            if($(this).hasClass('short')){
			                $(this).html('더보기');
			                rcontent.html(rcontent_txt_short)
			                $(this).removeClass('short');
			            }else{
			                $(this).html('접기');
			                rcontent.html(rcontent_txt);
			                $(this).addClass('short');

			            }
			        }
			    });
		}
	});
			
});
</script>
</body>
</html>