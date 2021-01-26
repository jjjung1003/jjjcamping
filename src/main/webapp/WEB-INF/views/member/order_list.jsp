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
	
	.jjj_td {
		 border-bottom:1px solid #BDBDBD;
		 height:20px;
	}
</style>
<script src="//code.jquery.com/jquery-1.11.0.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>
<body>
	<div align="center" id="cart_first">
	<div align="center"> <h2> 주문내역 </h2> </div>
	<hr id="hr_1">

	 <table width="600">
	   <tr>
	     <td height="70"><strong>주문일자</strong></td>
	     <td height="70"><strong>주문번호</strong></td>
	     <td><strong>상품코드</strong></td>
	     <td align="center"><strong>상품가격</strong></td>
	     <td align="center"><strong>총결제금액</strong></td>
	   </tr>
	   
	   <c:forEach items="${list}" var="odto">
	   <tr height="40">
	     <td class="jjj_td">${odto.writeday}</td>
	     <td class="jjj_td">${odto.o_code}</td>			
	     <td class="jjj_td">${odto.p_code}</td>
	     <td class="jjj_td" align="center"><fmt:formatNumber value="${odto.d_price}"/>원</td>
	     <td class="jjj_td" align="center"><fmt:formatNumber value="${odto.tot_price}"/>원</td>
	   </tr>  	   	   
	   </c:forEach>
	   
	 </table> <br><br>
	</div>
</body>
</html>