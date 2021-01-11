package kr.co.jjjcamping.command;

import java.io.File;

import com.oreilly.servlet.MultipartRequest;

import kr.co.jjjcamping.dao.AdminDao;
import kr.co.jjjcamping.dto.ProductDto;

public class Product_write_okCommand {

	public void product_write_ok(MultipartRequest multi, AdminDao adao) {

		ProductDto pdto=new ProductDto();
		
		//da zhong 분류 + 상품번호 생성
		String code=multi.getParameter("code");
		String num=adao.get_code(code);
		String code2=null;
		
		if(num == null)	//분류값 외에 상품코드가 없다면
			code2=code+"001";
		else	//분류값 외에 상품코드가 있다면
		{
			Integer num2=Integer.parseInt(num);
			num2++;
			int len=num2.toString().length();
			
			if(len==1)
				code2=code+"00"+num2;
			else if(len==2)
				code2=code+"0"+num2;
			else if(len==3)
				code2=code+num2;
		}
		
		pdto.setCode(code2);
		pdto.setPro_name(multi.getParameter("pro_name"));
		pdto.setM_img(multi.getFilesystemName("m_img"));
		pdto.setD_img(multi.getFilesystemName("d_img"));
		pdto.setMade(multi.getParameter("made"));
		pdto.setPrice(Integer.parseInt(multi.getParameter("price")));
		pdto.setSale(Integer.parseInt(multi.getParameter("sale")));
		pdto.setDiscount(Integer.parseInt(multi.getParameter("discount")));
		pdto.setPoint(Integer.parseInt(multi.getParameter("point")));
		pdto.setPayment(Integer.parseInt(multi.getParameter("payment")));
		pdto.setPro_stock(Integer.parseInt(multi.getParameter("pro_stock")));
		pdto.setQuantity(Integer.parseInt(multi.getParameter("quantity")));
		
		adao.product_write_ok(pdto);
	}
}


















