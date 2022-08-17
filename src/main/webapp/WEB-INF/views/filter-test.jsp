<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/tags.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<head>
<style>
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

li{
  list-style-type: none;
}

/* 보여줄 구간의 높이와 넓이 설정 */
#slideShow{
  width: 500px;
  height: 300px;
  position: relative;
  margin: 50px auto;
  overflow: hidden;   
  /*리스트 형식으로 이미지를 일렬로 
  정렬할 것이기 때문에, 500px 밖으로 튀어 나간 이미지들은
  hidden으로 숨겨줘야됨*/
}


.slides{
  position: absolute;
  left: 0;
  top: 0;
  width: 2500px; /* 슬라이드할 사진과 마진 총 넓이 */
  transition: left 0.5s ease-out; 
  /*ease-out: 처음에는 느렸다가 점점 빨라짐*/
}

/* 첫 번째 슬라이드 가운데에 정렬하기위해
첫번째 슬라이드만 margin-left조정 */
.slides li:first-child{
  margin-left: 100px;
}

/* 슬라이드들 옆으로 정렬 */
.slides li:not(:last-child){
  float: left;
  margin-right: 100px;
}

.slides li{
  float: left;
}

.controller span{
  position:absolute;
  background-color: transparent;
  color: black;
  text-align: center;
  border-radius: 50%;
  padding: 10px 20px;
  top: 50%;
  font-size: 1.3em;
  cursor: pointer;
}

/* 이전, 다음 화살표에 마우스 커서가 올라가 있을때 */
.controller span:hover{
  background-color: rgba(128, 128, 128, 0.11);
}

.prev{
  left: 10px;
}

/* 이전 화살표에 마우스 커서가 올라가 있을때 
이전 화살표가 살짝 왼쪽으로 이동하는 효과*/
.prev:hover{
  transform: translateX(-10px);
}

.next{
  right: 10px;
}

/* 다음 화살표에 마우스 커서가 올라가 있을때 
이전 화살표가 살짝 오른쪽으로 이동하는 효과*/
.next:hover{
  transform: translateX(10px);
}
</style>
</head>
<body>
	<div class="container">
	 <div id="slideShow">
	    <ul class="slides">
	      <li><img src="https://a0.muscache.com/im/pictures/60d4058e-98a8-4f30-ba8a-93b101a31c47.jpg?im_w=720" alt="" style="height:300px"></li>
	      <li><img src="https://a0.muscache.com/im/pictures/d0e3bb05-a96a-45cf-af92-980269168096.jpg?im_w=720" alt="" style="height:300px"></li>
	      <li><img src="https://a0.muscache.com/im/pictures/11bd9fc9-4ca9-4208-b449-bdc63a1969b9.jpg?im_w=720" alt="" style="height:300px"></li>
	      <li><img src="https://a0.muscache.com/im/pictures/e25a9b25-fa98-4160-bfd1-039287bf38b6.jpg?im_w=720" alt="" style="height:300px"></li>
	      <li><img src="https://a0.muscache.com/im/pictures/6d4b8668-20d2-4c45-8de6-4378d7bf9239.jpg?im_w=720" alt="" style="height:300px"></li>
	      
	    </ul>  
	    <p class="controller">
	      
	      <!-- &lang: 왼쪽 방향 화살표
	      &rang: 오른쪽 방향 화살표 -->
	      <span class="prev">&lang;</span>  
	      <span class="next">&rang;</span>
	    </p>
  	 </div>
	</div>
</body>
<script type="text/javascript">
const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
const slideImg = document.querySelectorAll('.slides li'); //모든 슬라이드들
let currentIdx = 0; //현재 슬라이드 index
const slideCount = slideImg.length; // 슬라이드 개수
const prev = document.querySelector('.prev'); //이전 버튼
const next = document.querySelector('.next'); //다음 버튼
const slideWidth = 300; //한개의 슬라이드 넓이
const slideMargin = 100; //슬라이드간의 margin 값

//전체 슬라이드 컨테이너 넓이 설정
slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';

function moveSlide(num) {
  slides.style.left = -num * 400 + 'px';
  currentIdx = num;
}

prev.addEventListener('click', function () {
  /*첫 번째 슬라이드로 표시 됐을때는 
  이전 버튼 눌러도 아무런 반응 없게 하기 위해 
  currentIdx !==0일때만 moveSlide 함수 불러옴 */

  if (currentIdx !== 0) moveSlide(currentIdx - 1);
});

next.addEventListener('click', function () {
  /* 마지막 슬라이드로 표시 됐을때는 
  다음 버튼 눌러도 아무런 반응 없게 하기 위해
  currentIdx !==slideCount - 1 일때만 
  moveSlide 함수 불러옴 */
  if (currentIdx !== slideCount - 1) {
    moveSlide(currentIdx + 1);
  }
});

</script>
</div>