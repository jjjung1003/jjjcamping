package kr.co.jjjcamping.dao;

import java.util.ArrayList;

import kr.co.jjjcamping.dto.CartDto;
import kr.co.jjjcamping.dto.CategoryDto;
import kr.co.jjjcamping.dto.OrderDto;
import kr.co.jjjcamping.dto.ProductDto;

public interface ProductDao {

	public int tot_record(String code);

	public ArrayList<ProductDto> pro_list(String cla, String search);

	public CategoryDto get_category(String code);

	public ArrayList<CategoryDto> get_category2(String code);

	public ProductDto pro_content(String code);

	public void quantity_update(OrderDto odto);
	
	
	
	
	
	
	
	
	
	
	
}
