<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preload" href="${path}/resources/css/hostingstyle.css" as="style">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>일반 건물 유형 선택</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/hostingstyle.css">
</head>
<body>
<!-- 숙소유형 선택 메인 -->
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
							<li class="nav-item nav-ask-superhost">
								<a class="profile-btn right-nav-btn nav-link active border rounded-pill" href="">
									<div>
										<img class="sm-profile-img front-img" 
										     src="/resources/images/host/julian-wan.jpg" aria-hidden="true"> 
										<img class="sm-profile-img middle-img" 
										     src="/resources/images/host/jurica-koletic.jpg" aria-hidden="true"> 
										<img class="sm-profile-img back-img" 
										     src="/resources/images/host/michael-dam.jpg" aria-hidden="true">
									</div> 
									<span class="profile-text">슈퍼호스트에게 물어보기</span>
								</a>
							</li>
							<li class="nav-item">
								<a class="right-nav-btn nav-link active border rounded-pill" href="">도움말</a>
							</li>
							<li class="nav-item">
								<a class="right-nav-btn nav-link active border rounded-pill" href="">저장 및 나가기</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</div>

		<!-- rightDiv main -->
		<div class="main-box align-self-center bg-white">
		<form id="form-select-type">
			<!--일반숙소유형선택 -->
			<div id="box-buttons" class="bd-highlight">
				<!-- 일반숙소유형 선택버튼 -->
				<div id="right-content-box" class="text-center">
					<div class="py-3">
						<c:forEach var="type" items="${accMainTypes }">
						<button	class="btn btn-types btn-maintypes bg-white container p-3 m-2" 
						        type="button" role="radio" data-type="${type.no }">
							<div class="float-start m-3">
								<div class="text-lg-center fw-bolder text-dark">${type.name }</div>
							</div>
							<div class="float-end">
								<div>
									<img src="/resources/images/acctype/maintype/${type.imageName }.jpg" 
										 alt="type image"
										 style="width: 56px; height: 56px;"
										 class="main-type-img img-fluid rounded float-end">
								</div>
							</div>
						</button>
						</c:forEach>
					</div>
				</div>
				<input class="hiddenField1" type="hidden" name="typeno" value="0">
				<input class="hiddenField2" type="hidden" name="typeno" value="0">
			</div>
		</form>
		</div>

		<!-- rightDiv footer -->
		<footer class="footer mt-auto py-3 bg-light">
			<div class="container-fluid">
				<!-- 진행상황 bar -->
				<div class="progress mb-2">
			    	<div class="progress-bar bg-dark" style="width:10%;" role="progressbar" 
			    	     aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
				</div>
				<!-- 뒤로/다음버튼 -->
				<div class="">
					<button id="back-btn"
						class="float-start btn btn-none ms-4 fs-6 text-decoration-underline text-black border-0"
						type="button" onclick="location.href='/host/become-a-host'" style="padding-top:14px">뒤로</button>
				</div>
				<div class="">
					<button id="next-btn"
						class="float-start btn btn-dark float-end me-5" type="button"
						onclick="" style="width:80px;height:48px;">
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
		let hiddenField1 = '<input class="hiddenField1" type="hidden" name="typeno" value="' + Number(type1) + '">';
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
		let hiddenField2 = '<input class="hiddenField2" type="hidden" name="typeno" value="' + Number(type2) + '">';
		$("#box-buttons").append(hiddenField2);
	});
	
	// 다음 버튼 클릭시
	$("#next-btn").click(function() {
		let hf1 = Number($(".hiddenField1").val());
		let hf2 = Number($(".hiddenField2").val());
		let hf3 = Number($(".hiddenFiled3").val());
		
		if (step == 0 && hf1 == 0 || step == 1 && hf2 == 0 || step == 3  && hf3 == 0) {
			alert("숙소 유형을 선택해주세요.");
		} 
		
		if (step == 0 && hf1 != 0) {
			searchSubTypes();
		}
		
		if (step == 1 && hf2 != 0) {
			goToPrivacyType();
		}
		
	});
	
	// 뒤로가기 버튼 클릭시
/* 	$("#next-btn").click(function() {
		goBack();
	});	
	
	function goBack() {
		
	} */
	
	// 서브 타입 조회
	function searchSubTypes() {
		step = 1;
		let $box = $("#right-content-box").empty();
		
		$.getJSON("/host/search?mainType=" + $(".hiddenField1").val() , function(subTypes) {
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
	
	// 프라이버시 타입 조회
	function goToPrivacyType() {
		let $box = $("#right-content-box").empty();
		
		$.getJSON("/host/search2", function(privacyTypes) {
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
	            	content += '	<button	class="btn btn-types btn-subtypes bg-white container m-2" type="button" role="radio" data-type='+ privacyType.no +'>';
	            	content += '		<div class="m-3 text-lg-start fw-bolder text-dark" style="font-size:18px;">'+ privacyType.name +'</div>';
	            	content += '	</button>';
	            	content += '</div>';
 	            	
	                $box.append(content);
                }) 
			}
		})
		
		$("#next-btn").attr("onclick","location.href='/host/location'");
		
	}
	
})

</script>
</body>
</html>