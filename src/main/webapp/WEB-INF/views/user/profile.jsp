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
<title>[회원이름]님의 프로필 -에어씨앤씨</title>
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
</style>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
	<div class="container">
	<div class="p-5">
		<div class="row">
			<div class="col-4">
				<div class="border rounded-3 p-4">
					<div class=" text-center mb-2">
						<img class="rounded-circle" src="/resources/images/profile/${user.profileImage}" alt="프로필사진" width="180">
					</div>
					<div class="text-center mb-5">
						<button type="button" class="btn btn-link fw-bold fs-6" data-bs-toggle="modal" data-bs-target="#modal-change-profileImg" style="color: black;">사진 업데이트하기</button>
					</div>
					<div class="mb-2 fs-4">
						<i class="bi bi-star fw-bold"></i>
						<span class="pop fw-bold fs-6" id="pop-review" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="bottom">후기4개</span>
					</div>
					<div class="mb-5 fs-4">
						<i class="bi bi-shield-check fw-bold"></i>
						<span class="pop fw-bold fs-6" id="pop-certification" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="bottom">본인 인증 완료</span>
					</div>
					<hr />
					<div class="mb-4">
						<h3 class="fs-4 fw-bold">${user.name} 인증 완료</h3>
					</div>
					<div class="d-flex justify-content-start mb-3 fs-5">
						<i class="bi bi-check-lg fw-bold"></i>
						<span class="ms-3">신분증</span>
					</div>
					<div class="d-flex justify-content-start  mb-3  fs-5">	
						<i class="bi bi-check-lg fw-bold"></i>
						<span class="ms-3">이메일 주소</span>
					</div>
					<div class="d-flex justify-content-start mb-3  fs-5">
						<i class="bi bi-check-lg fw-bold"></i>
						<span class="ms-3">전화번호</span>
					</div>
					<div>
						<p>계정 정보 인증을 통해 더욱 안전한 에어비앤비 커뮤니티를 만들 수 있는 방법에 대해 자세히 알아보세요.</p>
					</div>
				</div>
			</div>
			<div class="col ms-5 ps-5">
				<h2 class="fw-bold">안녕하세요. 저는 ${user.name}입니다.</h2>
				<p>회원가입: <fmt:formatDate value="${user.createdDate }" pattern="yyyy"/> </p>
				<button class="btn btn-link text-reset fw-bold fs-6 p-0" id="btn-change-profile">프로필 수정하기</button>
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
						<textarea class="form-control mb-5 fs-5" name="description" rows="4" id="textarea-description"> ${user.description} </textarea>
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
				<!-- 후기 -->
				<div class="d-flex justify-content-start fs-5 mt-5 mb-4">
					<i class="bi bi-star-fill"></i>
					<h3 class="fw-bold mb-3 ms-2">후기 4개</h3>
				</div>
				<div>
					<div class="mb-5">
						<div>
							<p class="text-muted">6월2019</p>
							<p class="fs-5">친절하고 예의바른 게스트</p>
						</div>
						<div style="display:inline-block;vertical-align: top;">
							<a href=""><img src="/resources/logo.png" alt="프로필사진"></a> 
							<div style="display:inline-block;">
								<span class="fs-5 fw-bold">Isa님,</span><span class="fs-5 fw-bold">피렌체, 이탈리아</span>
								<div class="fs-5 text-muted">회원가입:2014</div>
							</div>
						</div>
					</div>
					<div class="mb-5">
						<div>
							<p class="text-muted">6월2019</p>
							<p class="fs-5">친절하고 예의바른 게스트</p>
						</div>
						<div style="display:inline-block;vertical-align: top;">
							<a href=""><img src="/resources/logo.png" alt="프로필사진"></a> 
							<div style="display:inline-block;">
								<span class="fs-5 fw-bold">Isa님,</span><span class="fs-5 fw-bold">피렌체, 이탈리아</span>
								<div class="fs-5 text-muted">회원가입:2014</div>
							</div>
						</div>
					</div>
					<div class="mb-5">
						<div>
							<p class="text-muted">6월2019</p>
							<p class="fs-5">친절하고 예의바른 게스트</p>
						</div>
						<div style="display:inline-block;vertical-align: top;">
							<a href=""><img src="/resources/logo.png" alt="프로필사진"></a> 
							<div style="display:inline-block;">
								<span class="fs-5 fw-bold">Isa님,</span><span class="fs-5 fw-bold">피렌체, 이탈리아</span>
								<div class="fs-5 text-muted">회원가입:2014</div>
							</div>
						</div>
					</div>
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
        <h5 class="modal-title">프로필 사진 변경하기</h5>
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
	        <div class="">
		        <img class="rounded-circle" src="/resources/images/profile/${user.profileImage}" width="180">
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
		$(this).addClass("disabled");
		$("#div-profile").addClass("d-none");
	});
	
	$("#btn-cancel").click(function() {
		$("#div-update-profile").addClass("d-none");
		$("#btn-change-profile").removeClass("disabled");
		$("#div-profile").removeClass("d-none");
	});
	
	
	
	
	
	
	
	
})




</script>
</body>
</html>