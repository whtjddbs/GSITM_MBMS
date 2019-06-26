<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        예약 이력
        <small>지금까지의 예약 이력입니다.</small>
      </h1>
		<ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">My Page</a></li>
        <li class="active">예약이력</li>
      	</ol> 
    </section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-3">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">조건 검색</h3>
						<br>
					</div>
					
					<form id="availableHistoryList" method="get" action="/mypage/mypageHistoryDetail">
					<div class="box-body">
						<!-- Date and time range -->
						<div class="form-group">
							<label>예약 날짜</label>
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-clock-o"></i>
								</div>
								<input type="text" class="form-control pull-right" id="reservationtime" name="timeSelect">
							</div>
							<!-- /.input group -->
						</div> 
			            <br><input type="submit" class="btn  btn-info col-sm-12" id="availableRoomSearchBtn" value="검색">
					</div><br>
					</form>
					<!-- /.box-body -->
					
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col(left:col-md-3) -->
			
	<div class="col-md-9">
	<div class="box box-primary">
	<!-- /.content-wrapper -->	
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
					<!-- /.box-header -->
					<div class="box-body">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th class = "">예약 시작일</th>
									<th class = "">예약 종료일</th>
									<th class = "">회의 구분</th>
									<th class = "">회의명</th>
								</tr>
							</thead>
			               <tbody>
							<c:forEach var="mypage" items="${historyFilteringList}">
								<tr>
									<td>${mypage.startDate}</td>
									<td>${mypage.endDate}</td>
									<td>${mypage.category}</td>
									<td>${mypage.purpose}</td>
								</tr>
							</c:forEach>
							</tbody>			               		       
						</table>
					</div>
					<!-- /.box-body -->
				<!-- /.box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
	<!-- /.content-wrapper -->
				</div>	
				<!-- /. box -->	
			</div>
			<!-- /.col(right:col-md-9) -->
			</div>
			</section>
		</div>
		<!-- /.row -->


<script>
	$(function() {
		/** DatePicker **/
		$('#reservationtime').daterangepicker({
			timePicker : false,
			format : 'YYYY/MM/DD',
			locale: {format : 'YYYY/MM/DD'},
	      	startDate: moment().add(0, 'year'),
	      	endDate: moment().add(0, 'year')     	
		})
	})
</script>

<script>
	$(function() {
		$('#example1').DataTable({
			'paging' : true,
			'lengthChange' : false,
			'searching' : false,
			'ordering' : true,
			'info' : true,
			'autoWidth' : false
		})
	})
</script>

              
              