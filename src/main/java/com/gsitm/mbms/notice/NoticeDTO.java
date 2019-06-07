package com.gsitm.mbms.notice;

/**
 * @주제 :
 * @작성일 : 2019. 5. 16.
 * @작성자 : 송민기
 */

public class NoticeDTO {
	private String noticeNo;
	private String noticeSubject;
	private String noticeContent;
	private String writerEmpNo;
	private String noticeDate;

	public NoticeDTO() {

	}

	public NoticeDTO(String noticeNo, String noticeSubject, String noticeContent, String writerEmpNo,
			String noticeDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeSubject = noticeSubject;
		this.noticeContent = noticeContent;
		this.writerEmpNo = writerEmpNo;
		this.noticeDate = noticeDate;
	}

	public String getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeSubject() {
		return noticeSubject;
	}

	public void setNoticeSubject(String noticeSubject) {
		this.noticeSubject = noticeSubject;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getWriterEmpNo() {
		return writerEmpNo;
	}

	public void setWriterEmpNo(String writerEmpNo) {
		this.writerEmpNo = writerEmpNo;
	}

	public String getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}

}
