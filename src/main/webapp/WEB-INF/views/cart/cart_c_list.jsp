<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#hr_1 {
		border:1px solid #B40404;
		width:600px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	#cart_c_first {
		margin-top:100px;
		margin-bottom:150px;
	}
</style>
</head>
<body>

	<div align="center" id="cart_c_first">
	<div align="center"> <h2> 비회원 장바구니</h2> </div>
	<hr id="hr_1">
		<input type="hidden" name="cookie" value="${cookie}">

	 <table width="600">
	   <tr>
	     <td height="70"><strong>no.</strong></td>
	     <td height="70"><strong>상품 코드</strong></td>
	     <td align="center"><strong>상품명</strong></td>
	     <td align="center"><strong>메인이미지</strong></td>
	     <td align="center"><strong>정가</strong></td>
	     <td align="center"><strong>삭제</strong></td>
	   </tr>
	   <c:set var="i" value="1"/>
	   <c:forEach items="${list}" var="ccdto">
	   <tr>
	     <td>${i}</td>
	     <td>${ccdto.code}</td>
	     <td>${ccdto.pro_name}</td>
	     <td align="center"><img src="" width="80" height="60"></td>
	     <td align="center">${ccdto.price}</td>
	     <td align="center"><a href="cart_del?id=${ccdto.id}">X</a></td>
	   </tr>  
	   <c:set var="i" value="${i+1}"/>
	   </c:forEach>
	 </table>
	</div>
</body>
</html>