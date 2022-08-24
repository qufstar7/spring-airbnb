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
<link rel="icon" href="../../../resources/aircnc.png">
<title>위시리스트-에어씨엔씨</title>
<style type="text/css">
/*  footer css   */
	html, body {
    margin: 0;
    padding: 0;
    height: 100%;
}

#body-wrapper {
    min-height: 100%;
    position: relative;
}

#body-content {
    margin-top: 100px;
    padding-bottom: 496px; /* footer의 높이 */
}

footer {
    width: 100%;
    height: 496px; /* footer의 높이 */
    position: absolute;  
    bottom: 0;
    left: 0;
    background-color: #F7F7F7;
    border-top: 1px solid #DDDDDD !important;
    min-width: 1128px;
    padding-left: 300px;
    padding-right: 300px;
    
    
}

</style>
</head>

<body>
<%@ include file="../common/nav3.jsp"%>
<div  id="body-wrapper" >
<div class="container" id="body-content">
	<div class="row my-5">
		<h2 class="fw-bold">위시리스트</h2>
	</div>
	<c:if test="${not empty LOGIN_USER}">
		<div class="row" id="div-main-wishlists">
			<c:if test="${empty wishlists}">
				<h4 class="fw-bold">첫 번째 위시리스트 만들기</h4>
				<p><small>검색 중에 마음에 드는 숙소나 즐길 거리를 위시리스트에 저장하려면 하트 아이콘을 누르세요.</small> </p>
			</c:if>
			<c:if test="${not empty wishlists}">
				<c:forEach var="wishlist" items="${wishlists}" varStatus="loop">
					<c:if test="${loop.index lt 9}">
					 <div class="col-xl-4 col-lg-3 col-md-6 col-sm-12 col-xs-12" >
							<a href="/wishlists/detail?no=${wishlist.no}">
									<div class="flex-container">
										<div class="_clcy">
											<div class="aca5">
												<div class="_1h6">
													<c:if test="${not empty wishlist.accs}">
														<c:forEach items="${wishlist.accs[0].photos }" var="photo">
															<c:if test="${photo.num eq 1 }">
																<img src="/resources/images/acc/${photo.name}" class="myImg" id="image-large">
															</c:if>
														</c:forEach>
													</c:if>
												</div>
											</div>
											<div class="div-small">
												<div class="_96vp">
													<div class="_1h6">
														<c:if test="${not empty wishlist.accs}">
															<c:forEach items="${wishlist.accs[0].photos }" var="photo">
																<c:if test="${photo.num eq 2 }">
																	<img src="/resources/images/acc/${photo.name}" class="myImg">
																</c:if>
															</c:forEach>
														</c:if>
													</div>
												</div>
												<div class="_17xh">
													<div class="_1h6">
														<c:if test="${not empty wishlist.accs}">
															<c:forEach items="${wishlist.accs[0].photos }" var="photo">
																<c:if test="${photo.num eq 3 }">
																	<img src="/resources/images/acc/${photo.name}" class="myImg">
																</c:if>
															</c:forEach>
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
	</c:if>
	<!-- 처음 화면에서 사용 -->
	<c:if test="${fn:length(wishlists) gt 10}">  
		<div>
		 <button id="btn-more-lists" class="my-5"><span>더보기</span></button>
		</div>
	</c:if>
	</div>
	<%@ include file="../common/footer.jsp"%>
</div>
<script type="text/javascript">
$(function() {

	
	$("#btn-more-lists").click(function() {
		
		let count = $(".flex-container").length;
		//alert(count);
		
		let startNum = count + 1;
		
		$.getJSON("/wishlists/getMoreLists", "startNum=" + startNum)
		 .done(function(result) {
			let addListContent = '';
		 	if(result.moreWishlists.length < 9) {
		 		$("#btn-more-lists").remove();
		 	}
		 	
	 		$.each(result.moreWishlists, function(i, wishlist) {
		 		let imageFirstHtml = '';
		 		let imageSecond1Html = '';
		 		let imageThirdHtml = '';
	 			if(wishlist.accs.length > 0) {
	 				let firstAcc = wishlist.accs[0];
	 				let photos = firstAcc.photos;
	 				
	 				$.each(photos, function(i, photo) {
	 					if(photo.num === 1) {
	 						imageFirstHtml = '<img src="/resources/images/acc/' + photo.name + '" class="myImg" id="image-large">';
	 						
	 					} else if(photo.num === 2) {
	 						imageSecond1Html = '<img src="/resources/images/acc/' + photo.name + '" class="myImg">';
	 					} else if(photo.num === 3) {
	 						imageThirdHtml = '<img src="/resources/images/acc/' + photo.name + '" class="myImg">';
	 					}
	 				})
	 				
	 				imageCoverHtml = '<img src="' + wishlist.accs[0].imageCover + '" class="myImg" id="image-large">';
	 			}
	 			addListContent += '<div class="col-xl-4 col-lg-3 col-md-6 col-sm-12 col-xs-12" >';
	 			addListContent += '<a href="/wishlists/detail?no=' + wishlist.no + '">';
	 			addListContent +=		'<div class="flex-container">';
	 			addListContent +=					'<div class="_clcy">';
	 			addListContent +=							'<div class="aca5">';
	 			addListContent +=								'<div class="_1h6">';
	 			addListContent +=										imageFirstHtml;
	 			addListContent +=								'</div>';
	 			addListContent +=							'</div>';
	 			addListContent +=							'<div class="div-small">';
	 			addListContent +=								'<div class="_96vp">';
	 			addListContent +=									'<div class="_1h6">';
	 			addListContent +=											imageSecond1Html;
	 			addListContent +=									'</div>';
	 			addListContent +=								'</div>';
	 			addListContent +=								'<div class="_17xh">';
	 			addListContent +=									'<div class="_1h6">';
	 			addListContent +=											imageThirdHtml;
	 			addListContent +=									'</div>';
	 			addListContent +=								'</div>';
	 			addListContent +=							'</div>';
	 			addListContent +=						'</div>';
	 			addListContent +=					'</div>';
	 			addListContent +=				'<div class="mt-2 mb-5">';
	 			addListContent +=			'<span class="fs-4">' + wishlist.name + '</span>';
	 			addListContent +=		'</div>';
	 			addListContent +=	'</a>';
	 			addListContent += '</div>';
	 			
	 		})
		 	
	 		$("#div-main-wishlists").append(addListContent);
		 	
			 
			 
		 })
		
	});
	
	
})
</script>
</body>
</html>