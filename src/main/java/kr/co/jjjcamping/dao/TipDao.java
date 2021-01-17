package kr.co.jjjcamping.dao;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.co.jjjcamping.dto.NoticeDto;
import kr.co.jjjcamping.dto.TipDto;

public interface TipDao {

/* 꿀팁  */	
	public ArrayList<TipDto> tip_list();
	
	public TipDto tip_content(String id);
	
	public void tip_write_ok(TipDto tdto);
	

}
