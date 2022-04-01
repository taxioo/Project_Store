package com.spring.store;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import dao.UserDAO;
import vo.UserVO;

@Controller
public class UserController {
	@Autowired
	HttpServletRequest request;
	HttpServletRequest response;
	
	UserDAO user_dao;
	String WEB_PATH = "WEB-INF/views/";
	
	
	public void setUser_dao(UserDAO user_dao) {
		this.user_dao = user_dao;
	}
	
	@RequestMapping(value= {"/", "main.do"} )
	public String main() {
		return WEB_PATH + "home.jsp";
	}
	
	@RequestMapping("new_check.do")
	public String new_form2(){
		return WEB_PATH + "user/new_check_form.jsp";
	}
	
	@RequestMapping("new_form.do")
	public String new_form(Model model, String name, String tel1, String tel2, String tel3){
			model.addAttribute("name", name);
			model.addAttribute("tel1", tel1);
			model.addAttribute("tel2", tel2);
			model.addAttribute("tel3", tel3);
		return WEB_PATH + "user/new_form.jsp";
	}
	
	//회원가입전 가입유무 검사
  	@RequestMapping("check_new.do")
	@ResponseBody
	public String check(String name, String tel) {
		 UserVO vo = user_dao.selectOne_search(name);
		 String tel1 = tel.substring(0, 3);
		 String tel2 = tel.substring(3, 7);
		 String tel3 = tel.substring(tel.length()-4, tel.length());;
		 String str = "yes";
		 
		 if(vo == null) {
			 return str;
		 }
		 
		//이름 체크
		 if(name.equals(vo.getName()) || tel1.equals(vo.getTel1()) 
			 		|| tel2.equals(vo.getTel2()) 
			 		|| tel3.equals(vo.getTel3())) { 
			 str = "no";
		 }
		  
		  return str; 
  	}
	
  	//회원가입 db삽입
	@RequestMapping("insert.do")
	public String new_insert(Model model, UserVO vo) {
			int res = user_dao.insert(vo);
			if(res == 1) {
				model.addAttribute("msg", "회원가입이 완료 되었습니다.");
			}else{
				model.addAttribute("msg", "회원가입실패");
			}
		return WEB_PATH + "user/redirect.jsp";
	}
	
	//회원가입_아이디중복검사 페이지 이동
	@RequestMapping("IdCheckForm.do")
	public String idcheckform() {
		return  WEB_PATH + "include/IdCheckForm.jsp";	
	} 
	
	//회원가입_아이디중복검사
	@RequestMapping("check_id.do")
	@ResponseBody
	public String id_check(String id) {
		UserVO vo = user_dao.selectOne(id);
		 String str = "yes";
		 
		 if(vo == null) {
			 return str;
		 }else {
			 str="no";
		 }
		 
		 return str; 
  	}
	
	//로그인 폼 이동
	@RequestMapping("login_form.do")
	public String login_form() {
		return WEB_PATH + "user/login_form.jsp";
	}
	
	//로그인
	@RequestMapping("login.do")
	@ResponseBody
	public String login(String id, String pwd, Model model) {
		 UserVO vo = user_dao.selectOne(id);
		 String str = "no";
		 
		 if(vo == null) {
			 return str;
		 }
		//아이디 체크
		 if(id.equals(vo.getId()) && pwd.equals(vo.getPwd())){ //아이디, 비밀번호를 체크
			 str = "yes";
		 }
		  System.out.println(id); 
		  System.out.println(vo.getId());
		  System.out.println(pwd); 
		  System.out.println(vo.getPwd());
		  //아이디와 비밀번호 체크에 문제가 없다면 vo객체를
		  //어디서든 사용가능하도록 sessionScope영역에 저장.
		  HttpSession session = request.getSession(); // 세션영역을 가져온다
		  session.setAttribute("num", vo.getUser_num());
		  session.setAttribute("id", vo.getId());
		  session.setAttribute("pwd", vo.getPwd());
		  session.setAttribute("name", vo.getName());
		  session.setAttribute("postcode", vo.getPostcode());
		  session.setAttribute("addr1", vo.getAddress1());
		  session.setAttribute("addr2", vo.getAddress2());
		  session.setAttribute("email", vo.getEmail());
		  session.setAttribute("tel1", vo.getTel1());
		  session.setAttribute("tel2", vo.getTel2());
		  session.setAttribute("tel3", vo.getTel3());
		  session.setAttribute("jumin1", vo.getJumin1());
		  session.setAttribute("jumin2", vo.getJumin2());
		  
		  model.addAttribute("num", vo.getUser_num());
		  System.out.println(vo.getUser_num());
		  //세션유지시간(기본값 30분)
	//	  response.sendRedirect("main.jsp");
		  session.setMaxInactiveInterval(60 * 60);//세션 유지시간을 1시간으로 설정
		  
		  return str; 
	}
	
	//로그아웃
	@RequestMapping("logout.do")
	public String logout() {
		return WEB_PATH + "user/logout.jsp";
	}
	
	@RequestMapping("charge_form.do")
	public String charge_form() {
		return WEB_PATH + "user/charge_form.jsp";
	}
	
	@RequestMapping("calender.do")
	public String calender() {
		return WEB_PATH + "include/calender.jsp";
	}
	
	@RequestMapping("mypage.do")
	public String mypage(Integer user_num, Model model) {
		UserVO vo = user_dao.select_one(user_num);
		
		model.addAttribute("vo", vo);
		return WEB_PATH + "user/mypage.jsp";
	}
	
	@RequestMapping("user_delete_check.do")
	public String user_delete_form(String id, String pwd, Model model) {
		
		model.addAttribute("id", id);
		model.addAttribute("pwd", pwd);
		return WEB_PATH + "user/user_delete.jsp";
	}
	
	@RequestMapping("user_delete.do")
	public String user_delete(String id, Model model) {
		int res = user_dao.delete(id);
		
		 if(res==0) {
			  model.addAttribute("msg", "탈퇴실패, 관리자에게 문의하세요"); 
		  }else {
			  model.addAttribute("msg", "탈퇴완료"); 
		  }
		 
		 return  WEB_PATH +"user/redirect_delete.jsp";
	}
	
	@RequestMapping("user_correct_form.do")
	public String user_correct_form(Model model) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		UserVO vo = user_dao.selectOne(id);
		
		model.addAttribute("vo", vo);
		return  WEB_PATH +"user/user_correct_form.jsp";
	}
	
	
	@RequestMapping("user_correct.do")
	public String user_correct(UserVO vo, Model model) {
		int res = user_dao.adjust(vo);
		  
		  if(res==0) {
			  model.addAttribute("msg", "수정실패, 관리자에게 문의하세요"); 
		  }else {
			  model.addAttribute("msg", "수정완료");
			  
			  HttpSession session = request.getSession();
			  
			  session.setAttribute("num", vo.getUser_num());
			  session.setAttribute("id", vo.getId());
			  session.setAttribute("pwd", vo.getPwd());
			  session.setAttribute("name", vo.getName());
			  session.setAttribute("postcode", vo.getPostcode());
			  session.setAttribute("addr1", vo.getAddress1());
			  session.setAttribute("addr2", vo.getAddress2());
			  session.setAttribute("email", vo.getEmail());
			  session.setAttribute("tel1", vo.getTel1());
			  session.setAttribute("tel2", vo.getTel2());
			  session.setAttribute("tel3", vo.getTel3());
			  session.setAttribute("jumin1", vo.getJumin1());
			  session.setAttribute("jumin2", vo.getJumin2());
		  }
		  return  WEB_PATH +"user/redirect_update.jsp";
	}
	
	@RequestMapping("pwdForm.do")
	public String pwd_correct() {
		return  WEB_PATH +"user/pwd_correct.jsp";
	}
}
