<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- 아이콘 라이브러리 -->
<script src="https://kit.fontawesome.com/2628157b3b.js"></script>
<!-- google gsi -->
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- 카카오 로그인지원 자바스크립트 라이브러리 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 페이스북 -->
<style type="text/css">
	#btn-login-register, 
	#btn-register,
	#btn-login,
	#btn-register-complete {background: rgb(251,63,111);
			   background: radial-gradient(circle, rgba(251,63,111,1) 0%, rgba(252,70,205,0.6617997540813201) 75%);
			   color: white;
			   font-size: large;
			   font-weight: bold;
			   }
				   
	.line {
	display:flex;
	flex-basis:100%;
	align-items:center;
	color:rgba(0,0,0,0.35);
	font-size:14px;
	margin:8px 0px;
	}
	.line::before, .line::after {
		content:"";
		flex-grow:1;
		margin:0px 10px;
		background:rgba(0,0,0,0.35);
		height:1px;
		font-size:0px;
		line-height: 0px;
		opacity: 0.5;
	}
	

	.myModal-dialog {
		width: 620px !important;
	}


	
	#agree1, #agree2 {/* zoom:3.0; */
	display: inline-block !important;
    border-width: 1px !important;
    border-style: solid !important;
    border-color: rgb(176, 176, 176) !important;
    height: 24px !important;
    width: 24px !important;
    background: rgb(255, 255, 255) !important;
    text-align: center !important;
    overflow: hidden !important;
    vertical-align: top !important;
    border-radius: 4px !important;
	}
	#password-helper p {font-size: small; margin: 0%;}
	
	h4, h5 {font-weight: bold;}
	
	/* #btn-expose-password {
	position: absolute;
	top: 0;
	right: 0;
	height: inherit;} */
	.sns:hover {background:rgba(0,0,0,0.05); color: black;}
	
	.snsButton {
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background-color:#ffffff;
	border-radius:8px;
	border:1px solid black;
	display:inline-block;
	cursor:pointer;
	color:#1a021a;
	font-family:Arial;
	font-weight:bold;
	padding:10px 20px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
	}
	.snsButton:hover {
		background-color:#f6f6f6;
	}
	.snsButton:active {
		position:relative;
		top:2px;
	}
	#btn-login-expose-password {font-size: small !important; font-weight: bold !important;}
	
	.form-control.is-valid, .was-validated .form-control:valid {
		background-image: !important;
	}
	
	.invalid-feedback {font-size: 12px !important;}
	
</style>





<div >
<!-- Button trigger modal -->
<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#email-login-modal">
  로그인/회원가입
</button> -->

<!-- 이메일 입력 모달1 -->
<div style="z-index: 5000;" class="modal fade" id="email-login-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
  <div class="modal-dialog modal-dialog-centered myModal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title fw-bold w-100 text-center fs-6" id="exampleModalLabel">로그인 또는 회원가입</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body m-2">
      	<div >
      		<h3 class="fw-bold fs-5" id="h-welcome" >에어비앤비에 오신 것을 환영합니다.</h3>
      		<h3 class="d-none fw-bold fs-5" id="h-error"><i class="bi bi-exclamation-circle"></i> 해당 서비스를 이용하려면 로그인하세요</h5>
      	</div>
      	<div>
      		<form id="form-email" method="post" class="needs-validation" novalidate>
	      		<div class="form-floating my-4">
			     	<input type="text" class="form-control outline" name="email" placeholder="이메일" required >
			     	<label for="floatingInput">이메일</label>
			     	<div class="invalid-feedback">
			     		<i class="fa-solid fa-circle-exclamation"></i>  이메일을 입력해주세요
			     	</div>
		    	</div>
			    <div class="d-grid gap-2 my-4">
				     <button type="button" class="btn p-2" id="btn-login-register">계속</button>
			    </div>
      		</form>
      		<div class="line mb-3">
      			<span style="color: black;">또는</span>
      		</div>
		    <div class="d-grid gap-3">
		    	<button type="button" class="snsButton" id="btn-signIn-with-facebook">
		    		<img src="https://t1.daumcdn.net/cfile/tistory/994EAB4F5D2565432F" width="23px;" height="23px;" style="float: left;">
		    			<small>페이스북으로 로그인하기</small>
		    	</button>
				<button type="button" class="snsButton" id="btn-signIn-with-google">
					<img src="https://developers.google.com/static/identity/images/g-logo.png" width="23px;" height="23px;" style="float: left;">
						<small>구글로 로그인하기</small>
				</button>
				<button type="button" class="snsButton" id="btn-signIn-with-kakao">
					<img src="https://cdn.imweb.me/thumbnail/20220403/a8e484f2dfe39.png" width="24px;" height="24px;" style="float: left;">
						<small>카카오로 로그인하기</small>
				</button>
		    	<!-- 숨겨진 실제 카카오 로그인 버튼 -->
		    	<button type="button" class="btn btn-outline-dark d-none" id="custom-login-btn">
				  <img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="242" />
				</button> 
		    </div>
      	</div>
      </div>
    </div>
  </div>
</div>

<!-- Button trigger modal  나중에 삭제-->
<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#login-password-modal">
  로그인-비밀번호
</button> -->


<!-- 로그인의 경우 비밀번호 입력 모달2 -->
<div class="modal fade" id="login-password-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
  <div class="modal-dialog modal-lg modal-dialog-centered myModal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title fw-bold w-100 text-center fs-6">로그인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body m-2">
      	<!-- 기존사용자의 이메일과 소셜로그인 이메일이 같은 경우 프로필 출력 -->
      	<div class="text-center" id="div-login-again"></div>
      	<div>
      		<form id="form-login" action="" method="post" class="needs-validation" novalidate>
	      		<div class="form-floating  position-relative my-3 ">
	      			<input type="hidden" name="loginEmail">
			     	<input type="password" class="form-control outline" name="loginPassword" placeholder="비밀번호" required>
			     	<label for="floatingInput">비밀번호</label>
			     	<div class="invalid-feedback">
			     		<i class="fa-solid fa-circle-exclamation"></i> <span>유효하지 않은 비밀번호입니다. 다시 시도하여 주세요.</span>
			     	</div>
			     	<button type="button" class="text-reset btn btn-link position-absolute fw-bold top-50 end-0 translate-middle" id="btn-login-expose-password">표시</button>
		    	</div>
			    <div class="d-grid mb-3">
				     <button type="button" class="btn p-2" id="btn-login">로그인</button>
			    </div>
      		</form>
      	</div>
      	<div>
      		<button class="btn btn-link fw-bold text-reset p-0 mb-2" data-bs-toggle="modal" data-bs-target="#email-login-modal"><small>다른 계정으로 로그인하기</small></button><br/>
      		<button class="btn btn-link fw-bold text-reset p-0 d-none"><small>비밀번호를 잊으셨나요?</small></button>
      	</div>
      </div>
    </div>
  </div>
</div>

<!-- 회원가입입력 모달 -->
<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#email-register-modal">
  회원가입
</button> -->

<!-- Modal -->
<div class="modal fade" id="email-register-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
  <div class="modal-dialog modal-lg modal-dialog-scrollable modal-dialog-centered myModal-dialog">
    <div class="modal-content">
       <div class="modal-header">
        <h5 class="modal-title fw-bold w-100 text-center" id="exampleModalLabel">회원 가입 완료하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="register-form" action="" method="post" class="needs-validation p-2" novalidate>
        	<div class="form-floating">
			     <input type="text" class="form-control outline" name="firstName" placeholder="이름(예: 길동)" required >
			     <label for="floatingInput">이름(예: 길동)</label>
			     <div class="invalid-feedback">
					<i class="fa-solid fa-circle-exclamation"></i><span> 이름을 입력해주세요.</span>
				 </div>
			</div>
			
			<div class="form-floating">
			     <input type="text" class="form-control outline" name="lastName" placeholder="성(예: 홍)">
			     <label for="floatingInput">성(예: 홍)</label>
			     <div class="invalid-feedback">
					<i class="fa-solid fa-circle-exclamation"></i><span> 성을 입력해주세요.</span>
				 </div>
			    <p id="p-advice" style="font-size: 12px;">정부 발급 신분증에 표시된 이름과 일치하는지 확인하세요.</p>
		    </div>
		    <div class="form-floating">
			     <input type="date" class="form-control outline" name="birthDate" placeholder="생년원일">
			     <label for="floatingInput">생년월일</label>
			      <div class="invalid-feedback">
					<i class="fa-solid fa-circle-exclamation"></i><span> 계속하시려면 생일을 선택하세요.</span>
				 </div>
				 <p id="email-advice" style="font-size: 12px;">만 18세 이상의 성인만 회원으로 가입할 수 있습니다. 생일은 에어비앤비의 다른 회원에게 공개되지 않습니다.</p>
			</div>
		    <div class="form-floating">
			     <input type="email" class="form-control outline" name="registerEmail" placeholder="" required >
			     <label for="floatingInput">이메일</label>
			     <p id="p-info" style="font-size: 12px;">예약 확인과 영수증은 이메일로 보내드립니다.</p>
			     <div class="invalid-feedback">
					<i class="fa-solid fa-circle-exclamation"></i><span> 올바른 형식의 이메일을 입력해주세요.</span>
				 </div>
			</div>
		    <div class="form-floating position-relative">
			     <input type="password" class="form-control outline" name="password" placeholder="비밀번호">
			     <label for="floatingInput">비밀번호</label>
			     <button type="button" class="text-reset btn btn-link position-absolute top-50 end-0 translate-middle" id="btn-register-expose-password">표시</button>
			</div>
			<div class="password-feedback d-none" style="color: #dc3545; font-size: 12px; ">
					<i class="fa-solid fa-circle-exclamation"></i><span> 비밀번호를 입력하세요.</span>
			</div>
		    <div id="password-helper" class="p-0" style="font-size: 12px;">
		     	<p class="d-none" id="ph-1">비밀번호에 본인 이름이나 이메일 주소를 포함할 수 없습니다</p>
				<p class="d-none" id="ph-2">최소8자</p>
				<p class="d-none" id="ph-3">숫자나 기호를 포함하세요</p>
		    </div>
			<div class="row mb-3">
				<hr class="mb-4">
				<div class="col-10">
					<label for="agree1" style="font-size: small;">개인정보 수집 및 이용에 동의합니다.<br/>
							1. 에어비앤비가 수집하는 개인 정보 에어비앤비 플랫폼을 이용하는 데 필요한 정보 당사는 
							회원님이 에어비앤비 플랫폼을 이용할 때 회원님의 개인 정보를 수집합니다. 
							그렇지 않은 경우, 에어비앤비는 요청하신 서비스를 회원님께 제공하지 못할 수 있습니다. 이러한 정보에는 다음이 포함됩니다. </br>
							<span id="check-agree1" class="d-none" style="color: #dc3545; font-size: .875em;"><i class="fa-solid fa-circle-exclamation"></i> 계속하려면 동의해주세요.</span>
					</label>
				</div>
				<div class="col-2 ps-5">
					<input type="checkbox" id="agree1">
				</div>
			</div>
		    <div class="row mb-3">
		    	<div class="col-10">
					<label for="agree2" style="font-size: small;">마케팅 이메일 수신을 원합니다(선택).<br/>
						 에어비앤비 회원 전용 할인, 추천 여행 정보, 마케팅 이메일, 푸시 알림을 보내드립니다. 
						 계정 설정 또는 마케팅 알림에서 언제든지 수신을 거부할 수 있습니다.
					</label>
				</div>
				<div class="col-2 ps-5">
					<input type="checkbox" id="agree2" >
				</div>
				<hr class="mb-4">
		    </div>
        	<div style="font-size: small;">
        		동의 및 계속하기를 선택하여 에어비앤비 <strong>서비스 약관</strong>, <strong>결제 서비스 약관</strong>, 
        		<strong>위치기반서비스 이용약관</strong>, <strong>차별 금지 정책</strong>, <strong>개인정보 처리방침</strong>에 동의합니다.
        	</div>
        	<div class="d-grid gap-2 my-4">
        	<button type="button" class="btn p-3" id="btn-register">동의 및 계속하기</button>
        	</div>
        </form>
      </div>
    </div>
  </div>
</div>


<!-- 회원가입 완료 모달 -->

<!-- Button trigger modal -->
<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#register-complete-modal">
  회원가입 완료 모달
</button> -->

<div class="modal fade" id="register-complete-modal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1" data-bs-backdrop="static">
  <div class="modal-dialog modal-dialog-centered modal-lg myModal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title fw-bold w-100 text-center" id="exampleModalLabel">프로필 생성하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	  <div class="modal-body text-center">
			<img src="/resources/logo.png" alt="logo">
			<h4>에어비앤비에 오신 것을 환영합니다.</h4>
			<p>전 세계 숙소, 현지 레스토랑 및 독특한 체험을 찾아보세요.</p>
			<div class="d-grid gap-2 my-4">
		       <button type="button" class="btn p-3" id="btn-register-complete" data-bs-target="#upload-profile-modal" data-bs-toggle="modal" data-bs-dismiss="modal">계속</button>
		    </div>
	  </div>
    </div>
  </div>
</div>
<div class="modal fade" id="upload-profile-modal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1" data-bs-backdrop="static">
  <div class="modal-dialog modal-dialog-centered modal-lg myModal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title w-100 text-center">프로필 생성하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center p-5">
        <h4>프로필 사진 추가</h4>
        <div>
	        <p class="fs-5">얼굴이 보이는 이미지를 선택하세요. 호스트는 예약이 확정된 후에만 사진을 볼 수 있습니다.</p>
	        <p class="fs-5 d-none">이 사진이 내 프로필에 추가됩니다. 호스트나 캐스트가 보게 되는 사진이므로 개인정보나 민감한 정보가 표시되지 않도록 하세요.</p>
        </div>
        <form id="form-profileImg" action="" method="post" enctype="multipart/form-data" >
	        <div class="">
		        <img id="img-profileImg" class="rounded-circle" src="/resources/images/profile/profile-default-img.png" width="200">
	        </div>
	        <div class="d-grid gap-2 my-4">
	        	<input type="file" name="profileImg" id="profile-img" class="d-none" accept="image/gif, image/jpeg, image/png" />
	        	<button type="button" class="btn btn-dark p-3 fs-5 fw-bold" id="btn-add-profileImg"><i class="fa-solid fa-cloud-arrow-up text-start"></i> 사진 업로드하기</button>
	        	<button type="button" class="btn btn-dark p-3 fs-5 fw-bold d-none" id="btn-add-complete" onclick="location.href='/'" data-bs-dismiss="modal" aria-label="Close">완료</button>
	        	<button type="button" class="btn btn-outline-dark p-3 fs-5 fw-bold" id="btn-use-facebookImg">페이스북 사진 사용</button>
	        	<button type="button" class="btn btn-outline-dark p-3 fs-5 fw-bold d-none" id="btn-change-profileImg">사진 변경</button>
	        </div>
        </form>
        <div>
        	<button type="button" class="btn btn-link text-reset fw-bold fs-5" onclick="window.location.reload()" data-bs-dismiss="modal" aria-label="Close">나중에 할게요</button>
        </div>
      </div>
    </div>
  </div>
</div>

	<!-- 페이스북 로그인폼 처리 -->
	<form id="form-facebook-login" method="post" action="/user/sns-login">
		<input type="hidden" name="loginType" value="facebook">
		<input type="hidden" name="nickname" /> 
		<input type="hidden" name="email" />
	</form>

	<!-- 구글 로그인폼 처리 -->
	<div>
		<form id="form-google-login" method="post" action="/user/sns-login">
			<input type="hidden" name="loginType" value="google">
			<input type="hidden" name="nickname">
			<input type="hidden" name="email">
			<input type="hidden" name="profileImage">
		</form>
	
	</div>

	<!-- 카카오 로그인폼 처리 -->
	<div>
		<!-- <a id="custom-login-btn">
		  <img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="242" />
		</a>  -->
	   	<form id="form-kakao-login" method="post" action="/user/sns-login">
	   		<input type="hidden" name="loginType" value="kakao">
	   		<input type="hidden" name="nickname" />
	   		<input type="hidden" name="email" />
	   		<input type="hidden" name="gender" />
	   	</form>
	</div>

</div>
<script type="text/javascript">
// 페이스북 로그인 초기화 처리
//Load the SDK asynchronously
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "https://connect.facebook.net/en_US/sdk.js";
  fjs.parentNode.insertBefore(js, fjs);
  
  window.fbAsyncInit = function() {
	 console.log('FB.init', FB.init)
		FB.init({
		  appId      : '785083306180197',
		  cookie     : true,  // enable cookies to allow the server to access 
		                      // the session
		  xfbml      : true,  // parse social plugins on this page
		  version    : 'v14.0' // Specify the Graph API version to use
		});
	 
	 
			FB.AppEvents.logPageView();
		FB.getLoginStatus(function(response) {
			//console.log(response.status);
		})
	}
}(document, 'script', 'facebook-jssdk'));	


$(function () {
	
	
	let $firstName = $(":input[name=firstName]");
	let $lastName = $(":input[name=lastName]");
	let $birthDate = $(":input[name=birthDate]");
	let $email = $(":input[name=email]");
	let $registerEmail = $(":input[name=registerEmail]");
	let $loginPassword = $(":input[name=loginPassword]");
	let $password = $(":input[name=password]");
	
	let loginPasswordmodal = new bootstrap.Modal(document.getElementById("login-password-modal")); 
	let registerModal = new bootstrap.Modal(document.getElementById("email-register-modal")); 
	let loginEmailModal = new bootstrap.Modal(document.getElementById("email-login-modal")); 
	
	document.getElementById("email-login-modal").addEventListener('hidden.bs.modal', function (event) {
		$("#h-welcome").removeClass("d-none");
		$("#h-error").addClass("d-none");
		$("#form-email :input[name=email]").val('');
		$email.removeClass("is-valid");
		//$("#박스-에러").하이드();
	});
	
	
	
	let params = new URLSearchParams(document.location.search);
	let errorValue = params.get("error");
	
	if (errorValue) {
		loginEmailModal.show();
		$("#h-welcome").addClass("d-none");
		$("#h-error").removeClass("d-none");
		//$("#박스-에러").쇼();
	}
	
	
	// input안에서 enter를 치면 자동으로 폼이 제출되는 것을 방지한다.
	// enter 키번호는 13번이다.
	$email.keydown(function(event) {
		if (event.which === 13) {
			$("#btn-login-register").click();
			return false;
		}
		return true;
	});
	$loginPassword.keydown(function(event) {
		if (event.which === 13) {
			$("#btn-login").click();
			return false;
		}
		return true;
	});
	
	
	// normal 로그인
	$("#btn-login").click(function() {
		//let $loginPassword = $(":input[name=loginPassword]");
		if($loginPassword.val().trim() === "" ) {
			$loginPassword.removeClass("is-valid").addClass("is-invalid");
			return;
		}
		let querystring = $("#form-login").serialize();
		$.post("/user/normal-login", querystring, function(result) {
			if(result.pass) {
				location.href = "/";
			} else if (!result.pass) {
				$loginPassword.removeClass("is-valid").addClass("is-invalid");
			} 
		})
	})
	
	// 페이스북 로그인
	$("#btn-signIn-with-facebook").click(function() {

	   	 FB.login(function(response){
	   		
	   		if (response.status === 'connected') {
	   		console.log("FB.login  get user info ...........................")
	   		 FB.api('/me', {"fields":"name,email,gender"}, function(response) {
	      		    console.log('Successful login for: ' + response.name);
	      		    console.log(JSON.stringify(response));
	      		    $("#form-facebook-login :input[name=nickname]").val(response.name);
	      	        $("#form-facebook-login :input[name=email]").val(response.email);
	      	        
	      	      $.getJSON("/user/checkEmailWithSns", "email=" + response.email, function(result) {
						
	      			if(result.exist) {
	      				// 기존 페이지 계정 이메일과 소셜 로그인 이메일이 일치하는 경우 
	      				//console.log("sns이메일 존재");
	      				// 아래 모달창은 나중에 파일 통합하면 출력되게 한다
	      				loginEmailModal.hide();
	      				$("#login-password-modal .modal-title").text("계정이 이미 존재합니다.");
	      				loginPasswordmodal.show();
	      				$("#form-login :input[name=loginEmail]").val(result.user.email);
	      				return;
	      			} else {
	      				$("#form-facebook-login").submit();
	      				return;
	      			}
	      		});
	      		    
	      		  });
	   			
	   		  } else {
	   		    // The person is not logged into your webpage or we are unable to tell. 
	   			
	   		  }
			   		
		     			
		  }, {scope: 'public_profile,email'});
		
	});
	$("#btn-facebook-logout").click(function() {
	    FB.getLoginStatus(function(response) {
	        if (response && response.status === 'connected') {
	            console.log("logout: connected 일 때");
	            FB.logout(function(response) {
	                document.location.reload();
	            });
	        } else {
	            console.log("logout: connected 아닐 때");
	        }
	    });
		
	});
	
	// 구글 로그인
	$("#btn-signIn-with-google").click(function() {
		google.accounts.id.initialize({
		    client_id: "340808936773-p2v7dk0jtatnsjl29nnvivnol8f9rni8.apps.googleusercontent.com",
		    callback: handleCredentialResponse
		  });
		  /* google.accounts.id.renderButton(
		    document.getElementById("btn-signIn-with-google"),
		    { theme: "outline", size: "large" }  // customization attributes
		  );  */
		  google.accounts.id.prompt(); // also display the One Tap dialog
	})
	
	function handleCredentialResponse(response) {
		const responsePayload = parseJwt(response.credential);
		console.log("ID: " + responsePayload.sub);
	    console.log('Full Name: ' + responsePayload.name);
	   // console.log('Given Name: ' + responsePayload.given_name);
	   // console.log('Family Name: ' + responsePayload.family_name);
	    console.log("Image URL: " + responsePayload.picture);
	    console.log("Email: " + responsePayload.email);
	    
	    $("#form-google-login input[name=nickname]").val(responsePayload.name);
	    $("#form-google-login input[name=email]").val(responsePayload.email);
	    $("#form-google-login input[name=profileImage]").val(responsePayload.picture);
	    
	    $.getJSON("/user/checkEmailWithSns", "email=" + responsePayload.email)
	     .done(function(result) {
			if(result.exist && !result.user.loginType) {
				//console.log(result.user.loginType);
				// 기존 페이지 계정 이메일과 소셜 로그인 이메일이 일치하는 경우 	// loginType이 없는 유저들만?
				loginEmailModal.hide();
				$("#div-login-again").html("");
				// 아래 모달창은 나중에 파일 통합하면 출력되게 한다
				$("#login-password-modal .modal-title").text("계정이 이미 존재합니다.");
				let content = '<p class="fs-6">회원님 소유의 계정이 존재합니다. 계정으로 로그인하시기 바랍니다.</p>';
					content += '<div class="my-4">';
					content += '<img class="rounded-circle" src="/resources/images/profile/' + result.user.profileImage + '" alt="profile-img" width="120">';
					content += '</div>';
					content += '<div>';
					content += '<span class="fs-6">' + result.user.name + '</span>';
					content += '</div>';
					content += '<div>';
					content += '<span class="fs-6">' + result.user.email + '</span>';
					content += '</div>';
				$("#div-login-again").append(content);		
				$("#form-login :input[name=loginEmail]").val(result.user.email);
				loginPasswordmodal.show();
				return;
			} else {
				$("#form-google-login").submit();
				return;
			}
		})
	}
	function parseJwt (token) {
	    var base64Url = token.split('.')[1];
	    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
	    var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
	        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
	    }).join(''));

	    return JSON.parse(jsonPayload);
	};
	
	
	/* $("#btn-signIn-with-google").click(function() {
		alert("init");
		google.accounts.id.initialize({
	        client_id: "340808936773-p2v7dk0jtatnsjl29nnvivnol8f9rni8.apps.googleusercontent.com",
	        callback: handleCredentialResponse
	    });
	    google.accounts.id.prompt();
	})
	function handleCredentialResponse(response) {
		alert("함수");
	    var profile = jwt_decode(response.credential);
	    console.log(profile);
		console.log("ID: " + profile.sub);
		console.log('Name: ' + profile.name);
	    console.log("Image URL: " + profile.picture);
	    console.log("Email: " + profile.email);    
	    
	    $("#form-google-login input[name=nickname]").val(profile.name);
	    $("#form-google-login input[name=email]").val(profile.email);
	    $("#form-google-login input[name=profileImage]").val(profile.picture);
	    
	} */
	
	
	$("#btn-signIn-with-kakao").click(function() {
		$("#custom-login-btn").click();
	});
	
	Kakao.init('2931d0043daf4865ac102f53587fef2c'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
	$("#custom-login-btn").click(function() {
		Kakao.Auth.login({
	          success: function(authObj) {
	            //alert(JSON.stringify(authObj))
	            Kakao.API.request({
	                url: '/v2/user/me',
	                success: function(response) {
	                	let account = response.kakao_account;
	                	//alert(JSON.stringify(account));
	                	//$('#form-kakao-login input[name=id]').val(response.id);
	                	$('#form-kakao-login input[name=email]').val(( account.email != undefined ?  account.email : ''));
	                	$('#form-kakao-login input[name=nickname]').val(account.profile.nickname);
	                    //$('#form-kakao-login input[name=age]').val(account.age_range);
	                    $('#form-kakao-login input[name=gender]').val(account.gender);
	                    //let properties = response.properties;
	                    //let profile_image = properties.profile_image;
	                    // 사용자 정보가 포함된 폼을 서버로 제출한다.
						document.querySelector("#form-kakao-login").submit();
	                },
	                fail: function(error) {
	                    console.log(error);
	                }
	            });
	          },
	          fail: function(err) {
	            alert(JSON.stringify(err))
	          },
	        })
	})
	
	$("#btn-kakaoLogout").click(function() {
		if (Kakao.Auth.getAccessToken()) {
		      Kakao.API.request({
		        url: '/v1/user/unlink',
		        success: function (response) {
		        	console.log("로그아웃 성공");
		        	console.log(response)
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		    }
	})
	
	
	let emailRegExp = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
	let passwordRegExp =  /^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/;

	
	let validEmail = false;
	$email.keyup(function() {
		let email = $email.val().trim();
		if (email === "") {
			$email.removeClass("is-valid").addClass("is-invalid");
			return;
		}
		if (!emailRegExp.test(email)) {
			$email.removeClass("is-valid").addClass("is-invalid");
			return;
		}
		
		$email.addClass("is-valid").removeClass("is-invalid");
		validEmail = true;
	});
	
	
	// 로그인 및 회원가입 모달창에서 이메일 입력폼 제출
	$("#btn-login-register").click(function() {
		if(!validEmail) {
			$email.focus();
			$email.keyup();
			return false;
		}
		
		let email = $email.val().trim();
		
		$.getJSON("/user/checkEmail", "email=" + email, function(data) {
			console.log(data.result);
			// 사용자가 입력한 이메일이 db에 존재하면 비밀번호입력모달(로그인), 그렇지 않으면 회원가입모달창을 띄운다.
			if(data.result === "exist") {
				loginEmailModal.hide();
				$(":input[name=loginEmail]").val(email);
				loginPasswordmodal.show();
				return;
			} else if(data.result === "unexist"){
				loginEmailModal.hide();
				registerModal.show();
				$(":input[name=registerEmail]").val(email);
				return;
			} else if(data.result === 'disabled') {
				$("#email-login-modal").find(":input[name=email]").addClass("is-invalid");
				$("#email-login-modal").find(".invalid-feedback").text("이미 탈퇴 처리된 계정입니다.");
			}
		});
	});
	
	// 회원가입 모달의 이메일 입력필드
	$registerEmail.keyup(function() {
		let email = $registerEmail.val().trim();
		if(email === "" || !emailRegExp.test(email)) {
			$registerEmail.removeClass("is-valid").addClass("is-invalid");
			$("#p-info").addClass("d-none");
			return;
		}
		
		$registerEmail.addClass("is-valid").removeClass("is-invalid");
		$("#p-info").removeClass("d-none");
	})

	let validFirstName = false;
	$firstName.keyup(function() {
		
		let firstName = $(this).val().trim();
		if(firstName == "") {
			validFirstName = false;
			return;
		}  else {
			validFirstName = true;
			$(this).addClass("is-valid").removeClass("is-invalid");
		}
	});
	
	let validLastName = false;
	$lastName.keyup(function() {
		let lastName = $(this).val().trim();
		if(lastName == "") {
			//$(this).removeClass("is-valid").addClass("is-invalid");
			validLastName = false;
			return;
		} else {
			validLastName = true;
			$(this).addClass("is-valid").removeClass("is-invalid");
		}
		
		if($lastName.hasClass("is-valid")) {
			$("#p-advice").removeClass("d-none");
		} else if($lastName.hasClass("is-invalid")) {
			$("#p-advice").addClass("d-none");
		}
	})
	
	
	let validBirthDate = false;
	$birthDate.keyup(function() {
		
		let birthDate = $(this).val().trim();;
		if(birthDate == "") {
			validBirthDate = false;
			return;
		} else {
			validBirthDate = true;
			$(this).addClass("is-valid").removeClass("is-invalid");
		}
	});
	
	
	// 비밀번호 숨기기&표시 
	$("#btn-login-expose-password").click(function() {
		if($("#btn-login-expose-password").text() == "표시") {
			$loginPassword.attr("type", "text");
			//$password.css("ime-mode", "disabled");
			$("#btn-login-expose-password").text("숨기기");
		} else {
			$loginPassword.attr("type", "password");
			$("#btn-login-expose-password").text("표시");
		}
	});
	$("#btn-register-expose-password").click(function() {
		if($("#btn-register-expose-password").text() == "표시") {
			$password.attr("type", "text");
			//$password.css("ime-mode", "disabled");
			$("#btn-register-expose-password").text("숨기기");
		} else {
			$password.attr("type", "password");
			$("#btn-register-expose-password").text("표시");
		}
	});
	
	
	
	
	$password.focus(function() {
		
		$("#password-helper p").removeClass("d-none");
	});
	
	let validPassword = false;
	$password.keyup(function(event) {
				
		let password = $(this).val().trim();
		let firstName = $firstName.val().trim();
		let email = $registerEmail.val().trim();
		
		let koreanRegExp = /[ㄱ-힣]+/
		if(koreanRegExp.test(password)) {
			$password.val(password.replace(/[ㄱ-힣]/g, ''));
		}
		
		if(password) {
			$(".password-feedback").addClass("d-none");
		}
		
		if(password.includes(firstName)) {
			$("#ph-1").removeClass("text-success").addClass("text-danger");
			validPassword = false;
		} else {
			$("#ph-1").removeClass("text-danger").addClass("text-success");
			validPassword = true;
		}
		
		if(password.length < 8) {
			$("#ph-2").removeClass("text-success").addClass("text-danger");
			validPassword = false;
		} else {
			$("#ph-2").removeClass("text-danger").addClass("text-success");
			validPassword = true;
		}
		
		if(!passwordRegExp.test(password)) {
			$("#ph-3").removeClass("text-success").addClass("text-danger");
			validPassword = false;
		} else {
			$("#ph-3").removeClass("text-danger").addClass("text-success");
			validPassword = true;
		}
		
	});
	
	
	// 회원가입 입력폼 제출
	$("#btn-register").click(function() {
		
		if(!validFirstName) {
			$firstName.removeClass("is-valid").addClass("is-invalid");
			$firstName.focus();
		}
		
		if(!validLastName) {
			$lastName.removeClass("is-valid").addClass("is-invalid");
		}
		
		if(!validBirthDate) {
			$birthDate.removeClass("is-valid").addClass("is-invalid");
		}
		
		if(!validPassword) {
			$password.focus();
		}
		if($password.val().trim() == '') { 
			$(".password-feedback").removeClass("d-none");
			//$password.removeClass("is-valid").addClass("is-invalid");
			$password.focus();
		}
		
		if(!$("#agree1").prop("checked")) {
			$("#check-agree1").removeClass("d-none");
			return false
		}
		
		
		let querystring = $("#register-form").serialize();
		$.post("/user/register", querystring, function(result) {
			if(result.success) {
				
				registerModal.hide();
				let modal = new bootstrap.Modal(document.getElementById("register-complete-modal")); 
				modal.show();
			}
		})
		
	});
	
	$("#btn-add-profileImg").click(function() {
		$("#profile-img").click();
	});
	$("#btn-change-profileImg").click(function() {
		$("#profile-img").click();
	});
	
	$("#profile-img").change(function() {
		
		$("#upload-profile-modal h4").text("좋아요!");
		$("#upload-profile-modal p").text("이 사진이 내 프로필에 추가됩니다. 호스트나 캐스트가 보게 되는 사진이므로 개인정보나 민감한 정보가 표시되지 않도록 하세요.");
		$("#btn-add-profileImg").addClass("d-none");
		$("#btn-add-complete").removeClass("d-none");
		$("#btn-use-facebookImg").addClass("d-none");
		$("#btn-change-profileImg").removeClass("d-none");
		
		let formData = new FormData(document.getElementById("form-profileImg"));			// $("#form-profileImg")오류?
		
		$.ajax({
			type: "POST",								
			url: "/user/add/profileImg",			
			data: formData,	
			processData: false,
			contentType: false,			
			success: function(result) {					// 성공적인 응답이 왔을 때 실행되는 함수, data에는 서버가 보내느 응답데이터가 있다.
				if(result.success) {
					$("#img-profileImg").attr("src", "/resources/images/profile/" + result.filename);
				} else {
				}
			} 
			
		});
	});
	
	
	
})

</script>
