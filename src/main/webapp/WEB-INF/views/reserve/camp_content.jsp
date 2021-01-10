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
		width:800px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	#A_first {
		margin-top:100px;
	}
	
	#A_second {
		margin-top:20px;
		margin-bottom:50px;
	}
	
	#A_third {
		margin-top:20px;
		margin-bottom:150px;
	}
	
	#camp_btn {
		display:block;
		width:70px;
		height:30px;
		border:4px solid orange;
		border-radius:10px;
		color:gray;
		padding-top:5px;
		font-size:20px;
	}
</style>
</head>
<body>
  <div id="A_first" align="center">
    <table width="800" align="center" style="margin-bottom:100px;">
      <tr align="center">
        <td rowspan="4" width="350"> <img src="../admin/img/${cdto.m_img}" width="300" height="200" border="1px solid"> </td>
      </tr>  
      <tr align="center">
        <td width="100"> 캠핑장명 : </td>
        <td> ${cdto.title} </td>
      </tr>
      <tr align="center">
        <td> 연락처 : </td>
        <td> ${cdto.phone} </td>
      </tr>
      <tr align="center">
        <td> 주소 : </td>
        <td> ${cdto.address} </td>
      </tr>           
    </table>    
  </div>
  
  <div id="A_second" align="center">
    <div width="800" align="center" style="margin-bottom:100px;">
      <div> <img src="../admin/img/${cdto.m_img}" width="800" height="500"> </div>
      <div> <img src="../admin/img/${cdto.d_img}" width="800" height="500"> </div>
    </div>
  
  <div id="A_third" align="center">
    <table width="300" align="center" style="margin-bottom:100px;">
      <div><h2>1박 요금</h2></div>
      <tr align="center">
        <td> 비수기 :</td>
        <td> ${cdto.off_price}원 </td>
      </tr>
      <tr align="center">
        <td> 성수기 :</td>
        <td> ${cdto.on_price}원 </td>
      </tr>

    </table>
    
    <a href="camp_list" id="camp_btn">목록</a>
  </div>
  </div>
</body>
</html>