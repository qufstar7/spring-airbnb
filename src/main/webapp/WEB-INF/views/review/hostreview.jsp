<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<style type="text/css"> 
	
	#star-next-btn,
	#public-next-btn,
	#private-next-btn,
	#again-next-btn {
			background: white; 
			color: rgb(0, 166, 153);
			font-size: large;
			font-weight: bold;
			border: 2px solid rgb(0, 166, 153);
	}
	
	#star-next-btn:hover,
	#again-next-btn:hover, 
	#public-next-btn:hover,
	#private-next-btn:hover {
			background: rgb(0, 166, 153) !important;
			color: white;
	}
	
	.modal-content {		
			width: 100%;
	}
	
	.question 		{
		 	font-size: 18px; 
	}
	
	.bi-star  		{
		 	color: rgb(255, 90, 95); 
	}
	 
	.bi-star-fill   {
		 	color: rgb(255, 90, 95); 
	}
	
	.bi-emoji-frown-fill   {
		 	color: rgb(255, 90, 95); 
	}
	
	.bi-emoji-smile-fill   {
		 	color: rgb(255, 90, 95); 
	}
	 
	.gray 			{
		 	color: #323232; 
	}

	
</style>
</head>
<body>
<div class="container">
	<div class="row mb-4">
		<div class="col-12">
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" id="btn-exampleModalToggle">
			  리뷰 작성하기
			</button>		
		</div>
	</div>
</div>

<!-- form 시작 -->
<form class="mb-3" name="hostReview" id="host-review" method="post" action="reviewcomplete">			
<!-- Scrollable Modal -->
<div class="modal fade" id="review-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  	<div class="modal-dialog modal-dialog-scrollable modal-lg">
    	<div class="modal-content">
      		<div class="modal-header">
        		<h3 class="modal-title" id="exampleModalLabel"><strong>평가 및 후기</strong></h5>
       	 		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      		</div>			      
      		<div class="modal-body">
				<div class="row">
					<div class="col-4">
		      			<img scr="" /> 이미지 들어가는 곳
		      			<h5>Danny의 집</h5>
		      			<ul>
		      				<li>집 전체</li>
		      				<li>산 호세(San hose)</li>
		      			</ul>
		      			<h5>게스트 : Jon</h5>
		      			<p>2016년 1월 1일~2016년 1월 5일</p>
		     		</div>
		     		<div class="col-8">		
		     			<div class="row">
		     				<div class="col-12">
		      					<div class="mt-3 mb-5">
					      			<h3 class="mb-3 gray"><strong>Jon님에 대한 후기를 쓰세요.</strong></h3>
					      			<p class="gray">14일 동안 후기를 작성할 수 있습니다. 후기 작성 기간 동안에는 게스트도 호스트에 대한 후기를 작성해야 호스트의 피드백을 읽을 수 있습니다. 
					      	   			후기 작성 기간이 종료되면, 호스트의 피드백이 공개됩니다. 후기 작성 가이드 라인을 살펴보세요.
					      			</p>
					    		</div>
		     				</div>
		     			</div>	
		     			<div class="row">
		     				<div class="col-12">
						       	<h3 class="mb-5 gray"><strong>숙박이 어땠나요?</strong></h3>
								<div class="row mb-5">
									<div class="col-12">
										<h3 class="fs-4 gray" id="total-score"><strong>전체적 만족도</strong></h3>
										<div id="box-total">
											<i class="bi bi-star fs-2" data-score="1"></i>
											<i class="bi bi-star fs-2" data-score="2"></i>
											<i class="bi bi-star fs-2" data-score="3"></i>
											<i class="bi bi-star fs-2" data-score="4"></i>
											<i class="bi bi-star fs-2" data-score="5"></i>
											<input type="hidden" name="total" value="0">
										</div>
									</div>
								</div>    	
								<div class="row mb-5">
									<div class="col-12">
										<h3 class="fs-4 gray" id="clean-score"><strong>청결도</strong></h3>
										<p class="gray question">게스트는 숙소를 깨끗하게 사용했나요?</p>
										<div id="box-clean">
											<i class="bi bi-star fs-2" data-score="1"></i>
											<i class="bi bi-star fs-2" data-score="2"></i>
											<i class="bi bi-star fs-2" data-score="3"></i>
											<i class="bi bi-star fs-2" data-score="4"></i>
											<i class="bi bi-star fs-2" data-score="5"></i>
											<input type="hidden" name="clean" value="0">
										</div>
									</div>
								</div>
								<div class="row mb-5">
									<div class="col-12">
										<h3 class="fs-4 gray" id="communication-score"><strong>커뮤니케이션</strong></h3>
										<p class="gray question">숙박기간 전, 혹은 도중에 게스트와 연락이 잘 되었나요?</p>
										<div id="box-communication">
											<i class="bi bi-star fs-2" data-score="1"></i>
											<i class="bi bi-star fs-2" data-score="2"></i>
											<i class="bi bi-star fs-2" data-score="3"></i>
											<i class="bi bi-star fs-2" data-score="4"></i>
											<i class="bi bi-star fs-2" data-score="5"></i>
											<input type="hidden" name="communication" value="0">
										</div>
									</div>
								</div>
								<div class="row mb-5">
									<div class="col-12">
										<h3 class="fs-4 gray" id="observance-score"><strong>규칙 준수</strong></h3>
										<p class="gray question">게스트는 규칙을 준수했나요?</p>
										<div id="box-observance">
											<i class="bi bi-star fs-2" data-score="1"></i>
											<i class="bi bi-star fs-2" data-score="2"></i>
											<i class="bi bi-star fs-2" data-score="3"></i>
											<i class="bi bi-star fs-2" data-score="4"></i>
											<i class="bi bi-star fs-2" data-score="5"></i>
											<input type="hidden" name="observance" value="0">
										</div>
									</div>
								</div>
								<div align="right">
									<button type="button" class="btn px-5 next" id="star-next-btn">다음</button>
								</div>
							</div>
						</div>
		      		</div>
		     	</div>
			</div>		  
		</div>
	</div>
</div>
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="exampleModalLabel2"><strong>평가 및 후기</strong></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="text-center mb-5 mt-3">	
		        	<h3><strong>이 게스트의 재방문을 허용할 건가요?</strong></h3>
		        	<p>답변은 회원님의 프로필 또는 게스트에게 공개되지 않습니다.</p>
		        </div>
        		<div class="text-center">
        			<div class="mb-5">
					    <input type="radio" name="again" id="down-again" value="N">
					    <label for="down-again" id="bi-emoji-frown" class="bi bi-emoji-frown fs-1">
					    	<span class="fs-4" style="color: black">아니요 &nbsp;</span>
					    </label>
					    <input type="radio" name="again" id="up-again" value="Y" >
					    <label for="up-again" id="bi-emoji-smile" class="bi bi-emoji-smile fs-1">
					    	<span class="fs-4" style="color: black">예!</span>
					    </label>
					</div>    
					<div class="modal-footer">
						<button type="button" class="btn px-5 next" id="again-next-btn">다음</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="exampleModalToggle3" aria-hidden="true" aria-labelledby="exampleModalToggleLabel3" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="exampleModalLabel3"><strong>평가 및 후기</strong></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="mb-5">
					<h3>공개후기<span class="fs-5"></span></h3>
					<p class="mb-4">호스트의 후기는 게스트 프로필에 전체 공개됩니다.
					   다음 페이지에서 에어비앤비에게 비공개로 추가 피드백을 남기실 수 있습니다.
					   한국어로 공개 후기를 작성하세요.</p>
					<textarea name="public" id="public-text" cols="100" rows="5"  maxlength="500" style="resize:vertical;" 
							  placeholder="게스트는 숙소를 어떻게 사용했나요?"></textarea>
					<p align="right">남은 글자 수 : <span id="test-length">( 500 / 500 )</span>자</p>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn px-5 next" id="public-next-btn">다음</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="exampleModalToggle4" aria-hidden="true" aria-labelledby="exampleModalToggleLabel4" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="exampleModalLabel4"><strong>평가 및 후기</strong></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div>
					<div class="mb-4">
						<h3>게스트 비공개 피드백<span class="fs-5">  (선택사항)</span></h3>
						<p>이 피드백은 비공개이며, 해당 게스트와 에어비앤비 직원 빛 서비스 제공자만 볼 수 있습니다.</p>
					</div>
					<div class="mb-5">
						<p><strong>피드백을 하거나 감사함을 표하세요.<strong></p>
						<textarea name="feedback" id="feedback-text" cols="100" rows="5" onkeyup=""></textarea>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn px-5 next" id="private-next-btn">완료</button>
			</div>
		</div>
	</div>
</div>
</form>

<script type="text/javascript">
$(function() {
	
	let exampleModalToggle1 = new bootstrap.Modal(document.getElementById("review-modal"));
	let exampleModalToggle2 = new bootstrap.Modal(document.getElementById("exampleModalToggle2"));
	let exampleModalToggle3 = new bootstrap.Modal(document.getElementById("exampleModalToggle3"));
	let exampleModalToggle4 = new bootstrap.Modal(document.getElementById("exampleModalToggle4"));
	
	$("#btn-exampleModalToggle").click(function() {
		exampleModalToggle1.show();
	})
	
	// form 1 - 별점
	$("#box-total i").click(function() {
		let value = $(this).attr("data-score");
		$("input[name='total']").val(value);
		$("#box-total i").removeClass("bi-star-fill").addClass("bi-star");
		$("#box-total i:lt(" + value + ")").removeClass("bi-star").addClass("bi-star-fill");
	})
	
	$("#box-clean i").click(function() {
		let value = $(this).attr("data-score");
		$("input[name='clean']").val(value);
		$("#box-clean i").removeClass("bi-star-fill").addClass("bi-star");
		$("#box-clean i:lt(" + value + ")").removeClass("bi-star").addClass("bi-star-fill");
	})
	
	$("#box-communication i").click(function() {
		let value = $(this).attr("data-score");
		$("input[name='communication']").val(value);
		$("#box-communication i").removeClass("bi-star-fill").addClass("bi-star");
		$("#box-communication i:lt(" + value + ")").removeClass("bi-star").addClass("bi-star-fill");
	})
	
	$("#box-observance i").click(function() {
		let value = $(this).attr("data-score");
		$("input[name='observance']").val(value);
		$("#box-observance i").removeClass("bi-star-fill").addClass("bi-star");
		$("#box-observance i:lt(" + value + ")").removeClass("bi-star").addClass("bi-star-fill");
	})

	// 별점 미체크 확인
	$("#star-next-btn").click(function() {
		let existEmptyScore = false;
		$("input[type=hidden]").each(function(index, element) {
			if($(element).val() === "0") {
				existEmptyScore = true;
			}
		})
		
		if(existEmptyScore) {
			alert("모든 별점을 체크해야 합니다.");
			return false;
		}
		exampleModalToggle1.hide();
		exampleModalToggle2.show();
	})
	
	// radio 미체크 확인
	$("#again-next-btn").click(function() {
		let existEmptyAgain = false;
		let $checkAgain = $(":radio:checked()").length;
		
		if($checkAgain === 0) {
			existEmptyAgain = true;
		}
	
		if(existEmptyAgain) {
			alert("항목 중 하나를 선택해 주세요.");
			return false;
		}
		exampleModalToggle2.hide();
		exampleModalToggle3.show();
	})
	
	// 공개 리뷰 - 글자수 세는 함수
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
		exampleModalToggle3.hide();
		exampleModalToggle4.show();
	})
	
	/*
	$("#bi-emoji-frown").mouseenter(function() {
		$('#bi-emoji-smile').addClass("bi-emoji-smile").removeClass("bi-emoji-smile-fill");
		$("#bi-emoji-frown").removeClass("bi-emoji-frown").addClass("bi-emoji-frown-fill");
		
	})
	
	$("#bi-emoji-smile").mouseenter(function() {
		$("#bi-emoji-frown").addClass("bi-emoji-frown").removeClass("bi-emoji-frown-fill");
		$('#bi-emoji-smile').removeClass("bi-emoji-smile").addClass("bi-emoji-smile-fill");
	})
	*/
	
	$("#bi-emoji-frown").click(function() {
		$("#down-thumb").prop("checked", true);
		$('#bi-emoji-smile').addClass("bi-emoji-smile").removeClass("bi-emoji-smile-fill");
		$("#bi-emoji-frown").removeClass("bi-emoji-frown").addClass("bi-emoji-frown-fill");
	})
	
	$("#bi-emoji-smile").click(function() {
		$("#up-thumb").prop("checked", true);
		$("#bi-emoji-frown").addClass("bi-emoji-frown").removeClass("bi-emoji-frown-fill");
		$('#bi-emoji-smile').removeClass("bi-emoji-smile").addClass("bi-emoji-smile-fill");
	})

})

</script>
</body>
</html>