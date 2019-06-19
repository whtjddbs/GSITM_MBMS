<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
      <h1>예약 현황</h1>
      <ol class="breadcrumb">
         <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
         <li><a href="#">DEPARTMENT HEAD</a></li>
         <li class="active">결제 관리</li>
      </ol>
   </section>

   <!-- Main content -->
   <section class="content">
      <div class="row">
         <div class="col-xs-10 col-xs-offset-1">
            <div class="box">
               <div class="box-header">
                  <div>
                     <div class=" col-xs-8 bg-gray text-center">
                        <h3 class="box-title">예약 결재 대기중</h3>
                     </div>
                     <div class=" col-xs-4 pull-right">
                        <table id="example1" class="table table-bordered text-center">
                           <thead>
                              <tr>
                                 <th>기안</th>
                                 <th>1차 결재</th>
                                 <th>2차 결재</th>
                              </tr>
                           </thead>
                           <tbody>
                              <tr>
                                 <td>송민기 <br> 19/05/02 15:20</td>
                                 <td>-</td>
                                 <td>-</td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
               <!-- /.box-header -->
               <div class="row">

                  <div class="box-body">
                     <table id="approvalDetailTable"
                        class="table table-bordered text-center">
                        <tr>
                           <th>회의실명</th>
                           <td>보헌빌딩 201호 몰디브</td>
                        </tr>
                        <tr>
                           <th>회의 구분</th>
                           <td>고객 미팅</td>
                        </tr>
                        <tr>
                           <th>회의 내용</th>
                           <td>요구사항 인터뷰</td>

                        </tr>
                        <tr>
                           <th>이용 시간</th>
                           <td>2019-06-01 09:00 ~ 2019-06-02 18:00</td>
                        </tr>
                        <tr>
                           <th>참석 인원</th>
                           <td>4명
                              <button type="button"
                                 class="btn btn-primary pull-right">세부 조회</button>
                           </td>
                        </tr>
                        <tr>
                           <th>사용 목적</th>
                           <td>회의실 예약 관리 시스템(MBMS)을 위한 요구사항 정의서 작성을 위한 고객사와의 미팅</td>
                        </tr>
                        <tr>
                           <th>비품 신청 목록</th>
                           <td>빔 프로젝터 1 음향기기 1</td>
                        </tr>
                        <tr>
                           <th>다과 준비 여부</th>
                           <td><input type="checkbox"></td>
                        </tr>

                     </table>
                  </div>
               </div>
            </div>
            <!-- /.box-body -->
         </div>
         <!-- /.box -->
      </div>
      <!-- /.col -->
      <!-- /.row -->
   </section>
   <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script>
   $(function() {
      $("th").addClass("bg-gray");
   })
</script>