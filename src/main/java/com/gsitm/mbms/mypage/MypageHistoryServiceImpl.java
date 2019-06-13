package com.gsitm.mbms.mypage;

import java.util.List;

import javax.inject.Inject;


/**
 * @작성일 : 2019. 5. 28.
 * @작성자 : 이주현
 */

public class MypageHistoryServiceImpl implements MypageHistoryService{

	@Inject
	private MypageHistoryDAO dao;
	
	@Override
	public List<MypageHistoryDTO> selectAll() throws Exception {
		return dao.selectAll();
	}

}
