package com.gsitm.mbms.mypage;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




/**
 * @작성일 : 2019. 5. 28.
 * @작성자 : 이주현
 */

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	private SqlSession session;
	
	@Inject
	private MypageDAO mypageDAO;
		
	public List<MypageDTO> selectAllHistory() {
		return session.selectList("mypageMapper.selectAllHistory");
	}
		
	public List<MypageDTO> selectAllStatus() {
		return session.selectList("mypageMapper.selectAllStatus");
	}
	
	//삭제
	public void delete(int reserveNo) throws Exception{
		mypageDAO.delete(reserveNo);
	}
	
}
