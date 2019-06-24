package com.gsitm.mbms.util;

import javax.mail.internet.InternetAddress;

public interface MailService {
	boolean send(String subject, String text, String from, String to);
	public boolean multiSend(String subject, String text, String from, InternetAddress[] addArray);
}
