package vo;

import org.springframework.web.multipart.MultipartFile;

public class RoomVO {
	private int room_id, room_price, acd_num, room_cnt, cnt;
	private String room_type, acd_name, room_photo;
	private MultipartFile rm_photo;
	
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public String getAcd_name() {
		return acd_name;
	}
	public void setAcd_name(String acd_name) {
		this.acd_name = acd_name;
	}
	public String getRoom_photo() {
		return room_photo;
	}
	public void setRoom_photo(String room_photo) {
		this.room_photo = room_photo;
	}
	public MultipartFile getRm_photo() {
		return rm_photo;
	}
	public void setRm_photo(MultipartFile rm_photo) {
		this.rm_photo = rm_photo;
	}
	public int getAcd_num() {
		return acd_num;
	}
	public void setAcd_num(int acd_num) {
		this.acd_num = acd_num;
	}
	public int getRoom_cnt() {
		return room_cnt;
	}
	public void setRoom_cnt(int room_cnt) {
		this.room_cnt = room_cnt;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
	
	
	
}
