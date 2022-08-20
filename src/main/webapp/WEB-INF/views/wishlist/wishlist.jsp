<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/fresco.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/wishlist2.css">
<title>위시리스트-에어씨엔씨</title>
</head>

<body>
<%@ include file="../common/nav.jsp"%>
<div class="container"  id="main">
	<div class="row my-5">
		<h2 class="fw-bold">위시리스트</h2>
	</div>
	<div class="row">
	<c:if test="${empty wishlists}">
		<h4 class="fw-bold">첫 번째 위시리스트 만들기</h4>
		<p><small>검색 중에 마음에 드는 숙소나 즐길 거리를 위시리스트에 저장하려면 하트 아이콘을 누르세요.</small> </p>
	</c:if>
	<c:if test="${not empty wishlists}">
		<c:forEach var="wishlist" items="${wishlists}" varStatus="loop">
			<c:if test="${loop.index lt 9}">
			 <div class="col-xl-4 col-lg-3 col-md-6 col-sm-12 col-xs-12" id="div-main-wishlists">
					<a href="/wishlists/detail?no=${wishlist.no}">
							<div class="flex-container">
								<div class="_clcy">
									<div class="aca5">
										<div class="_1h6">
											<c:if test="${not empty wishlist.accs}">
												<img src="${wishlist.accs[0].imageCover}" class="myImg" id="image-large">
											</c:if>
										</div>
									</div>
									<div class="div-small">
										<div class="_96vp">
											<div class="_1h6">
												<c:if test="${not empty wishlist.accs}">
														<img src="https://a0.muscache.com/airbnb/static/destinations/o-Lisbon_480x320.jpg" class="myImg">
												</c:if>
											</div>
										</div>
										<div class="_17xh">
											<div class="_1h6">
												<c:if test="${not empty wishlist.accs}">
													<img src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg" class="myImg">
												</c:if>
											</div>
										</div>
									</div>
								</div>
							</div>
						<div class="mt-2 mb-5">
							<span class="fs-4">${wishlist.name}</span>
						</div>
					</a>
				</div>
			</c:if>
		</c:forEach>
	</c:if>
	</div>
	<c:if test="${fn:length(wishlists) gt 10}">  
		<div>
		 <button id="btn-more-lists"><span>더보기</span></button>
		</div>
	</c:if>
</div>
<script type="text/javascript">
$(function() {

	$("#btn-more-lists").click(function() {
		
		let startNum = $(".flex-container").length;
		alert(startNum);
		
		let addListContent = '';
		
		$.getJSON("/wishlists/getMoreLists", "startNum=" + startNum)
		 .done(function(moreLists) {
		 	if(moreLists.length <=9) {
		 		$("#btn-more-lists").remove();
		 		$.each(moreLists, function(i, wishlist) {
		 			
		 			addListContent += `<a href="/wishlists/detail?no=${wishlist.no}">
											<div class="flex-container">
												<div class="_clcy">
													<div class="aca5">
														<div class="_1h6">
															<c:if test="${not empty wishlist.accs}">
																<img src="${wishlist.accs[0].imageCover}" class="myImg" id="image-large">
															</c:if>
														</div>
													</div>
													<div class="div-small">
														<div class="_96vp">
															<div class="_1h6">
																<c:if test="${not empty wishlist.accs}">
																		<img src="https://a0.muscache.com/airbnb/static/destinations/o-Lisbon_480x320.jpg" class="myImg">
																</c:if>
															</div>
														</div>
														<div class="_17xh">
															<div class="_1h6">
																<c:if test="${not empty wishlist.accs}">
																	<img src="https://a0.muscache.com/airbnb/static/destinations/o-Kyoto_480x320.jpg" class="myImg">
																</c:if>
															</div>
														</div>
													</div>
												</div>
											</div>
										<div class="mt-2 mb-5">
											<span class="fs-4">${wishlist.name}</span>
										</div>
									</a>`;
		 			
		 			
		 		});
		 		
		 		$("#div-main-wishlists").append(addListContent);
		 	} else {
		 		
		 	}
			 
			 
		 })
		
	});
	
	
	
})
</script>
</body>
</html>