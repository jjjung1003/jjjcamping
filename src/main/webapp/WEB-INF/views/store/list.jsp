<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#hr_1 {
		border:1px solid #B40404;
		width:800px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	#store_first {
		margin-top:100px;
	}
	
	#store_second {
		margin-top:20px;
		margin-bottom:50px;
	}
	
	#store_third {
		margin-bottom:150px;
	}
	
		select {
		margin-top:5px;
		width: 70px;
		height:30px;
		border: 2px solid #999;
	}
	
	input[type="text"] {
		width: 190px;
		height:25px;
	}
	
	input[type="submit"] {
		margin-top:5px;
		width: 70px;
		height:30px;
	}
</style>
<script>
	function all()
	{
		location="list";
	}
	
	function region(n)
	{
		location="list?region="+n;
	}
</script>
</head>
<body>
  <div id="store_first" align="center">
    <h2> 매장안내 </h2>
	<hr id="hr_1">
	
	<!-- <a href="javascript:all()">전체</a>
	<a href="javascript:region('서울')">서울</a>
	<a href="javascript:region('인천')">인천</a>
	<a href="javascript:region('대전')">대전</a>
	<a href="javascript:region('대구')">대구</a>
	<a href="javascript:region('광주')">광주</a>
	<a href="javascript:region('울산')">울산</a>
	<a href="javascript:region('부산')">부산</a>
	<a href="javascript:region('경기')">경기</a>
	<a href="javascript:region('강원')">강원</a>
	<a href="javascript:region('충북')">충북</a>
	<a href="javascript:region('충남')">충남</a>
	<a href="javascript:region('전북')">전북</a>
	<a href="javascript:region('전남')">전남</a>
	<a href="javascript:region('경북')">경북</a>
	<a href="javascript:region('경남')">경남</a>
	<a href="javascript:region('제주')">제주</a> -->
  </div>
	
  <div id="store_second" align="center">
	<form method="post" action="list" name="jjj">
	  <select name="cla">
	    <option value="title"> 매장명 </option>
	    <option value="region"> 지역명 </option>
	    <option value="address"> 매장주소 </option>
	  </select>
	  <input type="text" name="search" value="${search}" placeholder="검색내용 입력" size="30">
      <input type="submit" value="검색하기">	  
	</form>
  </div>
  
  <div id="store_third" align="center">
    <table width="950" align="center">
      <tr>
      <c:set var="num" value="1"/>
      <c:forEach items="${slist}" var="sdto">
        <td width="330" height="400" align="center">
          <a href="content?id=${sdto.id}"> <img src="../store/img/${sdto.m_img}" width="270" height="250" style="border:3px solid orange; background:orange;"></a> <br>
          [${sdto.region} ${sdto.title}]<br> ${sdto.address}<br> ${sdto.phone}  
        </td>
        
        <c:if test="${num%3 == 0 && num != 30}">
	      </tr>
	      <tr>  
	    </c:if>  
	  <c:set var="num" value="${num+1}"/>
      </c:forEach>  
      </tr>  
    </table>
    
    <div align="center">
	  <c:if test="${pstart != 1}"> <!-- 1, 11, 21, 31.... -->
	  	<a href="list?page=${pstart-1}">◁◁ </a>
	  </c:if>
	  <c:if test="${pstart == 1}"> 
	  	◁◁
	  </c:if>
	  
	  <c:if test="${page != 1}"> <!-- 1, 2, 3, 4.... -->
	  	<a href="list?page=${page-1}">◁ </a>
	  </c:if>
	  <c:if test="${page == 1}"> 
	  	◁
	  </c:if>
	  
	  <c:forEach var="i" begin="${pstart}" end="${pend}">	
	  	<c:if test="${page != i}">
	  		<a href="list?page=${i}"> ${i}</a>
	  	</c:if>
	  	<c:if test="${page == i}">
	  		<a href="list?page=${i}" style="color:red"> ${i}</a>
	  	</c:if>
	  </c:forEach>  
	  
	  <c:if test="${page != page_cnt}"> <!-- 1, 2, 3, 4.... -->
	  	<a href="list?page=${page+1}">▷ </a>
	  </c:if>
	  <c:if test="${page == page_cnt}"> 
	  	▷
	  </c:if>
	  
	  <c:if test="${pend != page_cnt}"> <!-- 1, 11, 21, 31.... -->
	  	<a href="list?page=${pend+1}">▷▷ </a>
	  </c:if>
	  <c:if test="${pend == page_cnt}"> 
	  	▷▷ 
	  </c:if>	  
	</div> <br><p>
  </div>
  
</body>
</html>













