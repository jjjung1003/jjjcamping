<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

	#tip_first {
		margin-top:100px;
	}
	
	#tip_second {
		margin-bottom:150px;
	}
	
	#tip_second #list_btn {
		background-color:#2F0B3A;
		color:white;
	}
	
	#hr_1 {
		border:1px solid #B40404;
		width:800px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	select {
		margin-top:5px;
		width: 70px;
		height:30px;
		border: 2px solid #999;
		/*padding-left:12px;
		font-family: inherit;
		background: url('arrow.jpg') no-repeat 95% 50%;
		border-radius: 0px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none; */
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
<script>
	function content(id)
	{
		window.open("content?id="+id,"","width=600,height=350")
	}
</script>
</head>
<body>
<div align="center" id="tip_first"> <h2> 캠핑을 즐기는 꿀팁 </h2> </div>
	<hr id="hr_1">
	<div align="center">
	<form method="post" action="list" name="jjj">
		<select name="cla">
			<option value="title"> 제목 </option>
		</select>
		<input type="text" name="search" value="${search}" placeholder="검색내용 입력">
		<input type="submit" value="검색하기"> 
	</form><p><br>
	</div>
	
	<div id="tip_second">
	<table align="center" width="750">
	
	  <tr style="font-size:25px">
	    <td>No.</td>
	    <td width="400" height="60" align="center">Content</td>
	    <td align="center">Date</td>
	  </tr>
	  <c:forEach items="${tip_list}" var="tipdto">
	  <tr>
	    <td height="40">${tipdto.id}</td>
	    <td><a href="javascript:content('${tipdto.id}')"> ${tipdto.title} </a></td>
	    <td align="center">${tipdto.writeday}</td>
	  </tr> 
	  </c:forEach> 	   
	</table> <p><br>
	
	
	<c:if test="${email == 'yunjjjung1003@naver.com'}">	
		<div align="center"> <a href="write" id="list_btn"> 글 쓰기 </a> </div> <br><p/>
	</c:if>
  </div>
  
</body>
</html>
	  














