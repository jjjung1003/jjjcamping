<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#cs_first {
		margin-top:100px;
	}
	
	#cs_second {
		margin-bottom:150px;
	}
	
	#hr_1 {
		border:1px solid #B40404;
		width:800px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	#cscontent_btn {
		display:inline-block;
		border:3px solid #FAAC58;
		padding-top:3px;
		width: 90px;
		height:25px;
		margin-top:40px;
		border-radius:5px;
		margin-bottom:50px;
	}
</style>
</head>
<body>
	
	
<div align="center" id="cs_first"> <h2> 고객센터 1:1 문의</h2> </div>
	<hr id="hr_1">
	
	<div align="center" id="cs_second">
	<c:if test="${!(userid eq cdto.userid || userid eq 'admin')}">
		<div align="center">
	      <div> 문의글은 작성자와 관리자만 확인할 수 있습니다.</div> <p>	  	  
	  		<a href="list?page=${page}" id="cscontent_btn"> 뒤로가기 </a>	  
		</div>
	</c:if>

	<c:if test="${userid eq cdto.userid || userid eq 'admin'}">	<!-- 작성자 본인 가능 -->

	<div align="center">
	    <table align="center" width="500">
	    <input type="hidden" name="id" value="${cdto.id}">
	    <tr>
		      <td width="100" height="40"> 작성일 </td> 
		      <td> ${cdto.writeday} </td> 
		    </tr> 
		    <tr>
		      <td width="100" height="40"> 이름 </td> 
		      <td> ${cdto.name} </td> 
		    </tr>     
		    <tr>
		      <td width="100" height="40"> 제목 </td> 
		      <td> ${cdto.title} </td> 
		    </tr> 
		    <tr>
		      <td width="100" height="40"> 내용 </td> 
		      <td> ${cdto.content} </td> 
		    </tr> 
	  </table>
	  	  
	  <a href="cs_list?page=${page}" id="cscontent_btn"> 목록 </a>
	  <a href="cs_delete?id=${cdto.id}" id="cscontent_btn"> 삭제 </a> <p>
	  
	  <!-- 댓글 시작 -->
	<table width="700">  
      <form method="post" name="csdat" action="csdat_ok">      
      <input type="hidden" name="csid" value="${cdto.id}">
      <input type="hidden" name="name" value="${name}">
      <input type="hidden" name="page" value="${page}">
      <input type="hidden" name="userid" value="${userid}">
      <input type="hidden" name="id" value="0">
        <tr> 
          <td height="40"> 댓글 </td>
          <td colspan="2"> <input type="text" name="content" placeholder="내용"  size="70"> </td>
          <td> <input type="submit" value="저장"> </td>
        </tr>         
      </form>
      
      <c:forEach var="cddto" items="${list}">
    <tr>
      <td> ${cddto.writeday}</td>
      <td> ${cddto.name} </td>
      <td> ${cddto.content}</td>    
      <td> <a href="../cs/csdat_del?id=${cddto.id}&csid=${cdto.id}&page=${page}"> 삭제 </a></td>  
    </tr>
   </c:forEach>  		
	</table>  
	 <!-- 댓글 끝 -->
	  
	</div>
	</c:if>
	</div>
</body>
</html>