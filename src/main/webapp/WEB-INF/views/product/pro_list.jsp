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

	#pro_first {
		margin-top:100px;
	}
	
	#pro_second {
		margin-bottom:150px;
	}
	
	#pro_second #list_btn {
		display:block;
		width:70px;
		height:25px;
		border:4px solid orange;
		border-radius:10px;
		color:gray;
		padding-top:5px;
		font-size:15px;
	}
	
	#hr_1 {
		border:1px solid #B40404;
		width:850px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}

	select {
		margin-top:5px;
		width: 90px;
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
	
	.jjj_td {
		 border-bottom:1px solid #BDBDBD;
	}
</style>

</head>
<body>
<div align="center" id="pro_first"> <h2> 전체 상품</h2> </div>
	<hr id="hr_1">
	<div align="center">
	<form method="post" action="product_list" name="jjj">
		<select name="cla">
			<option value="code"> 코드번호 </option>
			<option value="pro_name"> 상품명 </option>
		</select>
		<input type="text" name="search" value="${search}" placeholder="검색내용 입력" autocomplete='off'>
		<input type="submit" value="검색하기"> 
	</form><p><br>
	</div>
	
	<div id="pro_second">
	<table align="center" width="850">
	  <tr style="font-size:15px">
	  	<td align="center"></td>
	    <td align="center"><strong>상품코드</strong></td>
	    <td align="center"><strong>상품명</strong></td>	    
	    <td align="center"><strong>정가</strong></td>
	    <td align="center"><strong>판매가</strong></td>
	    <td align="center"><strong>판매여부</strong></td>
	  </tr>
	  
	  <c:forEach items="${list}" var="pdto">
	  
		  <c:if test="${pdto.pro_stock == 0}">
	 		<c:set var="imsi" value="판매중"/>
	 	  </c:if>
	 	  <c:if test="${pdto.pro_stock == 1}">
	 		<c:set var="imsi" value="일시품절"/>
	 	  </c:if>
	 	  <c:if test="${pdto.pro_stock == 2}">
	 		<c:set var="imsi" value="품절"/>
	 	  </c:if>
	 	
	  <tr>
	  <input type="hidden" name="userid" value="${userid}">
	  <input type="hidden" name="code" value="${pdto.code}">
	  <input type="hidden" name="pro_name" value="${pdto.pro_name}">
	  <input type="hidden" name="quantity" value="${pdto.quantity}">	  
	    <td align="center"><a href="pro_content?code=${pdto.code}"><img src="../admin/img/product/${pdto.m_img}" width="150" height="130"></a></td>
	    <td class="jjj_td" align="center">${pdto.code}</td>
	    <td class="jjj_td" align="center"> ${pdto.pro_name}</td>
	    <td class="jjj_td" align="center"><fmt:formatNumber value="${pdto.price}"/>원</td>
	    <td class="jjj_td" align="center"><fmt:formatNumber value="${pdto.price*(100-pdto.discount)/100}"/>원</td>
	    <td class="jjj_td" align="center">${imsi}</td>
	  </form>  
	  </tr>
	  </c:forEach> 	   
	</table> <p><br>
	
	</div>

</body>
</html>