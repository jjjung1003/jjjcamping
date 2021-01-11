package kr.co.jjjcamping.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.jjjcamping.dao.ProductDao;
import kr.co.jjjcamping.dto.CategoryDto;
import kr.co.jjjcamping.dto.ProductDto;



public class Product_listCommand {

	public void pro_list(HttpServletRequest request, ProductDao pdao, Model model) {

		String code=request.getParameter("code");
		String category=null;
		
		int page, page_cnt, pstart, pend;
		
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		int index=(page-1)*10;
		
		int chong=pdao.tot_record(code);
		page_cnt=chong/10;
		if(chong%10 != 0)
			page_cnt=page_cnt+1;
				
		pstart=page/10;
		if(page%10 == 0)
			pstart=pstart-1;
		
		pstart=pstart*10+1;
		pend=pstart+9;
		if(pend > page_cnt)
			pend=page_cnt;
		
		ArrayList<ProductDto> plist=pdao.pro_list(code,index);
		ArrayList<CategoryDto> clist=pdao.get_category2(code.substring(0, 3));
		CategoryDto cdto=pdao.get_category(code);
		switch(Integer.parseInt(code.substring(1)))
		{
			case 101 : category="tent";break;
			case 102 : category="tarp";break;
			case 201 : category="s_bag";break;
			case 202 : category="mat";break;
			case 301 : category="stove";break;
			case 302 : category="bbq";break;
			case 303 : category="heater";break;
			case 401 : category="cbag";break;
			case 402 : category="peg";break;
			case 403 : category="hammock";break;
		}
		
	   model.addAttribute("pstart",pstart);
	   model.addAttribute("pend",pend);
	   model.addAttribute("page_cnt",page_cnt);
	   model.addAttribute("page",page);
	   
	   model.addAttribute("plist",plist);
	   model.addAttribute("clist",clist);
	   model.addAttribute("cdto",cdto);
	   model.addAttribute("category",category);
	   model.addAttribute("code",code);
	   
	}

}















