package vo;

import org.springframework.web.multipart.MultipartFile;

public class AcdVO {
	private String acd_name, acd_addr, acd_type, ceo_id, acd_photo;
	private int acd_num;
	private MultipartFile photo;

	public String getAcd_name() {
		return acd_name;
	}

	public void setAcd_name(String acd_name) {
		this.acd_name = acd_name;
	}

	public String getAcd_addr() {
		return acd_addr;
	}

	public void setAcd_addr(String acd_addr) {
		this.acd_addr = acd_addr;
	}

	public String getAcd_type() {
		return acd_type;
	}

	public void setAcd_type(String acd_type) {
		this.acd_type = acd_type;
	}

	public String getCeo_id() {
		return ceo_id;
	}

	public void setCeo_id(String ceo_id) {
		this.ceo_id = ceo_id;
	}
	
	public String getAcd_photo() {
		return acd_photo;
	}

	public void setAcd_photo(String acd_photo) {
		this.acd_photo = acd_photo;
	}

	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	public int getAcd_num() {
		return acd_num;
	}

	public void setAcd_num(int acd_num) {
		this.acd_num = acd_num;
	}

	

	
	
	
}
