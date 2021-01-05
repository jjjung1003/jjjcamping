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
		background-color:#2F0B3A;
		color:white;
	}
	
	#hr_1 {
		border:1px solid #B40404;
		width:1000px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	#hr_2 {
		width:800px;
		align:center;
		background-color:#585858;
		margin-top:200px;
	}
	#hr_3 {
		width:800px;
		align:center;
		background-color:#585858;
		border-:1px solid #B40404;
	}
	
	#list_table {
		width:810px;
		height:300px;
		text-align:center;
		margin-left:auto;
		margin-right:auto;
		
	}
	
	#list_table table {
		/* border-top: 2px solid #444444;
		border-bottom: 2px solid #444444;
   		order-collapse: collapse; */
   		font-size:17px;
	}
	
	#list_table #aa{
		float:left;
	}
	#list_table #bb{
		float:right;
	}
</style>
</head>
<body>
<div align="center" id="notice_first"> <h2> 공지사항</h2> </div>
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
	
	<div id="notice_second">
	<table align="center" width="750">
	  <tr style="font-size:25px">
	    <td>No.</td>
	    <td width="400" height="60" align="center">Content</td>
	    <td align="center">Name</td>
	    <td align="center">Date</td>
	    <td align="center">Hits</td>
	  </tr>
	  <c:forEach items="${list}" var="ndto">
	  <tr>
	    <td height="40">${ndto.id}</td>
	    <td><a href="hit?id=${ndto.id}"> ${ndto.title} </a></td>
	    <td align="center">${ndto.name}</td>
	    <td align="center">${ndto.writeday}</td>
	    <td align="center">${ndto.hit}</td>
	  </tr> 
	  </c:forEach> 	   
	</table> <p><br>
	
	<div align="center">
	  <c:if test="${pstart != 1}"> <!-- 1, 11, 21, 31.... -->
	  	<a href="list?page=${pstart-1}">◁◁ </a>
	  </c:if>
	  <c:if test="${pstart == 1}"> 
	  	◁◁
	  </c:if>
	  
	  <c:if test="${page != 1}"> <!-- 1, 2, 3, 4.... -->
	  	<a href="list?page=${page-1}">◁ </a>
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
	  
	  <c:if test="${page != page_cnt}"> <!-- 1, 2, 3, 4.... -->
	  	<a href="list?page=${page+1}">▷ </a>
	  </c:if>
	  <c:if test="${page == page_cnt}"> 
	  	▷
	  </c:if>
	  
	  <c:if test="${pend != page_cnt}"> <!-- 1, 11, 21, 31.... -->
	  	<a href="list?page=${pend+1}">▷▷ </a>
	  </c:if>
	  <c:if test="${pend == page_cnt}"> 
	  	▷▷ 
	  </c:if>	  
	</div> <br><p>
	
	<c:if test="${email == 'yunjjjung1003@naver.com'}">	
		<div align="center"> <a href="write" id="list_btn"> 글 쓰기 </a> </div> <br><p>
	</c:if>
	
	<hr id="hr_1">	
	
	
	<hr id="hr_2">
	  <div id="list_table" align="center">
		<table id="aa" align="center" width="400" height="300">
		  <tr>
		    <td style="font-size:17px;color:gray"> 고객센터 </td>
		  </tr>
		  <tr>
		    <td style="font-size:30px;color:red"> 1588-5515 </td>
		  </tr>
		  <tr>
		    <td> 상담시간 AM 09:00 ~ PM 06:00 <br>점심시간 AM 12:00 ~ PM 01:00 <br> 토요일, 일요일, 공휴일 휴무 </td>
		  </tr>
		  <tr>
		    <td align="center"> <span style="background:#BDBDBD"><a href="../tip/gogaek" style="color:white"> 1:1 문의하기 </a></span>  </td>
		  </tr>
		</table>
		
		<table id="bb" align="center" width="400" height="300">
		  <tr height="55"> 
		    <td style="font-size:17px;color:gray"> 캠핑몰 매장 안내  <a href="../tip/aanae"><span style="margin-left:150px"> ▷ </span> </a> </td>
		  </tr>
		  <tr>
		    <td rowspan="4"> <a href="../tip/aanae"> <img src="../notice/img/flower"> </a></td>
		  </tr>
		</table>
		
	  </div>
	  <hr id="hr_3">
	</div>
</body>
</html>
	  














