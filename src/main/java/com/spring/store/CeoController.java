package com.spring.store;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CeoDAO;
import vo.AcdVO;
import vo.CeoVO;
import vo.RoomVO;
import vo.UserVO;

@Controller
public class CeoController {
	CeoDAO ceo_dao;

	@Autowired
	HttpServletRequest request;
	HttpServletRequest response;
	
	String WEB_PATH = "WEB-INF/views/";
	
	public void setCeo_dao(CeoDAO ceo_dao) {
		this.ceo_dao = ceo_dao;
	}
	
	@RequestMapping("ceo_login.do")
	@ResponseBody
	public String ceo_login(String id, String pwd) {
		CeoVO vo = ceo_dao.selectOne(id);
		String str = "no";
		
		if(vo==null) {
			return str;
		}
		
		if(id.equals(vo.getCeo_id()) && pwd.equals(vo.getCeo_pwd())){ //아이디, 비밀번호를 체크
			 str = "yes";
		 }
		
		if(str == "yes") {
			
			HttpSession session = request.getSession();
			session.setAttribute("ceo_id", vo.getCeo_id());
			session.setAttribute("ceo_pwd", vo.getCeo_pwd());
			session.setAttribute("ceo_name", vo.getCeo_name());
			session.setAttribute("ceo_tel", vo.getCeo_tel());
			
			session.setMaxInactiveInterval(60 * 60);
			
		}
		return str;
	}
	
	@RequestMapping("ceo_main.do")
	public String ceo_main(Model model) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("ceo_id");
		List<AcdVO> list = ceo_dao.select(id);
		
	   	model.addAttribute("list", list);
		return WEB_PATH + "ceo/main.jsp";
	}
	
	//회원가입전 체크 유무 검사 폼
	@RequestMapping("ceo_new_check_form.do")
	public String ceo_new_check_form() {
		return WEB_PATH + "ceo/ceo_new_check_form.jsp";
	}
	
	//회원가입전 검사
	@ResponseBody
	@RequestMapping("ceo_check_new.do")
	public String ceo_check_new(String name, String tel) {
		CeoVO vo = ceo_dao.selectOne_search(name);
		String str = "yes";
		
		if(vo == null) {
			 return str;
		 }
		
		if(name.equals(vo.getCeo_name()) || tel.equals(vo.getCeo_tel())){ 
			 str = "no";
		 }
		
		return str;
	}
	
	//회원가입
	@RequestMapping("ceo_new_form.do")
	public String ceo_new_form(Model model, String name, String tel) {
		model.addAttribute("name", name);
		model.addAttribute("tel", tel);
		return WEB_PATH + "ceo/ceo_new_form.jsp";
	}
	
	//회원가입_아이디중복검사 페이지 이동
	@RequestMapping("ceo_IdCheckForm.do")
	public String ceo_idcheckform() {
		return  WEB_PATH + "include/ceo_IdCheckForm.jsp";	
	} 
	
	//회원가입_아이디중복검사
	@RequestMapping("ceo_check_id.do")
	@ResponseBody
	public String ceo_id_check(String id) {
		CeoVO vo = ceo_dao.selectOne(id);
		 String str = "yes";
		 
		 if(vo == null) {
			 return str;
		 }else {
			 str="no";
		 }
		 
		 return str; 
  	}
	
	@RequestMapping("ceo_login_form.do")
	public String ceo_new_form() {
		return WEB_PATH + "ceo/ceo_login_form.jsp";
	}
	
	//회원가입 db삽입
	@RequestMapping("ceo_insert.do")
	public String ceo_insert(Model model, CeoVO vo) {
			int res = ceo_dao.insert(vo);
			if(res == 1) {
				model.addAttribute("msg", "회원가입이 완료 되었습니다.");
			}else{
				model.addAttribute("msg", "회원가입실패");
			}
			
		return WEB_PATH + "ceo/redirect.jsp";
	}
	
	@RequestMapping("ceo_login_main.do")
	public String main() {
		return WEB_PATH + "ceo/login_main.jsp";
	}
	
	
}
