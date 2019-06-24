package com.gsitm.mbms.approval;

import java.util.List;

import com.gsitm.mbms.reserve.CompetentDepartmentDTO;
import com.gsitm.mbms.reserve.MeetingEquipmentDTO;
import com.gsitm.mbms.reserve.MeetingMemberDTO;
import com.gsitm.mbms.reserve.ReserveHistoryDTO;

/**
 * @주제 : 
 * @작성일 : 2019. 6. 24.
 * @작성자 : 조성윤
 */
public interface ApprovalDAO {
	/** 성윤: 결재 관리 상세보기 관련 **/
	public ReserveHistoryDTO selectOneReserveInfo(int reserveNo);
	public List<CompetentDepartmentDTO> selectCompetentDeptartmentList(int reserveNo);
	public List<MeetingEquipmentDTO> selectMeetingEquipmentList(int reserveNo);
	public List<MeetingMemberDTO> selectMeetingMemberList(int reserveNo);
}
