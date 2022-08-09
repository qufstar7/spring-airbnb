<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>카드 등록</title>
</head>
<body>
<div class="container my-3">
	<div class="row my-3">
		<div class="col">
			<h1 class="fs-5 border p-2">카드 등록</h1>
		</div>
	</div>
    <div class="row mb-3">
        <div class="col">
            <p>카드번호를 입력하세요.</p>
            <form:form class="border bg-light p-3" method="post" action="register" modelAttribute="cardRegisterForm" >
                <div class="mb-3">
                	<label for="id-field" class="form-label">카드번호</label>
                	<form:input class="form-control" path="id" id="id-field" placeholder="0000-0000-0000-0000"/>
                	<form:errors path="id" class="text-danger small fst-italic"></form:errors>
                </div>
                <div class="mb-3">
                	<label for="expiryDate-field" class="form-label">만료일</label>
                	<form:input class="form-control" path="expiryDate" id="expiryDate-field" placeholder="mm/yy"/>
                	<form:errors path="expiryDate" class="text-danger small fst-italic"></form:errors>
                </div>
                <div class="mb-3">
                	<label for="cvv-field" class="form-label">CVV</label>
                	<form:input class="form-control" path="cvv" id="cvv-field" placeholder="123"/>
                	<form:errors path="cvv" class="text-danger small fst-italic"></form:errors>
                </div>
                <div class="mb-3">
                	<label for="zipCode-field" class="form-label">우편번호</label>
                	<form:input class="form-control" path="zipCode" id="zipCode-field" placeholder="12345"/>
                	<form:errors path="zipCode" class="text-danger small fst-italic"></form:errors>
                </div>
                <div class="mb-3">
                	<label for="region-field" class="form-label">지역</label>
                	<form:input class="form-control" path="region" id="region-field" placeholder="한국"/>
                	<form:errors path="region" class="text-danger small fst-italic"></form:errors>
                </div>
                <div class="text-end">
                	<a href="/" class="btn btn-secondary">취소</a>
                	<button type="submit" class="btn btn-primary">회원가입</button>
                </div>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>