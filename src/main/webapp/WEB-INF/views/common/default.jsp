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
	
	body {  /* 5층 고객센터 , 매장안내 , 캠핑 tip 때문에 pading-top 전체넣어야함 . 레이어가 밀림 원본페이지 레이어 띄어져있음....  */
		margin:0px;
	}	  
	  
	#first { /*  장바구니, 주문배송, 마이페이지, 회원가입, 로그인  */
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
		background:#1E0300;
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
		border:1px solid #1E0300;
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
		margin-top:10px;
		width:1280px;
		height:270px;
		border-top:3px solid orange;
	}
	
	#obj	{
		display:inline-block;
		width:400px;
		height:270px;
		padding-top:10px;
		padding-left:50px;
		padding-right:20px;
   		font-size:17px;
   		border-right:1px solid lightgray;
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
		background:#1E0300; 
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
		background:#DC890C;
		font-size:30px;
		cursor:pointer;
	}
	
	#obj {
		display:inline-block;
		width:400px;
		height:270px;
		padding-top:10px;
		padding-left:50px;
		padding-right:20px;
   		font-size:17px;
   		border-right:1px solid lightgray;
	}
	
	.def_btn {
		display:block;
		width:120px;
		height:25px;
		padding-top:5px;
		border:3px solid gray;
		border-radius:5px;
		color:gray;
		font-size:15px;
		font-weight:bold;
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
		document.getElementsByClassName("main_li")[n].style.background="#DC890C";
	}
	
	function hide(n)
	{
		document.getElementsByClassName("sub")[n].style.display="none";
		document.getElementsByClassName("main_li")[n].style.background="#1E0300";
	}	
	
	function reser(userid)
	{
		if(userid=="")
		{
			if(confirm("캠핑장 예약을 위해서는 로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?"))
				location="../login/login";			
		}
		else
			location="../reserve/reserve_first";
		
	}
	
	function reser_chk(userid)
	{
		if(userid=="")
		{
			if(confirm("캠핑장 예약 확인을 위해 로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?"))
				location="../login/login";
		}
		else
			location="../member/my_reserve";
	}
</script>

	<decorator:head/>
</head>
<body>

	<div id="first">
	  <div id="right">
	    <ul>
		  
		    <c:if test="${userid eq null}">
		  	  <li style="width:90px;"><a href="../login/mem_first"><span class="material-icons">person회원가입</span></a></li>
		      <li style="width:80px;"><a href="../login/login"><span class="material-icons">vpn_key로그인</span></a></li>
		      <!-- <li style="width:140px;"><a href="../cart/cart_c_list"><span class="material-icons">local_grocery_store 비회원장바구니</span></a></li> -->
		    </c:if>
		    <c:if test="${userid ne null}">		    
		      <li style="width:90px;"><a href="../login/logout"><span class="material-icons">sensor_door로그아웃</span></a></li>
		      <li style="width:100px;"><a href="../member/mypage"><span class="material-icons">favorite_border마이페이지</span></a></li>
			  <li style="width:90px;"><a href="../member/my_reserve"><span class="material-icons">date_range예약내역</span></a></li>
			  <li style="width:90px;"><a href="../member/order_list"><span class="material-icons">local_shipping주문내역</span></a></li>
		      <li style="width:90px;"><a href="../cart/cart_list"><span class="material-icons">local_grocery_store 장바구니</span></a></li>		      
		    </c:if>
		    <c:if test="${userid eq 'admin'}">
		      <li><div class="material-icons" style="margin-left:-700px"><a href="../admin/admin_list">assignment_ind관리자페이지</a></div></li>
		    </c:if>
	    </ul>
	  </div>
	</div>
	
	<div id="second">
	  <div id="logo">
	     <center><a href="../main/index"><img src="../notice/img/logo11.jpg" width="170" height="80"></a></center> <!-- 로고 -->	    
	  </div>
	  
	  <div id="search">	    
	    <form method="post" action="default" name="jjj">
	    <span id="inner">
	      <input type="text" name="search" value="${search}" size="27" height="50" placeholder="상품 검색">
	      <span class="material-icons">search</span>
	    </span>  
	    </form>  	      	    
	  </div>
	  
	</div>
	
	<div id="third">
	  <ul id="main" style="margin-top:30px;margin-left:-40px;text-align:center;">
	    <li onmouseover="view(0,50)" onmouseout="hide(0)" class="main_li">
		  <span class="textbox">텐트/타프</span>
	        <ul class="sub">
	         	<li class="sub_li"><a href="../product/pro_list">텐트</a></li>
	          	<li class="sub_li"><a href="../product/pro_list?code=p0102">타프</a></li>
        	</ul>
   		</li>
   		<li onmouseover="view(1,50)" onmouseout="hide(1)" class="main_li">
		<span class="textbox">침낭/매트</span>
	        <ul class="sub">
	         	<li class="sub_li"><a href="../product/pro_list?code=p0201">침낭</a></li>
	          	<li class="sub_li"><a href="../product/pro_list?code=p0202">매트</a></li>
        	</ul>
   		</li>   		
   		<li onmouseover="view(2,75)" onmouseout="hide(2)" class="main_li">
		  <span class="textbox">가스장비</span>
	        <ul class="sub">
	         	<li class="sub_li"><a href="../product/pro_list?code=p0301">스토브</a></li>
	          	<li class="sub_li"><a href="../product/pro_list?code=p0302">바베큐</a></li>
	          	<li class="sub_li"><a href="../product/pro_list?code=p0303">히터</a></li>
        	</ul>
   		</li>
   		<li onmouseover="view(3,75)" onmouseout="hide(3)" class="main_li">
		  <span class="textbox">액세서리</span>
	        <ul class="sub">
	         	<li class="sub_li"><a href="../product/pro_list?code=p0401">캐리백</a></li>
	          	<li class="sub_li"><a href="../product/pro_list?code=p0402">팩/폴/슬링</a></li>
	          	<li class="sub_li"><a href="../product/pro_list?code=p0403">해먹</a></li>
        	</ul>
   		</li>
   		<li onmouseover="view(4,100)" onmouseout="hide(4)" class="main_li">
    	  <span class="textbox" style="color:white;">공지사항</span>
	        <ul class="sub">
	         	<li class="sub_li"><a href="../notice/notice_list">공지사항</a></li>
	          	<li class="sub_li"><a href="../cs/cs_list">고객센터</a></li>
	          	<li class="sub_li"><a href="../store/store_list">매장안내</a></li>
	          	<li class="sub_li"><a href="../tip/tip_list">캠핑꿀팁</a></li>
        	</ul>
        </li>
   		<li onmouseover="view(5,75)" onmouseout="hide(5)" class="main_li">
		  <span class="textbox">제휴캠핑장</span>
	        <ul class="sub">
	         	<li class="sub_li"><a href="../reserve/camp_list">캠핑장소개</a></li>
	          	<li class="sub_li" onclick="reser('${userid}')" style="cursor:pointer">예약하기</li>
	          	<li class="sub_li" onclick="reser_chk('${userid}')" style="cursor:pointer">예약확인</li>
        	</ul>
   		</li>
	  </ul>
	</div>	
	
	<decorator:body/> 
 
	<div id="footer1" valign="center">
		<table id="obj">
		  <tr height="60">
		    <td style="font-size:20px;color:gray;font-weight:bold;"> 고객센터 </td>
		  </tr>
		  <tr>
		    <td style="font-size:40px;color:orange;font-weight:bold;"> 1111-2222 </td>
		  </tr>
		  <tr>
		    <td> 상담시간 AM 09:00 ~ PM 06:00 <br>점심시간 AM 12:00 ~ PM 01:00 <br> 토요일, 일요일, 공휴일 휴무 <p/></td>
		  </tr>
		  
		  <c:if test="${userid != null}">
		  <tr>
		    <td align="center"> <span><a href="../cs/cs_write" class="def_btn"> 1:1 문의하기 </a></span>  </td>
		  </tr>
		  </c:if>
		  <c:if test="${userid == null}">
		  <tr>
		    <td align="center"> <span><a href="../login/login" class="def_btn"> 1:1 문의하기 </a></span>  </td>
		  </tr>
		  </c:if>
		  
		</table>
		
		<table id="obj">
		  <tr height="55"> 
		    <td> <a href="../store/store_list" class="def_btn" align="center">매장 안내  </a> </td>
		  </tr>
		  <tr>
		    <td><a href="../store/store_list"> <img src="../notice/img/11.jpg" width="300"> </a></td>
		  </tr>
		</table>
		<table id="obj" style="border:none;">
		  <tr height="55"> 
		    <td> <a href="../tip/tip_list" class="def_btn" align="center">캠핑 꿀팁</a></td>
		  </tr>
		  <tr>
		    <td><a href="../tip/tip_list"><img src="../notice/img/22.jpg" width="300"></a></td>
		  </tr>

		</table>
	</div>

	<hr id="hr_2">
	
	<div id="footer2">
	  <div id="left"> 회사소개 | 이용약관 | 개인정보 처리방침 | 이용안내  </div>
	  <span id="top"> ↑Top </span>	
	</div>
	
</body>
</html>