package kr.co.jjjcamping.dao;

import java.util.ArrayList;

import kr.co.jjjcamping.dto.CartDto;
import kr.co.jjjcamping.dto.ProductDto;

public interface CartDao {

	public void cart_add(CartDto cdto);

	public ArrayList<ProductDto> cart_list(String userid);


	
}
