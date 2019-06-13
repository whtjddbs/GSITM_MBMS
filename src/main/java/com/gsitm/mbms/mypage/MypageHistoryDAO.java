package com.gsitm.mbms.mypage;

import java.util.List;

/**
 * @작성일 : 2019. 5. 28.
 * @작성자 : 이주현
 */

public interface MypageHistoryDAO {

	public List<MypageHistoryDTO> selectAll() throws Exception;

}
