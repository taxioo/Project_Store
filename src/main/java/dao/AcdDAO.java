package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.AcdVO;
import vo.RoomVO;

public class AcdDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insert(AcdVO vo) {
		int res = sqlSession.insert("acd.acd_insert", vo);
		
		return res;
	}
	
	public List<AcdVO> select(String acd_type){
		List<AcdVO> list = new ArrayList<AcdVO>();
		list = sqlSession.selectList("acd.acd_list", acd_type);
		return list;
	}
	
	public List<RoomVO> select_room(String acd_name){
		List<RoomVO> list = new ArrayList<RoomVO>();
		list = sqlSession.selectList("acd.room_list", acd_name);
		
		return list;
	}
	
	public List<AcdVO> select_rm(String acd_name){
		List<AcdVO> list = new ArrayList<AcdVO>();
		list = sqlSession.selectList("acd.rm_list", acd_name);
		return list;
	}
	
	public List<AcdVO> select_addr(String acd_addr){
		List<AcdVO> list = new ArrayList<AcdVO>();
		list = sqlSession.selectList("acd.addr_list", acd_addr);
		return list;
	}
	
	public List<AcdVO> select_text(String text){
		List<AcdVO> list = new ArrayList<AcdVO>();
		list = sqlSession.selectList("acd.text_list", text);
		return list;
	}
	
	
}
