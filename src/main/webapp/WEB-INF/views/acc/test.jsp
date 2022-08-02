<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<!-- AOS 라이브러리 불러오기-->
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	body, html {
    height: 100%;
}

#first {
    height: 400%;
    background: none repeat scroll 0 0 white ;
    text-align:center;
    padding-top:20px;
    font-size:22px;
}

#second {
    padding-top:1200px;    
    height: 600px;
    background: none repeat scroll 0 0 blue;
    border: 5px solid black;
}

#navbar {
	position: fixed;
	top: 0;
}
</style>
</head>
<body>
<div id="first">
    스크롤 내려서 파랑 영역이 나올때까지 내려보세요
</div>
<div id="navbar"></div>
<div id="second"></div>
<script type="text/javascript">
 
	 let $div2 = $('#second').offset(); 
	 window.onscroll = scrollIF();
	 
	 $(function scrollIF() {
	        if ($(window).scrollTop() > $div2.top) {
	        	$('#navbar').attr("style", "tob:0");
	        } else {
	            $('#navbar').attr("style", "tob:-1000px");
	        }
	 }); 
	 /* let isVisible = false;

	 window.addEventListener('scroll', function() {
	     if ( checkVisible($('#second')) && !isVisible) {
	         alert("엘리먼트 보임 !!");
	         isVisible=true;
	     }
	 });

	 function checkVisible( elm, eval ) {
	     eval = eval || "object visible";
	     var viewportHeight = $(window).height(), // Viewport Height
	         scrolltop = $(window).scrollTop(), // Scroll Top
	         y = $(elm).offset().top,
	         elementHeight = $(elm).height();   
	     
	     if (eval == "object visible") return ((y < (viewportHeight + scrolltop)) && (y > (scrolltop - elementHeight)));
	     if (eval == "above") return ((y < (viewportHeight + scrolltop)));
	 } */
</script>
</body>
</html>