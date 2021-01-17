<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

	#notice_first {
		margin-top:100px;
	}
	
	#notice_second {
		margin-bottom:150px;
	}
	
	#notice_second #list_btn {
		display:block;
		width:70px;
		height:25px;
		border:4px solid orange;
		border-radius:10px;
		color:gray;
		padding-top:5px;
		font-size:15px;
	}
	
	#hr_1 {
		border:1px solid #B40404;
		width:850px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}

	select {
		margin-top:5px;
		width: 70px;
		height:30px;
		border: 2px solid #999;
	}
	
	input[type="text"] {
		width: 190px;
		height:25px;
	}
	
	input[type="submit"] {
		margin-top:5px;
		width: 70px;
		height:30px;
	}
</style>
</head>
<body>
<div align="center" id="notice_first"> <h2> 공지사항</h2> </div>
	<hr id="hr_1">
	<div align="center">
	<form method="post" action="notice_list" name="jjj">
		<select name="cla">
			<option value="title"> 제목 </option>
		</select>
		<input type="text" name="search" value="${search}" placeholder="검색내용 입력">
		<input type="submit" value="검색하기"> 
	</form><p><br>
	</div>
	
	<div id="notice_second">
	<table align="center" width="750">
	  <tr style="font-size:20px">
	    <td><strong>No.</strong></td>
	    <td width="400" height="60" align="center"><strong>Content</strong></td>
	    <td align="center"><strong>Name</strong></td>
	    <td align="center"><strong>Date</strong></td>
	    <td align="center"><strong>Hits</strong></td>
	  </tr>
	  <c:forEach items="${list}" var="ndto">
	  <tr>
	    <td height="40">${ndto.id}</td>
	    <td><a href="notice_hit?id=${ndto.id}"> ${ndto.title} </a></td>
	    <td align="center">${ndto.name}</td>
	    <td align="center">${ndto.writeday}</td>
	    <td align="center">${ndto.hit}</td>
	  </tr> 
	  </c:forEach> 	   
	</table> <p><br>
	
	<div align="center">
	  <c:if test="${pstart != 1}"> <!-- 1, 11, 21, 31.... -->
	  	<a href="notice_list?page=${pstart-1}"><strong>◁◁</strong> </a>
	  </c:if>
	  <c:if test="${pstart == 1}"> 
	  	<strong>◁◁</strong>
	  </c:if>
	  
	  <c:if test="${page != 1}"> <!-- 1, 2, 3, 4.... -->
	  	<a href="notice_list?page=${page-1}"><strong>◁</strong> </a>
	  </c:if>
	  <c:if test="${page == 1}"> 
	  	<strong>◁</strong>
	  </c:if>
	  
	  <c:forEach var="i" begin="${pstart}" end="${pend}">	
	  	<c:if test="${page != i}">
	  		<a href="notice_list?page=${i}"> <strong>${i}</strong></a>
	  	</c:if>
	  	<c:if test="${page == i}">
	  		<a href="notice_list?page=${i}" style="color:red"> <strong>${i}</strong></a>
	  	</c:if>
	  </c:forEach>  
	  
	  <c:if test="${page != page_cnt}"> <!-- 1, 2, 3, 4.... -->
	  	<a href="notice_list?page=${page+1}"><strong>▷</strong> </a>
	  </c:if>
	  <c:if test="${page == page_cnt}"> 
	  	<strong>▷</strong>
	  </c:if>
	  
	  <c:if test="${pend != page_cnt}"> <!-- 1, 11, 21, 31.... -->
	  	<a href="notice_list?page=${pend+1}"><strong>▷▷</strong> </a>
	  </c:if>
	  <c:if test="${pend == page_cnt}"> 
	  	<strong>▷▷ </strong>
	  </c:if>	  
	</div> <br><p>
	
	<c:if test="${userid == 'admin'}">	
		<div align="center"> <a href="notice_write" id="list_btn"> 글쓰기 </a> </div> <br><p>
	</c:if>

	</div>
	
</body>
</html>
	  


	  	











