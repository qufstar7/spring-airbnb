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
	.next {  
			background: white;
			color: rgb(255, 90, 95);
		    font-size: large;
		    font-weight: bold;
		    border: 2px solid rgb(255, 90, 95);
	}
	
	.next:hover {
			background: rgb(255, 90, 95) !important;
			color: white;
	}
	
</style>
</head>
<body>
<div class="container" >
	<div class="row">
		<div class="col-12 position-absolute top-50 start-50 translate-middle" align="center">
			<div>
				<img src="/resources/logo.png" alt="logo" style="width:130px; height:130px">
				<br /><br />
				<h4><strong>리뷰 작성이 완료되었습니다!</strong><h4>
				<p class="fs-5">참여해 주셔서 감사합니다.</p>
				<button type="submit" class="btn px-5 next" onclick="location.href='/'">메인으로 가기</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
</script>
</body>
</html>