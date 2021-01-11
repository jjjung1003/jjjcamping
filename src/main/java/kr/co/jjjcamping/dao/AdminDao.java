package kr.co.jjjcamping.dao;

import java.util.ArrayList;

import kr.co.jjjcamping.dto.CampDto;
import kr.co.jjjcamping.dto.ProductDto;
import kr.co.jjjcamping.dto.StoreDto;

public interface AdminDao {

	public void store_write_ok(StoreDto sdto);
	
	public void camp_write_ok(CampDto cdto);

	public void product_write_ok(ProductDto pdto);

	public String get_code(String code);
	
	
	
	
	
	
	
	
	
	
	
}
