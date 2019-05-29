package com.gsitm.mbms.reserve;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsitm.mbms.room.RoomDTO;

/**
 * @주제 : 
 * @작성일 : 2019. 5. 29.
 * @작성자 : 조성윤
 */
@Service
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	private ReserveDAO reserveDAO;
	
	@Override
	public List<RoomDTO> selectAllRoom() {
		return reserveDAO.selectAllRoom();
	}
	
}