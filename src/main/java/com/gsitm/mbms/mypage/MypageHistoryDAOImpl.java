package com.gsitm.mbms.mypage;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;

/**
 * @작성일 : 2019. 5. 28.
 * @작성자 : 이주현
 */

public class MypageHistoryDAOImpl implements MypageHistoryDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "mypageMapper";

	public List<MypageHistoryDTO> selectAll() throws Exception{
		return sqlSession.selectList(namespace + "selectAll");
	}
	
}
