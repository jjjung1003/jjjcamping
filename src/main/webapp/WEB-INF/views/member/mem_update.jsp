<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check(tt) {  // tt=> document.폼
		
		// year,month,day를 이용하여  yyyy-mm-dd 로 만들기
		var y=document.getElementById("year").value;
		var m=document.getElementById("month").value;
		var d=document.getElementById("day").value;
		var birth=y+"-"+m+"-"+d;
		var pwd=document.getElementById("pwd").value;
		
		document.getElementById("birth").value=birth;
		
		if(document.getElementById("year").selectedIndex==0||document.getElementById("month").selectedIndex==0||document.getElementById("day").selectedIndex==0)
		{
			 alert("생년월일을 확인해주세요");
			 document.jjj.birth.focus();
			 return false;
		}
		else if(document.getElementById("year").value > 2020-14)
		{
			alert("14세 미만은 가입할 수 없습니다.");
			return false;
		}
		else if(document.getElementById("pwd").value == null)
		{
			alert("본인인증을 위해 로그인 비밀번호를 입력해주세요.");
			return false;
		}
		else
			return true;
	}
</script>
<style>
	#mpg_up {
		width:1280px;
		text-align:center;
		margin:auto;
		margin-top:100px;
		margin-bottom:150px;
	}
	
	#hr_1 {
		border:1px solid #B40404;
		width:600px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	#mpg_btn {
		margin-top:150px;
		margin-right:450px;	
	}
	
	#mpg_btn1 {
		display:block;
		width:40px;
		height:20px;
		border:4px solid orange;
		border-radius:10px;
		color:gray;
		padding-left:5px;
		font-size:15px;	
	}
</style>
</head>
<body>

	<div id="mpg_up">
	
	<div align="center"> <h2> 정보수정 </h2> </div> <p>
	<hr id="hr_1">
	
	<div id="base" align="center">
	<form method="post" name="jjj" action="mem_update_ok?id=${mdto.id}" onsubmit="return check(this)">
		<input type="hidden" name="id" value="${mdto.id}">
	  <table width="450" height="200">
	    <tr>
	      <td> 이름 </td>
	      <td> ${mdto.name} <input type="hidden" name="name" value="${mdto.name}">  </td>
	    </tr>
	    <tr>
	      <td> 아이디 </td>
	      <td> ${userid} <input type="hidden" name="userid" value="${mdto.userid}"> </td>
	    </tr>
	    <tr>
	      <td> 비밀번호 </td>
	      <td> <a href="../member/pwd_change2?id=${mdto.id}" id="mpg_btn1"> 변경 </a> </td>
	    </tr>
	    <tr>
	      <td> 이메일 </td>
	      <td> <input type="text" name="email" value="${mdto.email}"> </td>
	    </tr>
	    <tr>
	      <td> 생년월일 </td>
	      <td>
	        <select id="year" name="year" id="year" style="width:100px;">
	           <option> 년도 </option>
		         <c:forEach var="i" begin="0" end="${2020-1900}">
		         	<c:set var="year" value="${2020-i}" />
		         	<option value="${year}">${year}</option>
	             </c:forEach>
	         </select>
	         
	         <select id="month" name="month" id="month" style="width:100px;">
	           <option> 월 </option>
	             <c:forEach var="i" begin="1" end="${12}">
		         	<c:set var="month" value="${13-i}" />
		         	<option value="${month}">${month}</option>
	             </c:forEach>
	         </select>
	         
	         <select id="day" name="day" id="day" style="width:100px;">
	           <option> 일 </option>
	           	 <c:forEach var="i" begin="1" end="${31}">
		         	<c:set var="day" value="${32-i}" />
		         	<option value="${day}">${day}</option>
	             </c:forEach>
	         </select>
	         <input type="hidden" name="birth" id="birth" value="${birth}">
	       </td>  
	    </tr>	    
	    <tr>
	      <td> 휴대폰번호 </td>
	      <td> <input type="text" name="phone" value="${mdto.phone}"></td>
	    </tr>
	           
	  </table> <p><br>
	  
		<div id="mpgup_pwd" align="center">
	      <div style="font-size:12px;color:purple"> 정보변경을 위해 비밀번호를 입력해주세요 </div>
	     <input type="password" name="pwd" id="pwd">   <br>
	        <c:if test="${chk != null}">
     			<span id="pkc" style="color:red;font-size:12px"> 비밀번호가 일치하지 않습니다. </span>
   			</c:if>
		</div> <p>
	   <span id="mpg_upbtn"><input type="submit" value="정보수정"></span>
	  </form>
	  
	</div>
	
</div>
	<div id="mpg_btn" align="right"><a href="mem_del?id=${mdto.id}" id="mpg_btn1"> 회원 탈퇴 </a></div>
</body>
</html>