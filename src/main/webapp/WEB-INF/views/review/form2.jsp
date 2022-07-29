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
</head>
<body>
<div class="container">
	<div class="row mb-4">
		<div class="col-12">
			<h3>이 숙소를 다시 이용하고 싶으신가요?</h3>
			<p>답변은 회원님의 프로필 또는 호스트의 숙소 페이지에 공개되지 않습니다.</p>
				<i class="bi bi-hand-thumbs-down fs-1" id="down-thumb" name="thumb" data-add="negative">f</i>
				<span>아니요</span>
				<i class="bi bi-hand-thumbs-up fs-1" id="good-thumb" name="thumb" data-add="positive"></i>
				<span>예!</span>
				<br />
			<button>다음</button>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	$("p").find("i").mouseover(function() {
		console.log("마우스 올라감")
		
		
	})
	$("i").mouseout(function() {
		console.log("마우스 내려감")
	})
})

/*
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
*/

$(function() {
	$("")
})
</script>
</body>
</html>