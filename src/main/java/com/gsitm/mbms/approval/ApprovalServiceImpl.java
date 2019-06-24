package com.gsitm.mbms.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsitm.mbms.reserve.CompetentDepartmentDTO;
import com.gsitm.mbms.reserve.MeetingEquipmentDTO;
import com.gsitm.mbms.reserve.MeetingMemberDTO;
import com.gsitm.mbms.reserve.ReserveHistoryDTO;

/**
 * @주제 : 
 * @작성일 : 2019. 6. 24.
 * @작성자 : 조성윤
 */
@Service
public class ApprovalServiceImpl implements ApprovalService {
	@Autowired
	private ApprovalDAO approvalDAO;

	@Override
	public ReserveHistoryDTO selectOneReserveInfo(int reserveNo) {
		return approvalDAO.selectOneReserveInfo(reserveNo);
	}

	@Override
	public List<CompetentDepartmentDTO> selectCompetentDeptartmentList(int reserveNo) {
		return approvalDAO.selectCompetentDeptartmentList(reserveNo);
	}

	@Override
	public List<MeetingEquipmentDTO> selectMeetingEquipmentList(int reserveNo) {
		return approvalDAO.selectMeetingEquipmentList(reserveNo);
	}

	@Override
	public List<MeetingMemberDTO> selectMeetingMemberList(int reserveNo) {
		return approvalDAO.selectMeetingMemberList(reserveNo);
	}
}
