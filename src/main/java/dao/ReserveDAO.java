package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.AcdVO;
import vo.ReserveVO;
import vo.RoomVO;
import vo.UserVO;

public class ReserveDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public RoomVO select_room(String res) {
		RoomVO vo = sqlSession.selectOne("reserve.res_room", res);
		
		return vo;
	}
	
	public UserVO select_user(String id) {
		UserVO vo = sqlSession.selectOne("reserve.res_user", id);
		
		return vo;
	}
	
	public int insert(ReserveVO vo) {
		int res = sqlSession.insert("reserve.insert", vo);
		
		return res;
		
	}
	
	public List<ReserveVO> selectList(int user_num) {
		List<ReserveVO> list = new ArrayList<ReserveVO>();
		list = sqlSession.selectList("reserve.select_list", user_num);
		
		return list;
	}
	
	public List<AcdVO> selectAcd(int user_num) {
		List<AcdVO> list = new ArrayList<AcdVO>();
		list = sqlSession.selectList("reserve.acd_list", user_num);
		
		return list;
	}
	
	public List<RoomVO> selectRoom(int room_id) {
		List<RoomVO> list = new ArrayList<RoomVO>();
		list = sqlSession.selectList("reserve.room_list", room_id);
		
		return list;
	}
	
	public List<UserVO> selectUser(int user_num) {
		List<UserVO> list = new ArrayList<UserVO>();
		list = sqlSession.selectList("reserve.user_list", user_num);
		
		return list;
	}
	
	public int update(int room_id) {
		int res  = sqlSession.update("reserve.update", room_id);
		
		return res;
	}
}
