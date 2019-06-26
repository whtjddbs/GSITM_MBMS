package com.gsitm.mbms.payment;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gsitm.mbms.employee.EmployeeDTO;
import com.gsitm.mbms.employee.LoginService;

import lombok.extern.slf4j.Slf4j;



/**
 * @작성일 : 2019. 6. 7
 * @작성자 : 이주현
 */
	
@Controller
@RequestMapping("/payment")
@Slf4j
public class PaymentController {
	
	@Inject
	private PaymentService paymentService;
	
	@Inject
	private LoginService loginService;
	
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	/** 관리자 비용 결제 조회 */
	@RequestMapping(value = "/paymentList", method = RequestMethod.GET)
	public String paymentList(Model model, HttpSession session) throws Exception {
		logger.info("payment ListPage!");
		
		EmployeeDTO employeeDTO = (EmployeeDTO)session.getAttribute("login");
				
		List<PaymentDTO> paymentList = paymentService.selectAllPayment(employeeDTO.getEmpNo());
		model.addAttribute("paymentList", paymentList);
		
		return "/payment/paymentList";
	}	
	
	/** 결제자 비용 결제 조회 */
	@RequestMapping(value = "/approverPaymentList", method = RequestMethod.GET)
	public String approverPaymentList(Model model, HttpServletRequest request, HttpSession session) throws Exception {
		logger.info("approver payment ListPage!");
		
		EmployeeDTO employeeDTO = (EmployeeDTO)session.getAttribute("login");
		
		List<PaymentDTO> approverPaymentList = paymentService.selectApproverPayment(employeeDTO.getEmpNo());
		model.addAttribute("approverPaymentList", approverPaymentList);
		
		return "/payment/approverPaymentList";
	}	
		
}
