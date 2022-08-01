<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>호스팅을 시작해 보세요</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/hostingstyle.css">
</head>
<body>

	<!-- 로고 홈링크 -->
	<div id="logo-link">
		<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"	aria-label="에어비앤비 홈페이지" role="img" focusable="false">
		<path d="M16 1c2.008 0 3.463.963 4.751 3.269l.533 1.025c1.954 3.83 6.114 12.54 7.1 14.836l.145.353c.667 1.591.91 2.472.96 3.396l.01.415.001.228c0 4.062-2.877 6.478-6.357 6.478-2.224 0-4.556-1.258-6.709-3.386l-.257-.26-.172-.179h-.011l-.176.185c-2.044 2.1-4.267 3.42-6.414 3.615l-.28.019-.267.006C5.377 31 2.5 28.584 2.5 24.522l.005-.469c.026-.928.23-1.768.83-3.244l.216-.524c.966-2.298 6.083-12.989 7.707-16.034C12.537 1.963 13.992 1 16 1zm0 2c-1.239 0-2.053.539-2.987 2.21l-.523 1.008c-1.926 3.776-6.06 12.43-7.031 14.692l-.345.836c-.427 1.071-.573 1.655-.605 2.24l-.009.33v.206C4.5 27.395 6.411 29 8.857 29c1.773 0 3.87-1.236 5.831-3.354-2.295-2.938-3.855-6.45-3.855-8.91 0-2.913 1.933-5.386 5.178-5.42 3.223.034 5.156 2.507 5.156 5.42 0 2.456-1.555 5.96-3.855 8.907C19.277 27.766 21.37 29 23.142 29c2.447 0 4.358-1.605 4.358-4.478l-.004-.411c-.019-.672-.17-1.296-.714-2.62l-.248-.6c-1.065-2.478-5.993-12.768-7.538-15.664C18.053 3.539 17.24 3 16 3zm.01 10.316c-2.01.021-3.177 1.514-3.177 3.42 0 1.797 1.18 4.58 2.955 7.044l.21.287.174-.234c1.73-2.385 2.898-5.066 2.989-6.875l.006-.221c0-1.906-1.167-3.4-3.156-3.421h-.001z"></path>
	</svg>
	</div>

	<!-- 왼쪽 호스팅 시작하기 영역 -->
	<div id="starting-host" class="position-relative">
		<div class="text-center bg-black" id="left-div">
			<div class="align-self-center d-inline">
				<div role="text" class="left-main-text text-white fw-bold">
					호스팅을 <br> 시작해 보세요
				</div>
				<button type="button" class="btn text-white"
					style="background-color: #FF385C;"
					onclick="location.href='/host/become-a-host';">호스팅을 시작하기</button>
			</div>
		</div>

		<!-- 오른쪽 동영상 영역 -->
		<div id="right-div">
			<div class="align-self-center">
				<!-- 동영상 -->
				<video class="host-video" autoplay controls muted
					crossorigin="anonymous" playsinline="" preload="auto"
					style="object-fit: cover; object-position: center top;">
					<source
						src="https://a0.muscache.com/v/a9/a7/a9a7873c-95de-5e37-8995-a5abb5b6b02f/a9a7873c95de5e378995a5abb5b6b02f_4000k_1.mp4?imformat=h265"
						type="video/mp4; codecs=hevc">
					<source
						src="https://a0.muscache.com/v/a9/a7/a9a7873c-95de-5e37-8995-a5abb5b6b02f/a9a7873c95de5e378995a5abb5b6b02f_4000k_1.mp4"
						type="video/mp4">
				</video>
				<!-- 동영상 재생 버튼 -->
				<div class="host-video-btn-div">
					<button aria-label="재생" type="button" class="hostVideoBtn">
						<span class=""><svg viewBox="0 0 32 32"
								xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
								role="presentation" focusable="false"
								style="display: block; height: 16px; width: 16px; fill: white;">
								<path
									d="M27.024 14.273L6.008 2.013c-.461-.268-1-.342-1.517-.206A2 2 0 0 0 3 3.741V28.26a2.002 2.002 0 0 0 3.008 1.728l21.015-12.26a2.003 2.003 0 0 0 .001-3.454z"></path></svg></span>
					</button>
				</div>

				<!-- 호스트 이름 -->
				<div class="hostName">chelsea</div>

				<!-- ~~의 호스트 -->
				<div>필라델피아의 호스트</div>
			</div>
		</div>

	</div>




	<!-- 호스팅 홍보 -->
	<%-- <div>
호스팅 홍보 영역
<iframe height="0" width="0" style="display: ; visibility: ;" src="//4620401.fls.doubleclick.net/activityi;src=4620401;type=gen;cat=airbn0;ord=1;num=9235793379026;gtm=2wg7p0;auiddc=1718786489.1658132184;u21=visitor;u22=true;u34=0;~oref=https%3A%2F%2Fwww.airbnb.co.kr%2Fhost%2Fhomes?"></iframe>
</div>

<!-- 호스팅 관련 질문 -->
<div>
호스팅 관련 질문 영역
</div>

<!-- 슈퍼호스트에게 물어보세요 -->
<div>
슈퍼호스트 영역

</div>

<!-- 에어커버 자세히 알아보기 -->
<div>
에어커버 영역

</div>

<!-- 호스팅 시작하기 2 -->
<div>
호스팅 시작하기 2
</div>

<!-- 푸터 -->
<div>
푸터 영역
<%@ include file="common/footer.jsp" %>
</div> --%>

	<script>
		document.getElementById('hostVideo').play();
	</script>

</body>
</html>