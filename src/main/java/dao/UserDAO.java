package dao;

import org.apache.ibatis.session.SqlSession;

import vo.UserVO;

public class UserDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insert(UserVO vo) {
		int res = sqlSession.insert("u.user_insert", vo);
		
		return res;
	}
	
	//아이디 중복 검사, 로그인
	public UserVO selectOne(String id) { 
		 UserVO vo = sqlSession.selectOne("u.user_login", id); 
		 
		 return vo; 
	 }
	
	//아이디 찾기, 회원가입 유무
	 public UserVO selectOne_search(String name) { 
		 UserVO vo = sqlSession.selectOne("u.user_search", name); 
		 
		 return vo; 
	 }
	
	 public UserVO select_one(int user_num) { 
		 UserVO vo = sqlSession.selectOne("u.user_mypage", user_num); 
		 
		 return vo; 
	 }
	 
	 public int delete(String id) {
		 int res = sqlSession.delete("u.user_delete", id);
		 
		 return res;
	 }
	 
	 //회원정보 수정
	 public int adjust(UserVO vo) {
		int res = sqlSession.update("u.user_update", vo);
			
		return res;
	 }
}
