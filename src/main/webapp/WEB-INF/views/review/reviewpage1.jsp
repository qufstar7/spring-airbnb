<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
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
   	
	
</style>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col">
			<div>
				<span>프로필</span>
				<span><i class="bi bi-chevron-right"></i></span>
				<span>후기</span>
				<h2>내가 작성한 후기</h2>
			</div>		
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="headerBox">
				<span>지난 후기</span>
			</div>
			<div class="contentbox">
				<p>후기는 에어비앤비 숙박이 완료된 후 작성됩니다. 나에 대한 후기는 이곳과 공개 프로필에서 볼 수 있습니다.</p>
				<p>아직 작성된 후기가 없습니다.</p>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="headerBox">
				<span>작성해야 할 후기</span>
			</div>
			<div class="contentbox">
				<p>현재 작성할 후기가 없습니다. 여행을 한번 다녀올 때가 된 것 같네요!</p>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="headerBox">
				<span>내가 작성한 후기</span>
			</div>
			<div class="contentbox">
				<p>아직 후기를 남기지 않으셨습니다.</p>
			</div>
		</div>
	</div>
	
	<div class="row mb-3">
		<div class="col">
			<div class="headerBox">
				<span>지난 후기</span>
			</div>
			<div class="contentbox">
				<p>후기는 에어비앤비 숙박이 완료된 후 작성됩니다. 나에 대한 후기는 이곳과 공개 프로필에서 볼 수 있습니다.</p>
				<p>아직 작성된 후기가 없습니다.</p>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="headerBox">
				<span>작성해야 할 후기</span>
			</div>
			<div class="contentbox">
				<div class="row">
					<div class="col-2">
						<a href="../detail?no=102">
							<img src="/resources/images/acc/no-image.jpg" class="bigImg mb-3">
						</a>
					</div>
					<div class="col-4">
						<ul class="noBullet">
							<li>숙소 이름</li>
							<li>호스트 이름</li>
							<li>어디 지역</li>
							<li>2022년 7월 1일 ~ 2022년 8월 12일</li>
						</ul>
					</div>
					<div class="col-6">
						<p>이곳에서의 경험은 어땠나요?</p>
						<button>리뷰 작성하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="headerBox">
				<span>내가 작성한 후기</span>
			</div>
			<div class="contentbox">
				<div class="row">
					<div class="col-1">
						<a href="../detail?no=102">
							<img src="/resources/images/acc/no-image.jpg" class="smallImg mb-3">
						</a>
					</div>
					<div class="col-2">
						<h4>Review for 민수</h4>
						<p>2022년 8월 (리뷰 적은 달)</p>
					</div>
				</div>
				<div class="row">
					<div class="col mb-3">
						리뷰 내용을 적습니다. 정말 좋았고 어쩌고 저쩌고 정말 좋았고 어쩌고 저쩌고 . 정말 좋았고 어쩌고 저쩌고 았고 어쩌고 저쩌고 
						정말 좋았고 어쩌고 저쩌고 정말 좋았고 어쩌고 저쩌고 정말 좋았고 어쩌고 저쩌고 정말 좋았고 어쩌고 저쩌고 정말 좋았고 어쩌고 저쩌고 . 
						정말 좋았고 어쩌고 저쩌고 정말 좋았고 어쩌고 좋았고 … 더보기
					</div>
				</div>
				<button>수정하기</button>
				<button>삭제하기</button>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="headerBox">
				<span>지난 후기</span>
			</div>
			<div class="contentbox">
			<p>후기는 에어비앤비 숙박이 완료된 후 작성됩니다. 나에 대한 후기는 이곳과 공개 프로필에서 볼 수 있습니다.</p>
				<div class="row">
					<div class="col-10">
						<h4>숙소 이름</h4>
						<p>2022년 8월 (리뷰 적은 달)</p>
					</div>
					<div class="col-2">
						<a href="../detail?no=102">
							<img src="/resources/images/acc/no-image.jpg" class="rectangleImg mb-3">
						</a>
					</div>					
				</div>
				<div class="row">
					<div class="col mb-3">
						리뷰 내용을 적습니다. 정말 좋았고 어쩌고 저쩌고 정말 좋았고 어쩌고 저쩌고 . 정말 좋았고 어쩌고 저쩌고 았고 어쩌고 저쩌고 
						정말 좋았고 어쩌고 저쩌고 정말 좋았고 어쩌고 저쩌고 정말 좋았고 어쩌고 저쩌고 정말 좋았고 어쩌고 저쩌고 정말 좋았고 어쩌고 저쩌고 . 
						정말 좋았고 어쩌고 저쩌고 정말 좋았고 어쩌고 좋았고 … 더보기
					</div>
				</div>
				<div class="row">
					<div class="col-1 mb-3">
						<a href="../profile?no=1">
							<img src="/resources/images/profile/no-image.png" class="userImg mb-3">
						</a>
					</div>
					<div class="col mb-3">
						<p class="mb-0">게스트 이름, (사는 곳)</p>				
						<p>회원가입 : 2011</p>	
					</div>			
				</div>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="headerBox">
				<span>지난 후기</span>
			</div>
			<div class="contentbox">
			<p>후기는 에어비앤비 숙박이 완료된 후 작성됩니다. 나에 대한 후기는 이곳과 공개 프로필에서 볼 수 있습니다.</p>
				<div class="row">
					<div class="col-10">
						<h4>숙소 이름</h4>
						<p>2022년 8월 (리뷰 적은 달) by guest(혹은 host. 값 불러오기)</p>
					</div>
					<div class="col-2">
						<a href="../detail?no=102">
							<img src="/resources/images/acc/no-image.jpg" class="rectangleImg mb-3">
						</a>
					</div>					
				</div>
				<div class="row">
					<div class="col mb-3">
						리뷰 내용을 적습니다. 정말 좋았고 어쩌고 저쩌고 정말 좋았고 어쩌고 저쩌고 . 정말 좋았고 어쩌고 저쩌고 았고 어쩌고 저쩌고 
						정말 좋았고 어쩌고 저쩌고 정말 좋았고 어쩌고 저쩌고 정말 좋았고 어쩌고 저쩌고 정말 좋았고 어쩌고 저쩌고 정말 좋았고 어쩌고 저쩌고 . 
						정말 좋았고 어쩌고 저쩌고 정말 좋았고 어쩌고 좋았고 … 더보기
					</div>
				</div>
				<div class="row">
					<div class="col-1 mb-3">
						<a href="../profile?no=1">
							<img src="/resources/images/profile/no-image.png" class="userImg mb-3">
						</a>
					</div>
					<div class="col mb-3">
						<p class="mb-0">게스트 이름, (사는 곳)</p>				
						<p>회원가입 : 2011</p>	
					</div>			
				</div>
			</div>
		</div>
	</div>
	
</div>
</body>
</html>