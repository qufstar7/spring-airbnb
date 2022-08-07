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
<title>Insert title here</title>
<style type="text/css">
	.scoreBarleft {
		width: 100%;
		height: 4px;
		background-color: rgb(221, 221, 221);
		margin-right: 8.33333% !important;
		border-radius: 2px;
	}
	
	#bar-clean-avg {
		/* width: 70%; */ 
		height: 4px;
		background-color: black;
		margin-right: 8.33333% !important;
		border-radius: 2px;
	}
</style>
</head>
<body>
<div class="container">
	<div class="mt-5 mb-5" id="review">
		<h4><i class="bi bi-star-fill"></i> <span>4.96</span>${acc.reviewScore } 
			<span class="text-decoration">후기 128${acc.reviewCount }개</span></h4>
	</div>
	<div class="row">
		<div class="col-4">
			<p>청결도</p>
		</div>
		<div class="col-2 barBox">
			<div class="scoreBarleft">
				<div id="bar-clean-avg" style="width: 70%;">
				</div>
			</div>
		</div>
		<div class="col-4">
			<p>정확성</p>
			<p>위치</p>
			<p>가격 대비 만족도</p>
		</div>
		<div class="col-2">
			<p><span>------</span><span>5.0</span></p>
			<p><span>------</span><span>5.0</span></p>
			<p><span>------</span><span>4.9</span></p>
		</div>
	</div>
</div>
</body>
</html>