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
<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link href="../resources/aircnc.png" rel="icon" type="image/x-icon" />
<title>보낸 후기</title>
<style type="text/css">
	.headerBox {
		border: 2px solid #edefed;
		background: #edefed;
		padding: 8px 12px;
	}
	
	.contentbox {
		border: 2px solid #edefed;
		padding: 8px 12px;
	}
	
	.bigImg {
			width: 200px;
			height: 200px;
	}
	
	.smallImg {
			width: 100px;
			height: 100px;
	}
	
	.rectangleImg {
			width: 100px;
			height: 60px;
			overflow: hidden;
	}
	
	.bigRectangleImg {
			width: 200px;
			height: 120px;
			overflow: hidden;
	}
	
   	.userImg {
 			width: 60px;
			height: 60px;  		
			border-radius: 100%;	
   	}
   	
	.noBullet	{
 	  		list-style:none;
 	  		
   	}

	.reviewBtn {  
			background: white;
		    color: rgb(255, 90, 95);
		    font-size: large;
		    font-weight: bold;
		    border: 2px solid rgb(255, 90, 95);
	}
	
	.reviewBtn:hover  {
			background: rgb(255, 90, 95) !important;
			color: white;
	}
	
	.modifyBtn, .deleteBtn {
			background: white;
		    color: rgb(255, 90, 95);
		    font-size: large;
		    border: 2px solid rgb(255, 90, 95);
		    border-radius: 10%;
	}
</style>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="container">
	<div class="row mx-5">
		<div class="col">
			<div class="mt-5 mb-5">
				<span><strong>프로필 &nbsp;</strong></span>
				<span><i class="bi bi-chevron-right">&nbsp;</i></span>
				<span><strong>후기</strong></span>
				<h2 class="mt-1"><strong>내가 보낸 후기</strong></h2>
			</div>		
		</div>
	</div>
	<ul class="nav nav-tabs mx-5 mb-3" id="myTab" role="tablist">
		<li class="nav-item" role="sentReview">
			<button class="nav-link active" id="sent-tab" type="button" role="tab" aria-controls="sent" aria-selected="true" 
					onclick="location.href='https://localhost/user/sentReview';" class="text-dark fs-6 p-0 mt-1 ms-2" style="text-decoration-line: none;">
					보낸 후기
			</button>
		</li>
		<li class="nav-item" role="reveivedRevies">
	    	<button class="nav-link " id="received-tab" type="button" role="tab" aria-controls="received" aria-selected="false"
	    			onclick="location.href='https://localhost/user/receivedReview';" class="text-dark fs-6 p-0 mt-1 ms-2" style="text-decoration-line: none;">
	    			받은 후기
	    	</button>
		</li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane active" id="sent" role="tabpanel" aria-labelledby="sent-tab" tabindex="0">
			<div class="row mb-3 mx-5">
			<div class="col">
				<div class="headerBox">
					<h4>작성해야 할 후기</h4>
				</div>
				<c:choose>
					<c:when test="${empty reviewsToDo}">
						<div class="contentbox mb-5">
							<p>현재 작성할 후기가 없습니다. 여행을 한번 다녀올 때가 된 것 같네요!</p>
						</div>
					</c:when>
					<c:otherwise>
						<div class="row mb-3">
							<div class="col">
								<div class="contentbox">
									<c:forEach var="review" items="${reviewsToDo }">
										<div class="row">
											<div class="col-3 pt-3 ps-3" align="center">
												<a href="/acc/detail?no=${review.accNo }">
													<img src="/resources/images/acc/${not empty review.accommodation.imageCover ? review.accommodation.imageCover : 'no-image.jpg'}" class="bigRectangleImg mb-3">
												</a>
											</div>
											<div class="col-9 pt-3 ps-3" align="center">
												<div class="row" align="left">
													<div class="col mb-4">
														<strong><a href="/acc/detail?no=${review.accNo }" class="text-dark p-0 mt-1 ms-2">${review.accommodation.name }</a></strong>
													</div>
												</div>		
												<div class="row" align="left">
													<div class="col mb-3">
														<!-- Button trigger modal -->
														<button type="button" class="btn reviewBtn" onclick = "location.href='https://localhost/guestreview?accNo=${review.accNo }&reservationNo=${review.reservationNo }'">
														  리뷰 작성하기
														</button>		
														<p>호스트와 게스트는 숙박이 종료된 후 14일 이내에 후기를 작성할 수 있습니다.</p>		
													</div>											
												</div>		
											</div>			
										</div>			
										<hr/>								
									</c:forEach>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${empty sentGuestReviews && empty sentHostReviews}">
						<div class="contentbox">
							<p>아직 후기를 남기지 않으셨습니다.</p>
						</div>
					</c:when>
					<c:otherwise>
						<div class="row mb-3">
							<div class="col">
								<div class="headerBox">
									<h4>내가 작성한 후기</h4>
								</div>
								<div class="contentbox">
									<c:forEach var="review" items="${sentGuestReviews }">
										<div class="row">
											<c:choose>
												<c:when test="${review.deleted == 'Y' }">
													<div class="mt-3 mb-3" align="center">
														<p>삭제된 리뷰입니다.</p>
													</div>												
												</c:when>
												<c:otherwise>
													<div class="col-2 pt-3" align="center">
														<a href="/acc/detail?no=${review.accNo }">
															<img src="/resources/images/acc/${not empty review.accommodation.imageCover ? review.accommodation.imageCover : 'no-image.jpg'}" class="rectangleImg mb-3">
														</a>
														<p class="mb-0"><fmt:formatDate value="${review.createdDate }" pattern="yyyy년 MM월 dd일" /></p>
													</div>		
													<div class="col-10 mb-3">
														<div class="row">
															<div class="col-12 mb-3">
																<strong><a href="/acc/detail?no=${review.accNo }" class="text-dark fs-5 p-0 mt-1 ms-2">${review.accommodation.name }</a></strong>
																<p class="mb-5 mt-3">${review.content }</p>
																<div align="right">
																	<button class="modifyBtn" type="button" id="btn-modify-review-guest" onclick = "location.href='https://localhost/modifyreview?no=${review.no}'">수정하기</button>
																	<button class="deleteBtn" type="button" id="btn-delete-review-guest" onclick = "location.href='https://localhost/deletereview?no=${review.no}'">삭제하기</button>
																</div>
																<c:choose>
																	<c:when test="${empty review.positiveFeedback}">
																	</c:when>
																	<c:otherwise>
																		<p class="mb-0"><strong>긍정적 평가</strong></p>
																		<p class="mb-3">${review.positiveFeedback }</p>		
																	</c:otherwise>
																</c:choose>	
																<c:choose>
																	<c:when test="${empty review.nagativeFeedback}">
																	</c:when>
																	<c:otherwise>
																		<p class="mb-0"><strong>부정적 평가</strong></p>
																		<p class="mb-3">${review.nagativeFeedback }</p>		
																	</c:otherwise>
																</c:choose>			
															</div>
														</div>
													</div>
												</div>
												</c:otherwise>
											</c:choose>
										<hr />
									</c:forEach>
									<c:forEach var="review" items="${sentHostReviews }">
										<div class="row">
											<c:choose>
												<c:when test="${review.deleted == 'Y' }">
													<div class="mt-3 mb-3" align="center">
														<p>삭제된 리뷰입니다.</p>
													</div>
												</c:when>
												<c:otherwise>
													<div class="col-2 pt-3" align="center">
														<a href="#">
															<img src="/resources/images/profile/${not empty review.user.profileImage ? review.user.profileImage : 'profile-default-img.png'}" class="mb-3 userImg">
														</a>			
														<p class="mb-0">${review.user.name }</p>				
														<p class="mb-0"><fmt:formatDate value="${review.createdDate }" pattern="yyyy년 MM월 dd일" /></p>
													</div>		
													<div class="col-10 mb-3">
														<div class="row">
															<div class="col-12 mb-3">
																<strong><a href="/acc/detail?no=${review.accNo }" class="text-dark fs-5 p-0 mt-1 ms-2">${review.accommodation.name }</a></strong>
																<p class="mb-5 mt-3">${review.content }</p>
																<div align="right">
																	<button type="button" class="modifyBtn" id="btn-modify-review-host" onclick = "location.href='https://localhost/modifyhostreview?no=${review.no}'">수정하기</button>
																	<button type="button" class="deleteBtn" id="btn-delete-review-host" onclick = "location.href='https://localhost/deletehostreview?no=${review.no}'">삭제하기</button>
																</div>
																<c:choose>
																	<c:when test="${empty review.privateNote}">
																	</c:when>
																	<c:otherwise>
																		<p class="mb-0"><strong>private note</strong></p>
																		<p class="mb-3">${review.privateNote }</p>											
																	</c:otherwise>
																</c:choose>					
															</div>
														</div>
													</div>
												</div>
												</c:otherwise>
											</c:choose>
										<hr />
									</c:forEach>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>



</body>
</html>