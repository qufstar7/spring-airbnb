<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<style type="text/css">

/*
#myform label:hover{
    text-shadow: 0 0 0 rgba(115, 115, 115);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(115, 115, 115);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(115, 115, 115);
} */

#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}



.scoreTitle {
	font-size: 25px;
}

.scoreDetail {
	font-size: 20px;
}


</style>
</head>
<body>
<div class="container">
	<div class="row mb-3">
		<div class="col">
			
			<!-- 리뷰 별점 -->
			<h2><strong>숙박이 어땠나요?</strong></h2>
			<div>
				<span class="scoreTitle">전체적 만족도</span><span class="scoreDetail">&nbsp;(필수항목)</span>
				<link href="/assets/css/star.css" rel="stylesheet"/>
			 	<form class="mb-3" name="myform" id="myform" method="post">
					<fieldset>
						<input type="radio" name="reviewStar-1" value="5" id="rate5"><label
							for="rate5"><i class="bi bi-star"></i></label>
						<input type="radio" name="reviewStar-1" value="4" id="rate4"><label
							for="rate4"><i class="bi bi-star"></i></label>
						<input type="radio" name="reviewStar-1" value="3" id="rate3"><label
							for="rate3"><i class="bi bi-star"></i></label>
						<input type="radio" name="reviewStar-1" value="2" id="rate2"><label
							for="rate2"><i class="bi bi-star"></i></label>
						<input type="radio" name="reviewStar-1" value="1" id="rate1"><label
							for="rate1"><i class="bi bi-star"></i></label>
					</fieldset>
				</form>		
			</div>
			<div class="mt-5">
				<span class="scoreTitle">정확성</span><br />
				<span class="scoreDetail">숙소 사진과 설명이 실제 숙소와 얼마나 일치하나요?</span>
			 	<form class="mb-3" name="myform" id="myform" method="post">
					<fieldset>
						<input type="radio" name="reviewStar-2" value="5" id="rate5"><label
							for="rate5"><i class="bi bi-star"></i></label>
						<input type="radio" name="reviewStar-2" value="4" id="rate4"><label
							for="rate4"><i class="bi bi-star"></i></label>
						<input type="radio" name="reviewStar-2" value="3" id="rate3"><label
							for="rate3"><i class="bi bi-star"></i></label>
						<input type="radio" name="reviewStar-2" value="2" id="rate2"><label
							for="rate2"><i class="bi bi-star"></i></label>
						<input type="radio" name="reviewStar-2" value="1" id="rate1"><label
							for="rate1"><i class="bi bi-star"></i></label>
					</fieldset>
				</form>
			</div>
			<div class="mt-5">
				<span class="scoreTitle">청결도</span><br />
				<span class="scoreDetail">숙소는 회원님이 예상한 것만큼 깨끗한가요?</span>
					<fieldset>
						<input type="radio" name="reviewStar" value="5" id="rate5"><label
							for="rate5"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="4" id="rate4"><label
							for="rate4"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="3" id="rate3"><label
							for="rate3"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="2" id="rate2"><label
							for="rate2"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="1" id="rate1"><label
							for="rate1"><span class="fa fa-star"></span></label>
					</fieldset>
				</form>
			</div>
			<div class="mt-5">
				<span class="scoreTitle">체크인</span><br />
				<span class="scoreDetail">호스트는 회원님의 원활한 체크인 절차를 위해 최선을 다했나요?</span>
					<fieldset>
						<input type="radio" name="reviewStar" value="5" id="rate5"><label
							for="rate5"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="4" id="rate4"><label
							for="rate4"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="3" id="rate3"><label
							for="rate3"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="2" id="rate2"><label
							for="rate2"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="1" id="rate1"><label
							for="rate1"><span class="fa fa-star"></span></label>
					</fieldset>
				</form>		
			</div>
			<div class="mt-5">
				<span class="scoreTitle">편의시설</span><br />
				<span class="scoreDetail">호스트가 숙소 설명에 약속된 모든 것들을 제공하였나요?</span>
			 	<form class="mb-3" name="myform" id="myform" method="post">
					<fieldset>
						<input type="radio" name="reviewStar" value="5" id="rate5"><label
							for="rate5"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="4" id="rate4"><label
							for="rate4"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="3" id="rate3"><label
							for="rate3"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="2" id="rate2"><label
							for="rate2"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="1" id="rate1"><label
							for="rate1"><span class="fa fa-star"></span></label>
					</fieldset>
				</form>		
			</div>
			<div class="mt-5">
				<span class="scoreTitle">커뮤니케이션</span><br />
				<span class="scoreDetail">숙박기간 전, 혹은 도중에 호스트와 연락이 잘 되고, 문의한 사항에 대하여 호스트가 빨리 응답해 왔습니까?</span>
			 	<form class="mb-3" name="myform" id="myform" method="post">
					<fieldset>
						<input type="radio" name="reviewStar" value="5" id="rate5"><label
							for="rate5"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="4" id="rate4"><label
							for="rate4"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="3" id="rate3"><label
							for="rate3"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="2" id="rate2"><label
							for="rate2"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="1" id="rate1"><label
							for="rate1"><span class="fa fa-star"></span></label>
					</fieldset>
				</form>		
			</div>
			<div class="mt-5">
				<span class="scoreTitle">위치</span><br />
				<span class="scoreDetail">숙소 지역은 만족하셨나요? 안전성과 편리성을 고려해 주세요.</span>
			 	<form class="mb-3" name="myform" id="myform" method="post">
					<fieldset>
						<input type="radio" name="reviewStar" value="5" id="rate5"><label
							for="rate5"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="4" id="rate4"><label
							for="rate4"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="3" id="rate3"><label
							for="rate3"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="2" id="rate2"><label
							for="rate2"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="1" id="rate1"><label
							for="rate1"><span class="fa fa-star"></span></label>
					</fieldset>
				</form>		
			</div>
			<div class="mt-5">
				<span class="scoreTitle">가치</span><br />
				<span class="scoreDetail">이 숙소를 평가하자면?</span>
			 	<form class="mb-3" name="myform" id="myform" method="post">
					<fieldset>
						<input type="radio" name="reviewStar" value="5" id="rate5">
						<label  for="rate5"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="4" id="rate4"><label
							for="rate4"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="3" id="rate3"><label
							for="rate3"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="2" id="rate2"><label
							for="rate2"><span class="fa fa-star"></span></label>
						<input type="radio" name="reviewStar" value="1" id="rate1"><label
							for="rate1"><span class="fa fa-star"></span></label>
					</fieldset>
				</form>		
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	$(":radio[name='reviewStar-1']").click(function() {
		let score = $(this).val();
		$(":radio[name='reviewStar-1']").removeClass('bi-star-fill').addClass('bi-star')
		$(this).next().find('i').removeClass("bi-star").addClass("bi-star-fill")
	})
	
	$(":radio[name='reviewStar-2']").click(function() {
		let score = $(this).val();
		$(":radio[name='reviewStar-2']").removeClass('bi-star-fill').addClass('bi-star')
		$(this).next().find('i').removeClass("bi-star").addClass("bi-star-fill")
	})
})
</script>
</body>
</html>