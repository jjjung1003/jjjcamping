<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#hr_1 {
		border:1px solid #B40404;
		width:700px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	#pro_first {
		margin-top:100px;
		margin-bottom:150px;
	}
</style>
</head>
<body>

	<div align="center" id="pro_first">
	<div align="center"> <h2> ${pdto.pro_name}</h2> </div>
	<hr id="hr_1">
	
		<table width="650">
		  <tr>
		    <td rowspan="7" width="350"><img src="../admin/img/product/${pdto.m_img}" width="300" height="200"></td>
		  </tr>
		  <tr>
		    <td width="120">상품코드 :</td>
		    <td>${pdto.code}</td>
		  </tr>
		  <tr>
		    <td>정가 :</td>
		    <td><fmt:formatNumber value="${pdto.price}"/>원</td>
		  </tr>
		  <tr>
		    <td>할인율 :</td>
		    <td>${pdto.discount} %</td>
		  </tr>
		  <tr>
		    <td>적립포인트 :</td>
		    <td>${pdto.point} %</td>
		  </tr>  
		  <tr>
		    <td>판매가격 :</td>
		    <td><fmt:formatNumber value="${pdto.price*(100-pdto.discount)/100}"/>원</td>
		  </tr>
		</table> <p><br>
		
		  
		<table width="650">
		  <form method="post" action="../cart/cart_add">
		    <input type="hidden" name="quantity" value="${pdto.quantity}">
		    <input type="hidden" name="userid" value="${userid}">
		    <input type="hidden" name="pro_name" value="${pdto.pro_name}">
		    <input type="hidden" name="quantity" value="${pdto.quantity}">
		    <input type="hidden" name="code" value="${pdto.code}">
		    <input type="hidden" name="price" value="${pdto.price*(100-pdto.discount)/100}">
		    <input type="hidden" name="point" value="${pdto.point}">
		    <input type="submit" value="장바구니">
		  </form>
		</table>
	</div>

</body>
</html>






