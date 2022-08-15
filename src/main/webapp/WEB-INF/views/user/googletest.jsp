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
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<button id="buttonDiv">구글로 로그인하기</button>  
    <div id="login">
    	<button type="button" value="로그인" id="btn-signIn-With-Google" class="" ></button> <br>
	</div>
	<div id="logout" style="display: none;">
	    <input type="button" id="btn-signOut" value="로그아웃" /><br>
	
	    <img id="upic" src=""><br>
	    <span id="uname"></span>
	</div>
<script type="text/javascript">
/* $(function () {
	$("#buttonDiv").on('click', function() {
		$("#btn-signIn-With-Google").click();
	})
}) */

$(function () {
	$(document).ready(function() {
		google.accounts.id.initialize({
		    client_id: "340808936773-p2v7dk0jtatnsjl29nnvivnol8f9rni8.apps.googleusercontent.com",
		    callback: handleCredentialResponse
		  });
		  google.accounts.id.renderButton(
		    document.getElementById("btn-signIn-With-Google"),
		    { theme: "outline", size: "large" }  // customization attributes
		  ); 
		  google.accounts.id.prompt(); // also display the One Tap dialog
	})
	
	function handleCredentialResponse(response) {
		const responsePayload = parseJwt(response.credential);
		console.log("ID: " + responsePayload.sub);
	    console.log('Full Name: ' + responsePayload.name);
	    console.log('Given Name: ' + responsePayload.given_name);
	    console.log('Family Name: ' + responsePayload.family_name);
	    console.log("Image URL: " + responsePayload.picture);
	    console.log("Email: " + responsePayload.email);
	}
	function parseJwt (token) {
	    var base64Url = token.split('.')[1];
	    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
	    var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
	        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
	    }).join(''));

	    return JSON.parse(jsonPayload);
	};
/* window.onload = function () {
	  google.accounts.id.initialize({
	    client_id: "340808936773-p2v7dk0jtatnsjl29nnvivnol8f9rni8.apps.googleusercontent.com",
	    callback: handleCredentialResponse
	  });
	  google.accounts.id.renderButton(
	    document.getElementById("btn-signIn-With-Google"),
	    { theme: "outline", size: "large" }  // customization attributes
	  ); 
	  google.accounts.id.prompt(); // also display the One Tap dialog
	} */

	/* function handleCredentialResponse(response) {
		const responsePayload = parseJwt(response.credential);
		console.log("ID: " + responsePayload.sub);
	    console.log('Full Name: ' + responsePayload.name);
	    console.log('Given Name: ' + responsePayload.given_name);
	    console.log('Family Name: ' + responsePayload.family_name);
	    console.log("Image URL: " + responsePayload.picture);
	    console.log("Email: " + responsePayload.email);
	}
	function parseJwt (token) {
	    var base64Url = token.split('.')[1];
	    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
	    var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
	        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
	    }).join(''));

	    return JSON.parse(jsonPayload);
	}; */
})
	



/* $(function () {
	
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
}) */


</script>
 </body>
</html>