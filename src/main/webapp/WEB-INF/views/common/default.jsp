<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
	a {  /* a태그 검정색 및 none없애기 */
		text-decoration:none;
		color:black;
	}	
	
	body {  /* 5층 고객센터 , 매장안내 , 캠핑 tip 때문에 paading-top 전체넣어야함 . 레이어가 밀림 원본페이지 레이어 띄어져있음....  */
		margin:0px;
	}	  
	  
	#first { /*  장바구니, 주문배송, 마이페이지, 회원가입, 로그인 ,즐겨찾기 */
		width:1280px;
		height:45px;
		margin:auto;
		color:white;
		font-size:11px;	    
	}
	
	#first #right li {
		float:right;
		width:100px;
		height:30px;
		list-style-type:none;
		font-size:12px;
		padding-top:10px;
	}
	
	#first #right .material-icons {
		font-size:14px;
		color:black;	
	}
	
	#second { /* 검색내용입력 , 돋보기 , 로고 이미지 */
		 width:1280px;
		 height:72px;
		 margin:auto;		 
	}
	
	#second #search #inner { /* 검색내용입력 칸 조정  */
		display:inline-block;
		background:#dddddd;
		width:280px;
		height:25px;
		padding-top:10px;
		padding-left:5px;
		border-radius:10px;
		margin-top:28px;
		margin-right:15px;
		float:right;
	}
	
	#second #search #inner input {
		width:230px;
		height:20px;
		margin-top:-3px;
		margin-left:10px;
		border:none;
		background:#dddddd;
	}
	
	#second .material-icons {/*돋보기 크기조정 */
		margin-top:-3px;
		margin-right:5px;
		font-size:25px;
		float:right;  
	}
	
	#third {  /* 메뉴 / 하위메뉴   1280 x 50 */ 
		width:1280px;
		height:50px;
		margin:auto;
	}
	
	#third .textbox {
		color:white;
	}
	
	.main_li {
		background:#1C1C1C;
	}
	
	#third #main > li { 
		float:left;
		width:160px;
		height:35px;
		list-style-type:none;
		position:relative;
		margin:auto;
		padding-top:15px;
		font-size:15px;
		font-weight:bold;
		z-index:10;  		
	}
	
	#third .sub {  /*3층에  하위메뉴 ul태그 */
		width:118px;
		height:80px;
		border:1px solid #F7890C;
		position:absolute;
		margin-top:40px;
		background:white;
		display:none;
	}
	
	#third .sub li {
		list-style-type:none;
		width:120px;
		height:20px;
		font-size:12px;
		font-weight:bold;
		margin-left:-20px;
		margin-top:3px;
	}
	
	#third .sub a {
		display:inline-block;
		width:120px;
		height:20px;
	}

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
   		font-size:17px;
	}
	
	#list_table #aa {
		float:left;
	}
	
	#list_table #bb {
		float:right;
	}
	
	#footer2 {  /* 12층 회사소개 ㅣ이용약관 ㅣ 개인정보처리방침 ㅣ 이용안내 및 top 클릭시 맨위로...   */
		width:1280px;
		height:50px;
		margin:auto;
		background:black; 
	}
	
	#footer2 #left {/* 회사소개 ㅣ 이용약관 ㅣ 개인정보 처리방침 ㅣ  이용안내 */
		float:left;
		color:#b4b4b4;
		text-align:center;
		position:absolute;
		padding-top:15px;
		padding-left:20px;
	}
	
	#footer2 #left #jungbo {
		color:orange;
	}
	
	#footer2 #top { /* Top 버튼누르면 페이지 맨위로... */
		width:100px;
		height:50px;
		float:right;
		color:white;
		background:orange;
		font-size:30px;
		cursor:pointer;
	}
</style>
<script>
	$(function(){	//top클릭시 맨 위로 이동
		$("#top").click(function(){
			$(window).scrollTop(0);
		});
	});
	
	function view(n,h)
	{
		document.getElementsByClassName("sub")[n].style.display="block";
		document.getElementsByClassName("sub")[n].style.height=h+"px";
		document.getElementsByClassName("sub")[n].style.top="10px";
		document.getElementsByClassName("main_li")[n].style.background="#F7890C";
	}
	
	function hide(n)
	{
		document.getElementsByClassName("sub")[n].style.display="none";
		document.getElementsByClassName("main_li")[n].style.background="#1C1C1C";
	}	
</script>

	<decorator:head/>
</head>
<body>

	<div id="first">
	  <div id="right">
	    <ul>
		  <li><a href=""><span class="material-icons">local_grocery_store장바구니</span></a></li>
		  <li><a href=""><span class="material-icons">local_shipping주문배송</span></a></li>
		    <c:if test="${userid eq null }">
		  	  <li><a href="../member/mem_first"><span class="material-icons">person회원가입</span></a></li>
		      <li><a href="../login/login"><span class="material-icons">vpn_key로그인</span></a></li>
		    </c:if>
		    <c:if test="${userid ne null }">
		      <li><a href="../login/mypage"><span class="material-icons">favorite_border마이페이지</span></a></li>
		      <li><a href="../login/logout"><span class="material-icons">sensor_door로그아웃</span></a></li>
		    </c:if>
		    <c:if test="${userid eq 'admin' }">
		      <li><span class="material-icons"><a href="">assignment_ind관리자페이지</a></span></li>
		    </c:if>
	    </ul>
	  </div>
	</div>
	
	<div id="second">
	  <div id="logo">
	     <center><a href="../main/index"><img src="../notice/img/logo.jpg" width="150" height="80"></a></center> <!-- 로고 -->	    
	  </div>
	  
	  <div id="search">
	    <span id="inner">
	      <input type="text" name="sear" size="27" height="50" placeholder="상품 검색">
	      <span class="material-icons">search</span>
	    </span>
	  </div>
	</div>
	
	<div id="third">
	  <ul id="main" style="margin-top:30px;margin-left:-40px;text-align:center;">
	    <li onmouseover="view(0,50)" onmouseout="hide(0)" class="main_li">
		  <a href=""><span class="textbox">텐트/타프</span></a>
	        <ul class="sub">
	         	<li class="sub_li"><a href="">텐트</a></li>
	          	<li class="sub_li"><a href="">타프</a></li>
        	</ul>
   		</li>
   		<li onmouseover="view(1,100)" onmouseout="hide(1)" class="main_li">
		  <a href=""><span class="textbox">가스장비</span></a>
	        <ul class="sub">
	         	<li class="sub_li"><a href="">스토브</a></li>
	          	<li class="sub_li"><a href="">랜턴</a></li>
	          	<li class="sub_li"><a href="">히터</a></li>
	          	<li class="sub_li"><a href="">토치</a></li>
        	</ul>
   		</li>
   		<li onmouseover="view(2,50)" onmouseout="hide(2)" class="main_li">
		<a href=""><span class="textbox">침낭/매트</span></a>
	        <ul class="sub">
	         	<li class="sub_li"><a href="">침낭</a></li>
	          	<li class="sub_li"><a href="">매트</a></li>
        	</ul>
   		</li>
   		<li onmouseover="view(3,75)" onmouseout="hide(3)" class="main_li">
		  <a href=""><span class="textbox">캠핑장비</span></a>
	        <ul class="sub">
	         	<li class="sub_li"><a href="">캐리백</a></li>
	          	<li class="sub_li"><a href="">팩/폴/슬링</a></li>
	          	<li class="sub_li"><a href="">해먹</a></li>
        	</ul>
   		</li>
   		<li onmouseover="view(4,50)" onmouseout="hide(4)" class="main_li">
		  <a href=""><span class="textbox">바베큐</span></a>
	        <ul class="sub">
	         	<li class="sub_li"><a href="">파이어캠프</a></li>
	          	<li class="sub_li"><a href="">액세서리</a></li>
        	</ul>
   		</li>
   		<li style="background:#F7890C">
    	  <span class="textbox" style="color:white;"><a href="../notice/list">공지사항</a></span>
        </li>
	  </ul>
	</div>	
	
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
		    <td rowspan="4"><a href="../tip/aanae"> <img src="../notice/img/11.jpg" width="300"> </a></td>
		  </tr>
		</table>
		
	  </div>
	</div>
	<hr id="hr_2">
	
	<div id="footer2">
	  <div id="left"> 회사소개  ㅣ 이용약관 ㅣ<b id="jungbo">개인정보 처리방침</b> ㅣ 이용안내  </div>
	  <span id="top"> ↑Top </span>	
	</div>
	
</body>
</html>