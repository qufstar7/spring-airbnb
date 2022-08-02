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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>Insert title here</title>
</head>
<body>

<h1>소셜 로그인</h1>
	<a id="custom-login-btn" onClick="loginWithKakao()">
	  <img
	    src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
	    width="242"
	  />
	</a>
	<ul>
	<li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li>
</ul>
<script type="text/javascript">
	Kakao.init('2931d0043daf4865ac102f53587fef2c'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
	  function loginWithKakao() {
		  Kakao.Auth.login({
	          success: function(authObj) {
	            //alert(JSON.stringify(authObj))
	            Kakao.API.request({
	                url: '/v2/user/me',
	                success: function(response) {
	                	alert(JSON.stringify(response));
	                    let id = "kakao_" + response.id;
	                    let email = (response.kakao_account.email != undefined ? response.kakao_account.email : '');
	                    
	                    let properties = response.properties;
	                    let name = properties.nickname;
	                    let profile_image = properties.profile_image;
	                    
	                    let member = {
	                        id : id,
	                        password : id,
	                        email : email,
	                        name : name,
	                        profile : profile_image,
	                        snsyn : 'Y'
	                    }
	                    //console.log(member);
	                    kakaoLogin(member).then(res => {
	                        if(res.status == 200){
	                            getLoginInfo().then(result => {
	                                if(result.status == 200){
	                                    setLoginInfo(result.data);
	                                    closeLoginPop();
	                                }
	                            })
	                        }
	                    })
	
	                },
	                fail: function(error) {
	                    console.log(error);
	                }
	            });
	          },
	          fail: function(err) {
	            alert(JSON.stringify(err))
	          },
	        })
	  }
	//카카오로그아웃  
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log("로그아웃 성공");
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }  

</script>
</body>
</html>