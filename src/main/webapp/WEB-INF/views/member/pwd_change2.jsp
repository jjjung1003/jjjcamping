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
		width:400px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}	
	
	#pwdchg {
		text-align:center;
		margin-top:100px;
		margin-bottom:150px;
	}
	
</style>
<script>

	var pwd_chk=0;
	
	function pwdchk(tt) {
		
		if(!(tt.value.length>=4 && tt.value.length<=10))
		{
			document.getElementById("pwd_msg").innerHTML="<span style='color:red;'> 4자이상 10자 이하로 가능합니다 </span>";
			pwd_chk=0;
		}	
		else if(tt.value != document.jjj.pwd2.value)
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
		
		if(!(tt.value.length>=4 && tt.value.length<=10))
		{
			document.getElementById("pwd2_msg").innerHTML="<span style='color:red;'> 4자이상 10자 이하로 가능합니다 </span>";
			pwd_chk=0;
		}
		else if(tt.value != document.jjj.pwd.value)
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

	<form method="post" name="jjj" action="pwd_change2_ok" onsubmit="return check(this)">
	  <input type="hidden" name="email" value="${email}">
	  <input type="hidden" name="id" value="${id}">
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
	  
        <div id="mpgup_pwd" align="center">
	      <div style="font-size:12px;color:purple"> 정보변경을 위해 기존비밀번호를 입력해주세요 </div>
	     <input type="password" name="pwd3" id="pwd3">   <br>
	        <c:if test="${chk3 != null}">
     			<span id="jjj" style="color:red;font-size:12px"> 비밀번호가 일치하지 않습니다. </span>
   			</c:if>
		</div> <p>
	  <div align="center"> <input type="submit" value="변경 신청"> </div>
	</form>
	</div>
</body>
</html>