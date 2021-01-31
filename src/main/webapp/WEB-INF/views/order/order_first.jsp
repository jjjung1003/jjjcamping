<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	#hr_1 {
		border:1px solid #B40404;
		width:600px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	#order_first {
		margin-top:100px;
		margin-bottom:150px;
	}
	
	table td {
		height: 25px;
	}
</style>
<script>
	function deliv_list(userid)
	{	// 배송지 목록 조회
		window.open("deliv_list?userid="+userid,"","width=900,height=350");
	}
	
	function chg_place(obj)
	{	// 배송 정보 입력시 신규 배송지 체크할 경우에만 주소 정보 수정 가능.
		if(obj.checked)
		{	
			document.jjj_order.zipcode.readOnly = true;
			document.jjj_order.address.readOnly = true;
			document.jjj_order.d_address.readOnly = false;
			/* document.jjj_order.extra.readOnly = false; */
		}
		else
		{
			document.jjj_order.zipcode.readOnly = true;
			document.jjj_order.address.readOnly = true;
			document.jjj_order.d_address.readOnly = true;
			/* document.jjj_order.extra.readOnly = true; */
		}
	}
	
	function phone_num(tt)
	{
		var chknum=tt.value;
		tt.value=chknum.replace(/[^0-9]/g, "");
	}
	
	function sample6_execDaumPostcode() {
		
		document.jjj_order.place.checked=true;
		chg_place(document.jjj_order.place);
		
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("d_address").value = extraAddr;
                
                } else {
                    document.getElementById("d_address").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("zipcode").value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("d_address").focus();
            }
        }).open();
    }
	
	function order_check(tt)
	{
		if(document.getElementById("o_name").value=="")
		{
			alert("받는분 이름을 기재해주세요.");
			return false;
		}		
		else if(document.getElementById("o_phone").value=="")
		{
			alert("받는분 연락처를 기재해주세요.");
			return false;
		}			
		else if(document.getElementById("zipcode").value=="")
		{
			alert("우편번호 확인해주세요.");
			return false;
		}		
		else if(document.getElementById("address").value=="")
		{
			alert("주소를 확인해주세요.");
			return false;
		}			
		else if(document.getElementById("d_address").value=="")
		{
			alert("세부주소를 확인해주세요.");
			return false;
		}	 

		return true;
		
	}
	
	/* var cyj=new XMLHttpRequest();	포인트 조회............

	function point_chk()
	{
		var uid=document.jjj_order.userid.value;
		cyj.open("get","point_chk?userid="+uid);
		cyj.send();
	}
	
	cyj.onreadystatechange=function()
	{
		if(cyj.readyState==4)
		{
			if(cyj.responseText == 1)
			{
				document.getElementById("point_use").innerText="111";
				return false;
			}
			else
			{
				document.getElementById("point_use").innerText="222";
				return false;
			}	
		}	
	}	 */

</script>
</head>
<body>
<div align="center" id="order_first">
	<div align="center"> <h2> 주문하기 </h2> </div>
	<hr id="hr_1">
	
	<form method="post" action="order_second" name="jjj_order" onsubmit="return order_check(this)">
	  <input type="hidden" name="userid" value="${userid}">
	 <table width="500">
	   <tr>
	     <td height="70"><strong>no.</strong></td>
	     <td height="70"><strong>상품 코드</strong></td>
	     <td align="center"><strong>상품명</strong></td>
	     <td align="center"><strong>가격</strong></td>
	     <td align="center"><strong>적립포인트</strong></td>
	   </tr>
	   
	   <c:set var="tot_price" value="0"/>
	   <c:set var="tot_point" value="0"/>
	   <c:set var="i" value="1"/>
	   <c:forEach items="${list}" var="cdto">
	   <input type="hidden" name="code" id="code" value="${cdto.code}">
	   <input type="hidden" name="d_price" value="${cdto.d_price}">
	   <tr>
	     <td>${i}</td>
	     <td>${cdto.code}</td>
	     <td>${cdto.pro_name}</td>
	     <td align="center"><fmt:formatNumber value="${cdto.d_price}"/> 원</td>
	     <td align="center"><fmt:formatNumber value="${cdto.d_price-(cdto.d_price*(100-cdto.point)/100)}"/>P</td>
	   </tr>    
	    
	   <c:set var="i" value="${i+1}"/>
	   <c:set var="tot_price" value="${tot_price+cdto.d_price}"/>
	   <c:set var="tot_point" value="${tot_point+cdto.d_price-(cdto.d_price*(100-cdto.point)/100)}"/>
	   </c:forEach>
	 </table> <br><br>
	 <input type="hidden" name="tot_price" id="tot_price" value="${tot_price}">
	 
	<table width="500">
	   <tr>
	     <td><strong>주문자정보</strong></td>
	   </tr> 	  
	    <tr>
			<td>이름</td>
			<td><input type="text" name="name" readonly value="${mdto.name}" readonly></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="email" value="${mdto.email}" readonly></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><input type="text" name="phone" value="${mdto.phone}" readonly></td>
		</tr> 
	 </table> <br><br>
	 
	<table width="500">
	  <tr>
	    <td><strong>배송지주소</strong></td>
	  </tr> 
	  <tr>
		<td>배송지선택</td>
		<td colspan="3">
			<input type="button" value="배송지 목록" onclick="deliv_list('${userid}')">
			<input type="checkbox" name="place" onclick="chg_place(this)">신규 배송지<br/>
		</td>
	  </tr>	 
	  <tr>
		<td> 받는분 이름 </td>
		<td><input type="text" name="o_name" id="o_name" value=""></td>
	  </tr>
	  <tr>
		<td> 받는분 연락처 </td>
		<td><input type="text" name="o_phone" id="o_phone" value="" maxlength="11" onkeyup="phone_num(this)" placeholder="휴대폰번호 ( - 없이 숫자만 입력하세요)"></td>
	  </tr>
	  <tr>
		<td rowspan="4"> 주소</td>
	    <td colspan="3"><input type="text" name="zipcode" id="zipcode" placeholder="우편번호" size="5" readonly> &nbsp; <input type="button" id="search" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
	  </tr>
	  <tr>
		<td colspan="3"><input type="text" name="address" id="address" placeholder="주소" size="40" readonly></td>
	  </tr>
	  <tr>
		<td colspan="3"><input type="text" name="d_address" id="d_address" placeholder="상세주소" size="40" readonly></td>
	  </tr>  
	</table> <br><br>
	 
	 <table width="300">
	   <tr>  
	     <td align="center" rowspan="3"><strong>보유포인트사용</strong></td>
	   </tr> 	   
	   <tr>   
	     <td align="center"><input type="text" name="point_use" id="point_use" value="${mdto.point}" size="10" readonly> P</td>
	   </tr>	   	   
	 </table> <br><br>
	 
	 <table width="250">
	   <tr>  
	     <td align="center" rowspan="3"><strong>결제방법</strong></td>
	   </tr>  
	   <tr>   
	     <td align="center"><input type="radio" name="payment" value="1" checked> 신용카드 </td>
	   </tr>
	   <tr>   
	     <td align="center"><input type="radio" name="payment" value="2"> 계좌이체 </td>
	   </tr>	   
	 </table> <br><br>
	 
	 	<div>총  결제금액 : <input type="hidden" name="tot_price" value="${tot_price-mdto.point}"><fmt:formatNumber value="${tot_price-mdto.point}"/> 원</div>
		<div>총 적립포인트 : <input type="hidden" name="point" value="${tot_point}"><fmt:formatNumber value="${tot_point}"/> P</div><br><br>
	 <input type="submit" value="결제하기">
	 </form>
	</div>
</body>
</html>