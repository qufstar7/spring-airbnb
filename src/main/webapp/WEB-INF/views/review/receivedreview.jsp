<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
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
<title>받은 후기</title>
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
	
   	.userImg {
 			width: 60px;
			height: 60px;  		
			border-radius: 100%;	
   	}
   	
	.noBullet	{
 	  		list-style:none;
 	  		
   	}
   	
   	.replyBtn {  
			background: white;
		    color: black;
		    font-size: large;
		    border: solid 1px black;
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
				<h2 class="mt-1"><strong>내가 받은 후기</strong></h2>
			</div>		
		</div>
	</div>
	<ul class="nav nav-tabs mx-5 mb-3" id="myTab" role="tablist">
		<li class="nav-item" role="sentReview">
			<button class="nav-link" id="sent-tab" type="button" role="tab" aria-controls="sent" aria-selected="true" 
					onclick="location.href='https://localhost/user/sentReview';" class="text-dark fs-6 p-0 mt-1 ms-2" style="text-decoration-line: none;">
					보낸 후기
			</button>
		</li>
		<li class="nav-item" role="reveivedRevies">
	    	<button class="nav-link active " id="received-tab" type="button" role="tab" aria-controls="received" aria-selected="false"
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
						<h4>호스트의 후기</h4>
					</div>
					<c:choose>
						<c:when test="${empty hostReviews}">
							<div class="contentbox mb-5">
								<p>후기는 에어비앤비 숙박이 완료된 후 작성됩니다. 나에 대한 후기는 이곳과 공개 프로필에서 볼 수 있습니다.</p>
								<p>아직 작성된 후기가 없습니다.</p>
							</div>
						</c:when>
						<c:otherwise>
							<div class="row mb-3">
								<div class="col">
									<div class="contentbox">
										<p class="mb-3">후기는 에어비앤비 숙박이 완료된 후 작성됩니다. 나에 대한 후기는 이곳과 공개 프로필에서 볼 수 있습니다.</p>
										<c:forEach var="review" items="${hostReviews }">
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
																<img src="../resources/images/profile/${not empty review.user.profileImage ? review.user.profileImage : 'profile-default-img.png'}" class="userImg mb-3">
															</a>
															<p class="mb-0">${review.user.name }</p>				
															<p class="mb-0"><fmt:formatDate value="${review.createdDate }" pattern="yyyy년 MM월 dd일" /> </p>
														</div>					
														<div class="col-10 mb-3">
															<div class="row">
																<div class="col-12 mb-3">
																	<strong><a href="/acc/detail?no=${review.accNo }" class="text-dark fs-5 p-0 mt-1 ms-2">${review.accommodation.name }</a></strong>
																	<p class="mt-3">${review.content }</p>
																	<div align="right"><button class="replyBtn">공개 답변 남기기</button></div>
																</div>
																<c:choose>
																	<c:when test="${review.privateNote == '' }">
																		<span>""</span>
																	</c:when>
																	<c:otherwise>
																		<div>
																			<h6><strong>비공개 후기</strong></h6>
																			<p>${review.privateNote }</p>											
																		</div>		
																	</c:otherwise>
																</c:choose>			
															</div>							
														</div>											
													</div>			
													</c:otherwise>
												</c:choose>
											<hr/>								
										</c:forEach>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${empty guestReviews}">
							<div class="contentbox">
								<p>후기는 에어비앤비 숙박이 완료된 후 작성됩니다. 나에 대한 후기는 이곳과 공개 프로필에서 볼 수 있습니다.</p>
								<p>아직 작성된 후기가 없습니다.</p>
							</div>
						</c:when>
						<c:otherwise>
							<div class="row mb-3">
								<div class="col">
									<div class="headerBox">
										<h4>게스트의 후기</h4>
									</div>
									<div class="contentbox">
									<p>후기는 에어비앤비 숙박이 완료된 후 작성됩니다. 나에 대한 후기는 이곳과 공개 프로필에서 볼 수 있습니다.</p>
										<c:forEach var="review" items="${guestReviews }">
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
																<img src="/resources/images/profile/${not empty review.user.profileImage ? review.user.profileImage : 'profile-default-img.png'}" class="userImg mb-3">
															</a>
															<p class="mb-0">${review.user.name }</p>				
															<p class="mb-0"><fmt:formatDate value="${review.createdDate }" pattern="yyyy년 MM월 dd일" /></p>
														</div>		
														<div class="col-10 mb-3">
															<div class="row">
																<div class="col-12 mb-3">
																	<strong><a href="/acc/detail?no=${review.accNo }" class="text-dark fs-5 p-0 mt-1 ms-2">${review.accommodation.name }</a></strong>
																	<p class="mt-3">${review.content }</p>
																	<div align="right" class="mb-3"><button class="replyBtn">공개 답변 남기기</button></div>			
																	<c:choose>
																		<c:when test="${empty review.positiveFeedback}">
																		</c:when>
																		<c:otherwise>
																			<p class="mb-0"><strong>긍정적 평가</strong></p>
																			<p>${review.positiveFeedback }</p>		
																		</c:otherwise>
																	</c:choose>	
																	<c:choose>
																		<c:when test="${empty review.nagativeFeedback}">
																		</c:when>
																		<c:otherwise>
																			<p class="mb-0"><strong>부정적 평가</strong></p>
																			<p>${review.nagativeFeedback }</p>		
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
</div>

</body>
</html>