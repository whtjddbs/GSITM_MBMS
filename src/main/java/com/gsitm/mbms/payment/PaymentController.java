package com.gsitm.mbms.payment;

import java.util.List;

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



/**
 * @작성일 : 2019. 6. 7
 * @작성자 : 이주현
 */
	
@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	/** 비용 결제 목록 */
	@RequestMapping(value = "/paymentList", method = RequestMethod.GET)
	public String paymentList(Model model, HttpServletRequest request) throws Exception {
		logger.info("payment ListPage!");
		
		List<PaymentDTO> paymentList = paymentService.selectAllPayment();
		model.addAttribute("paymentList", paymentList);
		return "/payment/paymentList";
	}	
	
	/** 총 결제 비용 */
	@RequestMapping(value = "/sumPayment", method = RequestMethod.GET)
	public String sumPayment(Model model, HttpServletRequest request) throws Exception {
		
		List<PaymentDTO> sumPayment = paymentService.sumPayment();
		model.addAttribute("sumPayment", sumPayment);
		return "/payment/paymentList";
	}		
	
	/** 상세 결제 정보 */
	@RequestMapping(value = "/paymentDetail", method = RequestMethod.GET)
	public void paymentDetail(@RequestParam("reserveNo") int reserveNo, Model model, HttpSession session) throws Exception {
		
		//해당 결제 정보 가져오기
		PaymentDTO paymentDTO = paymentService.paymentDetail(reserveNo);
		model.addAttribute("paymentDTO", paymentDTO);
		
		//결제 전체 리스트 가져오기
		//List<PaymentDTO> paymentList = paymentService.selectAllPayment();
		
		//return "/payment/paymentDetail";
	}	
	
//	/** 비용 상세 정보 */
//	@RequestMapping(value = "/paymentDetail", method = RequestMethod.GET)
//	public String paymentDetail(Model model, HttpServletRequest request) throws Exception {
//		
//		List<PaymentDTO> paymentDetail = paymentService.paymentDetail();
//		model.addAttribute("paymentDetail", paymentDetail);
//		return "/payment/paymentDetail";
//	}	
}
