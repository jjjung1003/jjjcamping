package kr.co.jjjcamping.dao;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.co.jjjcamping.dto.NoticeDto;
import kr.co.jjjcamping.dto.TipDto;

public interface TipDao {

/* 꿀팁  */	
	public ArrayList<TipDto> list();
	
	public TipDto content(String id);
	
	public void write_ok(TipDto tdto);
	

}
