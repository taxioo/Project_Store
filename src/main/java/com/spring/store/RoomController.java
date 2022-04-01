package com.spring.store;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.RoomDAO;
import vo.AcdVO;
import vo.ReserveVO;
import vo.RoomVO;

@Controller
public class RoomController {
	RoomDAO room_dao;
	
	@Autowired
	HttpServletRequest request;
	HttpServletRequest response;
	
	String WEB_PATH = "WEB-INF/views/";
	
	public void setRoom_dao(RoomDAO room_dao) {
		this.room_dao = room_dao;
	}
	
	@RequestMapping("room_insert_form.do")
	public String room_insert_form(String acd_name, int acd_num,  Model model) {
		model.addAttribute("acd_name", acd_name);
		model.addAttribute("acd_num", acd_num);
		
		return WEB_PATH + "room/room_insert_form.jsp";
	}
	
	@RequestMapping("room_insert_form2.do")
	public String room_insert_form(String acd_name,  Model model) {
		model.addAttribute("acd_name", acd_name);
		
		return WEB_PATH + "room/room_insert_form.jsp";
	}
	
	@RequestMapping("room_insert.do")
	public String room_insert(RoomVO vo, Model model, @RequestParam("rm_photo") MultipartFile multipartFile) {
		String name ="";
		FileOutputStream fos = null;
		int newWidth =200;
		int newHeight =200;
		String imgFormat = "png";
			try {
				String uploadPath = "C:\\web4_pm_spring\\work\\Store\\src\\main\\webapp\\resources\\upload\\" + vo.getAcd_name() + "\\" + "Room";
				File file = new File(uploadPath);
				BufferedImage image = ImageIO.read(multipartFile.getInputStream());
				Integer width = image.getWidth();
				Integer height = image.getHeight();
				
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
					return WEB_PATH + "room/redirect.jsp";
				}
				fos = new FileOutputStream(uploadPath + "\\"+ uploadFileName );
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
			vo.setRoom_photo(name);
			
			//최종등록
			 int res = room_dao.insert(vo); 
			 if(res == 1) { 
				 model.addAttribute("msg","등록이 완료 되었습니다");
			 }else{ 
				 model.addAttribute("msg", "등록이 되지 않았습니다.\n 관리자에게 문의하세요"); 
			 }
			 
		return WEB_PATH + "room/redirect.jsp";
	}
	
	 @RequestMapping("room_list.do")
	 public String list_transfer(String acd_name, Model model) {
		 List<RoomVO> room_list = room_dao.select(acd_name);	 
		 List<AcdVO> pen_list = room_dao.selectPen(acd_name);
		 List<ReserveVO> res_list = room_dao.selectRes(acd_name);
		 
		 int cnt = 0;
		 
		 
		 
		 String str = "no";
		 if(room_list.size() != 0) {
			str = "yes";
			cnt =  room_dao.selectCnt(acd_name);
		 }
		 
		 
		 model.addAttribute("total_price", cnt);
		 model.addAttribute("str", str);
		 model.addAttribute("pen_list", pen_list);
		 model.addAttribute("room_list", room_list); 
		 model.addAttribute("res_list", res_list);
		 
		 return "room_main.do?str=" + str; 
		 }
	 
	 @RequestMapping("room_main.do")
	 public String room_main() {
		 return WEB_PATH + "room/room_main.jsp";
	 }
	 
//   방삭제
	 @ResponseBody
	 @RequestMapping("room_delete.do")
	 public String room_delete(int room_id, String acd_name, String room_photo) {
		 
		 //db에 전송
		 int res = room_dao.delete(room_id);
		 
		 String str = "yes";
		 
		 //이미지 삭제
		 String path = "/resources/upload/" + acd_name + "/" + "Room";
		 
		 ServletContext app = request.getSession().getServletContext();
		 //실제경로
		 String rel_path = app.getRealPath(path);
		 //절대경로
		 String view_path = "C:\\Users\\taxio\\git\\repository\\Store\\src\\main\\webapp\\resources\\upload\\" + acd_name + "\\" + "Room";
		 
		 File rel_file = new File(rel_path + "\\" + room_photo);
		 File file = new File(view_path + "\\" + room_photo);
		 System.out.println(rel_path);
		 
		 
		 if(res==0) {
			  str = "no"; 
		  }
		 
		 //파일삭제
		 if(file.exists()) {
			 file.delete();
			 System.out.println("삭제 성공");
		 }else {
			 System.out.println("삭제실패");
		 }
		 
		 //서버 이미지 삭제 
//		 if(rel_file.exists()) {
//			 rel_file.delete();
//			 System.out.println("서버 이미지 삭제 성공");
//		 }else {
//			 System.out.println("서버 이미지 삭제 실패");
//		 } 
		 	
		 
		 return str;
	 }
	 
	 @RequestMapping("room_correct_form.do")
	 public String room_correct_form(int room_id, Model model) {
		 RoomVO vo = room_dao.selectCorrect(room_id);
		 System.out.println(vo.getAcd_name());
		 System.out.println(vo.getRoom_id());
		 System.out.println(vo.getRoom_photo());
		 System.out.println(vo.getRoom_price());
		 System.out.println(vo.getRoom_type());
		 model.addAttribute("vo", vo);
		 return WEB_PATH + "room/room_correct_form.jsp";
	 }
	 
	 @ResponseBody
	 @RequestMapping("room_correct.do")
	 public String room_correct(RoomVO vo) {
		 int res = room_dao.updateRoom(vo);
		 String str = "no";
		 
		 if(res!=0) {
			 str = "yes";
		 }
		 
		 return str;
	 }
	 
	 
}
