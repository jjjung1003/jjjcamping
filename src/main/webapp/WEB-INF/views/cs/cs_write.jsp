<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#cs_first {
		margin-top:100px;
	}
	
	#cs_second {
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
	
	
	<div align="center" id="cs_first"> <h2> 문의하기 </h2> </div>
	<hr id="hr_1">
	<div align="center" id="cs_second">
	  <form method="post" action="cs_write_ok" name="jjj">
	  <input type="hidden" name="userid" value="${userid}">
	  <input type="hidden" name="name" value="${cdto.name}">
	    <table align="center" width="500" style="margin-bottom:50px">
	    <tr>
	      <td width="100" height="50"> 아이디 </td> 
	      <td> ${userid} </td> 
	    </tr>
	    <tr>
	      <td height="50"> 이름 </td> 
	      <td> ${cdto.name} </td> 
	    </tr>     
	    <tr>
	      <td height="50"> 제목 </td> 
	      <td> <input type="text" name="title" size="30" placeholder="제목"> </td> 
	    </tr> 
	    <tr>
	      <td> 내용 </td> 
	      <td> <textarea rows="10" cols="50" name="content"> </textarea> </td> 
	    </tr> 
	  </table> <p>
	  <input type="submit" value="등록하기">  
	  </form>
	 </div> 
</body>
</html>