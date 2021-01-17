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
		width:500px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	#cart_first {
		margin-top:100px;
		margin-bottom:150px;
	}
</style>
</head>
<body>
<div align="center"> <h2> 전체 상품</h2> </div>
	<hr id="hr_1">
	<div align="center" id="cart_first">
	 <table width="500">
	   <tr>
	     <td height="70"><strong>상품 코드</strong></td>
	     <td align="center"><strong>상품명</strong></td>
	     <td align="center"><strong>메인이미지</strong></td>
	    <td align="center"><strong>정가</strong></td>
	   </tr>
	   <c:forEach items="${list}" var="cdto">
	   <tr>
	     <td>${cdto.code}</td>
	     <td>${cdto.pro_name}</td>
	     <td align="center"><img src="../admin/img/product/${cdto.m_img}" width="80" height="60"></td>
	     <td align="center">${cdto.price}</td>
	   </tr>  
	   </c:forEach>
	 </table>
	</div>
</body>
</html>