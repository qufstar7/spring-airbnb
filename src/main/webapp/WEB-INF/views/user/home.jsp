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
<!-- 아이콘 라이브러리 -->
<script src="https://kit.fontawesome.com/2628157b3b.js"></script>

<title>Insert title here</title>
<style type="text/css">
	#btn-next1, 
	#btn-next2 {background: rgb(251,63,111);
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
		margin:0px 16px;
		background:rgba(0,0,0,0.35);
		height:1px;
		font-size:0px;
		line-height: 0px;
	}
	
	.modal-dialog {
		
		width: 60%;
	}
	
	#agree1, #agree2 {zoom:3.0;}
	
</style>
</head>
<body>





<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#email-login-modal">
  로그인/회원가입
</button>

<!-- 이메일 입력 모달1 -->
<div class="modal fade" id="email-login-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">로그인 또는 회원가입</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body m-2">
      	<div>
      		<h3 class="fw-bold" >에어비앤비에 오신 것을 환영합니다.</h3>
      	</div>
      	<div>
      		<form action="" method="post" class="needs-validation" novalidate>
	      		<div class="form-floating my-4">
			     	<input type="text" class="form-control outline" name="email" placeholder="이메일" required >
			     	<label for="floatingInput">이메일</label>
			     	<div class="invalid-feedback">
			     		<i class="fa-solid fa-circle-exclamation"></i>  이메일을 입력해주세요
			     	</div>
		    	</div>
			    <div class="d-grid gap-2 my-4">
				     <button type="submit" class="btn p-3" id="btn-next1">계속</button>
			    </div>
      		</form>
      		<div class="line">
      			또는
      		</div>
		    <div class="d-grid gap-2">
		    	<button type="button" class="btn btn-outline-dark" >페이스북으로 로그인하기</button>
		    	<button type="button" class="btn btn-outline-dark" >구글로 로그인하기</button>
		    	<button type="button" class="btn btn-outline-dark" >Apple 계정으로 로그인하기</button>
		    </div>
      	</div>
      </div>
    </div>
  </div>
</div>

<!-- 로그인의 경우 비밀번호 입력 모달2 -->

<!-- 회원가입의 경우 회원가입입력폼 모달3 -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#email-register-modal">
  회원가입
</button>

<!-- Modal -->
<div class="modal fade" id="email-register-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원 가입 완료하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="register-form" action="" method="post" class="p-2" >
        	<div class="form-floating">
			     <input type="text" class="form-control outline" name="firstName" placeholder="이름(예: 길동)"  >
			     <label for="floatingInput">이름(예: 길동)</label>
			</div>
			
			<div class="form-floating">
			     <input type="text" class="form-control outline" name="lastName" placeholder="성(예: 홍)">
			     <label for="floatingInput">성(예: 홍)</label>
			    <p>정부 발급 신분증에 표시된 이름과 일치하는지 확인하세요.</p>
		    </div>
		    <div id="name-helper1">
				
			</div>
		    <div class="form-floating">
			     <input type="date" class="form-control outline" name="birthDate" placeholder="생년원일">
			     <label for="floatingInput">생년월일</label>
			</div>
		    <div class="form-floating">
			     <input type="email" class="form-control outline" name="email" placeholder="" required >
			     <label for="floatingInput">이메일</label>
			     <p>예약 확인과 영수증은 이메일로 보내드립니다.</p>
			</div>
		    <div class="form-floating">
			     <input type="password" class="form-control outline" name="password" placeholder="비밀번호">
			     <label for="floatingInput">비밀번호</label>
			     <button type="button" id="expose-password">표시</button>
			     <div id="password-helper" class="p-0">
			     	<p class="fs-6">비밀번호에 본인 이름이나 이메일 주소를 포함할 수 없습니다</p>
					<p class="fs-6">최소8자</p>
					<p class="fs-6">숫자나 기호를 포함하세요</p>
			     </div>
			</div>
			<div class="row mb-3">
				<div class="col-10">
					<label for="agree1">개인정보 수집 및 이용에 동의합니다.
							1. 에어비앤비가 수집하는 개인 정보 에어비앤비 플랫폼을 이용하는 데 필요한 정보 당사는 
							회원님이 에어비앤비 플랫폼을 이용할 때 회원님의 개인 정보를 수집합니다. 
							그렇지 않은 경우, 에어비앤비는 요청하신 서비스를 회원님께 제공하지 못할 수 있습니다. 이러한 정보에는 다음이 포함됩니다.
					</label>
				</div>
				<div class="col-2 ps-5">
					<input type="checkbox" id="agree1">
				</div>
			</div>
		    <div class="row mb-3">
		    	<div class="col-10">
					<label for="agree2">마케팅 이메일 수신을 원합니다(선택).
						 에어비앤비 회원 전용 할인, 추천 여행 정보, 마케팅 이메일, 푸시 알림을 보내드립니다. 
						 계정 설정 또는 마케팅 알림에서 언제든지 수신을 거부할 수 있습니다.
					</label>
				</div>
				<div class="col-2 ps-5">
					<input type="checkbox" id="agree2" >
				</div>
		    </div>
        	<div>
        		동의 및 계속하기를 선택하여 에어비앤비 <strong>서비스 약관</strong>, <strong>결제 서비스 약관</strong>, 
        		<strong>위치기반서비스 이용약관</strong>, <strong>차별 금지 정책</strong>, <strong>개인정보 처리방침</strong>에 동의합니다.
        	</div>
        	<div class="d-grid gap-2 my-4">
        	<button type="button" class="btn p-3" id="btn-next2">동의 및 계속하기</button>
        	</div>
        </form>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">

$(function () {
	
	let $firstName = $(":input[name=firstName]");
	let $lastName = $(":input[name=lastName]");
	let $birthDate = $(":input[name=birthDate]");
	let $email = $(":input[name=email]");
	let $password = $(":input[name=password]");
	
	let email = $email.val().trim();
	

	$("#btn-next1").click(function () {
		  'use strict'
		  
		  // Fetch all the forms we want to apply custom Bootstrap validation styles to
		  var forms = document.querySelectorAll('.needs-validation')

		  // Loop over them and prevent submission
		  Array.prototype.slice.call(forms)
		    .forEach(function (form) {
		      form.addEventListener('submit', function (event) {
		        if (!form.checkValidity()) {
		          event.preventDefault();
		          event.stopPropagation();
		        }

		        form.classList.add('was-validated');
		      }, false)
		    })
		});
	
	$firstName.keyup(function() {
		$("#name-helper1").html('');
		
		let firstName = $firstName.val().trim();
		if(firstName == "") {
			$("#name-helper1").html('<i class="fa-solid fa-circle-exclamation"></i><span>이름을 입력하세요</span>');
			return false;
		} 
	});
	
	$lastName.keyup(function() {
		$("#name-helper1").html('');
		let lastName = $lastName.val().trim();
		if(lastName == "") {
			$("#name-helper1").html('<i class="fa-solid fa-circle-exclamation"></i><span>성을 입력하세요</span>');
			return false;
		}
	});
	
	
	$("#btn-next2").click(function() {
		
		let firstName = $firstName.val().trim();
		if(firstName == "") {
			$("#name-helper1").toggleClass("d-none");
			return false;
		}
		let lastName = $lastName.val().trim();
		if(lastName == "") {
			$("#name-helper1 span").text("성을 입력하세요.");
			//$("#name-helper1").toggleClass("d-none");
			return false;
		}
		
		
		
	});
	
	
	// 비밀번호 숨기기&표시 
	$("#expose-password").click(function() {
		
		if($("#expose-password").text() == "표시") {
			$password.attr("type", "text");
			$("#expose-password").text("숨기기");
		} else {
			$password.attr("type", "password");
			$("#expose-password").text("표시");
		}
	});
	
	$password.keyup(function() {
		let password = $password.val().trim();
		let firstName = $(":input[name=firstName]").val();
		const reg = /^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/;
		
		if(password.includes(firstName) || password.includes(email)) {
			console.log("포함에러");
		}
		
		if(!reg.test(password)) {
			$("#password-helper .reg").toggleClass("d-none");
		}
		
	});
	
})

</script>
</body>
</html>