<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#admin_first {
		margin-top:100px;
	}
	
	#admin_second {
		margin-top:50px;
		margin-bottom:150px;
	}
	
	#hr_1 {
		border:1px solid #B40404;
		width:400px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	.admin_btn {
		display:block;
		width:120px;
		height:25px;
		border:3px solid orange;
		border-radius:10px;
		color:gray;
		padding-top:5px;
		font-size:15px;
	}
	
</style>	
</head>
<body>
	<div align="center" id="admin_first"> <h2> 관리자페이지 </h2> </div>
	<hr id="hr_1">
	
	<div align="center" id="admin_second">
	  <table width="300" height="200">
	    <tr align="center">
	      <td><a href="member_list" class="admin_btn">회원목록</a></td>
		</tr>
		<tr align="center">  
		  <td><a href="product_write" class="admin_btn">상품등록</a></td>
		  <td><a href="product_all_list" class="admin_btn">전체상품</a></td>
		</tr>
		<tr align="center">
		  <td><a href="store_write" class="admin_btn">매장등록</a></td>
		  <td><a href="camp_write" class="admin_btn">캠핑장등록</a></td>
		</tr>
		<tr align="center">   
		  <td><a href="reserve_check" class="admin_btn">예약확인</a></td>
		</tr> 
	  </table>	 
	</div>
</body>
</html>