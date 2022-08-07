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
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<title>Insert title here</title>
</head>
<body>
<div class="reservation">  <div>  	<p>예약일</p>  	<input placeholder="ex) 2020-09-01"  id="to"/><input  placeholder="ex) 2020-09-01"  id="from"/>  </div></div>
 <span class="material-symbols-outlined">
wifi
</span>
<span class="material-symbols-outlined">
soup_kitchen
</span>
<span class="material-symbols-outlined">
local_laundry_service
</span>
<span class="material-symbols-outlined">
laundry
</span>
<span class="material-symbols-outlined">
ac_unit
</span>
<span class="material-symbols-outlined">
local_fire_department
</span>
<span class="material-symbols-outlined">
workspaces
</span>
<span class="material-symbols-outlined">
tv_gen
</span>
<span class="material-symbols-outlined">
dry
</span>
<span class="material-symbols-outlined">
iron
</span>
<span class="material-symbols-outlined">
pool
</span>
<span class="material-symbols-outlined">
circle
</span>
<span class="material-symbols-outlined">
hot_tub
</span>
<span class="material-symbols-outlined">
garage_home
</span>
<span class="material-symbols-outlined">
electric_car
</span>
<span class="material-symbols-outlined">
crib
</span>
<span class="material-symbols-outlined">
fitness_center
</span>
<span class="material-symbols-outlined">
outdoor_grill
</span>
<span class="material-symbols-outlined">
fireplace
</span>
<span class="material-symbols-outlined">
egg_alt
</span>
<span class="material-symbols-outlined">
deck
</span>
<span class="material-symbols-outlined">
fireplace
</span>
<span class="material-symbols-outlined">
smoking_rooms
</span>
<span class="material-symbols-outlined">
shower
</span>
<span class="material-symbols-outlined">
detector_smoke
</span>
<span class="material-symbols-outlined">
doorbell
</span>
<span class="material-symbols-outlined">
medical_services
</span>
<span class="material-symbols-outlined">
fire_extinguisher
</span>
<span class="material-symbols-outlined">
book_online
</span>
<span class="material-symbols-outlined">
camera_front
</span>
<span class="material-symbols-outlined">
soap
</span>
<span class="material-symbols-outlined">
cleaning_services
</span>
<span class="material-symbols-outlined">
bed
</span>
<span class="material-symbols-outlined">
roller_shades_closed
</span>

<span class="material-symbols-outlined">
sports_esports
</span>
<span class="material-symbols-outlined">
piano
</span>
<span class="material-symbols-outlined">
extension
</span>
<span class="material-symbols-outlined">
toys_fan
</span>
<span class="material-symbols-outlined">
microwave_gen
</span>
<span class="material-symbols-outlined">
coffee_maker
</span>
<span class="material-symbols-outlined">
door_open
</span>
<span class="material-symbols-outlined">
pedal_bike
</span>
<span class="material-symbols-outlined">
elevator
</span>

<script type="text/javascript">
$(function() {
		
	
	   var fp1 = $("#to").flatpickr({
		minDate: new Date(),
		defaultDate : new Date(),
		mode: "range",
		dateFormat: "Y-m-d"
	  	
	   });  
	  	fp1.config.onChange.push(function(selectedDates) {
	  		console.log(Date.parse(selectedDates[0]))
	  		console.log(Date.parse(selectedDates[1]))
	  		
	  		let diffDate = Date.parse(selectedDates[1])-Date.parse(selectedDates[0])
	  		let day = Math.abs(diffDate / (1000 * 60 * 60 * 24))
	  		console.log(day)
	}) 
	  	
	
	/* var fp1 = flatpickr(document.getElementById("from"), {
		"locale": "ko",
		"minDate" : "today",
		disable : ["2022-08-16", "2022-08-17"]
	});
	var fp2 = flatpickr(document.getElementById("to"), {
		"locale": "ko",
		"maxDate" : new Date().fp_incr(30),
		disable : ["2022-08-16", "2022-08-17"]
	});

	fp1.config.onChange.push(function(selectedDates) {
		console.log(Date.parse(selectedDates))
	} ); */
})
</script>
</body>
</html>