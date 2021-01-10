package kr.co.jjjcamping.dto;

public class ReserveDto {

	private int id, night, price;
	private String userid, name, camp, A_deck, in_date, out_date, writeday;
	
	
	
	public String getA_deck() {
		return A_deck;
	}
	public void setA_deck(String a_deck) {
		A_deck = a_deck;
	}
	public String getIn_date() {
		return in_date;
	}
	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}
	public String getOut_date() {
		return out_date;
	}
	public void setOut_date(String out_date) {
		this.out_date = out_date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNight() {
		return night;
	}
	public void setNight(int night) {
		this.night = night;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCamp() {
		return camp;
	}
	public void setCamp(String camp) {
		this.camp = camp;
	}

	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	
	
}
