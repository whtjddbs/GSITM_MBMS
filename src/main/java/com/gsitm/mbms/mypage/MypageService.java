package com.gsitm.mbms.mypage;

import java.util.List;



/**
 * @작성일 : 2019. 5. 28.
 * @작성자 : 이주현
 */

public interface MypageService {

	 public List<MypageDTO> selectAllHistory() throws Exception;
	 
	 public List<MypageDTO> selectAllStatus() throws Exception;

	 //삭제
	 public void delete(int reserveNo) throws Exception;
	 //public void deleteReserve(int reserveNo) throws Exception;

}
