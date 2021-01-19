<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#mem_first {
		margin-top:100px;
		margin-bottom:150px;
	}
	
	#cla1 {
		margin:auto;
		margin-top:50px;
	}
	#cla2 {
		margin:auto;
		margin-top:50px;
	}
	#cla3 {
		margin:auto;
		margin-top:50px;
	}
	#cla4 {
		margin:auto;
		margin-top:50px;
	}	
	#ag_1 {
		margin-top:40px;
	}	
	#ag_2 {
		margin-top:5px;
	}	
	
	hr {
		border:1px solid #B40404;
		width:900px;
		align:center;
		background-color:#B40404;
	}
	
	#sixth {
		margin-top:50px;
		margin-bottom:150px;
	}

	input[type="button"] {
		margin-top:5px;
		width: 100px;
		height:30px;
	}
	
	input[type="submit"] {
		margin-top:5px;
		width: 100px;
		height:30px;
	}
</style>
</head>
<body>
  <div id="mem_first">
 
<div align="center"> <h2> 회원가입 </h2></div>
	<hr>
  <form method="post" name="agree" action="mem_second">
	  <div id="cla1" name="cla" align="center"> 
	    <div style="width:890px;color:#B40404" align="left"> 회원 가입을 하기에 앞서 회원약관을 읽어보시기 바랍니다. </div>
	    <div> <textarea rows="15" cols="120">
	    제1장. 총칙
1.제1조 (목적) 

2.제2조(정의) 

3.제3조(약관등의 명시와 설명 및 개정) 

4.제4조(서비스의 제공 및 변경) 

제2장. 회원가입 계약
1.제6조(회원가입) 

2.제7조(회원 탈퇴 및 자격 상실 등) 

3.제8조(회원에 대한 통지) 

제3장. 구매계약
1.제9조(구매신청) 

2.제10조 (계약의 성립) 

제4장. 대금결제
1.제11조(지급방법) 

2.제12조(수신확인통지·구매신청 변경 및 취소) 

제5장. 배송취소/환불
1.제13조(재화등의 공급) 

2.제14조(환급) 

3.제15조(청약철회 등) 

4.제16조(청약철회 등의 효과) 

제6장. 쇼핑몰과 이용자의 의무사항 
1.제17조(개인정보보호) 

2.제18조("쇼핑몰"의 의무) 

3.제19조(회원의 ID 및 비밀번호에 대한 의무) 

4.제20조(이용자의 의무) 

제7장. 기타 
1.제21조(연결“몰”과 피연결“몰”간의 관계) 

2.제22조(저작권의 귀속 및 이용제한) 

3.제23조(분쟁해결) 

4.제24조(재판권 및 준거법) 

제8장. 특별규정 
1.제25조(특별규정) 

고지의 의무
1.고지의 의무 
현 이용약관은 2021년 11월 27일에 제정되었으며 정부의 정책 또는 보안기술의 변경에 따라 내용의 추가·삭제 및 수정이 있을 시에는 개정 최소 10일 전부터 홈페이지의 '공지'란을 통해 고지할 것입니다. 
시행일자: 2020-11-27
최종변경일자 : 2020-11-27
	    
	    </textarea> </div>
	    <span> <input type="radio" name="cla_fir" value="1" checked> 동의함 </input> </span>
	  </div> 	
	  
	  <div id="cla2" name="cla" align="center"> 
	  <table width="900" height="100" border="1px solid black"> 
	    <div style="width:900px;color:#B40404" align="left"> [필수] 개인정보 수집·이용 </div>
	    <tr>
	      <td> 목적 </td>
	      <td> 항목 </td>
	      <td> 보유기간 </td>
	      <td> 동의여부 </td>
	    </tr>
	    <tr>
	      <td> 회원제 서비스 이용 / 본인확인 </td>
	      <td> 이름, 아이디, 비밀번호, 이메일, 휴대폰, 생일, 성별 </td>
	      <td> 회원탈퇴 후 5일까지 </td>
	      <td> 
	      	<input type="radio" name="cla_sec" value="1" checked> 동의함 </input>
	      </td>
	    </tr> 
	  </table>
	  <div> * 서비스 제공을 위한 최소한의 개인정보이므로 동의를 해주셔야 서비스를 이용하실 수 있습니다. </div>
	  </div>  
	  
	  <div id="cla3" name="cla" align="center"> 
	  <table width="900" height="100" border="1px solid black"> 
	    <tr>
	    <div style="width:900px;color:#B40404" align="left"> [선택] 개인정보 수집·이용 </div>
	      <td> 목적 </td>
	      <td> 항목 </td>
	      <td> 보유기간 </td>
	      <td> 동의여부 </td>
	    </tr>
	    <tr>
	      <td> 마케팅 활용(이벤트, 맞춤형 광고) </td>
	      <td> 휴대폰, 이메일, 쿠키정보 </td>
	      <td> 회원탈퇴 후 5일까지 </td>
	      <td> 
	      	<input type="radio" name="cla_thir" id="cla_thir" value="1" checked> 동의함 </input>
	      	<input type="radio" name="cla_thir" id="cla_thir" value="2"> 동의안함 </input>
	      </td>
	    </tr> 
	  </table>
	  <div> * 서비스 제공을 위한 최소한의 개인정보이므로 동의를 해주셔야 서비스를 이용하실 수 있습니다. </div>
	  </div>
	  
	  <div id="cla4" name="cla" align="center"> 
	  <table width="900" height="100" border="1px solid black"> 
	    <tr>
	    <div style="width:900px;color:#B40404" align="left"> [선택] 광고성 정보 수신 </div>
	      <td> 광고성 정보 수신 동의 </td>
	      <td colspan="3"> 
	      	<input type="radio" name="cla_four" value="1" checked> 동의함 </input>
	      	<input type="radio" name="cla_four" value="2"> 동의안함 </input>
	      </td>
	    </tr> 
	  </table>
	  <div> * 서비스 제공을 위한 최소한의 개인정보이므로 동의를 해주셔야 서비스를 이용하실 수 있습니다. </div>
	  </div>	    

	<div align="center" id="sixth">
	  <span id="ag_1"> <input type="submit" value="동의합니다."> </span>
	  <span id="ag_2"> <input type="button" onclick="location='../main/index'" value="가입 취소하기"> </span>
	</div>   
  </form>
  

  </div>
  
  
</body>
</html>