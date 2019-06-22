package com.gsitm.mbms.payment;

import java.util.List;


public interface PaymentDAO {
	
	public List<PaymentDTO> selectAllPayment();
	
	public List<PaymentDTO> sumPayment();

}
