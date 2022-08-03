<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	.container {margin-top: 50px;}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-4">
				<div class="border rounded-3 p-4">
					<div class=" text-center mb-2">
						<img src="/resources/logo.png" alt="프로필 사진">
					</div>
					<div class="text-center mb-5">
						<button type="button" class="btn btn-link text-muted fw-bold fs-5" data-bs-toggle="modal" data-bs-target="#modal-change-profileImg">사진 업데이트하기</button>
					</div>
					<div class="mb-2 fs-4">
						<i class="bi bi-star fw-bold"></i>
						<span class="pop fw-bold" id="pop-review" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="bottom">후기4개</span>
					</div>
					<div class="mb-5 fs-4">
						<i class="bi bi-shield-check fw-bold"></i>
						<span class="pop fw-bold" id="pop-certification" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="bottom">본인 인증 완료</span>
					</div>
					<hr />
					<div class="mb-4">
						<h3>Youna 인증 완료</h3>
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
				<h1 class="fw-bold">안녕하세요. 저는 Youna입니다.</h1>
				<p>회원가입: 2016</p>
				<a href="" class="text-reset fw-bold fs-5">프로필 수정하기</a>
				<div class="mt-5">
					<h3 class="fw-bold mb-4">소개</h3>
					<p class="fs-5 mb-4">안녕하세요, 반갑습니다.</p>
					<div class="d-flex justify-content-start mb-3 fs-5">
						<i class="bi bi-house-door-fill"></i>
						<span class="ms-2">거주지: 서울, 한국</span>
					</div>
					<div class="d-flex justify-content-start mb-3 fs-5">
						<i class="bi bi-chat-square-fill"></i>
						<span class="ms-2">구사 언어:  English, 日本語, 한국어</span>
					</div>
				</div>
				<!-- 프로필 수정하기 -->
				<div class="mt-5">
					<form action="">
						<label for="textarea-introduction" class="form-label fs-5">소개</label>
						<textarea class="form-control mb-5 fs-5" rows="4" id="textarea-introduction">안녕하세요, 반갑습니다.</textarea>
						<label for="input-location" class="form-label fs-5">위치</label>
						<input type="text" class="form-control mb-5 p-2 fs-5" id="input-location" value="서울, 한국">
						<label for="language" class="form-label fs-5 mb-3">구사 언어</label>
						<div class="mb-3" id="div-language">
							<div>
								<span>English</span><button type="button" class="btn-close" aria-label="Close"></button>
							</div>
							<div>
								<span>한국어</span><button type="button" class="btn-close" aria-label="Close"></button>
							</div>
							<div>
								<span>日本語</span><button type="button" class="btn-close" aria-label="Close"></button>
							</div>
						</div>
						<button type="button" class="btn btn-link text-reset fw-bold fs-5" data-bs-toggle="modal" data-bs-target="#modal-change-language">추가하기</button>
						<div class="d-flex justify-content-between mt-5">
							<button type="button" class="btn btn-link text-reset fs-5 fw-bold">취소</button>
							<button type="button" class="btn btn-dark btn-lg px-4">저장</button>
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
        <form id="form-profileImg" action="" method="post" enctype="multipart/form-data" >
	        <div class="">"
		        <img src="/resources/logo.png">
	        </div>
	        <div class="d-grid gap-2 my-4">
	        	<input type="file" name="profileImg" id="profile-img" class="d-none" accept="image/gif, image/jpeg, image/png" />
	        	<button type="button" class="btn btn-dark p-3 fs-5 fw-bold" id="btn-change-profileImg"><i class="bi bi-person-bounding-box"></i> 사진 변경하기</button>
	        	<button type="button" class="btn btn-outline-dark p-3 fs-5 fw-bold" id="btn-use-facebookImg">페이스북 사진 사용</button>
	        </div>
        </form>
        <div>
        	<button type="button" class="btn btn-link text-reset fw-bold fs-5" data-bs-dismiss="modal" aria-label="Close">나중에 할게요</button>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 프로필 구사언어 수정 모달 -->
<!-- Modal -->
<div class="modal fade" id="modal-change-language" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title fw-bold text-center" id="exampleModalLabel">구사 언어</h5> <!-- text-center 왜 적용안됨?!?!?!?!?!  -->
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>에어비앤비는 전 세계 다양한 언어권의 게스트가 이용하므로 여러 언어를 구사하는 호스트의 언어 능력은 큰 장점입니다.</p>
        <div class="form-check fs-4">
		  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
		  <label class="form-check-label" for="flexCheckDefault">한국어</label>
		</div>
		<div class="form-check fs-4">
		  <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" />
		  <label class="form-check-label" for="flexCheckChecked">日本語</label>
		</div>
		<div class="form-check fs-4">
		  <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" />
		  <label class="form-check-label" for="flexCheckChecked">English</label>
		</div>
		<div class="form-check fs-4">
		  <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" />
		  <label class="form-check-label" for="flexCheckChecked">中文</label>
		</div>
      </div>
      <div class="modal-footer justify-content-start">
        <button type="button" class="btn btn-dark btn-lg" data-bs-dismiss="modal">완료</button>
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
	
	$("#btn-change-profileImg").click(function() {
		$("#profile-img").click();
	})
})




</script>
</body>
</html>