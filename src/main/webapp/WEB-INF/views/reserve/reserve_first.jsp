<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
	#hr_1 {
		border:1px solid #B40404;
		width:400px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	#reser_first {
		margin-top:100px;
		margin-bottom:150px;
	}
	
	select {
		margin-top:5px;
		width: 200px;
		height:30px;
		border: 2px solid #999;
	}
	
	input[type="text"] {
		margin-top:4px;
		margin-bottom:1px;
		width: 193px;
		height:23px;
	}
	
</style>
<script>
	$(function()
	{
	   $(".date").datepicker(
	   {
		   dateFormat:"yy-mm-dd",  // 날짜 형식
		   changDay: true,
		   changeMonth: true,   
	       changeYear: true,
	       minDate: 1             // 오늘 +1 부터 클릭 가능
	   }); 
	});
	
	function check(tt)
	{
		var indate=tt.in_date.value;
		var outdate=tt.out_date.value;

		if(in_date >= out_date)
		{
			alert("제크아웃은 체크인 이후 날짜로 선택하시기 바랍니다.")
			return false;
		}	

	    var inarr = indate.split('-');
	    var outarr = outdate.split('-');
	    var in_date = new Date(inarr[0], (inarr[1]-1), inarr[2]);
	    var out_date = new Date(outarr[0], (outarr[1]-1), outarr[2]);

		var btw=out_date.getTime() - in_date.getTime();
		var btwdate=btw/(1000*60*60*24);
		
		document.getElementsByClassName("night").value=btwdate;
		alert(night);
	} 
	
	
</script>
</head>
<body>

<div id="reser_first" align="center">
    <h2> 캠핑장 예약하기 </h2>
	<hr id="hr_1">
	
	<div>
	  <form method="post" action="reserve_second" name="jjj" onsubmit="return check(this)">
	  <input type="hidden" name="userid" value="${userid}">
	  <input type="hidden" name="name" value="${name}">
	    <div>
	    <select name="camp">
	      <option value="A_camp"> A_camp </option>
	    </select> <br>
		</div>
		<div>
	    <select name="A_deck">
	      <option value="1"> 4x4 데크 1번 </option>
	      <option value="2"> 4x4 데크 2번 </option>
	      <option value="3"> 4x4 데크 3번 </option>
	      <option value="4"> 4x4 데크 4번 </option>
	      <option value="5"> 4x4 데크 5번 </option>
	      <option value="6"> 4x8 데크 6번 </option>
	      <option value="7"> 4x8 데크 7번 </option>
	      <option value="8"> 4x8 데크 8번 </option>
	      <option value="9"> 4x8 데크 9번 </option>
	      <option value="10"> 4x8 데크 10번 </option>
	    </select>
	    </div>
	    
		<div> 
		  <input type="text" id="in_date" name="in_date" class="date" placeholder="체크인" autocomplete="off" required>
		</div>
		<div> 
		  <input type="text" id="out_date" name="out_date" class="date" placeholder="체크아웃" autocomplete="off" required>
		</div>
		
		<br><p>
		<div> 
		  <input type="submit" value="예약하기">
		</div>
			<input type="text" name="night" value="${night}" disabled> <br>
			<input type="text" name="price" class="price" value="${price}" disabled>
	  </form>    
		
	</div>
</div>
</body>
</html>










