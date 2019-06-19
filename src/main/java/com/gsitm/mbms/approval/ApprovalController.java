package com.gsitm.mbms.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @주제 : 
 * @작성일 : 2019. 6. 17.
 * @작성자 : 조성윤
 */
@Controller
@RequestMapping("/approval")
public class ApprovalController {
	@RequestMapping("/approvalDetail")
	public String approvalDetail() {
		return "approval/approvalDetail";
	}
}
