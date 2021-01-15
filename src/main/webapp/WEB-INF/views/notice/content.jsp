<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function update_pwd()
	{
		document.getElementById("pwd_chk1").style.visibility="visible";
	}
	function delete_pwd()
	{
		document.getElementById("pwd_chk2").style.visibility="visible";
	}
</script>
<style>
	hr {
		border:1px solid #B40404;
		width:800px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	#notice_content {
		margin-top:100px;
		margin-bottom:150px;
	}
	
	input[type="button"] {
		margin-top:5px;
		width: 90px;
		height:30px;
	}
</style>
</head>
<body>
	
	<div id="notice_content">
	<div align="center"> <h2> 공지사항</h2> </div>
	<hr>
	<table align="center" width="700">
	  <tr>
	    <td width="150">Name</td>
	    <td> ${ndto.name} </td>
	  </tr>
	  <tr>
	    <td>Title</td>
	    <td>${ndto.title}</td>
	  </tr>
	  <tr>  
	    <td>File</td>
	    <td><img src="../notice/img/${ndto.fname}" width="200"></td>
	  </tr>	 
	  <tr>  
	    <td>Content</td>
	    <td>${ndto.content}</td>
	  </tr>	 
	</table> <p>
	<div align="center">
	<span align="center"><input type="button" value="목록보기" onclick="location.href='list'"></span>
	
	<c:if test="${userid == 'admin'}">	  
		<span align="center"><input type="button" value="수정하기" onclick="location='update?id=${ndto.id}'"></span>		
		<span align="center"><input type="button" value="삭제하기" onclick="location='delete?id=${ndto.id}'"></span> <p>

	</c:if>
	</div>
	</div>
</body>
</html>