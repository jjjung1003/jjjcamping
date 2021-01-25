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
		width:400px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	#order_first {
		margin-top:100px;
		margin-bottom:150px;
	}
	#ocbtn {
		display:block;
		width:100px;
		height:25px;
		border:3px solid orange;
		border-radius:10px;
		color:gray;
		padding-top:5px;
		font-size:15px;
	}
</style>
</head>
<body>
<div align="center" id="order_first">
	<div align="center"> <h2> 주문완료 </h2> </div>
	<hr id="hr_1">
	주문이 완료되었습니다.<p><br>
	주문일자 : ${date} <br>
	주문번호 : ${o_code}<br>
	적립포인트 : <fmt:formatNumber value="${point}"/>P <br><br><br><br><br>
	
	<a href="../member/order_list" id="ocbtn">주문내역보기</a>
</div>	
</body>
</html>