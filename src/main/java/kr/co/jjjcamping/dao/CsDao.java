package kr.co.jjjcamping.dao;

import java.util.ArrayList;

import kr.co.jjjcamping.dto.CsDatDto;
import kr.co.jjjcamping.dto.CsDto;

public interface CsDao {

	public void cs_write_ok(CsDto cdto);

	public ArrayList<CsDto> cs_list(String cla, String search, int index);

	public int cs_list_cnt(String cla, String search);

	public CsDto cs_content(String id);

	public void cs_delete(String id);

	public CsDto cs_info(String string);

	
	
	
	
	
	
	

}
