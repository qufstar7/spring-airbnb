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
	#review-next {background: rgb(255, 90, 95);
			   color: white;
			   font-size: large;
			   font-weight: bold;
			   }
	
	.modal-content {
		
		width: 100%;
	}
	
	.question { font-size: 18px; }
	
	.bi-star  		{ color: rgb(0, 166, 153); }
	.bi-star-fill   { color: rgb(0, 166, 153); }
	.gray 			{ color: #323232; }
	
</style>
</head>
<body>
<div class="container">
	<div class="row mb-4">
		<div class="col-12">
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#review-modal">
			  리뷰 작성하기
			</button>		
		</div>
	</div>
</div>

			
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
		      				<li>후기 34개</li>
		      				<li>산 호세(San hose)</li>
		      			</ul>
		      			<h5>호스트: Danny</h5>
		      			<p>2016년 1월 1일~2016년 1월 5일</p>
		     		</div>
		     		<div class="col-8">		
		     			<div class="row">
		     				<div class="col-12">
		      					<div class="mt-3 mb-5">
					      			<h3 class="mb-3 gray"><strong>Danny님에 대한 후기를 쓰세요.</strong></h3>
					      			<p class="gray">14일 동안 후기를 작성할 수 있습니다. 후기 작성 기간 동안에는 호스트도 회원님에 대한 후기를 작성해야 회원님의 피드백을 읽을 수 있습니다. 
					      	   			후기 작성 기간이 종료되면, 회원님의 피드백이 공개됩니다. 후기 작성 가이드 라인을 살펴보세요.
					      				<br /><br />
					      	   		호스트는 카테고리별 평점은 보지 못하고 전체 평균 별점만 알 수 있습니다. 후기 작성에 대해 자세히 알아보세요.
					      			</p>
					    		</div>
		     				
		     				</div>
		     			</div>	
		     			<div class="row">
		     				<div class="col-12">
						       	<h3 class="mb-5 gray"><strong>숙박이 어땠나요?</strong></h3>
							 	<form class="mb-3" name="reviewScore" id="review-score" method="post">
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
											<p class="gray question">숙소는 회원님이 예상한 것만큼 깨끗한가요?</p>
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
											<h3 class="fs-4 gray" id="accuracy-score"><strong>정확성</strong></h3>
											<p class="gray question">숙소 사진과 설명이 실제 숙소와 얼마나 일치하나요?</p>
											<div id="box-accuracy">
												<i class="bi bi-star fs-2" data-score="1"></i>
												<i class="bi bi-star fs-2" data-score="2"></i>
												<i class="bi bi-star fs-2" data-score="3"></i>
												<i class="bi bi-star fs-2" data-score="4"></i>
												<i class="bi bi-star fs-2" data-score="5"></i>
												<input type="hidden" name="accuracy" value="0">
											</div>
										</div>
									</div>
									<div class="row mb-5">
										<div class="col-12">
											<h3 class="fs-4 gray" id="communication-score"><strong>커뮤니케이션</strong></h3>
											<p class="gray question">숙박기간 전, 혹은 도중에 호스트와 연락이 잘 되고, 문의한 사항에 대하여 호스트가 빨리 응답해 왔습니까?</p>
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
											<h3 class="fs-4 gray" id="location-score"><strong>위치</strong></h3>
											<p class="gray question">숙소 지역은 만족하셨나요? 안전성과 편리성을 고려해 주세요.</p>
											<div id="box-location">
												<i class="bi bi-star fs-2" data-score="1"></i>
												<i class="bi bi-star fs-2" data-score="2"></i>
												<i class="bi bi-star fs-2" data-score="3"></i>
												<i class="bi bi-star fs-2" data-score="4"></i>
												<i class="bi bi-star fs-2" data-score="5"></i>
												<input type="hidden" name="location" value="0">
											</div>
										</div>
									</div>
									<div class="row mb-5">
										<div class="col-12">
											<h3 class="fs-4 gray" id="checkin-score"><strong>체크인</strong></h3>
											<p class="gray question">호스트는 회원님의 원활한 체크인 절차를 위해 최선을 다했나요?</p>
											<div id="box-checkin">
												<i class="bi bi-star fs-2" data-score="1"></i>
												<i class="bi bi-star fs-2" data-score="2"></i>
												<i class="bi bi-star fs-2" data-score="3"></i>
												<i class="bi bi-star fs-2" data-score="4"></i>
												<i class="bi bi-star fs-2" data-score="5"></i>
												<input type="hidden" name="checkin" value="0">
											</div>
										</div>
									</div>
									<div class="row mb-5">
										<div class="col-12">
											<h3 class="fs-4 gray" id="convenience-score"><strong>편의시설</strong></h3>
											<p class="gray question">호스트가 숙소 설명에 약속된 모든 것을 제공하였나요?</p>
											<div id="box-convenience">
												<i class="bi bi-star fs-2" data-score="1"></i>
												<i class="bi bi-star fs-2" data-score="2"></i>
												<i class="bi bi-star fs-2" data-score="3"></i>
												<i class="bi bi-star fs-2" data-score="4"></i>
												<i class="bi bi-star fs-2" data-score="5"></i>
												<input type="hidden" name="convenience" value="0">
											</div>
										</div>
									</div>
									<div class="row mb-5">
										<div class="col-12">
											<h3 class="fs-4 gray" id="value-score"><strong>가치</strong></h3>
											<p class="gray question">이 숙소를 평가하자면?</p>
											<div id="box-value">
												<i class="bi bi-star fs-2" data-score="1"></i>
												<i class="bi bi-star fs-2" data-score="2"></i>
												<i class="bi bi-star fs-2" data-score="3"></i>
												<i class="bi bi-star fs-2" data-score="4"></i>
												<i class="bi bi-star fs-2" data-score="5"></i>
												<input type="hidden" name="valueS" value="0">
											</div>
										</div>
									</div>
									<div>
										<button type="button" class="btn px-5" id="review-next" href="#exampleModalToggle2" data-bs-toggle="modal" data-bs-dismiss="modal">다음</button>
									</div>
								</div>
							</div>
			      		</div>
					</form>
		     	</div>
			</div>		  
		</div>
	</div>
</div>
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalToggleLabel2">Modal 2</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
	        	Hide this modal and show the first with the button below.
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">Back to first</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function() {
	
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
	
	$("#box-accuracy i").click(function() {
		let value = $(this).attr("data-score");
		$("input[name='accuracy']").val(value);
		$("#box-accuracy i").removeClass("bi-star-fill").addClass("bi-star");
		$("#box-accuracy i:lt(" + value + ")").removeClass("bi-star").addClass("bi-star-fill");
	})
	
	$("#box-communication i").click(function() {
		let value = parseInt($(this).attr("data-score"));
		$("input[name='communication']").val(value);
		$("#box-communication i").removeClass("bi-star-fill").addClass("bi-star");
		$("#box-communication i:lt(" + value + ")").removeClass("bi-star").addClass("bi-star-fill");
	})
	
	$("#box-location i").click(function() {
		let value = parseInt($(this).attr("data-score"));
		$("input[name='location']").val(value);
		$("#box-location i").removeClass("bi-star-fill").addClass("bi-star");
		$("#box-location i:lt(" + value + ")").removeClass("bi-star").addClass("bi-star-fill");
	})
	
	$("#box-checkin i").click(function() {
		let value = $(this).attr("data-score");
		$("input[name='checkin']").val(value);
		$("#box-checkin i").removeClass("bi-star-fill").addClass("bi-star");
		$("#box-checkin i:lt(" + value + ")").removeClass("bi-star").addClass("bi-star-fill");
	})
	
	$("#box-convenience i").click(function() {
		let value = parseInt($(this).attr("data-score"));
		$("input[name='convenience']").val(value);
		$("#box-convenience i").removeClass("bi-star-fill").addClass("bi-star");
		$("#box-convenience i:lt(" + value + ")").removeClass("bi-star").addClass("bi-star-fill");
	})
	
	$("#box-value i").click(function() {
		let value = $(this).attr("data-score");
		$("input[name='valueS']").val(value);
		$("#box-value i").removeClass("bi-star-fill").addClass("bi-star");
		$("#box-value i:lt(" + value + ")").removeClass("bi-star").addClass("bi-star-fill");
	})
	
})

</script>
</body>
</html>