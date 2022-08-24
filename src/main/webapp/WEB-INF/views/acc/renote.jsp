<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
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
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700" rel="stylesheet">
<link href="../resources/aircnc.png" rel="icon" type="image/x-icon" />
<title>${recvUser.name }에게 답장하기</title>
</head>
<body>
<div class="container p-3">
	<form action="note/reAdd" id="reNote-form" method="post">
		<div class="col-12 pb-1">
			<h4>${recvUser.name }에게 답장하기</h4>
			<textarea class="form-control rounded" name="content" style="width: 500px; height: 100%; min-height: 176px;">
			</textarea>
			<input type="hidden" name="no" value="${acc.accNo }"> 
			<input type="hidden" name="recvNo" value="${recvUser.no }"> 
		</div>
		<button type="button" id="note-btn" class="btn btn-outline-dark">메세지 전송하기</button>
	</form>
</div>
<script type="text/javascript">
$(function () {
	


      	
		$("#note-btn").click( function() {
			let params = $("#reNote-form").serialize();
			$.post("/acc/note/reAdd", params,  function(result) {
				if(result.success) {
					window.close();
				}	
			}) 
		});
		
});
</script>
</body>
</html>