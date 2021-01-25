package kr.co.jjjcamping.dao;

import java.util.ArrayList;

import kr.co.jjjcamping.dto.CartDto;
import kr.co.jjjcamping.dto.OrderDto;
import kr.co.jjjcamping.dto.ProductDto;

public interface OrderDao {

	public ArrayList<CartDto> order_first(String userid);

	public void order_second(OrderDto odto);

	public OrderDto order_complete(String userid, String o_code);

}
