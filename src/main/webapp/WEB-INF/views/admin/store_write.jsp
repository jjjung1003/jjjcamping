<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#store_first {
		margin-top:100px;
	}
	
	#store_second {
		margin-top:50px;
		margin-bottom:150px;
	}
	
	#hr_1 {
		border:1px solid #B40404;
		width:700px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	input[type="text"] {
		width: 350px;
		height:25px;
	}
	
	input[type="submit"] {
		width: 90px;
		height:30px;
	}
</style>
</head>
<body>
	<div align="center" id="store_first"> <h2> 매장 정보 등록 </h2> </div>
	<hr id="hr_1">
	<div align="center" id="store_second">
	  <form method="post" action="store_write_ok" name="jjj" enctype="multipart/form-data">

	    <table align="center" width="500" style="margin-bottom:50px">
	    <tr>
	      <td width="100" height="50"> 지역 </td> 
	      <td> <input type="text" name="region" size="30" placeholder="예 : 서울,경기,인천"> </td> 
	    </tr>
	    <tr>
	      <td height="50"> 매장명 </td> 
	      <td> <input type="text" name="title" size="30" placeholder="매장명"> </td> 
	    </tr>     
	    <tr>
	      <td height="50"> 주소 </td> 
	      <td> <input type="text" name="address" size="30" placeholder="주소"> </td> 
	    </tr> 
	    <tr>
	      <td height="50"> 연락처 </td> 
	      <td> <input type="text" name="phone" size="30" placeholder="예: 02-1234-5678"> </td> 
	    </tr>
	    <tr>
	      <td height="50"> 매장이미지 </td> 
	      <td> <input type="file" name="m_img" size="30"> </td> 
	    </tr> 
	  </table> <p>
	  <input type="submit" value="등록하기">  
	  </form>
	 </div>
	 

</body>
</html>