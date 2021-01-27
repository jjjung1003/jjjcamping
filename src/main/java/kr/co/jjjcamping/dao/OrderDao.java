package kr.co.jjjcamping.dao;

import java.util.ArrayList;

import kr.co.jjjcamping.dto.CartDto;
import kr.co.jjjcamping.dto.OrderDto;
import kr.co.jjjcamping.dto.ProductDto;

public interface OrderDao {

	public ArrayList<CartDto> order_first(String userid);

	public void order_second(OrderDto odto);

	public String get_code();

	public void cart_del(OrderDto odto);

	public ArrayList<OrderDto> deliv_list(String userid);

	public void deliv_add(OrderDto odto);

}
