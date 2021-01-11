package kr.co.jjjcamping.dao;

import java.util.ArrayList;

import kr.co.jjjcamping.dto.StoreDto;

public interface StoreDao {

	public ArrayList<StoreDto> list(String cla, String search, int index);

	public int list_cnt(String cla, String search);

	public StoreDto content(String id);

	public void delete(String id);

	
	
	
	
	
	
	
	
	
	
	
	
}
