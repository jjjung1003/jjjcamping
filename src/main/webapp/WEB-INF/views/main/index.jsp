<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/55812331f3.js" crossorigin="anonymous"></script>
<style>	
	#fourth /*메인이미지와 숫자 클릭시 숫자에 맞는 이미지 보이기  */
	{
		 width:1280px;
		 height:500px;
		 margin:auto;
		 background:lightblue;
	}
	
	#fourth #inner  {   /* 메인이미지 보이기 */
		position:relative;
		width:1280px;
		height:500px;
		overflow:hidden; 
		margin:auto;
	}
	
	#fourth .main
	{
		position:absolute;
		left:0px;
		top:0px;	
	}
	
	#fourth #number
	{
		text-align:center;
		padding-top:450px;
		position:absolute;
		padding-left:600px;
		z-index:5;
		word-spacing:5px;
	}
		
	#fourth #number .num /* 숫자 스타일 변경 숫자만... */
	{
		width:100px;
		height:50px;
		color:white;
		background:#918d8a;
		border:5px solid #918d8a;
		opacity:0.6;
		border-radius:5px;
	}
	
	#fifth 
	{
		width:1280px;
		height:700px;
		margin:auto;
		margin-bottom:150px;
	}

	#fifth #list {
		width:1280;
		height:130px;
	}
	
	#fifth ul {
		width:1280px;
		height:120px;
		margin:0px;
		margin-left:-40px;
		font-size:0px;
	}
	
	#fifth #list .title {
		margin:0px;
		text-align:center;
		cursor:pointer;
		background:#FBFBFB;
		font-size:14px;
		color:#9E9E9E;
		padding-top:17px;
		display:inline-block;
		width:213px;
		height:90px;
	}
	
	.li_style {
		margin:0px;
		text-align:center;
		cursor:pointer;
		background:none;
		font-size:14px;
		color:orange;
		border-top:3px solid orange;
		padding-top:0px;
		display:inline-block;
		width:213px;
		height:90px;
	}
	.pop_1 {
		position: fixed;
		padding: 20px;
		width: 150px;
		height: 150px;
		border: 1px solid #ccc;
		top:50px;
		left: 200px;
		z-index:10;
	}
	.pop_2 {
		position: fixed;
		border: 1px solid #ccc;
		top:100px;
		left: 520px;
		z-index:10;
	}
</style>
</head>
<body>	
<script>
	function img_chg(n)
	{
		var main=document.getElementsByClassName("main");
		for(i=0; i<main.length; i++)
		{
			main[i].style.zIndex="1";
		}	
		main[n].style.zIndex="2";
	}
</script>
	<div class="pop_1"> Notice <br><br>
		이 팝업은 방문기록이 없을 경우 확인 가능합니다.		
	</div>
	<button class="pop_2" onclick="Cookie_del()"> 방문기록삭제 </button>
	<script>
		console.log(document.cookie);
		var currentCookie = document.cookie;
		var cookieCheck = document.cookie.indexOf('ABC');	//없다면 -1
		
		console.log(cookieCheck);
		if(cookieCheck > -1) {
			document.querySelector('.pop_1').style.display = 'none';
		}
		else {
			document.querySelector('.pop_1').style.display = 'block';
		}
		
		//쿠키 생성
		var date = new Date();
		//date.getDate()+7	//변수에 날짜 지정 	변수.setDate(새로운 날짜)
		date.setDate(date.getDate() + 7);
		
		var setCookie = '';
		setCookie += 'CookieName = ABC;';
		setCookie += 'expires =' + date.toUTCString();
		
		document.cookie = setCookie;
		
		//쿠키 삭제
		document.cookie = setCookie;
		
		function Cookie_del(){
			var date = new Date();
			date.setDate(date.getDate() - 1);
			
			var setCookie = '';
			setCookie += 'CookieName = ABC;';
			setCookie += 'expires =' + date.toUTCString();
			
			document.cookie = setCookie;
		}		
	</script>
	
	<div id="fourth">
  	  <div id="view">
        <div id="inner">
      	  <img class="main" src="../notice/img/11.jpg" width="1280" height="500"> <img class="main" src="../notice/img/22.jpg" width="1280" height="500">  <img class="main" src="../notice/img/33.jpg" width="1280" height="500"><img class="main" src="../notice/img/44.jpg" width="1280" height="500"><img class="main" src="../notice/img/55.jpg" width="1280" height="500">
	     	<div id="number">
		      <a href="javascript:img_chg(0)" class="num">1</a> 
		      <a href="javascript:img_chg(1)" class="num">2</a> 
		      <a href="javascript:img_chg(2)" class="num">3</a> 
		      <a href="javascript:img_chg(3)" class="num">4</a> 
		      <a href="javascript:img_chg(4)" class="num">5</a> 
	      	</div>     
        </div>
      </div>
	</div>
	
	<!-- <div id="fifth">
	  <div id="list" style="margin-top:50px;">
		<ul style="height:200px;margin-top:0px;">
			<li class="title" style="color:orange;font-size:15px;padding-top:0px;padding-bottom:0px;"><br/><a style="font-size:35px;font-weight:bold;padding:0px;color:orange">NEW</a><br/>신상품<br/>&nbsp;<br/></li>
		</ul>
		<table width="1280" height="300" align="center" style="border:1px solid; margin-top:-70px;">
		  <tr>
		    <td>1</td>
		    <td>2 </td>
		    <td>3 </td>
		    <td>4 </td>
		    <td>5 </td>
		  </tr> 
		</table>
		<ul style="height:200px;margin-top:0px;">
			<li class="title" style="color:orange;font-size:15px;padding-top:0px;padding-bottom:0px;"><br/><a style="font-size:35px;font-weight:bold;padding:0px;color:orange">BEST</a><br/>판매량<br/>&nbsp;<br/></li>
		</ul>
		<table width="1280" height="300" align="center" style="border:1px solid; margin-top:-70px;">
		  <tr>
		    <td>1 </td>
		    <td>2 </td>
		    <td>3 </td>
		    <td>4 </td>
		    <td>5 </td>
		  </tr> 
		</table>
	  </div>

	  </div>  -->
	  
</body>
</html>








