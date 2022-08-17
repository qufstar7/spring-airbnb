<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preload" href="${path}/resources/css/hostingstyle.css"
	as="style">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>숙소 유형 선택</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/hostingstyle.css">
</head>
<body>

	<!-- 로고 홈링크 -->
	<a id="logo-link" href="/">
		<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"	aria-label="에어비앤비 홈페이지" role="img" focusable="false">
			<path d="M16 1c2.008 0 3.463.963 4.751 3.269l.533 1.025c1.954 3.83 6.114 12.54 7.1 14.836l.145.353c.667 1.591.91 2.472.96 3.396l.01.415.001.228c0 4.062-2.877 6.478-6.357 6.478-2.224 0-4.556-1.258-6.709-3.386l-.257-.26-.172-.179h-.011l-.176.185c-2.044 2.1-4.267 3.42-6.414 3.615l-.28.019-.267.006C5.377 31 2.5 28.584 2.5 24.522l.005-.469c.026-.928.23-1.768.83-3.244l.216-.524c.966-2.298 6.083-12.989 7.707-16.034C12.537 1.963 13.992 1 16 1zm0 2c-1.239 0-2.053.539-2.987 2.21l-.523 1.008c-1.926 3.776-6.06 12.43-7.031 14.692l-.345.836c-.427 1.071-.573 1.655-.605 2.24l-.009.33v.206C4.5 27.395 6.411 29 8.857 29c1.773 0 3.87-1.236 5.831-3.354-2.295-2.938-3.855-6.45-3.855-8.91 0-2.913 1.933-5.386 5.178-5.42 3.223.034 5.156 2.507 5.156 5.42 0 2.456-1.555 5.96-3.855 8.907C19.277 27.766 21.37 29 23.142 29c2.447 0 4.358-1.605 4.358-4.478l-.004-.411c-.019-.672-.17-1.296-.714-2.62l-.248-.6c-1.065-2.478-5.993-12.768-7.538-15.664C18.053 3.539 17.24 3 16 3zm.01 10.316c-2.01.021-3.177 1.514-3.177 3.42 0 1.797 1.18 4.58 2.955 7.044l.21.287.174-.234c1.73-2.385 2.898-5.066 2.989-6.875l.006-.221c0-1.906-1.167-3.4-3.156-3.421h-.001z"></path>
		</svg>
	</a>

	<!-- 전체 박스 -->
	<div class="host-box">
	
		<!-- 왼쪽 영역 -->
		<div id="left-div">
			<!-- leftDiv text -->
			<div class="align-self-center m-5">
				<div role="text" class="left-main-text">호스팅할 숙소 유형을 알려주세요</div>
			</div>
		</div>

		<!-- 오른쪽 영역 -->
		<div id="right-div">
			<!-- rightDiv header nav -->
			<div class="right-div-header">
				<nav class="navbar navbar-expand-lg navbar-light p-4">
					<div class="container-fluid flex-row-reverse">
						<div id="navbarNav">
							<ul class="navbar-nav">
								<li class="nav-item nav-ask-superhost"><a
									class="profile-btn right-nav-btn nav-link active border rounded-pill"
									href="">
										<div>
											<img class="sm-profile-img front-img"
												src="/resources/images/host/julian-wan.jpg"
												aria-hidden="true"> <img
												class="sm-profile-img middle-img"
												src="/resources/images/host/jurica-koletic.jpg"
												aria-hidden="true"> <img
												class="sm-profile-img back-img"
												src="/resources/images/host/michael-dam.jpg"
												aria-hidden="true">
										</div> <span class="profile-text">${LOGIN_USER.name }님의 숙소
											등록하기</span>
								</a></li>
								<li class="nav-item"><a
									class="right-nav-btn nav-link active border rounded-pill"
									href="">도움말</a></li>
								<li class="nav-item"><a
									class="right-nav-btn nav-link active border rounded-pill"
									href="">저장 및 나가기</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>

			<!-- rightDiv main -->
			<div class="main-box align-self-center bg-white">
				<form id="form-select-type" method="post" action="/host/submitTypes">
					<!--일반숙소유형선택 -->
					<div id="box-buttons" class="bd-highlight">
						<!-- 일반숙소유형 선택버튼 -->
						<div id="right-content-box" class="text-center">
							<div class="py-3">
								<c:forEach var="type" items="${accMainTypes }">
									<button
										class="btn btn-types btn-maintypes bg-white container p-3 m-2"
										type="button" role="radio" data-type="${type.no }">
										<div class="float-start m-3">
											<div class="text-lg-center fw-bolder text-dark">${type.name }</div>
										</div>
										<div class="float-end">
											<div>
												<img
													src="/resources/images/acctype/maintype/${type.imageName }.jpg"
													alt="type image" style="width: 56px; height: 56px;"
													class="main-type-img img-fluid rounded float-end">
											</div>
										</div>
									</button>
								</c:forEach>
							</div>
						</div>
						<input class="hiddenField1" type="hidden" name="mainType" value="0">
						<input class="hiddenField2" type="hidden" name="subType" value="0">
						<input class="hiddenField3" type="hidden" name="privacyType" value="0">
					</div>
				</form>
			</div>

			<!-- rightDiv footer -->
			<footer class="footer mt-auto py-3 bg-light">
				<div class="container-fluid">
					<!-- 진행상황 bar -->
					<div class="progress mb-2">
						<div class="progress-bar bg-dark" style="width: 8.3%;"
							role="progressbar" aria-valuenow="8.3" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<!-- 뒤로/다음버튼 -->
					<div class="">
						<button id="back-btn"
							class="float-start btn btn-none ms-4 fs-6 text-decoration-underline text-black border-0"
							type="button" onclick="history.go(-1)"
							style="padding-top: 14px">뒤로</button>
					</div>
					<div class="">
						<button id="next-btn" type="button" form="form-select-type" 
							class="float-start btn btn-dark float-end me-5" 
							style="width: 80px; height: 48px;">
							다음</a>
					</div>
				</div>
			</footer>

		</div>

	</div>

	<script type="text/javascript">
$(function(){
	// 페이지 단계를 저장하는 전역변수
	let step = 0;
	
	// 페이지에 접속시 서버에서 저장된 번호의 유형이 선택되어 있게 한다.
	//$("#right-content-box>div>button:first").addClass("btn-type-checked");
	
	// 메인 타입을 선택할 때	
	$("#right-content-box").on("click", '.btn-maintypes', function() {
		// 버튼 체크 중 속성 추가
		$(".btn-maintypes").removeClass("btn-type-checked");
		$(this).addClass("btn-type-checked");
		
		// 클릭한 버튼의 data-type 속성값 저장
		let type1 = $(this).attr("data-type");	
		
		// 기존의 히든필드 삭제
 		if ($(".hiddenField1")) {
			$(".hiddenField1").remove();
		}		
		// 히든필드 생성 및 추가
		let hiddenField1 = '<input class="hiddenField1" type="hidden" name="mainType" value="' + Number(type1) + '">';
		$("#box-buttons").append(hiddenField1);
	});
	
	// 서브 타입을 선택할 때
	$("#right-content-box").on("click", '.btn-subtypes', function() {
		// 버튼 체크 중 속성 추가
		$(".btn-subtypes").removeClass("btn-type-checked");
		$(this).addClass("btn-type-checked");
		
		// 클릭한 버튼의 data-type 속성값 저장
		let type2 = $(this).attr("data-type");

		// 기존의 히든필드 삭제
 		if ($(".hiddenField2")) {
			$(".hiddenField2").remove();
		}		
		// 히든필드 생성 및 추가
		let hiddenField2 = '<input class="hiddenField2" type="hidden" name="subType" value="' + Number(type2) + '">';
		$("#box-buttons").append(hiddenField2);
	});
	
	// 프라이버시 타입을 선택할 때
	$("#right-content-box").on("click", '.btn-privacytypes', function() {
		// 버튼 체크 중 속성 추가
		$(".btn-privacytypes").removeClass("btn-type-checked");
		$(this).addClass("btn-type-checked");
		
		// 클릭한 버튼의 data-type 속성값 저장
		let type3 = $(this).attr("data-type");

		// 기존의 히든필드 삭제
 		if ($(".hiddenField3")) {
			$(".hiddenField3").remove();
		}		
		// 히든필드 생성 및 추가
		let hiddenField3 = '<input class="hiddenField3" type="hidden" name="privacyType" value="' + Number(type3) + '">';
		$("#box-buttons").append(hiddenField3);
		
 		// 다음버튼 누르면 주소등록페이지로 갈수있게 버튼 속성 변경
		$("#next-btn").attr("type", "submit");

	});
	
	// 다음 버튼 클릭시
	$("#next-btn").click(function() {
		let hf1 = Number($(".hiddenField1").val());
		let hf2 = Number($(".hiddenField2").val());
		let hf3 = Number($(".hiddenFiled3").val());
		
		// 유형을 선택하지 않고 다음버튼 클릭시
		if (step == 0 && hf1 == 0 || step == 1 && hf2 == 0 || step == 2  && hf3 == 0) {
			alert("숙소 유형을 선택해주세요.");
		}
		
		// step0, 메인유형 선택 후 다음버튼 클릭시
		if (step == 0 && hf1 != 0) {
			submitMainType();
			$(".progress-bar").css("width","16.6%");
			$(".progress-bar").attr("aria-valuenow","16.6");
		}
		
		// step1, 서브유형 선택 후 다음버튼 클릭시
		if (step == 1 && hf2 != 0) {
			submitSubType();
			$(".progress-bar").css("width","24.9%");
			$(".progress-bar").attr("aria-valuenow","24.9");
		}
		
		// step2, 프라이버시유형 선택 후 다음버튼 클릭시
/* 		if (step == 2 && hf3 != 0) {
			
			$("#form-select-type").submit(function( event ) {
		  		alert("Handler for .submit() called.");
 				event.preventDefault();
			});
			//#(this).location.href = "/host/insertType?privacyType=" + $(".hiddenField3").val();
			location.href = '/host/location';
		} */
		
	});
	
	// 뒤로가기 버튼 클릭시
/* 	$("#back-btn").click(function() {
		if (step == 0) {
			location.href = '/host/become-a-host';
		}
		location.href = '/host/types';
		
	});	 */

	
	// 메인타입 제출, 서브타입 조회
	function submitMainType() {
		step = 1;
		let $box = $("#right-content-box").empty();
		
		$.getJSON("/host/searchType1?mainType=" + $(".hiddenField1").val() , function(subTypes) {
			if (subTypes.length == 0) {
				let content = `
					<div class="col-12">
						<p class="text-center">검색결과가 존재하지 않습니다.</p>
					</div>
				`;
				$box.append(content);
			} else {
	            $.each(subTypes, function(index, subType) {
	            	let content = '';
	            	content += '<div class="">';
	            	content += '	<button	class="btn btn-types btn-subtypes bg-white container m-2" type="button" role="radio" data-type='+ subType.no +'>';
	            	content += '		<div class="m-3 mb-0 text-lg-start fw-bolder text-dark" style="font-size:18px;">'+ subType.name +'</div>';
            		content += '		<div class="m-3 mt-2 text-start sub-type-description">'+subType.description+'</div>';
	            	content += '	</button>';
	            	content += '</div>';
 	            	
	                $box.append(content);
                }) 
			}
		})
	}
	
	// 서브타입 제출, 프라이버시타입 조회
	function submitSubType() {
		step = 2;
		let $box = $("#right-content-box").empty();
		
		$.getJSON("/host/searchType2?subType=" + $(".hiddenField2").val(), function(privacyTypes) {
			if (privacyTypes.length == 0) {
				let content = `
					<div class="col-12">
						<p class="text-center">검색결과가 존재하지 않습니다.</p>
					</div>
				`;
				$box.append(content);
			} else {
	            $.each(privacyTypes, function(index, privacyType) {
	            	let content = '';
	            	content += '<div class="">';
	            	content += '	<button	class="btn btn-types btn-privacytypes bg-white container m-2" type="button" role="radio" data-type='+ privacyType.no +'>';
	            	content += '		<div class="m-3 text-lg-start fw-bolder text-dark" style="font-size:18px;">'+ privacyType.name +'</div>';
	            	content += '	</button>';
	            	content += '</div>';
 	            	
	                $box.append(content);
                }) 
			}
		})
		$("#next-btn").attr("onclick","location.href='/host/submit'");		
		
	}
	
})

</script>
</body>
</html>