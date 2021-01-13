<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	
	#second #right {
		float:right;
	}
	
	#second #search #inner { /* 검색내용입력 칸 조정  */
		display:inline-block;
		background:#dddddd;
		width:250px;
		height:20px;
		padding-top:3px;
		padding-left:5px;
		border-radius:10px;
		float:right;
	}
	
	#second #search #inner input {
		border:none;
		background:#dddddd;
	}
	  
	#second .material-icons { 	/*돋보기 크기조정 */
		font-size:22px;
		float:right;  
	}	
</style>
</head>
<body>
	<div id="first">
	  <div id="right">
	    <ul>
		  <li><a href=""><span class="material-icons">local_grocery_store장바구니</span></a></li>
		  <li><span class="material-icons">local_shipping주문배송</span></li>
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
	     <center><a href="../main/index"><img src="../notice/img/logo.jpg" width="100" height="60"></a></center> <!-- 로고 -->	    
	  </div>
	  <div id="search">
	      <span id="inner">
	        <input type="text" name="sear" size="27" height="50" placeholder="검색 내용 입력">
	        <span class="material-icons">search</span>
	      </span>
	  </div>
	</div>
</body>
</html>