package com.gsitm.mbms.payment;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private SqlSession session;
	
	@Inject
	private PaymentDAO dao;
	
	@Override
	public List<PaymentDTO> selectAllPayment() {
		return session.selectList("paymentMapper.selectAllPayment");
	}
	
	@Override
	public List<PaymentDTO> sumPayment() {
		return session.selectList("paymentMapper.sumPayment");
	}
	
	public PaymentDTO paymentDetail(int reserveNo) throws Exception {
		return dao.paymentDetail(reserveNo);
		//return session.selectOne("paymentMapper.paymentDetail");
	}
	
}
