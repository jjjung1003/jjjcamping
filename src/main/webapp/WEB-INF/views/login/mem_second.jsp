<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#btn {
		margin-top:50px;
		margin-bottom:150px;
	}
	
	hr {
		border:1px solid #B40404;
		width:600px;
		align:center;
		background-color:#B40404;
	}
	
	#sec_first {
		margin-top:100px;
	}
	
</style>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>

	function chk_userid(tt)
	{
		var chkuserid=document.getElementById("userid").value;
		document.getElementById("userid").value=chkuserid.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, "");		
	}
	
	
	var cyj=new XMLHttpRequest();
	var id_chk=0;
	var pwd_chk=0;
	
	function idchk() {

		var userid=document.getElementById("userid").value;
		cyj.open("get","userid_check?userid="+userid);
		cyj.send();
	}	
	
	cyj.onreadystatechange=function()
	{
		if(cyj.readyState==4)
		{
			if(cyj.responseText == 1)
			{
				document.getElementById("id_msg").innerHTML="<span style='color:red;'>사용 불가능한 아이디</span>";
				id_chk=0;
			}
			else
			{
				document.getElementById("id_msg").innerHTML="<span style='color:blue;'>사용 가능한 아이디</span>";
				id_chk=1;
			}	
		}	
	}	
	
	function pwdchk(tt) {

		if(!(document.getElementById("pwd").value.length>=4 && document.getElementById("pwd").value.length<=10))
		{
			document.getElementById("pwd_msg").innerHTML="<span style='color:red;'> 4자이상 10자 이하로 가능합니다 </span>";
			pwd_chk=0;
		}	
		else if(document.getElementById("pwd").value != document.getElementById("pwd2").value)
		{
			document.getElementById("pwd_msg").innerHTML="";
			pwd_chk=0;
		}
		else
		{
			document.getElementById("pwd_msg").innerHTML="";
		}
	}
	
	function pwdchk_eq(tt) {
		
		if(!(document.getElementById("pwd2").value.length>=4 && document.getElementById("pwd2").value.length<=10))
		{
			document.getElementById("pwd2_msg").innerHTML="<span style='color:red;'> 4자이상 10자 이하로 가능합니다 </span>";
			pwd_chk=0;
		}
		else if(document.getElementById("pwd2").value != document.getElementById("pwd").value)
		{
			document.getElementById("pwd2_msg").innerHTML="<span style='color:red;'> 기재하신 비밀번호와 다릅니다. </span>"
			pwd_chk=0;
		}
		else
		{
			document.getElementById("pwd2_msg").innerHTML="<span style='color:blue;'> 비밀번호가 일치합니다.</span>"
			pwd_chk=1;
		}
	}
	
	function phone_num(tt)
	{
		var chknum=tt.value;
		tt.value=chknum.replace(/[^0-9]/g, "");
	}
	
	function check(tt) {  // tt=> document.폼
		
		var d = $("#day").val();	//입력값
	    var m = $("#month").val();
	    var y = $("#year").val();
	    var age = 14;	    
	    var birth=y+"-"+m+"-"+d;
	    document.getElementById("birth").value=birth;
	    
	    var date1 = new Date();	//현재 날짜
	    date1.setFullYear(y, m-1, d);
	
	    var date2 = new Date();
	    date2.setFullYear(date2.getFullYear() - age);		
		
		if(!(document.getElementById("age14").checked))
		{
			 alert("만 14세 이상이시면, 체크 후 가입해주세요");
			 document.jjj.age14.focus();
			 return false;
		}
		else if(id_chk==0)
		{	
			alert("아이디를 확인해주세요");
			return false;
		}	
		else if(pwd_chk==0)
		{
			alert("비밀번호를 확인해주세요");
			return false;
		}
		else if(document.getElementById("email").value=="")
		{
			 alert("email 확인해주세요");
			 document.jjj.email.focus();
			 return false;
		}
		else if(document.getElementById("year").selectedIndex==0||document.getElementById("month").selectedIndex==0||document.getElementById("day").selectedIndex==0)
		{
			 alert("birth 확인해주세요");
			 document.jjj.birth.focus();
			 return false;
		} 
        else if(!(tt.gen[0].checked || tt.gen[1].checked))
		{
			 alert("gen 확인해주세요");
			 return false;
		}  
		else if(document.getElementById("phone").value=="")
		{
			 alert("phone 확인해주세요");
			 document.jjj.phone.focus();
			 return false;
		}
		else if((date2 - date1) < 0)
		{
	        alert("죄송합니다. 만 14세 미만은 가입할 수 없습니다.");
	        return false;
		}	
		else
			return true;
	}


	/* //pwd 체크 ---------------------------------- 실패
	function chk_pwd(tt)
	{
		var pwd = $("#pwd").val();
		var num = pwd.search(/[0-9]/g);
		var eng = pwd.search(/[a-z]/ig);
		var spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		if(num < 0 || eng < 0 || spe < 0 )
		{
			  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
			  pwd_chk=0;
		}	
	}*/
</script>	
</head>
<body>

  <div id="sec_first" align="center">
  
  <div align="center"> <h2>회원정보 입력 </h2></div>
<hr>

	<form method="post" name="jjj" action="mem_third" onsubmit="return check(this)">
	<input type="hidden" name="cla1" value="${cla1}">
	<input type="hidden" name="cla2" value="${cla2}">
	<input type="hidden" name="cla3" value="${cla3}">
	<input type="hidden" name="cla4" value="${cla4}">
	  <table width="450" height="480">
	  <div style="color:#B40404;"> <input type="checkbox" name="age14" id="age14" value="1"> (필수)14세 이상만 가입할 수 있습니다.  </div>
	  <div style="font-size:12px;"> * 회원가입에 필요한 최소한의 정보만 입력 받음으로써<br>고객님의 개인정보 수집을 최소화하고 편리한 회원가입을 제공합니다.</div> <p>
	  
	    <tr>
	      <td> <input type="text" name="name" id="name" placeholder="이름" style="width:450px; height:40px;"> </td>
	    </tr>
	    <tr>
	      <td> <input type="text" name="userid" id="userid" placeholder="아이디 (영문만 가능)" onblur="idchk()" onkeyup="chk_userid(this)" style="width:450px; height:40px;">
	      	   <span id="id_msg" style="font-size:12px;"> </span>
	      </td>
	    </tr>
	    <tr>
	      <td> <input type="password" name="pwd" id="pwd" placeholder="비밀번호" onblur="pwdchk(this)" style="width:450px; height:40px;">
	      	   <span id="pwd_msg" style="font-size:12px;"></span>
	      </td>
	    </tr>
	    <tr>
	      <td> <input type="password" name="pwd2" id="pwd2" placeholder="비밀번호 확인" onblur="pwdchk_eq(this)" style="width:450px; height:40px;"> <br>
	      	   <span id="pwd2_msg" style="font-size:12px;"></span>
	      </td>
	    </tr>
	    <tr>
	      <td> <input type="text" name="email" id="email" placeholder="이메일" style="width:450px; height:40px;"> </td>
	    </tr>
	    <tr>
	      <td>	      
	         <select id="year" name="year" style="width:148px; height:40px;">
	           <option> 생년 </option>
		         <c:forEach var="i" begin="0" end="${2020-1900}">
		         	<c:set var="year" value="${2020-i}" />
		         	<option value="${year}"><span id="sel_year">${year}</span></option>
	             </c:forEach>
	         </select>
	         
	         <select id="month" name="month" style="width:148px; height:40px;">
	           <option> 월 </option>
	             <c:forEach var="i" begin="1" end="${12}">
		         	<c:set var="month" value="${13-i}" />
		         	<option value="${month}">${month}</option>
	             </c:forEach>
	         </select>
	         
	         <select id="day" name="day" style="width:148px; height:40px;">
	           <option> 일 </option>
	           	 <c:forEach var="i" begin="1" end="${31}">
		         	<c:set var="day" value="${32-i}" />
		         	<option value="${day}">${day}</option>
	             </c:forEach>
	         </select>
	         
	         <input type="hidden" name="birth" id="birth">
	      </td>
	    </tr>
	    <tr>
	      <td width="450" height="40"> 성별 :
	        <input type="radio" name="gen" id="gen" value="1"> 남성
	        <input type="radio" name="gen" id="gen" value="2"> 여성
	      </td>
	    </tr>
	    <tr>
	      <td> <input type="text" name="phone" id="phone" class="phone_num" placeholder="휴대폰번호 ( - 없이 숫자만 입력하세요)" style="width:450px; height:40px;" maxlength="11" onkeyup="phone_num(this)"></td>
	    </tr> 
	     
	  </table>	
	  	  
	  <div id="btn" align="center">
		<input type="submit" value="회원가입">
	  </div>  	
	</form>
  </div>	
</body>
</html>













