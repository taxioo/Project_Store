package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.AcdVO;
import vo.CeoVO;
import vo.RoomVO;

public class CeoDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public CeoVO selectOne_search(String name) {
		CeoVO vo = sqlSession.selectOne("c.ceo_search", name);
		
		return vo;
	}
	
	//아이디 중복 검사, 로그인
	public CeoVO selectOne(String id) { 
		 CeoVO vo = sqlSession.selectOne("c.ceo_login", id); 
		 
		 return vo; 
	 }
	
	public int insert(CeoVO vo) {
		int res = sqlSession.insert("c.ceo_insert", vo);
		
		return res;
	}
	
	//메인화면 게시판 출력
	public List<AcdVO> select(String id){
		   	List<AcdVO> list = new ArrayList<AcdVO>();
		   	list = sqlSession.selectList("c.acd_list", id);
			return list;
		}
	
}
