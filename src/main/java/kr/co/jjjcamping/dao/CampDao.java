package kr.co.jjjcamping.dao;

import java.util.ArrayList;

import kr.co.jjjcamping.dto.CampDto;

public interface CampDao {

	public void camp_write_ok(CampDto cdto);

	public ArrayList<CampDto> camp_list();

	public CampDto camp_content(String parameter);	
	
	
	
	
	
	
	
	
	
	
	
}
