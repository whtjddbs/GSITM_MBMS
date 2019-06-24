<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        예약 통계
        <small>Statistics</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">예약 관리</a></li>
        <li class="active">통계</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">

        <!-- /.col (LEFT) -->
        <div class="col-md-12">

          <!-- BAR CHART -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">그래프 시각화</h3><br>
              <h3 class="box-title">　</h3>
			    <form id="availableRoomListForm" method="get" action="/stats/statsHistory">           
			   
			
				
					<div class="col-md-4">
						<div class="form-group">
							<label>근무지명</label> <select name="buildingSelect" class="form-control">
								<option value="전체" selected="selected">전체</option>
								<c:forEach var="buildingDTO" items="${buildingList}">
									<option value="${buildingDTO.buildName}">${buildingDTO.buildName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				
				
				
				
				
				
				
					<div class="col-md-4">
						<div class="form-group">
							<label>부서명</label> <select name="deptSelect" class="form-control">
								<option value="전체" selected="selected">전체</option>
								<c:forEach var="departmentDTO" items="${departmentList}">
									<option value="${departmentDTO.deptName}">${departmentDTO.deptName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label>회의실구분</label> <select name="roomTypeSelect" class="form-control">
								<option value="전체" selected="selected">전체</option>
								<c:forEach var="roomtype" items="${roomTypes}">
									<option value="${roomtype}">${roomtype}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
				
				
					<div class="col-md-8">
						
						<!-- Date and time range -->
						<div class="form-group">
							<label>검색 날짜 (시작 - 끝)</label>
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-clock-o"></i>
								</div>
								<input type="text" class="form-control pull-right"
									name="timeSelect" id="reservationtime" value='전체'>
							</div>
							<!-- /.input group -->
						</div>
				
					</div>
				
					<div class="col-md-4">
						<div class="form-group">
							<label>검색하기</label> <input type="submit"
								class="btn  btn-info col-sm-12" value="검색">
						</div>
					</div>
				
</form>

	
              <div class="box-tools pull-right">
             
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            
            <div class="box-body">
            <div class="col-md-12">
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          
          
        






<div class="box box-success">
<!-- /.content-wrapper -->	
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
					<!-- /.box-header -->
					<h4 class="box-title">필터링된 데이터</h4>
					<div class="box-body">
					<table id="example1" class="table table-bordered table-striped">
            	
              		<tr>
              			<td>
              				<label> 검색 필터 - 근무지 : ${filterMap.buildingSelect}, 부서명: ${filterMap.deptSelect}, 회의실구분: ${filterMap.roomTypeSelect}, 날짜: ${filterMap.timeSelectStart} ~ ${filterMap.timeSelectEnd}</label> 
  						<td>
  						
              		</tr>
              		
              	</table>
              	<br>
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th class = "">근무지명</th>
									<th class = "">신청부서</th>
									<th class = "">회의실명</th>
									<th class = "">예약자명</th>
									<th class = "">회의시작</th>
									<th class = "">회의끝</th>
									<th class = "">회의종류</th>
									<th class = "">상세보기</th>
								</tr>
							</thead>
							<tbody>
					              <c:forEach var="histDTO" items="${historyList}">
										<tr>
											
												<td>${histDTO.buildName}</td>
												<td>${histDTO.deptName}</td>
												<td>${histDTO.roomName}</td>
												<td>${histDTO.empName} ${histDTO.empPosition}</td>
												<td>${histDTO.startDate}</td>
												<td>${histDTO.endDate}</td>
												<td><a href='noticeDetail?noticeNo=${histDTO.category}'>${histDTO.category}</a></td>
												<td>${histDTO.purpose}</td>
											
											
										</tr>
									</c:forEach>
				                </tbody>
				                <tfoot>
				           <!--      <tr>
									<th class = "">근무지명</th>
									<th class = "">신청부서</th>
									<th class = "">회의실명</th>
									<th class = "">예약자명</th>
									<th class = "">시작날짜</th>
									<th class = "">끝날짜</th>
									<th class = "">회의종류</th>
									<th class = "">상세보기</th>
				                </tr> -->
				                </tfoot>
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
</div>










        </div>
        <!-- /.col (RIGHT) -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
  
  
  
  
  
  






<script>
	$(function() {

		/** DatePicker **/
		//Date range picker with time picker
		$('#reservationtime').daterangepicker({
			timePicker : false,
			format : 'YYYY/MM/DD',
			locale: {format : 'YYYY/MM/DD'},
	      	startDate: moment().add(-1, 'year'),
	      	endDate: moment().add(0, 'year')
	      	
		})
		

	})
</script>
