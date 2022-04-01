package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.AcdVO;
import vo.ReserveVO;
import vo.RoomVO;

public class RoomDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insert(RoomVO vo) {
		int res = sqlSession.insert("room.room_insert", vo);
		
		return res;
	}
	
	public List<RoomVO> select(String acd_name){
		List<RoomVO> list = new ArrayList<RoomVO>();
		list = sqlSession.selectList("room.room_list", acd_name);
		
		return list;
	}
	
	public List<AcdVO> selectPen(String acd_name){
		List<AcdVO> list = new ArrayList<AcdVO>();
		list = sqlSession.selectList("room.pen_list", acd_name);
		
		return list;
	}
	
	public List<ReserveVO> selectRes(String acd_name){
		List<ReserveVO> list = new ArrayList<ReserveVO>();
		list = sqlSession.selectList("room.res_list", acd_name);
		
		return list;
	}
	
	public int delete(int room_id) {
		int res = sqlSession.delete("room.room_delete", room_id);
		
		return res;
	}
	
	public RoomVO selectCorrect(int room_id) {
		 RoomVO vo = sqlSession.selectOne("room.room_select", room_id); 
		 
		 return vo; 
	}
	
	public int updateRoom(RoomVO vo) {
		System.out.println(vo.getRoom_type());
		
		int res = sqlSession.update("room.room_correct", vo);
		
				
		return res;
	}
	
	public int selectCnt(String acd_name) {
		int res = sqlSession.selectOne("room.room_cnt", acd_name);
		
		return res;
	}
}
