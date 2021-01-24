<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#pro_first {
		margin-top:100px;
	}
	
	#pro_second {
		margin-top:50px;
		margin-bottom:150px;
	}
	
	#hr_1 {
		border:1px solid #B40404;
		width:800px;
		align:center;
		background-color:#B40404;
		margin-bottom:50px;
	}
	
	td {
	  padding-bottom:10px;
	}
	
	input[type="text"] {
		width: 200px;
		height:20px;
	}
	
	input[type="button"] {
		width: 70px;
		height:25px;
	}
	
	input[type="submit"] {
		width: 90px;
		height:30px;
	}
	
	select {
		margin-top:5px;
		width: 100px;
		height:30px;
		border: 2px solid #999;
	}
	
</style>
<script>
	function view_zhong(da_val)
	{
		var zhong=document.getElementById("zhong");
		switch(da_val)	// 대분류 코드
		{
			case "01" : var val=['텐트','타프']; break;
			case "02" : var val=['침낭','매트']; break;
			case "03" : var val=['스토브','바베큐','히터']; break;
			case "04" : var val=['캐리백','팩/폴/슬링','해먹']; break;
		}
		//중분류 option 생성
		zhong.options.length=val.length;
		
		for(i=0; i<val.length; i++)
		{
			zhong.options[i].value="0"+(i+1);
			zhong.options[i].text=val[i];
		}
		view_xiao(zhong.value);		
	}
	
	function cre_code()
	{
		var da=document.getElementById("da").value;
		var zhong=document.getElementById("zhong").value;
		
		code="p"+da+zhong;
		document.pro_jjj.code.value=code;
	}
	
</script>
</head>
<body>
  
<div align="center" id="pro_first"> <h2> 상품 정보 등록 </h2> </div>
<hr id="hr_1">

<div align="center" id="pro_second">
  <form method="post" action="product_write_ok" name="pro_jjj" enctype="multipart/form-data">

    <table align="center" width="750" style="margin-bottom:50px">
      <tr>
        <td> 상품코드 </td>
        <td> <input type="text" name="code" id="code" placeholder="코드생성 버튼 이용"> </td>
        <td>
        	대분류
          <select id="da" onchange="view_zhong(this.value)">
            <option></option>
            <option value="01">텐트/타프</option>
            <option value="02">침낭/매트</option>
            <option value="03">가스장비</option>
            <option value="04">액세서리</option>
          </select>
         	중분류
          <select id="zhong" onchange="view_xiao(this.value)">
            
          </select> 
                
          <input type="button" value="코드생성" onclick="cre_code()">
        </td>
      </tr>
      
	  <tr>
		<td> 상품명 </td>
		<td colspan="2"> <input type="text" name="pro_name" placeholder="공백없이 입력해주세요"> </td>
	  </tr>
	  
	  <tr>
		<td> 메인이미지  </td>
		<td colspan="2"><input type="file" name="m_img"></td>
	  </tr>
	  <tr>
		<td> 상세이미지  </td>
		<td colspan="2"><input type="file" name="d_img"></td>
	  </tr> 
			
	  <!-- <tr>
		<td> 옵션 1 </td>
		<td colspan="2"> <input type="text" name="opt1" placeholder="없으면 입력 X"> </td>
	  </tr>
	  <tr>
		<td> 옵션 2 </td>
		<td colspan="2"> <input type="text" name="opt2" placeholder="없으면 입력 X"> </td>
	  </tr>
	  <tr>
		<td> 옵션 3 </td>
		<td colspan="2"> <input type="text" name="opt3" placeholder="없으면 입력 X"> </td>
	  </tr> -->
	  
      <tr>
		<td> 제조사 </td>
		<td colspan="2"> <input type="text" name="made"  placeholder="제조사"> </td>
	  </tr>
	  
	  <tr>
		<td> 정가 </td>
		<td colspan="2"> <input type="text" name="price" placeholder="숫자만 입력해주세요"> </td>
	  </tr>
	  	  
	  <tr>
		<td> 할인 </td>
		<td colspan="2">
		  <select name="sale">
			<option value="0"> 정가 </option>
			<option value="1"> 세일 </option>
		  </select>
		</td>
	  </tr>	  

	  <tr>
		<td> 할인율 </td>
		<td colspan="2"> <input type="text" name="discount" value="0"> 기본 0 </td>
	  </tr>
	  <tr>
		<td> 포인트적립율 </td>
		<td colspan="2"> <input type="text" name="point" value="5"> 기본 5% </td>
	  </tr>
	  <tr>
		<td> 배송비 </td>
		<td colspan="2"> 10만원 이상 무료 <input type="hidden" name="charge" value="0"> </td>
	  </tr>
	  
	  <tr>
		<td> 배송비 결제 </td>
		<td colspan="2">
		  <select name="payment">
			<option value="0" selected> 선불 </option>
			<option value="1"> 착불 </option>
		  </select>
			기본 선불
		</td>
	  </tr>
      
	  <tr>
		<td> 판매여부 </td>
		<td colspan="2">
		  <select name="pro_stock">
			<option value="0"> 판매중 </option>
			<option value="1"> 일시품절 </option>
			<option value="2"> 품절 </option>
		  </select>
		</td>
	  </tr>	
	  
	  <tr>
		<td> 재고수량  </td>
		<td colspan="2"><input type="text" name="quantity" placeholder="숫자만 입력해주세요"></td>
	  </tr>         
       
    </table> <p>
  	<input type="submit" value="상품등록">  
  </form>
</div>	
</body>
</html>








