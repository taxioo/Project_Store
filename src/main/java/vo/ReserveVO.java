package vo;

import java.sql.Date;

public class ReserveVO {
	private int res_num, user_num, room_id, res_cnt;
	private char status;
	private String acd_name;
	
	
	private Date start_date, end_date, res_date;
	
	public int getRes_num() {
		return res_num;
	}
	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public int getRes_cnt() {
		return res_cnt;
	}
	public void setRes_cnt(int res_cnt) {
		this.res_cnt = res_cnt;
	}
	
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public char getStatus() {
		return status;
	}
	public void setStatus(char status) {
		this.status = status;
	}
	public String getAcd_name() {
		return acd_name;
	}
	public void setAcd_name(String acd_name) {
		this.acd_name = acd_name;
	}
	public Date getRes_date() {
		return res_date;
	}
	public void setRes_date(Date res_date) {
		this.res_date = res_date;
	}
	
	
	
	
	
}
