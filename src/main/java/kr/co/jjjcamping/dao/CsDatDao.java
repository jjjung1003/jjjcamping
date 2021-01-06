package kr.co.jjjcamping.dao;

import java.util.ArrayList;

import kr.co.jjjcamping.dto.CsDatDto;
import kr.co.jjjcamping.dto.CsDto;

public interface CsDatDao {

	public ArrayList<CsDatDto> get_csdat(String csid);

	public void csdat_ok(CsDatDto cddto);
	
	public void csdat_del(String id);
	
	
	
	
	

}
