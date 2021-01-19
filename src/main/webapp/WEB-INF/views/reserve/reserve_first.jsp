<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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
      $(".in_date_chg").datepicker(
      {
         dateFormat:"yy-mm-dd",  // 날짜 형식
         changDay: true,
         changeMonth: true,   
          changeYear: true,
          minDate: 1,             // 오늘 +1 부터 클릭 가능
          onSelect:function(d){
                
      $("#in_date1").val(d);
             }
      });              
    });
	
	
	$(function()
    {
      $(".out_date_chg").datepicker(
      {
         dateFormat:"yy-mm-dd",  // 날짜 형식
         changDay: true,
         changeMonth: true,   
          changeYear: true,
          minDate: 1,             // 오늘 +1 부터 클릭 가능
          onSelect:function(d){
                
      $("#out_date1").val(d),
      $("#night").val(d)=$("#out_date1").val(d)-$("#in_date1").val(d);
      
             }
      });              
    });
	
	
	function check(tt)
	{
		var indate=tt.in_date.value;
		var outdate=tt.out_date.value;
		if(indate >= outdate)
		{
			alert("제크아웃은 체크인 이후 날짜로 선택하시기 바랍니다.")	
			return false;
		}		    
	} 
	
	/* var inarr = indate.split('-');
    var outarr = outdate.split('-');
    var in_date = new Date(inarr[0], (inarr[1]-1), inarr[2]);
    var out_date = new Date(outarr[0], (outarr[1]-1), outarr[2]);

	var btw=out_date.getTime() - in_date.getTime();
	var btwdate=btw/(1000*60*60*24);
	
	document.getElementsByClassName("night").value=btwdate;
	alert(night); */
	
	
	function campSelectValue(n)
	{
	 n.campValue.value = n.camp.options[n.camp.selectedIndex].text;
	 n.camp1.value = n.camp.options[n.camp.selectedIndex].value;
	}
	
	function deckSelectValue(n)
	{
	 n.deckValue.value = n.A_deck.options[n.A_deck.selectedIndex].text;
	 n.A_deck1.value = n.A_deck.options[n.A_deck.selectedIndex].value;
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
	    <select name="camp" onChange="campSelectValue(this.form);">
	      <option value=""> 캠핑장선택 </option>
		  <option value="A_camp"> A_camp </option>
	      <option value="B_camp"> B_camp </option>
		</select>
		</div>
		<div>
		<select name="A_deck" onChange="deckSelectValue(this.form);">
		  <option value=""> 데크선택 </option>
		  <option value="1">데크 1번 </option>
	      <option value="2">데크 2번 </option>
	      <option value="3">데크 3번 </option>
	      <option value="4">데크 4번 </option>
	      <option value="5">데크 5번 </option>
	      <option value="6">데크 6번 </option>
	      <option value="7">데크 7번 </option>
	      <option value="8">데크 8번 </option>
	      <option value="9">데크 9번 </option>
	      <option value="10">데크 10번 </option>
		</select>
	    </div>
	    
		<div> 
		  <input type="text" id="in_date_chg" name="in_date" class="in_date_chg" placeholder="체크인" autocomplete="off" required>
		</div>
		<div> 
		  <input type="text" id="out_date_chg" name="out_date" class="out_date_chg" placeholder="체크아웃" autocomplete="off" required>
		</div>
		
		<br><p>
		
		<div> 선택한 정보를 확인해주세요!<br>
		
		  <input type="hidden" name="campValue" disabled>
		  <input type="text" name="camp1" disabled> <br>	<!-- 선택한 캠핑장  -->
		  
		  <input type="hidden" name="deckValue" disabled>
		  <input type="text" name="A_deck1" disabled> <br>	<!-- 선택한 데크  -->
	
		  <input type="text" id="in_date1" disabled> <br>	<!-- 체크인  -->		  
		  <input type="text" id="out_date1" disabled> <br>	<!-- 체크인아웃  -->
		 
		</div><br><p>
		<div> 
		  <input type="submit" value="예약하기">
		</div>
			
	  </form>    
		
	</div>
</div>
</body>
</html>










