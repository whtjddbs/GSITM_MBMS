<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        공지사항
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 공지사항</a></li>
        <li class="active">공지사항 상세보기</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        
        <div class="col-md-12">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">공지사항 상세보기</h3>

              <div class="box-tools pull-right">
                <a href='noticeDetail?notice_no=${noticeDTO.notice_no -1}' class="btn btn-box-tool" data-toggle="tooltip" title="Previous"><i class="fa fa-chevron-left"> </i> 이전글(현재 처음글이면 비활성화해야)</a>
                <a href='noticeDetail?notice_no=${noticeDTO.notice_no +1}' class="btn btn-box-tool" data-toggle="tooltip" title="Next"> 다음글(현재 최신글이면 비활성화해야) <i class="fa fa-chevron-right"></i></a>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="mailbox-read-info">
                <h3>${noticeDTO.notice_subject}</h3>
                <h5>작성자: ${noticeDTO.writer_emp_no}
                  <span class="mailbox-read-time pull-right">작성일 : ${noticeDTO.notice_date}</span>
                </h5>
              </div>
              <!-- /.mailbox-read-info -->

              <div class="mailbox-read-message">

                <p>${noticeDTO.notice_content}</p>

              </div>
              <!-- /.mailbox-read-message -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
              <ul class="mailbox-attachments clearfix">
                <li>
                  <span class="mailbox-attachment-icon"><i class="fa fa-file-pdf-o"></i></span>

                  <div class="mailbox-attachment-info">
                    <a href="#" class="mailbox-attachment-name"><i class="fa fa-paperclip"></i> Sep2014-report.pdf</a>
                        <span class="mailbox-attachment-size">
                          1,245 KB
                          <a href="#" class="btn btn-default btn-xs pull-right"><i class="fa fa-cloud-download"></i></a>
                        </span>
                  </div>
                </li>
                <li>
                  <span class="mailbox-attachment-icon"><i class="fa fa-file-word-o"></i></span>

                  <div class="mailbox-attachment-info">
                    <a href="#" class="mailbox-attachment-name"><i class="fa fa-paperclip"></i> App Description.docx</a>
                        <span class="mailbox-attachment-size">
                          1,245 KB
                          <a href="#" class="btn btn-default btn-xs pull-right"><i class="fa fa-cloud-download"></i></a>
                        </span>
                  </div>

                </li>
 				
              </ul>
              첨부파일 구현해라@@@@@@@@@@@@@@
            </div>
            <!-- /.box-footer -->
            <div class="box-footer">
              <div class="pull-right">
              
              <form action="noticeDelete" method="post">
              	<input type="hidden" name="notice_no" value="${noticeDTO.notice_no}">
	            <button type="submit" class="btn btn-default"><i class="fa fa-trash-o"></i> 삭제(당사자랑 운영자만 활성화)</button>
              </form>
              
              <form action="noticeUpdateForm" method="post">
              	<input type="hidden" name="notice_no" value="${noticeDTO.notice_no}">
	            <button type="submit" class="btn btn-default"><i class="fa fa-print"></i> 수정(아이콘바꾸기)(당사자랑 운영자만 활성화)</button>
              </form>
                
              	
              </div><!-- 
                <button type="button" class="btn btn-default"><i class="fa fa-reply"></i> 답글 달기(구현?)</button>
                <button type="button" class="btn btn-default"><i class="fa fa-share"></i> 공유(구현?)</button> -->
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /. box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->