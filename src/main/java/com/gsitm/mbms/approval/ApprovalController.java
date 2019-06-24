package com.gsitm.mbms.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gsitm.mbms.reserve.CompetentDepartmentDTO;
import com.gsitm.mbms.reserve.MeetingEquipmentDTO;
import com.gsitm.mbms.reserve.MeetingMemberDTO;
import com.gsitm.mbms.reserve.ReserveHistoryDTO;

/**
 * @주제 : 
 * @작성일 : 2019. 6. 17.
 * @작성자 : 조성윤
 */
@Controller
@RequestMapping("/approval")
public class ApprovalController {
	@Autowired
	private ApprovalService approvalService;
	
	@RequestMapping("/approvalDetail")
	public String approvalDetail(int reserveNo) {
		ReserveHistoryDTO reserveHistoryDTO = approvalService.selectOneReserveInfo(reserveNo);
		List<CompetentDepartmentDTO> competentDepartments = approvalService.selectCompetentDeptartmentList(reserveNo);
		List<MeetingMemberDTO> meetingMembers = approvalService.selectMeetingMemberList(reserveNo);
		List<MeetingEquipmentDTO> meetingEquipments = approvalService.selectMeetingEquipmentList(reserveNo);
		
		return "approval/approvalDetail";
	}
	
	@GetMapping("/approvalList")
	public String approvalList() {
		return "approval/approvalList";
	}
}
