package com.gsitm.mbms.approval;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gsitm.mbms.reserve.CompetentDepartmentDTO;
import com.gsitm.mbms.reserve.MeetingEquipmentDTO;
import com.gsitm.mbms.reserve.MeetingMemberDTO;
import com.gsitm.mbms.reserve.ReserveHistoryDTO;

/**
 * @주제 : 
 * @작성일 : 2019. 6. 24.
 * @작성자 : 조성윤
 */
@Repository
public class ApprovalDAOImpl implements ApprovalDAO {
	@Autowired
	SqlSession session;

	@Override
	public ReserveHistoryDTO selectOneReserveInfo(int reserveNo) {
		return session.selectOne("reserveHistoryMapper.selectOneReserveInfo", reserveNo);
	}

	@Override
	public List<CompetentDepartmentDTO> selectCompetentDeptartmentList(int reserveNo) {
		return session.selectList("reserveHistoryMapper.selectCompetentDeptartmentList", reserveNo);
	}

	@Override
	public List<MeetingEquipmentDTO> selectMeetingEquipmentList(int reserveNo) {
		return session.selectList("reserveHistoryMapper.selectMeetingEquipmentList", reserveNo);
	}

	@Override
	public List<MeetingMemberDTO> selectMeetingMemberList(int reserveNo) {
		return session.selectList("reserveHistoryMapper.selectMeetingMemberList", reserveNo);
	}
	
}
