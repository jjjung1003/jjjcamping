<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function view_cookie()
	{
		var userid=session.getAttribute("userid").toString()
		document.cookie=userid;
		document.getElementById("view").innerText=document.cookie;
	}
	function del_cookie()
	{
		var now=new Date();
		now.setDate(now.getDate()-1);
		document.cookie=now.toGMTString();
	}
</script>
</head>
<body>
  <div align="center">
	<input type="button" value="쿠키 보기" onclick="view_cookie()">
	<input type="button" value="쿠키 삭제" onclick="del_cookie()">
	<span id="view"></span>
  </div>	
</body>
</html>