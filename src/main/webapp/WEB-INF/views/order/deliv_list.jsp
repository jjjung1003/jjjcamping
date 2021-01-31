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
		width:900px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	#deliv_list {
		margin-top:100px;
		margin-bottom:150px;
	}
	
	#ck_btn {
		cursor:pointer;
	}
</style>
<script>
	function sel_deliv(o_name,o_phone,zipcode,address,d_address)
	{
		var deliv=opener.document.jjj_order;
		deliv.o_name.value=o_name;
		deliv.o_phone.value=o_phone;
		deliv.zipcode.value=zipcode;
		deliv.address.value=address;
		deliv.d_address.value=d_address;
		close();
	}
</script>
</head>
<body>
	<div align="center" id="deliv_list">
	<div align="center"> <h2>배송 주소록</h2> </div>
	<hr id="hr_1">
	  <table align="center" width="900">
	    <tr>
	      <td width="70">받는분</td>
	      <td width="120">연락처</td>
	      <td width="80">우편번호</td>
	      <td align="center" width="300">주소</td>
	      <td align="center">세부주소</td>
	      <td align="center">선택</td>
	    </tr>
	  <c:forEach items="${list}" var="odto">  
	  <input type="hidden" name="id" value="${odto.id}">
	    <tr>	      
	      <td>${odto.o_name}</td>
	      <td>${odto.o_phone}</td>
	      <td>${odto.zipcode}</td>
	      <td>${odto.address}</td>
	      <td>${odto.d_address}</td>
	      <td align="center"><span id="ck_btn" onclick="sel_deliv('${odto.o_name}','${odto.o_phone}','${odto.zipcode}','${odto.address}','${odto.d_address}')">CLICK</span></td>
	    </tr>   
	  </c:forEach>  
	  </table>
	</div>
</body>
</html>