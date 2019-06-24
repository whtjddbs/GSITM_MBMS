package com.gsitm.mbms.payment;

import java.util.List;


public interface PaymentService {
	public List<PaymentDTO> selectAllPayment() throws Exception;
	
	public List<PaymentDTO> sumPayment() throws Exception;

	public PaymentDTO paymentDetail(int reserveNo) throws Exception;

}
