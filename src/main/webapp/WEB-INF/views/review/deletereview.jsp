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
<title>리뷰 삭제하기</title>
</head>
<body>
<div class="container">
<%@ include file="../common/nav.jsp"%>
	<div class="modal fade" id="deleteModal1" aria-hidden="true"  data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="deleteModal1" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body mx-auto">
					<div class="px-5">
						<img src="/resources/logo.png" alt="logo" style="width:130px; height:130px" class="mb-3 mt-3" id="img">
						<br />
					</div>
					<div>	
						<h4><strong>정말 삭제하시겠습니까?</strong><h4>
						<p class="fs-5 mb-5">삭제 후 복구는 불가합니다.</p>
					</div>
				</div>
				<div class="modal-footer mx-auto" >
					<button type="button" class="btn px-5 endBtn" id="btn-close" onclick="location.href='https://localhost/user/sentReview';">아니오</button>
					<button type="button" class="btn px-5 endBtn" id="btn-delete-review" >네</button>
		    	</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="deleteModal2" aria-hidden="true"  data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="deleteModal2" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body mx-auto">
					<div class="px-5">
						<img src="/resources/logo.png" alt="logo" style="width:130px; height:130px" class="mb-3 mt-3" id="img">
						<br />
					</div>
					<div>	
						<h4><strong>삭제가 완료되었습니다.</strong><h4>
					</div>
				</div>
				<div class="modal-footer mx-auto" >
					<button type="button" class="btn px-5 endBtn" id="btn-go-review" onclick="location.href='https://localhost/user/sentReview';">나의 후기로 가기</button>
					<button type="button" class="btn px-5 endBtn" id="btn-go-main" onclick="location.href='https://localhost/';">>메인으로 가기</button>
		    	</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	
	let deleteModal1 = new bootstrap.Modal(document.getElementById("deleteModal1"));
	let deleteModal2 = new bootstrap.Modal(document.getElementById("deleteModal2"));
	
	let params = new URLSearchParams(document.location.search);
	let no = params.get("no");	// reviewNo
	
	$(document).ready(function() {
		deleteModal1.show();
	})
	
	$("#btn-delete-review").click(function() {
		deleteModal1.hide();
		
		let review = {
			no: no
		}
		
		$.ajax({
			type: "PUT",							// HTTP 요청 방식
			url: '/review/delete',					// 요청 URL
			data: JSON.stringify(review),			// 서버로 보내는 데이터
			contentType: "application/json",		// 서버로 보내는 요청메세지의 컨텐츠 타입
			dataType: 'json',						// 서버로부터 받을 것으로 예상되는 응답메세지의 컨텐츠 타입
			success: function() {
			}
		})
		deleteModal2.show();
	})
	
})

</script>
</body>
</html>