<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#footer1 {
	margin:auto;
	width:1280px;
}
	#hr_2 {
		width:1280px;
		height:3px;
		align:center;
		background:orange;
		margin-top:30px;
		border:none;
	}
	#list_table {
		width:810px;
		height:300px;
		text-align:center;
		margin-left:auto;
		margin-right:auto;
		
	}
	
	#list_table table {
		/* border-top: 2px solid #444444;
		border-bottom: 2px solid #444444;
   		order-collapse: collapse; */
   		font-size:17px;
	}
	
	#list_table #aa {
		float:left;
	}
	
	#list_table #bb {
		float:right;
	}
	
	#footer2  /* 12층 회사소개 ㅣ이용약관 ㅣ 개인정보처리방침 ㅣ 이용안내 및 top 클릭시 맨위로...   */
	{
		width:1280px;
		height:50px;
		margin:auto;
		background:black; 
	}
	
	#footer2 #left /* 회사소개 ㅣ 이용약관 ㅣ 개인정보 처리방침 ㅣ  이용안내 */
	{
		float:left;
		color:#b4b4b4;
		text-align:center;
		position:absolute;
		padding-top:15px;
		padding-left:20px;
	}
	
	#footer2 #left #jungbo
	{
		color:orange;
	}
	
	#footer2 #top /* Top 버튼누르면 페이지 맨위로... */
	{
		width:100px;
		height:50px;
		float:right;
		color:white;
		background:orange;
		font-size:30px;
		cursor:pointer;
	}
</style>
</head>
<body>

	<decorator:body/>
 
	<div id="footer1">
	<hr id="hr_2">
	  <div id="list_table" align="center">
		<table id="aa" align="center" width="400" height="300">
		  <tr>
		    <td style="font-size:17px;color:gray"> 고객센터 </td>
		  </tr>
		  <tr>
		    <td style="font-size:30px;color:red"> 1588-5515 </td>
		  </tr>
		  <tr>
		    <td> 상담시간 AM 09:00 ~ PM 06:00 <br>점심시간 AM 12:00 ~ PM 01:00 <br> 토요일, 일요일, 공휴일 휴무 </td>
		  </tr>
		  <tr>
		    <td align="center"> <span style="background:#BDBDBD"><a href="../tip/gogaek" style="color:white"> 1:1 문의하기 </a></span>  </td>
		  </tr>
		</table>
		
		<table id="bb" align="center" width="400" height="300">
		  <tr height="55"> 
		    <td style="font-size:17px;color:gray"> 캠핑몰 매장 안내  <a href="../tip/aanae"><span style="margin-left:150px"> ▷ </span> </a> </td>
		  </tr>
		  <tr>
		    <td rowspan="4"><a href="../tip/aanae"> <img src="../notice/img/flower.jpg" width="300"> </a></td>
		  </tr>
		</table>
	  </div>
	</div>
	<div id="footer2">
	  <div id="left"> 회사소개  ㅣ 이용약관 ㅣ<b id="jungbo">개인정보 처리방침</b> ㅣ 이용안내  </div>
	  <span id="top"> ↑Top </span>	
	</div>
</body>
</html>