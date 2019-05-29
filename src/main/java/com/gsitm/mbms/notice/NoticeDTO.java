package com.gsitm.mbms.notice;

/**
 * @주제 :
 * @작성일 : 2019. 5. 16.
 * @작성자 : 송민기
 */

public class NoticeDTO {
	private String notice_no;
	private String notice_subject;
	private String notice_content;
	private String writer_emp_no;
	private String notice_date;

	public NoticeDTO() {

	}

	public NoticeDTO(String notice_no, String notice_subject, String notice_content, String writer_emp_no,
			String notice_date) {
		super();
		this.notice_no = notice_no;
		this.notice_subject = notice_subject;
		this.notice_content = notice_content;
		this.writer_emp_no = writer_emp_no;
		this.notice_date = notice_date;
	}

	public String getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(String notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_subject() {
		return notice_subject;
	}

	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getWriter_emp_no() {
		return writer_emp_no;
	}

	public void setWriter_emp_no(String writer_emp_no) {
		this.writer_emp_no = writer_emp_no;
	}

	public String getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}

	@Override
	public String toString() {
		return "NoticeDTO [notice_no=" + notice_no + ", notice_subject=" + notice_subject + ", notice_content="
				+ notice_content + ", writer_emp_no=" + writer_emp_no + ", notice_date=" + notice_date + "]";
	}

	
	
}
