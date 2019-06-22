package com.gsitm.mbms.notice;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * @주제 :
 * @작성일 : 2019. 5. 16.
 * @작성자 : 송민기
 */

@Slf4j
@Data
@AllArgsConstructor
@NoArgsConstructor

public class NoticeDTO {
	private String noticeNo;
	private String noticeSubject;
	private String noticeContent;
	private String writerEmpNo;
	private String noticeDate;
	
	private String writerEmpName;	


	public NoticeDTO(String noticeNo, String noticeSubject, String noticeContent, String writerEmpNo,
			String noticeDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeSubject = noticeSubject;
		this.noticeContent = noticeContent;
		this.writerEmpNo = writerEmpNo;
		this.noticeDate = noticeDate;
	}
}
