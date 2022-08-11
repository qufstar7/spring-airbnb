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
		<div class="row">
			<div class="col-6">
			
				<p><span class="material-symbols-outlined">
				language
				   </span>여행에 차질이 없도록 최선을 다해 도와드리겠습니다. 모든 예약은 에어비앤비의 게스트 환불 정책에 따라 보호를 받습니다.
				</p>
			</div>
			<div class="col-6">
			</div>
     	</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	
	let $scoreBox = $("#box-score");
	let $reviewBox = $("#box-review");
	
	let params = new URLSearchParams(document.location.search);
	let accNo = params.get("accNo");
	
	$.ajax({
		type: "GET",
		url: "review/alist",
		data: {accNo:accNo},
		dataType: 'json',
		success: function(data) {
			
			$.ajax({
				type: "GET",
				url: "review/getreviews",
				data: {accNo:accNo},
				dataType: 'json',
				success: function(data) {
					let item = data.item;
					// let image = user.image;
					
					if (item.length == 0){
						let content1 = '';
						content1 += '<p>이 호스트의 다른 숙소에 대한 후기가 763개 있습니다. 다른 숙소 후기 보기</p>';
						$scoreBox.html(content1);
						
						let content2 = '';
						content2 += '<p>여행에 차질이 없도록 최선을 다해 도와드리겠습니다. 모든 예약은 에어비앤비의 게스트 환불 정책에 따라 보호를 받습니다.</p>';
						$reviewBox.html(content2);
						
					} else {	
						$.each(reviews, function(index, review) {
							let content3 = '';
							content3 += '<i class="bi bi-star-fill"></i>';
							content3 += '<span><strong>4.96</span></strong>';
							content3 += '<span><strong>후기 128개</strong></span>';
							content3 += '<h4><i class="bi bi-star-fill"></i> <span>4.96</span>${acc.reviewScore } ';
							content3 += '<span class="text-decoration">후기 128${acc.reviewCount }개</span></h4>';
							
							$scoreBox.append(content3);
							
							let content4 = '';
							content4 += '<div>';
							content4 += '	<form>';
							content4 += '		<div class="search-box mb-3">';
							content4 += '			<i class="bi bi-search"></i>';
							content4 += '			<input type="search" placeHolder="후기 검색" class="searchKeyword" id="search-keyword" name="keyword"/> ';
							content4 += '		</div>';
							content4 += '	</form>';
							content4 += '</div>';
							content4 += '<div id="box-show-reviews">';
							content4 += '	<div class="row-4 mb-3">';
							content4 += '		<p class="noMargin">Martin</p>';
							content4 += '		<p class="noMargin">2017년 12월</p>';
							content4 += '	</div>';
							content4 += '	<div class="row-8 mb-5">';
							content4 += '		<p>친한 친구들과 함께 향후 몇 년간의 진행 상황을 확인할 ...';
							content4 += '		</p>';
							content4 += '		<span><strong>더 보기 >> </strong></span>';
							content4 += '	</div>';
							content4 += '</div>';
						
							$reviewBox.append(content4);
						})
					}
				}
			})
			

		}
	})
})

</script>
</body>
</html>