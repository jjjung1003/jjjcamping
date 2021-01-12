<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#pwdsear {
		width:800px;
		text-align:center;
		margin:auto;
		margin-top:100px;
		margin-bottom:150px;
	}
	
	hr {
		border:1px solid #B40404;
		width:400px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	#pwdsear_btn {
		display:block;
		width:100px;
		height:25px;
		border:4px solid orange;
		border-radius:10px;
		color:gray;
		padding-top:5px;
		font-size:15px;
	}
	
	input[type="text"] {
		width: 190px;
		height:25px;
	}
	
	input[type="submit"] {
		margin-top:5px;
		width: 90px;
		height:30px;
	}
</style>
</head>
<body>

  <div id="pwdsear">
  
  <div align="center"> <h2> 패스워드 재설정 </h2> 
	<hr>
	  패스워드 재설정을 위해 메일이 발송됩니다. </div> <br><p>
	  
    <form method="post" action="pwd_search_ok">


        <div id="">
          <input type="text" name="userid" placeholder="아이디"> <p>
		  <input type="text" name="email" placeholder="이메일 주소"> 
		</div> <p>
        <div id="">
          <input type="submit" value="메일 받기">          
        </div> <br>
        
        <c:if test="${chk == 1}">	<!-- chk라는 변수가 -->
      		<div id="msg" style="color:#F7819F; font-size:15px;"> 기재하신 아이디와 이메일로 등록된 정보가 없습니다. </div>
    	</c:if>
    	  
     	<c:if test="${chk == 0}">	<!-- chk라는 변수가 -->
      		<div id="msg" style="color:#F7819F; font-size:15px;"> 발송된 메일을 확인해주세요. </div> <p>
      		<div id="msg" align="center"> <a href="../login/login" id="pwdsear_btn"> 로그인하기</a></div>
    	</c:if> 
    </form>
  </div>	
</body>
</html>