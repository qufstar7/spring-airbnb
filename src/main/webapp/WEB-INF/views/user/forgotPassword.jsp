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
<title>Insert title here</title>
<style type="text/css">

	.modal-dialog {
		width: 550px;
	}
</style>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="modal" tabindex="-1" style="display: flex !important;">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title fw-bold w-100 text-center fs-6">비밀번호를 잊으셨나요?</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>계정으로 사용하는 이메일 주소를 입력하시면, 비밀번호 재설정 링크를 전송해 드립니다.</p>
        <div class="form-floating mb-2">
			     	<input type="text" class="form-control outline" name="email" placeholder="이메일" required >
			     	<label for="floatingInput">이메일</label>
			     	<div class="invalid-feedback">
			     		<i class="fa-solid fa-circle-exclamation"></i>  이메일을 입력해주세요
			     	</div>
		</div>
		<div id="div-test" class="fs-6" style="color: red; font-weight: bold;">
			
		</div>
      	<div class="d-grid gap-2" style="margin-top: 40px;">
      		<button type="button" class="btn btn-dark fs-6 fw-bold py-2" id="test"  data-bs-dismiss="modal" aria-label="Close">재설정 링크 전송하기</button>
      	</div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">

$(function () {
	
	
	let $email = $(":input[name=email]");
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
	
	$("#test").click(function() {
		if(!validEmail) {
			$email.focus();
			$email.keyup();
			return false;
		}
		//$(".btn-close").click();
		
		let email = $email.val().trim();
		console.log(email);
		
		$.getJSON("/user/checkEmail", "email=" + email, function(result) {
			
			// 사용자가 입력한 이메일이 db에 존재하면 비밀번호입력모달(로그인), 그렇지 않으면 회원가입모달창을 띄운다.
			if(result.exist) {
				/* $(":input[name=loginEmail]").val(email);
				loginPasswordmodal.show(); */
				console.log("존재하는 이메일");
				return;
			} else {
				$email.val("").removeClass("is-valid");
				//$("#div-test").text(email + "의 계정이 존재하지 않습니다. 다른 이메일 또는 잘못된 이메일로 가입하셨을 수 있습니다.");
				$("#div-test").html('<i class="bi bi-exclamation-circle fw-bold"></i> ' + email + '의 계정이 존재하지 않습니다. 다른 이메일 또는 잘못된 이메일로 가입하셨을 수 있습니다.')
				return;
			}
		});
	});
})

</script>
</body>
</html>