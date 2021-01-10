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
	
	#info_first {
		margin-top:100px;
	}
	
	#info_second {
		margin-top:20px;
		margin-bottom:150px;
	}
	
</style>
</head>
<body>
	<div id="info_first" align="center">
      <h2> 제휴캠핑장 </h2> 
      <br> 저희 jjjcamping에서 구매하신 텐트를 사용하여 2박이상 예약하시면
      <br> 당일 바베큐 참숯 1키로를 무료로 제공해드립니다.
      <p> 자세한 내용은 해당 캠핑장으로 문의주세요. *^^* 
	  <hr id="hr_1">
	</div>
	
	<div id="info_second" align="center">
    
    
    <c:forEach items="${list}" var="cdto">
    <table width="800" align="center" style="margin-bottom:100px;">
      <tr align="center">
        <td rowspan="5" width="400"> 
          <a href="camp_content?id=${cdto.id}"> 
            <img src="../admin/img/${cdto.m_img}" width="300" height="200" border="1px solid">
          </a></td>
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
      <tr align="center">
        <td> 평점 :</td>
        <td> ★★★★★ </td>
      </tr> 
      </table> 
    </c:forEach>      
    
    
  </div>
  
</body>
</html>