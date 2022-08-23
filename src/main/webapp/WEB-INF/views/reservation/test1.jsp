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
<link rel="stylesheet" type="text/css" href="/resources/css/book.css" />
<!-- 달력 -->
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="divide">
		<button type ="button" onclick="fnCalCount('p',this);">+</button>
	    <input type="text" name="pop_out" value="0" readonly="readonly" style="text-align:center;"/>
	    <button type="button" onclick="fnCalCount('m', this);">-</button>
	</div>
	<div class="divide">
		<div class="ckindate">
			<!— 달력 from—>
			<label for="from"></label> <input type="text" class="c-from" id="from" pattern="yyyy-dd-mm" value="" />
		</div>
		<div class="ckoutdate">
			<!— 달력 to —>
			<label for="to"></label> <input type="text" class="c-to" id="to" pattern="yyyy-dd-mm" value="" />
		</div>
	</div>
</div>
<script type="text/javascript">
function fnCalCount(type, ths){
    var $input = $(ths).parents("td").find("input[name='pop_out']");
    var tCount = Number($input.val());
    var tEqCount = Number($(ths).parents("tr").find("td.bseq_ea").html());
    
    if(type=='p'){
        if(tCount < tEqCount) $input.val(Number(tCount)+1);
        
    }else{
        if(tCount >0) $input.val(Number(tCount)-1);    
        }
}
$(function(){
	var fp1 = flatpickr(document.getElementById("from"), {
		"locale": "ko",
		"minDate" : "today"
	});
	var fp2 = flatpickr(document.getElementById("to"), {
		"locale": "ko"
	});

	fp1.config.onChange.push(function(selectedDates) {
		fp2.config.maxDate = selectedDates[0].fp_incr(14)
	} );
})

</script>
</body>
</html>