package com.spring.store;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ReserveDAO;
import vo.AcdVO;
import vo.ReserveVO;
import vo.RoomVO;
import vo.UserVO;

@Controller
public class ReserveController {
	ReserveDAO reserve_dao;
	
	@Autowired
	HttpServletRequest request;
	HttpServletRequest response;
	
	String WEB_PATH = "WEB-INF/views/";
	
	public void setReserve_dao(ReserveDAO reserve_dao) {
		this.reserve_dao = reserve_dao;
	}
	
	@RequestMapping("reservation_form.do")
	public String reserve_form(String res, String start_date, String end_date, Model model) {
		RoomVO room_vo = reserve_dao.select_room(res);
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		UserVO user_vo = reserve_dao.select_user(id);
		
		model.addAttribute("rm_vo", room_vo);
		model.addAttribute("us_vo", user_vo);
		model.addAttribute("start_date", start_date);
		model.addAttribute("end_date", end_date);
		return WEB_PATH + "reservation/reserve_form.jsp";
	}
	
	@RequestMapping("reserve.do")
	public String reserve(ReserveVO vo, String date1, String date2, Model model) {
		System.out.println(date1);
		System.out.println(date2);
		java.sql.Date s = java.sql.Date.valueOf(date1);
		java.sql.Date e = java.sql.Date.valueOf(date2);
		vo.setStart_date(s);
		vo.setEnd_date(e);
		System.out.println(vo.getStart_date());
		System.out.println(vo.getEnd_date());
		vo.setStatus('1');
		int room_id = vo.getRoom_id();
		int res = reserve_dao.insert(vo);
		if(res == 1) {
			model.addAttribute("msg", "예약이 완료 되었습니다.");
			int cnt = reserve_dao.update(room_id);
		}else{
			model.addAttribute("msg", "예약 실패");
		}
		return WEB_PATH + "reservation/redirect.jsp";
	}
	
	//마이페이지 예약내역
	@RequestMapping("my_reserve_list.do")
	public String my_reserve(Integer user_num, Model model) {
		List<ReserveVO> list = reserve_dao.selectList(user_num);
		List<AcdVO> list2 = reserve_dao.selectAcd(user_num);
		String [] photo = new String [list.size()];
		String [] addr = new String[list.size()];
		
		for(int i = 0; i < list.size(); i++) {
			for(int j = 0; j < list2.size(); j++) {
				if(list.get(i).getAcd_name().equals(list2.get(j).getAcd_name())) {
					photo[i] = list2.get(j).getAcd_photo();
					addr[i] = list2.get(j).getAcd_addr();
					
					break;
				}
			}
		}
		
		model.addAttribute("addr", addr);
		model.addAttribute("photo", photo);
		model.addAttribute("rs_list", list);
		model.addAttribute("acd_list", list2);
		
		
		return  WEB_PATH + "list/user_reserve_list.jsp";
	}
	
	//마이페이지 예약 상세내역
	@RequestMapping("room_reserve_list.do")
	public String room_reserve_list(ReserveVO vo, String acd_name, Model model) {
		int room_id = vo.getRoom_id();
		int user_num = vo.getUser_num();
		List<RoomVO> list = reserve_dao.selectRoom(room_id);
		List<UserVO> list2 = reserve_dao.selectUser(user_num);
		
		
		model.addAttribute("rm_list", list);
		model.addAttribute("us_list", list2);
		model.addAttribute("store_vo", vo);
		model.addAttribute("acd_name", acd_name);
		
		return  WEB_PATH + "list/room_reserve_list.jsp";
	}
}
