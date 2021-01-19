<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

	hr {
		border:1px solid #B40404;
		width:300px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}	
	
	#pwdchg {
		text-align:center;
		margin-top:100px;
		margin-bottom:150px;
	}
	
	input[type="submit"] {
		margin-top:5px;
		width: 90px;
		height:30px;
	}
	
</style>
<script>

	var pwd_chk=0;
	
	function pwdchk(tt) {
		
		if(!(document.getElementById("pwd").value.length>=4 && document.getElementById("pwd").value.length<=10))
		{
			document.getElementById("pwd_msg").innerHTML="<span style='color:red;'> 4자이상 10자 이하로 가능합니다 </span>";
			pwd_chk=0;
		}	
		else if(document.getElementById("pwd").value != document.getElementById("pwd2").value)
		{
			document.getElementById("pwd_msg").innerHTML="";
			pwd_chk=0;
		}	
		else
		{
			document.getElementById("pwd_msg").innerHTML="";
		}
	}
	
	function pwdchk_eq(tt) {
		
		if(!(document.getElementById("pwd2").value.length>=4 && document.getElementById("pwd2").value.length<=10))
		{
			document.getElementById("pwd2_msg").innerHTML="<span style='color:red;'> 4자이상 10자 이하로 가능합니다 </span>";
			pwd_chk=0;
		}
		else if(document.getElementById("pwd2").value != document.getElementById("pwd").value)
		{
			document.getElementById("pwd2_msg").innerHTML="<span style='color:red;'> 기재하신 비밀번호와 다릅니다. </span>"
			pwd_chk=0;
		}
		else
		{
			document.getElementById("pwd2_msg").innerHTML="<span style='color:blue;'> 비밀번호가 일치합니다.</span>"
			pwd_chk=1;
		}
	}
	
	function check(tt) {  // tt=> document.폼

		if(pwd_chk==0)
		{
			alert("비밀번호를 확인해주세요");
			return false;
		}
		else
			return true;
		
	}
	
</script>

</head>
<body>		
	<div id="pwdchg">
	
	<div align="center"> <h2> 비밀번호 변경 </h2></div>
<hr>

	<form method="post" name="jjj" action="pwd_change_ok" onsubmit="return check(this)">
	  <input type="hidden" name="email" value="${email}">
	  <table align="center">
	    <tr>
	      <td>
	  	    <input type="password" name="pwd" id="pwd" placeholder="변경할 비밀번호" onblur="pwdchk(this)" style="width:200px; height:30px;"> <br>
	        <span id="pwd_msg" style="font-size:12px;"></span>
	      </td>   
	    </tr>
	    <tr>
	      <td>
	  		<input type="password" name="pwd2" id="pwd2" placeholder="변경할 비밀번호 확인" onblur="pwdchk_eq(this)" style="width:200px; height:30px;"> <br>
	 		<span id="pwd2_msg" style="font-size:12px;"></span>
	      </td>   
	    </tr>	    
	  </table>  <p>
	  <div align="center"> <input type="submit" value="변경 신청"> </div>
	</form>
	</div>
</body>
</html>