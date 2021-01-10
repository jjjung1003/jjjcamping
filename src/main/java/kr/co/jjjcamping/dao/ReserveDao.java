package kr.co.jjjcamping.dao;

import java.util.ArrayList;

import kr.co.jjjcamping.dto.ReserveDto;

public interface ReserveDao {

	public void reserve_second(ReserveDto rdto);

	public ArrayList<ReserveDto> my_reserve(String userid);

	public void reserve_del(String id);

	

}
