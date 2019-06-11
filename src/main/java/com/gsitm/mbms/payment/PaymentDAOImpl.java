package com.gsitm.mbms.payment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;


public class PaymentDAOImpl implements PaymentDAO {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<PaymentDTO> selectAllPayment() {
		return session.selectList("paymentMapper.selectAllPayment");
	}
	
	@Override
	public List<PaymentDTO> sumPayment() {
		return session.selectList("paymentMapper.sumPayment");
	}

}
