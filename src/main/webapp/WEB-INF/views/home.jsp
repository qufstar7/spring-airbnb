<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common/tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.0/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Applied Coding & Computer - aircnc</title>
</head>
<%@ include file="common/nav.jsp"%>
<c:set var="menu" value="home" />
<body>
	<div class="container my-3">
		<div
			class="d-flex align-content-start justify-content-between flex-wrap"
			style="height: 10207px; margin-top:100px">
			<a href="#" style="text-decoration-line: none; color: black">
				<div class="p-1">
					<div class="" style="width: 300px">
						<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
							<!-- 숙소 섬네일 슬라이드쇼 -->
							<div class="carousel-indicators">
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<!-- 슬라이드쇼 이미지 -->
							<div class="carousel-inner" style="border-radius: 25px;">
								<div class="carousel-item active">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
						<!-- 숙소 설명 -->
						<div class="row my-2">
							<div class="col-8">
								<div class="card-title">애월읍, 제주시의 캠핑카</div>
								<div class="card-text">비치보이스,Boy21</div>
								<div class="card-subtitle mb-2 text-muted">퀸 침대 1개</div>
								<div class="card-subtitle mb-2 text-muted">12월 6일 ~ 1월 3일</div>
								<div class="card-text">
									<strong>₩<fmt:formatNumber value="6343393" /></strong>/월
								</div>
							</div>
							<div class="col-4 text-end">★4.5(120)</div>
						</div>
					</div>
				</div>
			</a>
			<a href="#" style="text-decoration-line: none; color: black">
				<div class="p-1">
					<div class="" style="width: 300px">
						<!-- 숙소 섬네일 슬라이드쇼 시작 -->
						<!-- 아이디에 acc_no나 img_no를 사용하는게 좋을 것 같습니다. / id - 아래 3개의 버튼, prev버튼, next버튼 -->
						<div id="carouselExampleIndicators-1" class="carousel slide" data-bs-ride="true">
							<div class="carousel-indicators">
								<button type="button"
									data-bs-target="#carouselExampleIndicators-1"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators-1"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators-1"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<!-- 슬라이드쇼 이미지 -->
							<div class="carousel-inner" style="border-radius: 25px;">
								<div class="carousel-item active">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
							</div>
							
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleIndicators-1" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleIndicators-1" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
						<!-- 숙소 설명 -->
						<div class="row my-2">
							<div class="col-8">
								<div class="card-title">애월읍, 제주시의 캠핑카</div>
								<div class="card-text">비치보이스,Boy21</div>
								<div class="card-subtitle mb-2 text-muted">퀸 침대 1개</div>
								<div class="card-subtitle mb-2 text-muted">12월 6일 ~ 1월 3일</div>
								<div class="card-text">
									<strong>₩<fmt:formatNumber value="6343393" /></strong>/월
								</div>
							</div>
							<div class="col-4 text-end">★4.5(120)</div>
						</div>
					</div>
				</div>
			</a><a href="#" style="text-decoration-line: none; color: black">
				<div class="p-1">
					<div class="" style="width: 300px">
						<div id="carouselExampleIndicators-2" class="carousel slide" data-bs-ride="true">
							<!-- 숙소 섬네일 슬라이드쇼 -->
							<div class="carousel-indicators">
								<button type="button"
									data-bs-target="#carouselExampleIndicators-2"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators-2"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators-2"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<!-- 슬라이드쇼 이미지 -->
							<div class="carousel-inner" style="border-radius: 25px;">
								<div class="carousel-item active">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleIndicators-2" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleIndicators-2" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
						<!-- 숙소 설명 -->
						<div class="row my-2">
							<div class="col-8">
								<div class="card-title">애월읍, 제주시의 캠핑카</div>
								<div class="card-text">비치보이스,Boy21</div>
								<div class="card-subtitle mb-2 text-muted">퀸 침대 1개</div>
								<div class="card-subtitle mb-2 text-muted">12월 6일 ~ 1월 3일</div>
								<div class="card-text">
									<strong>₩<fmt:formatNumber value="6343393" /></strong>/월
								</div>
							</div>
							<div class="col-4 text-end">★4.5(120)</div>
						</div>
					</div>
				</div>
			</a>
			
			<a href="#" style="text-decoration-line: none; color: black">
				<div class="p-1">
					<div class="" style="width: 300px">
						<div id="carouselExampleIndicators-3" class="carousel slide" data-bs-ride="true">
							<!-- 숙소 섬네일 슬라이드쇼 -->
							<div class="carousel-indicators">
								<button type="button"
									data-bs-target="#carouselExampleIndicators-3"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators-3"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators-3"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<!-- 슬라이드쇼 이미지 -->
							<div class="carousel-inner" style="border-radius: 25px;">
								<div class="carousel-item active">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleIndicators-3" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleIndicators-3" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
						<!-- 숙소 설명 -->
						<div class="row my-2">
							<div class="col-8">
								<div class="card-title">애월읍, 제주시의 캠핑카</div>
								<div class="card-text">비치보이스,Boy21</div>
								<div class="card-subtitle mb-2 text-muted">퀸 침대 1개</div>
								<div class="card-subtitle mb-2 text-muted">12월 6일 ~ 1월 3일</div>
								<div class="card-text">
									<strong>₩<fmt:formatNumber value="6343393" /></strong>/월
								</div>
							</div>
							<div class="col-4 text-end">★4.5(120)</div>
						</div>
					</div>
				</div>
			</a>
			
			<a href="#" style="text-decoration-line: none; color: black">
				<div class="p-1">
					<div class="" style="width: 300px">
						<div id="carouselExampleIndicators-4" class="carousel slide" data-bs-ride="true">
							<!-- 숙소 섬네일 슬라이드쇼 -->
							<div class="carousel-indicators">
								<button type="button"
									data-bs-target="#carouselExampleIndicators-4"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators-4"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators-4"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<!-- 슬라이드쇼 이미지 -->
							<div class="carousel-inner" style="border-radius: 25px;">
								<div class="carousel-item active">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleIndicators-4" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleIndicators-4" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
						<!-- 숙소 설명 -->
						<div class="row my-2">
							<div class="col-8">
								<div class="card-title">애월읍, 제주시의 캠핑카</div>
								<div class="card-text">비치보이스,Boy21</div>
								<div class="card-subtitle mb-2 text-muted">퀸 침대 1개</div>
								<div class="card-subtitle mb-2 text-muted">12월 6일 ~ 1월 3일</div>
								<div class="card-text">
									<strong>₩<fmt:formatNumber value="6343393" /></strong>/월
								</div>
							</div>
							<div class="col-4 text-end">★4.5(120)</div>
						</div>
					</div>
				</div>
			</a>
			<%-- 하나의 숙소카드 입니다.
			<a href="#" style="text-decoration-line: none; color: black">
				<div class="p-1">
					<div class="" style="width: 300px">
						<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
							<!-- 숙소 섬네일 슬라이드쇼 -->
							<div class="carousel-indicators">
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<!-- 슬라이드쇼 이미지 -->
							<div class="carousel-inner" style="border-radius: 25px;">
								<div class="carousel-item active">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
								<div class="carousel-item">
									<img class="acc-thumbnail rounded-0"
										src="/resources/images/acc/sample-home.jpg" alt="숙소이미지"
										style="object-fit: cover; width: 300px; height: 300px;">
								</div>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
						<!-- 숙소 설명 -->
						<div class="row my-2">
							<div class="col-8">
								<div class="card-title">애월읍, 제주시의 캠핑카</div>
								<div class="card-text">비치보이스,Boy21</div>
								<div class="card-subtitle mb-2 text-muted">퀸 침대 1개</div>
								<div class="card-subtitle mb-2 text-muted">12월 6일 ~ 1월 3일</div>
								<div class="card-text">
									<strong>₩<fmt:formatNumber value="6343393" /></strong>/월
								</div>
							</div>
							<div class="col-4 text-end">★4.5(120)</div>
						</div>
					</div>
				</div>
			</a>
			--%>
		</div>
	</div>
<!-- filter modal -->
<div class="modal" id="filterModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>
