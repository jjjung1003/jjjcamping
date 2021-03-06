<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#mem_first {
		margin-top:100px;
	}
	
	#mem_second {
		margin-bottom:150px;
	}
	
	#mem_second #memlist_btn {
		display:block;
		width:95px;
		height:25px;
		border:2px solid navy;
		border-radius:5px;
		font-size:15px;
		cursor:pointer;
		font-size:10px;
	}
	
	#hr_1 {
		border:1px solid #B40404;
		width:1000px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	select {
		margin-top:5px;
		width: 80px;
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
<script>
	function mem_rejoin(id)
	{
		if(confirm("재가입을 위해 탈퇴회원의 아이디, 이메일을 삭제하시겠습니까?"))
			location.href='mem_rejoin?id='+id;
	}
</script>
</head>
<body>
<div align="center" id="mem_first"> <h2> 전체 회원</h2> </div>
	<hr id="hr_1">
	<div align="center">
	<form method="post" action="member_list" name="jjj">
		<select name="cla">
		    <option value="id"> 회원번호 </option>
			<option value="userid"> 아이디 </option>
			<option value="name"> 이름 </option>
		</select>
		<input type="text" name="search" value="${search}" placeholder="검색내용 입력" autocomplete='off'>
		<input type="submit" value="검색하기"> 
	</form><p><br>
	</div>
	
	<div id="mem_second">
	<table align="center" width="1000">
	  <tr style="font-size:15px">
	    <td height="70"><strong>회원번호</strong></td>
	    <td align="center"><strong>이름</strong></td>
	    <td align="center"><strong>아이디</strong></td>
	    <td align="center"><strong>성별</strong></td>
	    <td align="center"><strong>생년월일</strong></td>
	    <td align="center"><strong>연락처</strong></td>
	    <td align="center"><strong>이메일</strong></td>
	    <td align="center"><strong>가입일</strong></td>
	    <td align="center"><strong>회원상태</strong></td>
	    <td align="center"><strong>재가입요청시</strong></td>
	  </tr>
	  
	  <c:forEach items="${list}" var="mdto">	
	  
	  	  <c:if test="${mdto.gen == 1}">
	 		<c:set var="genimsi" value="남자"/>
	 	  </c:if>
	 	  <c:if test="${mdto.gen == 2}">
	 		<c:set var="genimsi" value="여자"/>
	 	  </c:if>
	 	  
	 	  <c:if test="${mdto.withdraw == 0}">
	 		<c:set var="wdimsi" value="정상회원"/>
	 	  </c:if>
	 	  <c:if test="${mdto.withdraw == 1}">
	 		<c:set var="wdimsi" value="탈퇴회원"/>
	 	  </c:if>
	  <tr>
	    <td height="40">${mdto.id}</td>
	    <td align="center"> ${mdto.name}</td>
	    <td align="center">${mdto.userid}</td>
	    <td align="center">${genimsi}</td>
	    <td align="center">${mdto.birth}</td>
	    <td align="center">${mdto.phone}</td>
	    <td align="center">${mdto.email}</td>
	    <td align="center">${mdto.writeday}</td>
	    <td align="center">${wdimsi}</td>
	    <td align="center"><button  id="memlist_btn" align="center" onclick="mem_rejoin(${mdto.id})">아이디/메일 삭제</button></td>
	  </tr> 
	  </c:forEach> 	   
	</table> <p><br>
	
	</div>
</body>
</html>