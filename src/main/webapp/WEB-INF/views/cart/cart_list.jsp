<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
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
	
	#cart_first {
		margin-top:100px;
		margin-bottom:150px;
	}
</style>
<script src="//code.jquery.com/jquery-1.11.0.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>

</script>
</head>
<body>
	<div align="center" id="cart_first">
	<div align="center"> <h2> 장바구니 </h2> </div>
	<hr id="hr_1">
	
	<form method="post" action="../order/order_first" name="jjj">
	
	 <table width="600">
	   <tr>
	     <td height="70"><strong>no.</strong></td>
	     <td height="70"><strong>상품 코드</strong></td>
	     <td align="center"><strong>상품명</strong></td>
	     <td align="center"><strong>메인이미지</strong></td>
	     <td align="center"><strong>정가</strong></td>
	     <td align="center"><strong>판매가</strong></td>
	     <td align="center"><strong>삭제</strong></td>
	   </tr>
	   
	   <c:set var="i" value="1"/>
	   <c:forEach items="${list}" var="cdto">
	   <tr>
	     <td>${i}</td>
	     <td>${cdto.code}</td>			
	     <td>${cdto.pro_name}</td>
	     <td align="center"><img src="../admin/img/product/${cdto.m_img}" width="80" height="60"></td>
	     <td align="center"><fmt:formatNumber value="${cdto.price}"/>원</td>
	     <td align="center"><input type="hidden" id="d_price" name="d_price" value="${d_price}"><fmt:formatNumber value="${d_price}"/>원</td>
	     <td align="center"><a href="cart_del?id=${cdto.id}">X</a></td>
	   </tr>  
	   <c:set var="i" value="${i+1}"/>
	   	   
	   </c:forEach>
	   
	 </table> <br><br>
	 <input type="submit" value="주문하기">
	 </form>
	</div>
</body>
</html>