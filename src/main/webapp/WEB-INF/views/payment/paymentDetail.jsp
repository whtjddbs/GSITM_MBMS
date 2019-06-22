<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
figure img {max-width:600px; height:auto;}

.btn_del_upd {display: inline-block;}

</style>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        결제 상세 정보
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 비용 결제 관리</a></li>
        <li class="active">결제 상세정보</li>
      </ol>
    </section>
    
    <!-- Main content -->
    <section class="content">
      <div class="row">
        
        <div class="col-md-12">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">결제 상세 정보</h3>

            </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="mailbox-read-info">
                <h3>${noticeDTO.noticeSubject}</h3>
                <h5>${PaymentDTO.paymentDate}
                  <span class="mailbox-read-time pull-right">결제일 : ${PaymentDTO.paymentDate}</span>
                </h5>
              </div>
              <!-- /.mailbox-read-info -->

              <div class="mailbox-read-message">

                <p>${noticeDTO.noticeContent}</p>

              </div>
              <!-- /.mailbox-read-message -->
            </div>

            <!-- /.box-footer -->
            <div class="box-footer">
              <div class="pull-right">
                  	
              </div><!-- 
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