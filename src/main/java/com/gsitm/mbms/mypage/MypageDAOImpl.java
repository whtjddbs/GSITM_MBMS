package com.gsitm.mbms.mypage;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;




/**
 * @작성일 : 2019. 5. 28.
 * @작성자 : 이주현
 */
@Repository
public class MypageDAOImpl implements MypageDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "mypageMapper.";

	
	@Override
	public List<MypageDTO> selectAllHistory() {
		return session.selectList("mypageMapper.selectAllHistory");
	}
	
	@Override
	public List<MypageDTO> selectAllStatus(){
		return session.selectList("mypageMapper.selectAllStatus");
	}
	
	@Override
	public List<MypageDTO> selectMemberList(){
		return session.selectList("mypageMapper.selectMemberList");
	}
	
	//삭제
	public void delete(int reserveNo) throws Exception {
		session.delete(namespace + "delete", reserveNo);
	}
	
	@Override
	public List<MypageDTO> getStatusListResult(Map<String, Object> map) {
		return session.selectList("mypageMapper.getStatusListResult", map);
	}
	
}
