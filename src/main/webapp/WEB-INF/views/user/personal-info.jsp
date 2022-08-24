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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="icon" href="../../../resources/aircnc.png">
<title>계정관리-에어씨엔씨</title>
<style type="text/css">
	.btn-link {color: black; font-weight: bold;}
	hr {color: rgba(0,0,0, 0.5); }
	.container {width: 58%;}
	#div-right { border: 1px solid #DDDDDD !important;
    			border-radius: 12px !important;
   				padding: 24px !important;}
   .myButton {
    margin-top:15px;
	box-shadow:inset 0px 39px 0px -24px #e67a73;
	background-color:#e4685d;
	border-radius:6px;
	border:1px solid #ffffff;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-weight: bold;
	font-size:16px;
	padding:10px 25px;
	text-decoration:none;
	text-shadow:0px 1px 0px #b23e35;
	}
	.myButton:hover {
		background-color:#eb675e;
	}
	.myButton:active {
		position:relative;
		top:1px;
	}

   
   	
   
</style>

</head>
<body>
<%@ include file="../common/nav3.jsp" %>
<div class="container mt-5">
	<div class="mb-5">
		<small class="fw-bold">계정 > 개인정보</small>
		<h3 class="fw-bold mt-2">개인정보</h3>
	</div>
	<form action="" id="form-update-profileInfo">
	<div class="row d-flex justify-content-between">
		<div class="col-7">
			<div class="mb-4">
				<div class="d-flex justify-content-between">
					<span>실명</span>
					<button type="button" class="btn btn-link p-0" id="btn-name">수정</button>
				</div>
				<span id="span-name">${user.name}</span>
				<div id="div-name" class="d-none">
					<span><small>허가증이나 여권 등 여행 서류에 기재되어 있는 이름을 말합니다.</small></span>
					<div class="form-floating mt-3">
				     	<input type="text" class="form-control outline" name="name" placeholder="실명" value="${user.name}" required >
				     	<label for="floatingInput">실명</label>
				     	<div class="invalid-feedback">
				     		<i class="fa-solid fa-circle-exclamation"></i>  실명은 반드시 입력해야 합니다
				     	</div>
				     	<button type="button" class="myButton" id="btn-update-name">저장</button>
					</div>
				</div>
			</div>
			<hr/>
			<div class="mb-4">
				<div class="d-flex justify-content-between">
					<span>성별</span>
					<button type="button" class="btn btn-link p-0" id="btn-gender">수정</button>
				</div>
				<span id="span-gender">${user.gender}</span>
				<div class="form-floating d-none" id="div-gender">
				  <select class="form-select" name="gender" id="floatingSelect" aria-label="Floating label select example">
				    <option value="male" ${user.gender == 'male' ? 'selected' : '' }>male</option>
				    <option value="female" ${user.gender == 'female' ? 'selected' : '' }>female</option>
				    <option value="else" ${user.gender == 'else' ? 'selected' : '' }>else</option>
				  </select>
				  <label for="floatingSelect">성별</label>
				  <button type="button" class="myButton" id="btn-update-gender">저장</button>
				</div>
			</div>
			<hr/>
			<div class="mb-4">
				<div class="d-flex justify-content-between">
					<span>생년월일</span>
					<button type="button" class="btn btn-link p-0" id="btn-birthDate">수정</button>
				</div>
				<span id="span-birthDate">****/**/**</span>
				<div class="form-floating d-none" id="div-birthDate">
				  <input type="date" class="form-control" name="birthDate" id="floatingDate" placeholder="생년월일" value='<fmt:formatDate value="${user.birthDate}" pattern="yyyy-MM-dd"/>'>
				  <label for="floatingDate">생년월일</label>
				  <button type="button" class="myButton" id="btn-update-birthDate">저장</button>
				</div>
			</div>
			<hr/>
			<div class="mb-4">
				<div class="d-flex justify-content-between">
					<span>이메일 주소</span>
					<!-- <button class="btn btn-link p-0" id="btn-email">수정</button> -->
				</div>
				<span id="span-email">${user.email }</span>
	<!--		<div class="d-none" id="div-email">
					<span><small>언제든지 확인하실 수 있는 주소를 사용하세요</small></span>
					<div class="form-floating mt-3">
				     	<input type="text" class="form-control outline" name="email" placeholder="이메일" required >
				     	<label for="floatingInput">이메일</label>
				     	<div class="invalid-feedback">
				     		<i class="fa-solid fa-circle-exclamation"></i>  이메일 주소가 올바르지 않습니다.
				     	</div>
				     	<button class="myButton">저장</button>
					</div>   
				</div>   -->
			</div>
			<hr/>
			<div class="mb-4">
			
				<div class="d-flex justify-content-between">
					<span>전화번호</span>
					<button type="button" class="btn btn-link p-0" id="btn-phone">수정</button>
				</div>
				<span id="span-phone">${user.phone }</span><br/>
				<div class="mt-2">
					<small >연락처 번호(예약이 확정된 게스트와 에어비앤비가 연락할 번호) 다른 전화번호를 추가</small><br>
					<small>하고 번호별 사용 목적을 정하실 수 있습니다.</small>
				</div>
			
				<div class="form-floating mt-3 d-none" id="div-phone">
				     	<input type="text" class="form-control outline" name="phone" placeholder="전화번호" value="${user.phone }">
				     	<label for="floatingInput">전화번호</label>
				     	<button type="button" class="myButton" id="btn-update-phone">저장</button>
					</div>
			</div>
			<hr/>
			<div class="mb-4">
				<div class="d-flex justify-content-between">
					<span>정부 발급 신분증</span>
					<button type="button" class="btn btn-link p-0">추가</button>
				</div>
				<small>제공되지 않음</small>
			</div>
			<hr/>
			<div class="mb-4">
				<div class="d-flex justify-content-between">
					<span>주소</span>
					<button type="button" class="btn btn-link p-0" id="btn-address">수정</button>
				</div>
				<span id="span-address">${not empty user.address ? user.address : "제공되지 않음"}</span>
				<div id="div-addr" class="d-none">
					<table>
						<tr>
						<td class="d-grid gap-2">
							<div>
								<input type="text" name="postcode" id="postcode" readonly placeholder="우편번호">
								<button type="button" class="btn btn-outline-secondary btn-sm" id="btn-find-addr">우편번호 찾기</button>
							</div> 
							<input type="text" name="address" id="addr" placeholder="주소" readonly />
							<input type="text" name="detailAddr" id="detailAddr" placeholder="상세주소" />
						</td>
						</tr>
					</table>
					<button type="button" class="myButton" id="btn-update-address">저장</button>
				</div>
			</div>
			<hr/>
		</div>
		<div class="col-4">
			<div id="div-right">
				<svg viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg" style="display:block;height:48px;width:48px;fill:#E31C5F;stroke:currentColor" aria-hidden="true" role="presentation" focusable="false"><g><g stroke="none">
				<path d="M27 5l.585.005c4.29.076 8.837.984 13.645 2.737l.77.288V35.4l-.008.13a1 1 0 0 1-.47.724l-.116.06L27 42.716V25a1 1 0 0 0-.883-.993L26 24H12V8.029l.77-.286c4.797-1.75 9.336-2.658 13.62-2.737L27 5z" fill-opacity=".2"></path>
				<path d="M27 1c5.599 0 11.518 1.275 17.755 3.816a2 2 0 0 1 1.239 1.691L46 6.67V35.4a5 5 0 0 1-2.764 4.472l-.205.097-15.594 6.93L27 47l-2.461-1h2.451a.01.01 0 0 0 .007-.003L27 45.99v-1.085l15.218-6.763a3 3 0 0 0 1.757-2.351l.019-.194.006-.196V6.669l-.692-.278C37.557 4.128 32.121 3 27 3S16.443 4.128 10.692 6.391L10 6.67 9.999 24H8V6.669a2 2 0 0 1 1.098-1.786l.147-.067C15.483 2.275 21.401 1 27 1z"></path></g>
				<g fill="none" stroke-width="2"><path d="M4 24h22a1 1 0 0 1 1 1v20.99a.01.01 0 0 1-.01.01H4a1 1 0 0 1-1-1V25a1 1 0 0 1 1-1z"></path><path d="M21 25v-5a6 6 0 1 0-12 0v5"></path><circle cx="15" cy="35" r="2"></circle></g></g></svg>
				<h5 class="fw-bold mt-3">여기에 내 개인정보가 표시되지 않는 이유가 무엇인가요?</h5>
				<span class="">신분이 노출되지 않도록 일부 계정 정보가 숨김 처리되었습니다.</span>
				<hr/>
				<svg viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg" style="display:block;height:48px;width:48px;fill:#E31C5F;stroke:currentColor" aria-hidden="true" role="presentation" focusable="false"><g stroke="none">
				<path d="m39 15.999v28.001h-30v-28.001z" fill-opacity=".2"></path>
				<path d="m24 0c5.4292399 0 9.8479317 4.32667079 9.9961582 9.72009516l.0038418.27990484v2h7c1.0543618 0 1.9181651.8158778 1.9945143 1.8507377l.0054857.1492623v32c0 1.0543618-.8158778 1.9181651-1.8507377 1.9945143l-.1492623.0054857h-34c-1.0543618 0-1.91816512-.8158778-1.99451426-1.8507377l-.00548574-.1492623v-32c0-1.0543618.81587779-1.9181651 1.85073766-1.9945143l.14926234-.0054857h7v-2c0-5.5228475 4.4771525-10 10-10zm17 14h-34v32h34zm-17 14c1.6568542 0 3 1.3431458 3 3s-1.3431458 3-3 3-3-1.3431458-3-3 1.3431458-3 3-3zm0 2c-.5522847 0-1 .4477153-1 1s.4477153 1 1 1 1-.4477153 1-1-.4477153-1-1-1zm0-28c-4.3349143 0-7.8645429 3.44783777-7.9961932 7.75082067l-.0038068.24917933v2h16v-2c0-4.418278-3.581722-8-8-8z"></path></g></svg>
				<h5 class="fw-bold mt-3">수정할 수 있는 세부 정보는 무엇인가요?</h5>
				<span>에어비앤비에서 본인 인증 시 사용하는 세부 정보는 변경할 수 없습니다. 연락처 정보와 일부 개인정보는 수정할 수 있지만,</span><br/>
				<span>다음번 예약 또는 숙소를 등록할 때 본인 인증 절차를 거쳐야 할 수도 있습니다.</span>
				<hr/>
				<svg viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg" style="display:block;height:48px;width:48px;fill:#E31C5F;stroke:currentColor" aria-hidden="true" role="presentation" focusable="false"><g stroke="none">
				<path d="M24 9C14.946 9 7.125 15.065 4.74 23.591L4.63 24l.013.054c2.235 8.596 9.968 14.78 18.99 14.943L24 39c9.053 0 16.875-6.064 19.26-14.59l.11-.411-.013-.052c-2.234-8.597-9.968-14.78-18.99-14.944L24 9z" fill-opacity=".2"></path>
				<path d="M24 5c11.18 0 20.794 7.705 23.346 18.413l.133.587-.133.587C44.794 35.295 35.181 43 24 43 12.82 43 3.206 35.295.654 24.588l-.133-.587.048-.216C2.985 12.884 12.69 5 24 5zm0 2C13.88 7 5.16 13.887 2.691 23.509l-.12.492.032.14c2.288 9.564 10.728 16.513 20.65 16.846l.377.01L24 41c10.243 0 19.052-7.056 21.397-16.861l.031-.14-.031-.138c-2.288-9.566-10.728-16.515-20.65-16.848l-.377-.01L24 7zm0 10a7 7 0 1 1 0 14 7 7 0 0 1 0-14zm0 2a5 5 0 1 0 0 10 5 5 0 0 0 0-10z"></path></g></svg>
				<h5 class="fw-bold mt-3">다른 사람에게 어떤 정보가 공개되나요?</h5>
				<span>에어비앤비는 예약이 확정된 후에만 호스트 및 게스트의 연락처 정보를 공개합니다.</span>
			</div>
		</div>
		
	</div>
	</form>
</div>
<script type="text/javascript">
	// 생년월일 수정 시 오늘 이후 날짜 제한하기
	let now_utc = Date.now() // 지금 날짜를 밀리초로
	// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
	let timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
	// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
	let today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	document.getElementById("floatingDate").setAttribute("max", today);

$(function () {
	$inputName = $(":input[name=name]");
	let validName = true;
	$inputName.keyup(function() {
		let name = $inputName.val().trim();
		if (!name) {
			$inputName.removeClass("is-valid").addClass("is-invalid");
			validName = false;
			return;
		}
		
		$inputName.addClass("is-valid").removeClass("is-invalid");
		validName = true;
	});
	
	$("#btn-name").click(function() {
		if($(this).text() == '수정') {
			$(this).text('취소');
			$("#span-name").addClass("d-none");
			$("#div-name").removeClass("d-none");
		} else {
			$(this).text('수정');
			$("#span-name").removeClass("d-none");
			$("#div-name").addClass("d-none");
		}
	});
	
	$("#btn-update-name").click(function() {
		if(!validName) {
			$inputName.focus();
			return;
		}
		
		let querystring = $("#form-update-profileInfo").serialize();
		$.post("/user/update/personalInfo", querystring, function(data) {
			let updatedUser = data.user
			$("#span-name").text(updatedUser.name);
			$("#btn-name").click();
		})
		
		
	});
	
	$("#btn-gender").click(function() {
		if($(this).text() == '수정') {
			$(this).text('취소');
			$("#span-gender").addClass("d-none");
			$("#div-gender").removeClass("d-none");
		} else {
			$(this).text('수정');
			$("#span-gender").removeClass("d-none");
			$("#div-gender").addClass("d-none");
		}
	});
	
	$("#btn-update-gender").click(function() {
		let querystring = $("#form-update-profileInfo").serialize();
		$.post("/user/update/personalInfo", querystring, function(data) {
			let updatedUser = data.user
			$("#span-gender").text(updatedUser.gender);
			$("#btn-gender").click();
		})
	});
	
	$("#btn-birthDate").click(function() {
		if($(this).text() == '수정') {
			$(this).text('취소');
			$("#span-birthDate").addClass("d-none");
			$("#div-birthDate").removeClass("d-none");
		} else {
			$(this).text('수정');
			$("#span-birthDate").removeClass("d-none");
			$("#div-birthDate").addClass("d-none");
		}
	});
	
	$("#btn-update-birthDate").click(function() {
		let querystring = $("#form-update-profileInfo").serialize();
		$.post("/user/update/personalInfo", querystring, function(data) {
			let birthDate = data.user.birthDate;
			$("#btn-birthDate").click();
		});
	});
	
	/* $("#btn-email").click(function() {
		if($(this).text() == '수정') {
			$(this).text('취소');
			$("#span-email").addClass("d-none");
			$("#div-email").removeClass("d-none");
		} else {
			$(this).text('수정');
			$("#span-email").removeClass("d-none");
			$("#div-email").addClass("d-none");
		}
	}); */
	
	/* $("#btn-add-phone").click(function() {
		if($(this).text() == '추가') {
			$(this).text('취소');
			$("#div-phone").removeClass("d-none");
		} else {
			$(this).text('추가');
			$("#div-phone").addClass("d-none");
		}
	}); */
	
	$("#btn-phone").click(function() {
		if($(this).text() == '수정') {
			$(this).text('취소');
			$("#div-phone").removeClass("d-none");
		} else {
			$(this).text('수정');
			$("#div-phone").addClass("d-none");
		}
	});
	
	$("#btn-update-phone").click(function() {
		let querystring = $("#form-update-profileInfo").serialize();
		$.post("/user/update/personalInfo", querystring, function(data) {
			$("#span-phone").text(data.user.phone);
			$("#btn-phone").click();
		});
	})
	
	$("#btn-address").click(function() {
		if($(this).text() == '수정') {
			$(this).text('취소');
			$("#div-addr").removeClass("d-none");
		} else {
			$(this).text('수정');
			$("#div-addr").addClass("d-none");
		}
	});
	
	$("#btn-update-address").click(function() {
		let querystring = $("#form-update-profileInfo").serialize();
		$.post("/user/update/personalInfo", querystring, function(data) {
			$("#span-address").text(data.user.address);
			$("#btn-address").click();
		})
	})
	
	$("#btn-find-addr").click(function() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("detailAddr").value = extraAddr;

				} else {
					document.getElementById("detailAddr").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("addr").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddr").focus();
			}
		}).open();
	});
	
	
	
})


</script>
</body>
</html>