package kr.co.jjjcamping.dao;

import java.util.ArrayList;

import kr.co.jjjcamping.dto.CsDatDto;
import kr.co.jjjcamping.dto.CsDto;

public interface CsDao {

	public void write_ok(CsDto cdto);

	public ArrayList<CsDto> list(String cla, String search, int index);

	public int list_cnt(String cla, String search);

	public CsDto content(String id);

	public void delete(String id);

	public CsDto mypage(String string);

	
	
	
	
	
	
	

}
