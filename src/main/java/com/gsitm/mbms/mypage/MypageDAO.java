package com.gsitm.mbms.mypage;

import java.util.List;
import java.util.Map;



/**
 * @작성일 : 2019. 5. 28.
 * @작성자 : 이주현
 */

public interface MypageDAO {

	public List<MypageDTO> selectAllHistory();
	
	public List<MypageDTO> selectAllStatus();
	
	public List<MypageDTO> selectMemberList();

	//삭제
	public void delete(int reserveNo) throws Exception;
	
	public List<MypageDTO> getStatusListResult(Map<String, Object> map);


}
