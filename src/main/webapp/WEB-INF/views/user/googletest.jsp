<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- google gsi -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script src="https://unpkg.com/jwt-decode/build/jwt-decode.js"></script>
<title>Insert title here</title>
</head>
<body>
    <div id="login">
    	<input type="button" value="로그인" id="btn-signIn-With-Google" /><br>
	</div>
	<div id="logout" style="display: none;">
	    <input type="button" id="btn-signOut" value="로그아웃" /><br>
	
	    <img id="upic" src=""><br>
	    <span id="uname"></span>
	</div>
<script type="text/javascript">
$(function () {
	
	$("#btn-signIn-With-Google").click(function() {
		google.accounts.id.initialize({
	        client_id: "340808936773-p2v7dk0jtatnsjl29nnvivnol8f9rni8.apps.googleusercontent.com",
	        callback: handleCredentialResponse
	    });
	    google.accounts.id.prompt();
	})
	function handleCredentialResponse(response) {
	    var profile = jwt_decode(response.credential);
	    console.log(profile);
		console.log("ID: " + profile.sub);
		console.log('Name: ' + profile.name);
	    console.log("Image URL: " + profile.picture);
	    console.log("Email: " + profile.email);    
	    
		$('#login').css('display', 'none');
		$('#logout').css('display', 'block');
		$('#upic').attr('src', profile.picture);
		$('#uname').html('[ ' +profile.name + ' ]');
	}
	
	$("#btn-signOut").click(function() {
	    google.accounts.id.disableAutoSelect();
	    
	    $('#login').css('display', 'block');
	    $('#logout').css('display', 'none');
	    $('#upic').attr('src', '');
	    $('#uname').html('');
	})
})


</script>
 </body>
</html>