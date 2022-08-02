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
<!-- google -->
<!-- <meta name="google-signin-scope" content="profile email">
앱의 클라이언트 ID 지정
<meta name="google-signin-client_id" content="340808936773-p2v7dk0jtatnsjl29nnvivnol8f9rni8.apps.googleusercontent.com"> -->
<!-- google SDK( Google 플랫폼 라이브러리) -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script src="https://unpkg.com/jwt-decode/build/jwt-decode.js"></script>
<title>Insert title here</title>
</head>
<body>
	<!-- data-onsuccess="onSignIn": 버튼을 클릭해서 사용자로그인을 하면 정보를 받을 콜백메소드 -->
	<!-- 자동으로 렌더링된 로그인 버튼 -->
    <!-- <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
    <button type="button" onclick="signOut();">Sign Out</button>  -->
    <div id="login">
    	<input type="button" value="로그인" id="btn-signIn" /><br>
	</div>
	<div id="logout" style="display: none;">
	    <input type="button" id="btn-signOut" value="로그아웃" /><br>
	
	    <img id="upic" src=""><br>
	    <span id="uname"></span>
	</div>

	

    

	<!-- <div id="g_id_onload"
         data-client_id="340808936773-p2v7dk0jtatnsjl29nnvivnol8f9rni8.apps.googleusercontent.com"
         data-callback="handleCredentialResponse"
         data-login_uri="http://localhost">
    </div>
    <div class="g_id_signin" data-type="standard"></div> -->



    <!-- <script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      }
      // 로그아웃처리
      function signOut() {
    	  gapi.auth2.getAuthInstance().disconnect();
      }
      // 구글 로그아웃 표준 코드
      function signOut() {
    	    var auth2 = gapi.auth2.getAuthInstance();
    	    auth2.signOut().then(function () {
    	      console.log('User signed out.');
    	    });
    	  }
    </script> -->
<script type="text/javascript">
$(function () {
	
	$("#btn-signIn").click(function() {
		google.accounts.id.initialize({
	        client_id: "340808936773-p2v7dk0jtatnsjl29nnvivnol8f9rni8.apps.googleusercontent.com",
	        callback: handleCredentialResponse
	    });
	    google.accounts.id.prompt();
	})
	/* function onSignIn() {
	    google.accounts.id.initialize({
	        client_id: "340808936773-p2v7dk0jtatnsjl29nnvivnol8f9rni8.apps.googleusercontent.com",
	        callback: handleCredentialResponse
	    });
	    google.accounts.id.prompt();
	} */
	
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