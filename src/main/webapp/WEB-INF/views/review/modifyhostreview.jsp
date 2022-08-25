<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>나의 후기 수정하기</title>
<style type="text/css"> 
	
	#star-next-btn,
	#thumb-next-btn,
	#public-next-btn,
	#btn-add-guestreview,
	#private-next-btn {  
			background: white;
		    color: rgb(255, 90, 95);
		    font-size: large;
		    font-weight: bold;
		    border: 2px solid rgb(255, 90, 95);
	}
	
	#star-next-btn:hover,
	#thumb-next-btn:hover, 
	#public-next-btn:hover,
	#private-next-btn:hover,
	#btn-add-guestreview:hover {
			background: rgb(255, 90, 95) !important;
			color: white;
	}
	
	.endBtn {
			background: white;
			color: rgb(255, 90, 95) !important;
			border: 2px solid rgb(255, 90, 95);
		    font-size: large;
		    font-weight: bold;
	}
	
	#img {
		display : block;
		margin : auto;
	}
	
	.modal-content {		
		 	width: 100%;
	}
	
	.question 		{
		 	font-size: 18px; 
	}
	
	.bi-star  		{
		 	color: rgb(0, 166, 153); 
	}
	 
	.bi-star-fill   {
			color: rgb(0, 166, 153); 
	}
	
	.bi-hand-thumbs-down-fill   {
		 	color: rgb(0, 166, 153); 
	}
	
	.bi-hand-thumbs-up-fill   {
		 	color: rgb(0, 166, 153); 
	}
	 
	.gray 			{
		 	color: #323232; 
	}
	
	[type=radio] { 
			position: absolute;
			opacity: 0;
			width: 0;
			height: 0;
	}
	
	.houseImg {
			width: 200px;
			height: 200px;
	}
	
</style>
</head>
<body>
<div class="container">
<%@ include file="../common/nav.jsp"%>
<!-- form 시작 -->
<!-- 파라미터로 숙소 번호 받아야 한다. -->
<form class="mb-3" name="hostReview" id="host-review">		
<input type="hidden" id="user-type" name="userType" value="host" />	
<!-- Scrollable Modal -->
<div class="modal fade" id="exampleModalToggle1" aria-hidden="true"  data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="exampleModalToggleLabel1" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="exampleModalLabel1"><strong>평가 및 후기 수정</strong></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="mb-5">
					<h3>공개후기<span class="fs-5">  (필수항목)</span></h3>
					<p class="gray mb-4">14일 동안 후기를 작성할 수 있습니다. 후기 작성 기간 동안에는 게스트도 호스트에 대한 후기를 작성해야 호스트의 피드백을 읽을 수 있습니다. 
					      	   			후기 작성 기간이 종료되면, 호스트의 피드백이 공개됩니다. 후기 작성 가이드 라인을 살펴보세요.
					</p>
					<textarea name="public" id="public-text" cols="100" rows="5"  maxlength="500" style="resize:vertical; width:100%";" 
							  placeholder="호스트가 어떻게 회원님을 맞이하였나요? 숙소 설명은 명확하였나요? 숙소가 위치한 지역은 어떤가요?"></textarea>
					<p align="right">남은 글자 수 : <span id="test-length">( 500 / 500 )</span>자</p>
				</div>
				<div>
					<div class="mb-4">
						<h3>게스트 비공개 피드백<span class="fs-5">  (선택사항)</span></h3>
						<p>이 피드백은 비공개이며, 해당 게스트와 에어비앤비 직원 빛 서비스 제공자만 볼 수 있습니다.</p>
					</div>
					<div class="mb-5">
						<p><strong>피드백을 하거나 감사함을 표하세요.<strong></p>
						<textarea name="feedback" id="private-text" cols="100" rows="5" style="resize:vertical; width:100%;"></textarea>
						<p align="right">남은 글자 수 : <span id="private-length">( 500 / 500 )</span>자</p>
					</div>
				</div>			
			</div> 
			<div class="modal-footer">
				<button type="button" class="btn px-5 next" id="btn-comp-hostreview">완료</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true"  data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body mx-auto">
					<div class="px-5">
						<img src="/resources/logo.png" alt="logo" style="width:130px; height:130px" class="mb-3 mt-3" id="img">
						<br />
					</div>
					<div>	
						<h4><strong>리뷰 수정이 완료되었습니다!</strong><h4>
						<p class="fs-5 mb-5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;참여해 주셔서 감사합니다.</p>
					</div>
			</div>
			<div class="modal-footer mx-auto" >
				<button type="button" class="btn px-5 endBtn" id="btn-go-review" onclick="location.href='https://localhost/user/sentReview';">나의 후기로 가기</button>
				<button type="button" class="btn px-5 endBtn" id="btn-go-main" onclick="location.href='https://localhost/';">메인으로 가기</button>
	    	</button>
			</div>
		</div>
	</div>
</div>
</form>

</div>

<script type="text/javascript">
$(function() {
	
	let exampleModalToggle1 = new bootstrap.Modal(document.getElementById("exampleModalToggle1"));
	let exampleModalToggle2 = new bootstrap.Modal(document.getElementById("exampleModalToggle2"));
	
	let params = new URLSearchParams(document.location.search);
	let no = params.get("no");	// reviewNo
	
	$(document).ready(function() {
		$.ajax({
			type: 'GET',
			url: "review/review",				
			data: {no:no},
			dataType: 'json',
			success: function(data) {
				
				let item = data.item;
				$("#public-text").val(item.content);
				$("#positive-text").val(item.positiveFeedback);
				$("#feedback-text").val(item.nagativeFeedback);
				
				exampleModalToggle1.show();
			}
		})
	})

	$(".btn-close").click(function(){
		window.history.back();
	})

	// 후기 - 글자수 세는 함수
	$("#public-text").keyup(function() {
		let content = $(this).val();
		$("#test-length").text("( "+ ( 500 - parseInt(content.length)) +" / 500 )");
		
		if (content.length > 500) {
			alert("최대 500자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 500));
	        $('#test-length').text("( 0 / 500 )");
			
		}
	})
	
	// 공개 리뷰 미체크 확인
	// 비공개 리뷰는 필수가 아니다.
	$("#public-next-btn").click(function() {
		let existEmptyPublic = false;
		
		if($("#public-text").val() === "") {
			existEmptyPublic = true;
		}
		
		if(existEmptyPublic) {
			alert("내용을 입력해 주세요.");
			return false;
		}
	})
				
	// 비공개 후기 - 글자수 세는 함수
	$("#private-text").keyup(function() {
		let content = $(this).val();
		$("#private-length").text("( "+ ( 500 - parseInt(content.length)) +" / 500 )");
		
		if (content.length > 500) {
			alert("최대 500자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 500));
	        $('#private-length').text("( 0 / 500 )");
		}
	})
	
	$("#btn-comp-hostreview").click(function() {
		exampleModalToggle1.hide();
		exampleModalToggle2.show();
	})
	
	$("#btn-go-review").click(function() {
		window.location = "https://localhost/user/sentReview";
	})
	
	$("#btn-go-main").click(function() {
		window.location = "https://localhost/";
	})
	
	$("#btn-comp-hostreview").click(function() {
		let review = {
			content: $("#public-text").val(),	
			privateNote: $("#private-text").val(),	
			no: no
		}
		
		$.ajax({
			type: "PUT",							// HTTP 요청 방식
			url: '/review/modification',			// 요청 URL
			data: JSON.stringify(review),			// 서버로 보내는 데이터
			contentType: "application/json",		// 서버로 보내는 요청메세지의 컨텐츠 타입
			dataType: 'json',						// 서버로부터 받을 것으로 예상되는 응답메세지의 컨텐츠 타입
			success: function() {
				alert(data.message);
			}
		});
	})
});


</script>
</body>
</html>