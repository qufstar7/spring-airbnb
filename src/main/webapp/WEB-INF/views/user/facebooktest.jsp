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
<title>Insert title here</title>
</head>
<body>

	<form id="form-facebook-login" method="post" action="sns-login">
		사용자id: <input type="text" name="id" id="id" value="" /> 
		사용자명: <input type="text" name="name" id="name" value="" /> 
		사용자 이메일: <input type="text" name="email" id="" value="" />
	</form>
	<button type="button" id="btn-facebook-login">페이스북 로그인</button>
	<button type="button" id="btn-facebook-logout">페이스북 로그아웃</button>

	<div id="status"></div>
	<script type="text/javascript">


$(function () {
	
	
	// 페이스북 로그인 초기화 처리
	// Load the SDK asynchronously
	(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "https://connect.facebook.net/en_US/sdk.js";
	  fjs.parentNode.insertBefore(js, fjs);
	  
	  window.fbAsyncInit = function() {
		 console.log('FB.init', FB.init)
			FB.init({
			  appId      : '785083306180197',
			  cookie     : true,  // enable cookies to allow the server to access 
			                      // the session
			  xfbml      : true,  // parse social plugins on this page
			  version    : 'v14.0' // Specify the Graph API version to use
			});
				FB.AppEvents.logPageView();
			FB.getLoginStatus(function(response) {
				console.log(response.status);
			})
			
		}
	}(document, 'script', 'facebook-jssdk'));	
	
	
	$("#btn-facebook-login").click(function() {

	   	 FB.login(function(response){
	   		
	   		if (response.status === 'connected') {
	   		console.log("FB.login  get user info ...........................")
	   		 FB.api('/me', {"fields":"name,email,gender,birthday"}, function(response) {
	      		    console.log('Successful login for: ' + response.name);
	      		    console.log(JSON.stringify(response));
	      		    $(":input[name=name]").val(response.name);
	      	        $(":input[name=id]").val(response.id);
	      	        $(":input[name=email]").val(response.email);
	      		    document.getElementById('status').innerHTML =
	      		      'Thanks for logging in, ' + response.name + '!';
	      		  });
	   			
	   		  } else {
	   		    // The person is not logged into your webpage or we are unable to tell. 
	   			
	   		  }
			   		
		     			
		  }, {scope: 'public_profile,email'});
		
	});
	
	
	$("#btn-facebook-logout").click(function() {
	    FB.getLoginStatus(function(response) {
	        if (response && response.status === 'connected') {
	            console.log("logout: connected 일 때");
	            FB.logout(function(response) {
	                document.location.reload();
	            });
	        } else {
	            console.log("logout: connected 아닐 때");
	        }
	    });
		
	});
})
</script>
	<!-- <script type="text/javascript">


	//This is called with the results from from FB.getLoginStatus().
	// 기존 로그인 상태를 가져오기 위해 facebook에 대한 호출
	function statusChangeCallback(response) {
	  console.log('statusChangeCallback');
	  console.log(response);
	  // The response object is returned with a status field that lets the
	  // app know the current login status of the person.
	  // Full docs on the response object can be found in the documentation
	  // for FB.getLoginStatus().
	  if (response.status === 'connected') {
	    alert("연결되어 있음");
	    testAPI();
	  } else {
	    // The person is not logged into your app or we are unable to tell.
	    document.getElementById('status').innerHTML = 'Please log ' +
	      'into this app.';
	  }
	}
	
	// This function is called when someone finishes with the Login
	// Button.  See the onlogin handler attached to it in the sample
	// code below.
	function checkLoginState() {
	  FB.getLoginStatus(function(response) {
	    statusChangeCallback(response);
	  });
	}
	
	// SDK가 다운되고 자동으로 fbAsyncInit 함수가 호출되도록 설계됨. 또한 SDK의 로드가 끝나고 사용하는 FB.init 메서드를 호출하여 app-ID를 초기화한다.
	//  FB에는 여러 가지 로그인에 관한 상태를 설정하고 체크할 수 있는 메서드가 들어있다
	window.fbAsyncInit = function() {
	FB.init({
	  appId      : '785083306180197',
	  cookie     : true,  // enable cookies to allow the server to access 
	                      // the session
	  xfbml      : true,  // parse social plugins on this page
	  version    : 'v14.0' // Specify the Graph API version to use
	});
	
	FB.login(function(response) {
	}, {scope: 'public_pofile,email'});
	
	// Now that we've initialized the JavaScript SDK, we call 
	// FB.getLoginStatus().  This function gets the state of the
	// person visiting this page and can return one of three states to
	// the callback you provide.  They can be:
	//
	// 1. Logged into your app ('connected')
	// 2. Logged into Facebook, but not your app ('not_authorized')
	// 3. Not logged into Facebook and can't tell if they are logged into
	//    your app or not.
	//
	// These three cases are handled in the callback function.
	
	FB.getLoginStatus(function(response) {
	  statusChangeCallback(response);
	});
	
	};
	
	// Load the SDK asynchronously
	(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "https://connect.facebook.net/en_US/sdk.js";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	
	// Here we run a very simple test of the Graph API after login is
	// successful.  See statusChangeCallback() for when this call is made.
	function testAPI() {
	  console.log('Welcome!  Fetching your information.... ');
	  FB.api('/me', {"fields":"name,email,gender,birthday"}, function(response) {
	    console.log('Successful login for: ' + response.name);
	    console.log(JSON.stringify(response));
	    $(":input[name=name]").val(response.name);
        $(":input[name=id]").val(response.id);
        $(":input[name=email]").val(response.email);
	    document.getElementById('status').innerHTML =
	      'Thanks for logging in, ' + response.name + '!';
	  });
	} 
</script> -->
</body>
</html>