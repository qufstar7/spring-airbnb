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
</head>
<body>
<div class="container">
	<div class="row mb-4">
		<div class="col-12">
			<div>
				<h3>공개후기</h3><span>(필수항목)</span>
					<p>회원님의 후기는 회원님의 프로필과 회원님의 호스트 숙소 페이지에 전체 공개됩니다.
						다음 페이지에서 에어비앤비에게 비공개로 추가 피드백을 남기실 수 있습니다.
						한국어로 공개 후기를 작성하세요.
						다른 게스트는 필요한 경우 자동 번역문을 읽을 수 있습니다.
					</p>
					<textarea name="publicReview" id="public-review" rows="5" cols="50" maxlength="500" onkeyup=""
							  placeholder="호스트가 어떻게 회원님을 맞이하였나요? 숙소 설명은 명확하였나요? 숙소가 위치한 지역은 어떤가요?">
					</textarea>
					<span>남은 글자 수 : 500단어</span>
			</div>
			<div>
				<h3>호스트 비공개 피드백</h3>
					<p>이 피드백은 비공개이며, 해당 호스트와 에어비앤비 직원 빛 서비스 제공자만 볼 수 있습니다.</p>
					<p>이 숙소에서 가장 마음에 드는 점은 무엇인가요?</p>
					<textarea name="favorite" id="" rows="5" cols="50" onkeyup="">
					</textarea>
					<p>회원님의 호스트가 더 발전하기 위한 피드백을 주세요.</p>
					<textarea name="feedback" id="" rows="5" cols="50" onkeyup="">
					</textarea>
			</div>
		</div>
	</div>
</div>
</body>
</html>