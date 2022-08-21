<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<nav>
	<div class="my-3 mx-4">
		<div style="display: inline-block !important; vertical-align: text-bottom;">
			<a href="/"><img src="/resources/logo.png" alt="로고" width="50"></abbr></a>
		</div>
		<div style="display: inline-block !important; ">
			<ul>
				<li class="${step eq 'reasons' ? 'fw-bold' : '' }">1. 이유 선택</li>
				<li class="${step eq 'confirm' ? 'fw-bold' : '' }"><i class="bi bi-chevron-right"></i>2. 확인</li>
				<li class="${step eq 'complete' ? 'fw-bold' : '' }"><i class="bi bi-chevron-right"></i>3. 완료</li>
			</ul>
		</div>
		<div role="progressbar">
		<progress id="progress" value="${step eq 'reasons' ? '35' : step eq 'confirm' ? '70' : 100}" min="0" max="100"></progress>
		</div>
	</div>

</nav>
</html>