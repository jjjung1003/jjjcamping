<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#mpg_fourth {
		width:1280px;
		text-align:center;
		margin:auto;
		margin-top:100px;
		margin-bottom:150px;
	}
	
	#hr_1 {
		border:1px solid #B40404;
		width:500px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	#mpg_btn {
		margin-left:10px;	
	}
	
	#mpg_btn1 {
		display:block;
		width:70px;
		height:25px;
		border:4px solid orange;
		border-radius:10px;
		color:gray;
		padding-top:5px;
		font-size:15px;	
	}
</style>
</head>
<body>

<div id="mpg_fourth">

<div align="center"> <h2> ${mdto.name}님의 마이페이지 </h2> </div> <p>
	<hr id="hr_1">
	
	
	<div id="base" align="center">
		<input type="hidden" name="id" value="${mdto.id}">
	  <table width="350" height="200">
	    <tr>
	      <td> 이름 </td>
	      <td> ${mdto.name} </td>
	    </tr>
	    <tr>
	      <td> 아이디 </td>
	      <td> ${mdto.userid} </td>
	    </tr>
	    <tr>
	      <td> 이메일 </td>
	      <td> ${mdto.email} </td>
	    </tr>
	    <tr>
	      <td> 생년월일 </td>
	      <td> ${mdto.birth} </td>
	    </tr>	    
	    <tr>
	      <td> 휴대폰번호 </td>
	      <td> ${mdto.phone}</td>
	    </tr>
	    <tr>
	      <td> 보유 포인트 </td>
	      <td> <fmt:formatNumber value="${mdto.point}"/>P</td>
	    </tr> <p>
	    <tr>
	      
        </tr>
	  </table> <p>
	      <div align="center"> 
      		<span id="mpg_btn"><a href="mem_update?id=${mdto.id}" id="mpg_btn1"> 정보 수정 </a></span>
          </div>
	</div>
	</div>
</body>
</html>






