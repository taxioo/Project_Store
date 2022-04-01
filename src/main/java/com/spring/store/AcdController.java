package com.spring.store;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import dao.AcdDAO;
import vo.AcdVO;
import vo.RoomVO;

@Controller
public class AcdController {
	AcdDAO acd_dao;
	
	public void setAcd_dao(AcdDAO acd_dao) {
		this.acd_dao = acd_dao;
	}
	
	@Autowired
	HttpServletRequest request;
	HttpServletRequest response;
	
	String WEB_PATH = "WEB-INF/views/";
	
	//검색
	@SuppressWarnings("unused")
	@RequestMapping("search.do")
	public String search(String text, String date1, String date2, int room_cnt, Model model) {
		String [] area = {"서울", "부산", "경주", "인천", "대구", "대전", "경기"}; 
		String str = "yes";
		List<AcdVO> list;
		List<RoomVO> list2;
		System.out.println(date1);
		System.out.println(date2);
		
		for(int i = 0; i < area.length; i++) {
			if(text.contains(area[i])) {
				String acd_addr = area[i];
				list = acd_dao.select_addr(acd_addr);

				if(list.isEmpty()) {
					str = "no";
					break;
				}
				model.addAttribute("list", list);
				break;
				
			}else {//첫번쨰 if문 else
				list = acd_dao.select_text(text);
				if(list.isEmpty()) {
					str = "no";
					break;
				}
				
				model.addAttribute("list", list);
				break;
			}
		}
		
		model.addAttribute("str", str);
		
		return WEB_PATH +  "include/search_main.jsp";
	}
	
	@RequestMapping("acd_insert_form.do")
	public String acd_insert_form() {
		return WEB_PATH + "acd/acd_insert_form.jsp";
	}
	
	@SuppressWarnings("resource")
	@RequestMapping("acd_insert.do")
	public String acd_upload(AcdVO vo, Model model, @RequestParam("photo") MultipartFile multipartFile) {
//		ServletContext app = request.getSession().getServletContext();
//		String w_path ="/upload/";
//		String rel_path = app.getRealPath(w_path);
//		System.out.println(rel_path);
		
		String name ="";
		FileOutputStream fos = null;
		int newWidth =400;
		int newHeight =400;
		String imgFormat = "png";
		
		
			try {
				String uploadPath = "C:\\web4_pm_spring\\work\\Store\\src\\main\\webapp\\resources\\upload\\" +  vo.getAcd_name();
				File file = new File(uploadPath);
				BufferedImage image = ImageIO.read(multipartFile.getInputStream());
				Integer width = image.getWidth();
				Integer height = image.getHeight();
				
				// 이미지 리사이즈
				// Image.SCALE_DEFAULT : 기본 이미지 스케일링 알고리즘 사용 
				// Image.SCALE_FAST : 이미지 부드러움보다 속도 우선 
				// Image.SCALE_REPLICATE : ReplicateScaleFilter 클래스로 구체화 된 이미지 크기 조절 알고리즘 
				// Image.SCALE_SMOOTH : 속도보다 이미지 부드러움을 우선 
				// Image.SCALE_AREA_AVERAGING : 평균 알고리즘 사용

				Image resizeImage = image.getScaledInstance(newWidth, newHeight, Image.SCALE_SMOOTH);
				BufferedImage newImage = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_RGB); 
				Graphics g = newImage.getGraphics(); 
				g.drawImage(resizeImage, 0, 0, null); 
				g.dispose(); 
				
				UUID uuid = UUID.randomUUID();
				String uploadFileName = multipartFile.getOriginalFilename();
				uploadFileName = uuid.toString() + "_" + uploadFileName;
				
				if(!file.exists()) {
					file.mkdirs();
				}

				if(multipartFile.getContentType().indexOf("image") > -1 ) {
				}else {
					model.addAttribute("msg", "이미지 파일만 넣어주시기 바랍니다.");
					return WEB_PATH + "acd/redirect.jsp";
				}
				fos = new FileOutputStream(uploadPath + "\\" + uploadFileName);
				fos.write(multipartFile.getBytes());
				ImageIO.write(newImage, imgFormat, new File(uploadPath + "\\" + uploadFileName));
				name = uploadFileName;
				
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				System.out.println("[File에러]" + e.getMessage());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				System.out.println("[IO에러]" + e.getMessage());
			}
			
			//vo에 경로 저장
			vo.setAcd_photo(name);
			
			//최종등록
			 int res = acd_dao.insert(vo); 
			 if(res == 1) { 
				 model.addAttribute("msg","등록이 완료 되었습니다");
			 }else{ 
				 model.addAttribute("msg", "등록이 되지 않았습니다.\n 관리자에게 문의하세요"); 
			 }
			 
			
		return WEB_PATH + "acd/redirect.jsp";
	}
	
	//사용자에게 보여지는 숙박 리스트
	@RequestMapping("acd_list.do")
	public String list_main(Model model, String acd_type) {
		List<AcdVO> list = acd_dao.select(acd_type);
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getAcd_addr());
			System.out.println(list.get(i).getAcd_name());
			System.out.println(list.get(i).getAcd_photo());
			System.out.println(list.get(i).getCeo_id());
		}
	   	model.addAttribute("list", list);
		return WEB_PATH + "list/main.jsp";
	}
	
	//방 리스트
	@RequestMapping("cus_room_list.do")
	public String list_main(String acd_name, String start_date, String end_date, Model model) {
		 List<RoomVO> room_list = acd_dao.select_room(acd_name);
		 List<AcdVO> pen_list = acd_dao.select_rm(acd_name);
		 
		 for(int i = 0; i < room_list.size(); i++) {
			 System.out.println("room_list = " + room_list.get(i).getRoom_type());
		 }
		 
		 
		 model.addAttribute("room_list", room_list); 
		 model.addAttribute("pen_list", pen_list); 
		 model.addAttribute("ceo_id", pen_list.get(0).getCeo_id()); 
		 
		 return WEB_PATH + "list/room_main.jsp"; 
		 }
	
	

}
