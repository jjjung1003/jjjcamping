package kr.co.jjjcamping.dao;

import java.util.ArrayList;

import javax.servlet.http.Cookie;

import kr.co.jjjcamping.dto.CartDto;
import kr.co.jjjcamping.dto.ProductDto;

public interface CartDao {

	public void cart_add(CartDto cdto);

	public ArrayList<ProductDto> cart_list(String userid);

	public void cart_del(String id);

	public void cart_c_add(CartDto cdto);

	public ArrayList<CartDto> cart_c_list(String strcookie);

	public String[] cart_list_code(String userid);


	
}
