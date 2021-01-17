package kr.co.jjjcamping.dao;

import java.util.ArrayList;

import kr.co.jjjcamping.dto.StoreDto;

public interface StoreDao {

	public ArrayList<StoreDto> store_list(String cla, String search, int index);

	public int store_list_cnt(String cla, String search);

	public StoreDto store_content(String id);

	public void store_delete(String id);

	
	
	
	
	
	
	
	
	
	
	
	
}
