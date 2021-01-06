<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
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
	
	#cs_first {
		margin-top:100px;
	}
	
	#cs_second {
		margin-top:50px;
		margin-bottom:150px;
	}
	
	#hr_1 {
		border:1px solid #B40404;
		width:800px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	#cslist_btn {
		display:inline-block;
		border:3px solid #FAAC58;
		padding-top:3px;
		width: 90px;
		height:25px;
		margin-top:40px;
		border-radius:5px;
	}
</style>
</head>
<body>

<div align="center">
<div align="center" id="cs_first"> <h2> 고객센터 1:1 문의</h2> </div>
	<hr id="hr_1">

	<!-- 검색단 시작 -->
	<form method="post" action="list" name="jjj">
	  <select name="cla">
	    <option value="id"> 글번호 </option>	
	    <option value="userid"> 아이디 </option>  
	  </select>
	  <input type="text" name="search" value="${search}">
	  <input type="submit" value="검색하기">
	</form>
	<!-- 검색단 끝 -->
	
	<div id="cs_second">
	  <table align="center" width="750" style="margin-bottom:50px">
	    <tr style="font-size:20px">
	      <td> 글번호 </td>
	      <td> 이름 </td> 
	      <td width="400" height="60" align="center"> 제목 </td>
	      <td align="center"> 작성일 </td>
	    </tr> 
	      
	  <c:forEach items="${cslist}" var="cdto">
	    <tr>
	      <input type="hidden" name="userid" value="${cdto.userid}">
	      <td height="40"> ${cdto.id} </td>
	      <td> ${cdto.name} </td>
	      <td> <a href="content?id=${cdto.id}&page=${page}"> ${cdto.title} </a></td>
	      <td align="center"> ${cdto.writeday} </td>
	    </tr> 
	  </c:forEach>  
	  </table>
	  
	  <!-- 페이징처리 시작 -->
	  
	  <c:if test="${pstart != 1}">
	  	<a href="list?page=${pstart-1}"> ◁◁ </a>
	  </c:if>
	  <c:if test="${pstart == 1}">
	  	◁◁
	  </c:if>
	  
	  <c:if test="${page != 1}">
	  	<a href="list?page=${page-1}"> ◁ </a>
	  </c:if>
	  <c:if test="${page == 1}">
	  	◁
	  </c:if>
	  
	  <c:forEach var="i" begin="${pstart}" end="${pend}">
	    <c:if test="${page != i}">
	      <a href="list?page=${i}"> ${i}</a>
	    </c:if>
	    <c:if test="${page == i}">
	      <a href="list?page=${i}" style="color:red"> ${i}</a>
	    </c:if>
	  </c:forEach>
	  
	  <c:if test="${pend != page_cnt}">
	  	<a href="list?page=${page+1}"> ▷ </a>
	  </c:if>
	  <c:if test="${pend == page_cnt}">
	  	▷
	  </c:if>
	  
	  <c:if test="${pend != page_cnt}">
	  	<a href="list?page=${pend+1}"> ▷▷ </a>
	  </c:if>
	  <c:if test="${pend == page_cnt}">
	  	▷▷
	  </c:if>
	  
	  <!-- 페이징처리 끝 -->
	  <p>
	  <a href="write" id="cslist_btn"> 글쓰기 </a>
	</div>
	</div>	
</body>
</html>