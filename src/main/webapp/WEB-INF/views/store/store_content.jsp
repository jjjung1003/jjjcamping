<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#store_first {
		margin-top:100px;
		margin-bottom:50px;
	}
	
	#store_second {
		margin-bottom:150px;
	}
	
	#hr_1 {
		border:1px solid #B40404;
		width:700px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}	
	
	input[type="button"] {
		width: 90px;
		height:30px;
	}
	
	#store_del {
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

  <div id="store_first" align="center">
    <h2> 매장안내 </h2>
	<hr id="hr_1">
	
	<table width="600" align="center">
	  <tr>
		<td rowspan="4"><img src="../store/img/${sdto.m_img}" width="200" height="200" style="border:3px solid orange; background:orange;"></td>
	  </tr>	
	  <tr>
		<td>매장명 : ${sdto.title}</td>
	  </tr>	
	  <tr>	
		<td>매장주소 : ${sdto.address}</td>
	  </tr>	
	  <tr>	
		<td>연락처 : ${sdto.phone}</td>
	  </tr>	
	</table>
	
	
  </div>
  
  <div id="store_second" align="center">
    <input type="button" onclick="location.href='../store/store_list'" value="목록">
  </div>
  
   <div align="center" style="margin-bottom:50px">
  	 <c:if test="${userid eq 'admin'}">
	   <a href="store_delete?id=${sdto.id}" id="store_del">매장삭제 </a>
	 </c:if> 
   </div> 

</body>
</html>









