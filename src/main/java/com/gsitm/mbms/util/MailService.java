package com.gsitm.mbms.util;

import com.gsitm.mbms.reserve.ReserveHistoryDTO;
import com.gsitm.mbms.room.RoomDTO;

public interface MailService {
	public boolean send(String subject, String to, ReserveHistoryDTO reserveHistory, RoomDTO roomDTO, String comment);
	public String getMailTemplate(ReserveHistoryDTO reserveHistory, RoomDTO roomDTO, String comment);
}
