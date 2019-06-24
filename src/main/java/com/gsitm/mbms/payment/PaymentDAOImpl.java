package com.gsitm.mbms.payment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAOImpl implements PaymentDAO {
	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "paymentMapper.";
	
	@Override
	public List<PaymentDTO> selectAllPayment() {
		return session.selectList("paymentMapper.selectAllPayment");
	}
	
	@Override
	public List<PaymentDTO> sumPayment() {
		return session.selectList("paymentMapper.sumPayment");
	}
	
	@Override
	public PaymentDTO paymentDetail(int reserveNo) throws Exception {
		return session.selectOne(namespace + "paymentDetail", reserveNo);
	}


}
