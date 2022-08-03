<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<style>
	.noMargin {
		margin: 0;
	}

	.searchKeyword {
		padding-left: 40px;
		
	}

	.search-box {
	    position: relative;
	    text-align: center;
	    margin: 0 auto;
	}
	
	.bi-search {
	    position: absolute;
	    left: 15px;
	    top: 20px;
	    margin: 0;
	}

	input {
	    width: 100%;
	    border-radius: 30px;
	    border: 1px solid #bbb;
	    margin: 10px 0;
	    padding: 10px 12px;
	}
 input[type=search]::-ms-clear
</style>
</head>
<body>

	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-show-review">
		후기 128개
	</button>
			
<!-- form 시작 -->
<!-- 파라미터로 숙소 번호 받아야 한다. -->
<form class="mb-3" name="" id="">		
<!-- Scrollable Modal -->
<div class="modal fade" id="modal-show-review" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  	<div class="modal-dialog modal-dialog-scrollable modal-xl">
    	<div class="modal-content">
      		<div class="modal-header">
        		<h3 class="modal-title" id="exampleModalLabel"></h5>
       	 		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      		</div>			      
      		<div class="modal-body">
				<div class="row">
					<div class="col-4">
						<div class="mb-3">
							<i class="bi bi-star-fill"></i>
							<span><strong>4.96</span></strong>
							<span><strong>후기 128개</strong></span>
						</div>
						<div>
							<p class="noMargin">청결도</p>
							<p class="noMargin">정확성</p>
							<p class="noMargin">의사소통</p>
							<p class="noMargin">위치</p>
							<p class="noMargin">체크인</p>
							<p class="noMargin">가격 대비 만족도</p>
						</div>
		     		</div>
		     		<div class="col-8">		
		     			<div class="row">
		     				<div class="col-12">
								<div class="row mb-5">
									<div class="col-12">
										<div>
											<form>
												<div class="search-box mb-3">
													<i class="bi bi-search"></i>
													<input type="search" placeHolder="후기 검색" class="searchKeyword" id="search-keyword" name="keyword"/> 
												</div>
											</form>
										</div>
										<div class="row-4 mb-3">
											<p class="noMargin">Martin</p>
											<p class="noMargin">2017년 12월</p>
										</div>
										<div class="row-8 mb-5">
											<p>꽃섬에서의 휴가는 기대를 훨씬 뛰어넘었습니다. 훌륭하고 친절하며 항상 이용할 수 있는 서비스와 지원이 우리의 꿈을 현실로 만들었습니다. 
												이 섬은 표준이 아닌 다른 모든 것을 갖추고 있습니다. 콘셉트와 숙소가 환경과 통합되어 있다는 점이 인상적입니다.
												필립은 모호한 프로젝트를 진행합니다. 가장 친한 친구들과 함께 향후 몇 년간의 진행 상황을 확인할 ...
											</p>
											<span><strong>더 보기 ></strong></span>
										</div>
									</div>
									<div class="col-12">
										<div class="row-4 mb-3">
											<p class="noMargin">Martin</p>
											<p class="noMargin">2017년 12월</p>
										</div>
										<div class="row-8 mb-5">
											<p>꽃섬에서의 휴가는 기대를 훨씬 뛰어넘었습니다. 훌륭하고 친절하며 항상 이용할 수 있는 서비스와 지원이 우리의 꿈을 현실로 만들었습니다. 
												이 섬은 표준이 아닌 다른 모든 것을 갖추고 있습니다. 콘셉트와 숙소가 환경과 통합되어 있다는 점이 인상적입니다.
												필립은 모호한 프로젝트를 진행합니다. 가장 친한 친구들과 함께 향후 몇 년간의 진행 상황을 확인할 ...
											</p>
											<span><strong>더 보기 ></strong></span>
										</div>
									</div>
									<div class="col-12">
										<div class="row-4 mb-3">
											<p class="noMargin">Martin</p>
											<p class="noMargin">2017년 12월</p>
										</div>
										<div class="row-8 mb-5">
											<p>꽃섬에서의 휴가는 기대를 훨씬 뛰어넘었습니다. 훌륭하고 친절하며 항상 이용할 수 있는 서비스와 지원이 우리의 꿈을 현실로 만들었습니다. 
												이 섬은 표준이 아닌 다른 모든 것을 갖추고 있습니다. 콘셉트와 숙소가 환경과 통합되어 있다는 점이 인상적입니다.
												필립은 모호한 프로젝트를 진행합니다. 가장 친한 친구들과 함께 향후 몇 년간의 진행 상황을 확인할 ...
											</p>
											<span><strong>더 보기 ></strong></span>
										</div>
									</div>
									<div class="col-12">
										<div class="row-4 mb-3">
											<p class="noMargin">Martin</p>
											<p class="noMargin">2017년 12월</p>
										</div>
										<div class="row-8 mb-5">
											<p>꽃섬에서의 휴가는 기대를 훨씬 뛰어넘었습니다. 훌륭하고 친절하며 항상 이용할 수 있는 서비스와 지원이 우리의 꿈을 현실로 만들었습니다. 
												이 섬은 표준이 아닌 다른 모든 것을 갖추고 있습니다. 콘셉트와 숙소가 환경과 통합되어 있다는 점이 인상적입니다.
												필립은 모호한 프로젝트를 진행합니다. 가장 친한 친구들과 함께 향후 몇 년간의 진행 상황을 확인할 ...
											</p>
											<span><strong>더 보기 ></strong></span>
										</div>
									</div>
									<div class="col-12">
										<div class="row-4 mb-3">
											<p class="noMargin">Martin</p>
											<p class="noMargin">2017년 12월</p>
										</div>
										<div class="row-8 mb-5">
											<p>꽃섬에서의 휴가는 기대를 훨씬 뛰어넘었습니다. 훌륭하고 친절하며 항상 이용할 수 있는 서비스와 지원이 우리의 꿈을 현실로 만들었습니다. 
												이 섬은 표준이 아닌 다른 모든 것을 갖추고 있습니다. 콘셉트와 숙소가 환경과 통합되어 있다는 점이 인상적입니다.
												필립은 모호한 프로젝트를 진행합니다. 가장 친한 친구들과 함께 향후 몇 년간의 진행 상황을 확인할 ...
											</p>
											<span><strong>더 보기 ></strong></span>
										</div>
									</div>
									<div class="col-12">
										<div class="row-4 mb-3">
											<p class="noMargin">Martin</p>
											<p class="noMargin">2017년 12월</p>
										</div>
										<div class="row-8 mb-5">
											<p>꽃섬에서의 휴가는 기대를 훨씬 뛰어넘었습니다. 훌륭하고 친절하며 항상 이용할 수 있는 서비스와 지원이 우리의 꿈을 현실로 만들었습니다. 
												이 섬은 표준이 아닌 다른 모든 것을 갖추고 있습니다. 콘셉트와 숙소가 환경과 통합되어 있다는 점이 인상적입니다.
												필립은 모호한 프로젝트를 진행합니다. 가장 친한 친구들과 함께 향후 몇 년간의 진행 상황을 확인할 ...
											</p>
											<span><strong>더 보기 ></strong></span>
										</div>
									</div>
									<div class="col-12">
										<div class="row-4 mb-3">
											<p class="noMargin">Martin</p>
											<p class="noMargin">2017년 12월</p>
										</div>
										<div class="row-8 mb-5">
											<p>꽃섬에서의 휴가는 기대를 훨씬 뛰어넘었습니다. 훌륭하고 친절하며 항상 이용할 수 있는 서비스와 지원이 우리의 꿈을 현실로 만들었습니다. 
												이 섬은 표준이 아닌 다른 모든 것을 갖추고 있습니다. 콘셉트와 숙소가 환경과 통합되어 있다는 점이 인상적입니다.
												필립은 모호한 프로젝트를 진행합니다. 가장 친한 친구들과 함께 향후 몇 년간의 진행 상황을 확인할 ...
											</p>
											<span><strong>더 보기 ></strong></span>
										</div>
									</div>
									<div class="col-12">
										<div class="row-4 mb-3">
											<p class="noMargin">Martin</p>
											<p class="noMargin">2017년 12월</p>
										</div>
										<div class="row-8 mb-5">
											<p>꽃섬에서의 휴가는 기대를 훨씬 뛰어넘었습니다. 훌륭하고 친절하며 항상 이용할 수 있는 서비스와 지원이 우리의 꿈을 현실로 만들었습니다. 
												이 섬은 표준이 아닌 다른 모든 것을 갖추고 있습니다. 콘셉트와 숙소가 환경과 통합되어 있다는 점이 인상적입니다.
												필립은 모호한 프로젝트를 진행합니다. 가장 친한 친구들과 함께 향후 몇 년간의 진행 상황을 확인할 ...
											</p>
											<span><strong>더 보기 ></strong></span>
										</div>
									</div>
									<div class="col-12">
										<div class="row-4 mb-3">
											<p class="noMargin">Martin</p>
											<p class="noMargin">2017년 12월</p>
										</div>
										<div class="row-8 mb-5">
											<p>꽃섬에서의 휴가는 기대를 훨씬 뛰어넘었습니다. 훌륭하고 친절하며 항상 이용할 수 있는 서비스와 지원이 우리의 꿈을 현실로 만들었습니다. 
												이 섬은 표준이 아닌 다른 모든 것을 갖추고 있습니다. 콘셉트와 숙소가 환경과 통합되어 있다는 점이 인상적입니다.
												필립은 모호한 프로젝트를 진행합니다. 가장 친한 친구들과 함께 향후 몇 년간의 진행 상황을 확인할 ...
											</p>
											<span><strong>더 보기 ></strong></span>
										</div>
									</div>
									<div class="col-12">
										<div class="row-4 mb-3">
											<p class="noMargin">Martin</p>
											<p class="noMargin">2017년 12월</p>
										</div>
										<div class="row-8 mb-5">
											<p>꽃섬에서의 휴가는 기대를 훨씬 뛰어넘었습니다. 훌륭하고 친절하며 항상 이용할 수 있는 서비스와 지원이 우리의 꿈을 현실로 만들었습니다. 
												이 섬은 표준이 아닌 다른 모든 것을 갖추고 있습니다. 콘셉트와 숙소가 환경과 통합되어 있다는 점이 인상적입니다.
												필립은 모호한 프로젝트를 진행합니다. 가장 친한 친구들과 함께 향후 몇 년간의 진행 상황을 확인할 ...
											</p>
											<span><strong>더 보기 ></strong></span>
										</div>
									</div>
								</div>
							</div>
						</div>
		      		</div>
		     	</div>
			</div>		  
		</div>
	</div>
</div>
</form>
</body>
</html>