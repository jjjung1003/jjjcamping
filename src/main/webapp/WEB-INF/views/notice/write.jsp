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
		width:800px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	#notice_write {
		margin-top:100px;
		margin-bottom:150px;
	}
</style>
</head>
<body>
  <c:if test="${email == 'yunjjjung1003@naver.com'}">	
  
	<div id="notice_write">
	
	<div align="center"> <h2> 공지사항 글쓰기 </h2> </div>
	<hr>
	
  <form method="post" action="write_ok" enctype="multipart/form-data">
    <input type="hidden" name="name" value="관리자">
	<table align="center" width="700">
	  <tr>
	    <td width="100">Name</td>
	    <td>관리자</td>
	  </tr>
	  <tr>
	    <td>Title</td>
	    <td><input type="text" name="title" size="78"></td>
	  </tr>
	  <tr>  
	    <td>Content</td>
	    <td><textarea rows="20" cols="80" name="content"></textarea></td>
	  </tr>	 
	  <tr>  
	    <td>File</td>
	    <td><input type="file" name="fname"> <span style="color:red"> 파일 필수 선택 </span></td>
	  </tr>	 
	</table> <p>
	<div align="center"> <input type="submit" value="등록하기"> </div>
  </form>
  
  </div>	
  </c:if>
</body>
</html>