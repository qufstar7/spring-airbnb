<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/book.css" />
<title>예약완료</title>
</head>
<style>
.left-box {
	float: left;
	width: 50%;
}

.right-box {
	float: right;
	width: 50%;
	height: 600px;
}
</style>
<body>
<%@ include file="../common/nav2.jsp" %>
<%@ include file="../user/home.jsp" %>
<div class="container">
	<!-- 왼쪽 -->
	<div class="left-box">
		<div class="divide">
			<h3><Strong>예약이 확정되었습니다!</Strong></h3>
			<p>이메일(으)로 세부정보를 보냈습니다.</p>
		</div>
		<div class="divide">
			<div class="row">
					<h5><strong>호스트 소개</strong></h5>
				<div class="col-1" style="padding : 5px">
					<div class="box1" style="background: #BDBDBD;">
					    <img class="profile" src="../resources/images/acc/sample-home.jpg">
					</div>
				</div>
				<div class="col">
				    <span>궁금한 사항은 언제든 $유저님에게 문의하실 수 있습니다.</span>
				</div>
				<div>
					<textarea rows="4" class="form-control" name="messageToHost" placeholder="유저님, 안녕하세요. 여행이 예정되어있습니다."></textarea>
					<br>
					<button type="submit" class="btn btn-outline-dark">메시지 보내기</button>
				</div>
			</div>
		</div>
		<div class="divide">
			<div>
				<h5><strong>마지막 단계: 여행 계획 공유하기</strong></h5>
				<p>여행 일정표를 다른 사람과 공유해 보세요.</p>
			</div>
			<div>
				<input type="text" style="width:200px; height:55px; border-radius:5px;" name="companion" placeholder="이메일 주소 입력">
				<div style="margin-top:20px">
					<button type="sumnbit" class="btn btn-dark">제출하기</button>
                	<a href="/" class="btn btn-outline-dark">건너뛰기</a>
                </div>
			</div>
		</div>
		<div class="divide">
			<div class="totalFn">
				<div class="count-box">
					<button type="button" class="minus">-</button>
					<span class="num">0</span>
					<button type="button" class="plus">+</button>
				</div>
				<div class="count-box">
					<button type="button" class="minus">-</button>
					<span class="num">0</span>
					<button type="button" class="plus">+</button>
				</div>
					<div class="count-box">
					<button type="button" class="minus">-</button>
					<span class="num">0</span>
					<button type="button" class="plus">+</button>
				</div>
				<!-- 합계 -->
				<div class="total-area">
					<span>Total =</span>
					<strong class="count-total">0</strong>
				</div>
			</div>
		</div>
		<div class="divide">
			<select id="card-select" class="form-select" aria-label="Default select example">
				<option value="유저카드" selected>${card.id }</option>
				<option value="1" disabled>결제 수단 추가하기</option>
				<option value="카드추가">신용카드 또는 체크카드</option>
				<option value="2" disabled>이용 불가</option>
				<option value="카카오 결제">카카오 결제 </option>
			</select>
			<div id="insertCard">
			</div>
		</div>
	</div>
		
	
	<!-- 오른쪽 -->
	<div class="right-box">
		<div class="container-fixed">
			<div class="row my-5 px-5" style="padding:5px" >
				<div class ="border bg-white rounded">
					<div class="box-acc">
					    <img class="acc" src="../resources/images/acc/sample-home.jpg">
					</div>
					<div>
						<h5>${accommodation.name}</h5>
					</div>
					<div>
						<p><fmt:formatDate value="${accommodation.checkIn}" pattern="MM월dd일" />~<fmt:formatDate value="${accommodation.checkOut}" pattern="dd일" />
						· 게스트 ${accommodation.guest }명
						</p>
					</div>
					<hr>
					<div class="divide2">
						<span>총 합계</span>
						<span style="float:right">${reservation.totalPrice }</span>
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" >게스트</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$("#card-select").on('change',function(){
		let result = $("#card-select option:selected").val();
		let $insert = $("#insertCard")
		if( result == "카드추가") {
			let content = '';
			content += '<div class="row" style="padding:20px">';
			content += '	<div class="col border bg-white rounded">';
			content += '			<div class="mb-3">';
			content += '				<label for="id-field" class="form-label">카드번호</label>';
			content += '				<input class="form-control" name="id" id="id-field" placeholder="0000-0000-0000-0000"/>';
			content += '			</div>';
			content += '			<div class ="row">';
			content += '				<div class="col mb-3">';
			content += '					<label for="expiryDate-field" class="form-label">만료일</label>';
			content += '					<input class="form-control" name="expiryDate" id="expiryDate-field" placeholder="MM/YY"/>';
			content += '				</div>';
			content += '				<div class="col mb-3">';
			content += '					<label for="cvv-field" class="form-label">CVV</label>';
			content += '					<input class="form-control" name="cvv" id="cvv-field" placeholder="123"/>';
			content += '				</div>';
			content += '				<div class="mb-3">';
			content += '					<label for="zipCode-field" class="form-label">우편번호</label>';
			content += '					<input class="form-control" name="zipCode" id="zipCode-field" placeholder="12345"/>';
			content += '				</div>';
			content += '				<div class="mb-3">';
			content += '					<label for="region-field" class="form-label">지역</label>';
			content += '					<input class="form-control" name="region" id="region-field" placeholder="한국"/>';
			content += '				</div>';
			content += '		</div>';
			content += '	</div>';
			content += '</div>';
			
			$insert.append(content);
		}else {
			$insert.empty();
		}
	});

	function countBtn(){
		var $wrap = $('.totalFn'),
			$btnMinus = $wrap.find('.minus'),
			$btnPlus = $wrap.find('.plus');
			$cell = $wrap.find('.cell');          
		
		$btnMinus.on('click', function(e){
			var $this = $(this);
			var num = $this.parent().find('.num').text();
			num --;
			if (num <= 0) {
				num = 0;
			}
			$this.parent().find('.num').text(num);
			totalFn();
		});
		
		$btnPlus.on('click', function(){
			var $this = $(this);
			var num = $this.parent().find('.num').text();
			num ++;
			if (20 <= num) {
				num = 20; // 최대 인원수
			}
			$this.parent().find('.num').text(num);
			 totalFn();
		});
			function totalFn(){
				var $total = $(".totalFn .count-box")
				var total = 0;
				$total.find(".num").each(function(){
					total += Number($(this).text());
				});
				$(".count-total").text(total);
			};
	}
})
</script>
</body>
</html>