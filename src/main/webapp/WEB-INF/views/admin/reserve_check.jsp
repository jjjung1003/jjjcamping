<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

	#reserve_first {
		margin-top:100px;
	}
	
	#reserve_second {
		margin-bottom:150px;
	}
	
	#reserve_second #list_btn {
		background-color:#2F0B3A;
		color:white;
	}
	
	#hr_1 {
		border:1px solid #B40404;
		width:900px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
</style>
</head>
<body>
<div align="center" id="reserve_first"> <h2> 캠핑장 예약내역</h2> </div>
	<hr id="hr_1">
	
	<div id="reserve_second">
	  <table align="center" width="900">
	  <caption><h3>다가오는예약</h3></caption>
	  <tr style="font-size:20px;">
	    <td height="30">No.</td>
	    <td>신청일</td>
	    <td>캠핑장</td>
	    <td>예약자명</td>
	    <td>아이디</td>
	    <td>연락처</td>
	    <td>입실일</td>
	    <td>퇴실일</td>
	    <td>데크번호</td>
	    <td>예약취소</td>
	  </tr>
	  
	  <c:forEach items="${list}" var="rdto">
	  <c:if test="${rdto.in_date >= today}">	   
	  <tr height="30">
	    <td> ${rdto.id} </td>
	    <td> ${rdto.writeday} </td>
	    <td> ${rdto.camp} </td>
	    <td> ${rdto.name} </td>
	    <td> ${rdto.userid} </td>
	    <td> ${mdto.phone} </td>
	    <td> ${rdto.in_date} </td>
	    <td> ${rdto.out_date} </td>
	    <td> ${rdto.a_deck} </td>
	    <td><a href="../admin/reserve_del?id=${rdto.id}"> X </a></td>
	  </tr>
	  </c:if>
	  </c:forEach>  
	</table> <p><br><br><br><br>
	
	<table align="center" width="900">
	<caption><h3>종료된예약</h3></caption>
	  <tr style="font-size:20px">
	    <td height="30">No.</td>
	    <td>신청일</td>
	    <td>캠핑장</td>
	    <td>예약자명</td>
	    <td>아이디</td>
	    <td>연락처</td>
	    <td>입실일</td>
	    <td>퇴실일</td>
	    <td>데크번호</td>
	  </tr>
	  
	  <c:forEach items="${list}" var="rdto">
	  <c:if test="${rdto.in_date < today}">	   
	  <tr height="30">
	    <td> ${rdto.id} </td>
	    <td> ${rdto.writeday} </td>
	    <td> ${rdto.camp} </td>
	    <td> ${rdto.name} </td>
	    <td> ${rdto.userid} </td>
	    <td> ${mdto.phone} </td>
	    <td> ${rdto.in_date} </td>
	    <td> ${rdto.out_date} </td>
	    <td> ${rdto.a_deck} </td>
	  </tr>
	  </c:if>
	  </c:forEach>
	  </table>
	  
	</div>
	
</body>
</html>
	  
