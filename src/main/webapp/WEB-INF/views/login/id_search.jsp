<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	a {
		text-decoration:none;
		color:black;
	}
	#id_sear {
		width:1280px;
		text-align:center;
		margin:auto;
		margin-bottom:150px;
	}
	
	#hr_1 {
		border:1px solid #B40404;
		width:600px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	#idsear_btn {
		background-color:#A4A4A4;	
		color:white;	
	}
	
	#pwdsear_btn{
		background-color:#A4A4A4;	
		color:white;	
	}
</style>
</head>
<body>
<div align="center"> <h2> 아이디찾기</h2> </div>
	<hr id="hr_1">
	<div id="id_sear">
  <form method="post" action="id_search_ok">
	<input type="text" name="name" id="name" placeholder="이름"> <p>
	<input type="text" name="phone" id="phone" size="20px" placeholder="휴대폰번호 (숫자만 입력)" maxlength="11"> <p>
	<input type="submit" value="아이디찾기">
  </form> <p> <br><p>
 	 <c:if test="${chk == 1}">	<!-- chk라는 변수가 -->
      	<div id="msg" style="color:red"> 기재하신 정보로 확인되는 아이디가 없습니다. </div>
     </c:if>
      
     <c:if test="${chk == 0}">	<!-- chk라는 변수가 -->
      	<div id="msg" style="font-size:15px;"> <span style="color:#F7819F; font-size:18px;">${name}</span>님의 아이디는 <span style="color:#F7819F; font-size:24px;">${userid}</span>입니다. </div> <br><p>
      	<div id="msg" style="color:black"> <a href="pwd_search" id="pwdsear_btn"> 비밀번호 찾기</a></div> <br>
      	<div id="msg" style="color:black"> <a href="login" id="idsear_btn"> 로그인하러 가기</a></div>
      	
     </c:if>  
  </div>	
</body>
</html>