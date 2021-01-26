package kr.co.jjjcamping.dao;

import java.util.ArrayList;

import kr.co.jjjcamping.dto.CartDto;
import kr.co.jjjcamping.dto.OrderDto;
import kr.co.jjjcamping.dto.ProductDto;

public interface OrderDao {

	public ArrayList<CartDto> order_first(String userid);

	public void order_second(OrderDto odto);

	public String get_code();

	public void o_pcode_in(String[] ccode, String[] cprice);

}
