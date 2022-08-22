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
<title>Insert title here</title>
</head>
<body>
<div class="container">
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
<script type="text/javascript">
$(function(){
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