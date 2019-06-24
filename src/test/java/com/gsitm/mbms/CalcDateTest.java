package com.gsitm.mbms;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.gsitm.mbms.reserve.ReserveService;
import com.gsitm.mbms.util.MailService;

import lombok.extern.slf4j.Slf4j;

/**
 * @주제 : 
 * @작성일 : 2019. 6. 24.
 * @작성자 : 조성윤
 */
@Slf4j
@RunWith(SpringRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class CalcDateTest {

	@Autowired
	ReserveService rService;
	@Autowired
	MailService mailService;
	
	@Test
	public void test() throws ParseException {
		assertThat(rService, is(notNullValue()));
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		Date startDate = format.parse("2019/06/20 13:00");
		Date endDate = format.parse("2019/06/24 15:00");
		
		double reserveHours = rService.calcDate(startDate, endDate).getReserveHours();
		log.info("reserveHours: {}",reserveHours);
	}
	
	@Test
	public void mailTest() throws AddressException {
		assertThat(mailService, is(notNullValue()));
		
		String subject = "테스트 메일입니다.";
		String content = "?????????????호호호";
		String email = "blackrnfk@gmail.com";
		String email2 = "jsy_1201@naver.com";
		
		InternetAddress[] addArray = new InternetAddress[2];
		addArray[0] = new InternetAddress(email);
		addArray[1] = new InternetAddress(email2);
		
		

		long start = System.nanoTime();
//		boolean result = mailService.send(subject, content, "jayjoy77@naver.com", email+","+email2);
		boolean result = mailService.multiSend(subject, content, "jayjoy77@naver.com", addArray);
		assertThat(result, is(true));
		long end = System.nanoTime();
		log.info("rrrrrrrrrr: {}",end-start);
	}

}
