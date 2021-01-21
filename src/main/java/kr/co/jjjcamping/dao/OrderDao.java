package kr.co.jjjcamping.dao;

import java.util.ArrayList;

import kr.co.jjjcamping.dto.CartDto;

public interface OrderDao {

	ArrayList<CartDto> cart_list(String userid);

}
