<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        예약 현황 관리
        <small>Statistics</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">예약 관리</a></li>
        <li class="active">현황 관리</li>
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
              <h3 class="box-title">데이터 필터링</h3><br>
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
					<table class="table table-bordered table-striped">
            	
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
									<th class = "">승인여부</th>
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
												<td>${histDTO.category}</td>
												<td>
													<c:if test='${histDTO.approval2Yn==1}'>최종승인됨</c:if>
													<c:if test='${histDTO.approval1Yn==1 && histDTO.approval2Yn==0}'>1차승인</c:if>
													<c:if test='${histDTO.approval1Yn==0 && histDTO.reason==null}'>미승인</c:if>
													<c:if test='${histDTO.reason!=null}'> 반려</c:if>
												</td>
												<td>
													<a data-toggle="modal"  href="#modal-active_${histDTO.reserveNo}">${histDTO.title}</a>
												
											
											
											
											
											
											
											
											
											
											<div class="modal modal-active fade" id="modal-active_${histDTO.reserveNo}">
														<!-- 예약 상세보기 modal div -->
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
					
																<h4 class="modal-title">상세 예약내역</h4>
															</div>
															
															<div class="modal-body"><!-- 
																<p><strong>예약정보</strong></p>	 -->		
																<div class="col-md-12">											
																	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
																		<label>예약번호</label>
																		<input type="text" class="form-control pull-right" value='${histDTO.reserveNo}' readonly>
																	</div>
																	
																	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
																		<label>회의실명</label>
																		<input type="text" class="form-control pull-right" value='${histDTO.roomName}'readonly>
																	
																	</div>
																	
																	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
																		<label>예약자</label>
																		<input type="text" class="form-control pull-right" value='${histDTO.reserveEmpNo} ${histDTO.empName} ${histDTO.empPosition}'readonly>
																	</div>
																	
																	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
																		<label>회의시작</label>
																		<input type="text" class="form-control pull-right" value='${histDTO.startDate}'readonly>
																	</div>
																	
																	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
																		<label>회의종료</label>
																		<input type="text" class="form-control pull-right" value='${histDTO.endDate} 'readonly>
																	</div>
																	
																	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
																		<label>1차결재일</label>
																		<input type="text" class="form-control pull-right" value='${histDTO.approval1Date}'readonly>
																	</div>
																	
																	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
																		<label>2차결재일</label>
																		<input type="text" class="form-control pull-right" value='${histDTO.approval2Date}'readonly>
																	</div>
																	
																	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
																		<label>예약신청일</label>
																		<input type="text" class="form-control pull-right" value='${histDTO.reserveDate}'readonly>
																	</div>
																	
																	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
																		<label>회의목적</label>
																		<input type="text" class="form-control pull-right" value='${histDTO.purpose}'readonly>
																	</div>
																	
																	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
																		<label>회의구분</label>
																		<input type="text" class="form-control pull-right" value='${histDTO.category}'readonly>
																	</div>
																	
																	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
																		<label>중요도</label>
																		<input type="text" class="form-control pull-right" value='${histDTO.priority}'readonly>
																	</div>
																	
																	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
																		<label>참석인원수</label>
																		<input type="text" class="form-control pull-right" value='${histDTO.empCount}'readonly>
																	</div>
																	
																	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
																		<label>간식준비여부</label>
																		<input type="text" class="form-control pull-right" value='${histDTO.snackYn}'readonly>
																	</div>
																	
																	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
																		<label>근무지명</label>
																		<input type="text" class="form-control pull-right" value='${histDTO.buildName}'readonly>
																	</div>
																	
																	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
																		<label>신청부서명</label>
																		<input type="text" class="form-control pull-right" value='${histDTO.deptName} 'readonly>
																	</div>
																	
																	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
																		<label>회의실타입</label>
																		<input type="text" class="form-control pull-right" value='${histDTO.roomType}'readonly>
																	</div>
																	
																	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
																		<label>회의비용</label>
																		<input type="text" class="form-control pull-right" value='${histDTO.reservePrice}'readonly>
																	</div>
																	
																	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
																		<label>반려사유(반려된 경우)</label>
																		<input type="text" class="form-control pull-right" value='${histDTO.reason}'readonly>
																	</div>
																	
																	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
																		<label>회의제목</label>
																		<input type="text" class="form-control pull-right" value='${histDTO.title}'readonly>
																	</div>
																</div>
																<p>　</p>
															</div>
															
													<div class="modal-footer">
													<button type="button" class="btn  btn-info col-sm-12" data-dismiss="modal" aria-label="Close">
																	<span aria-hidden="true">확인</span>
																</button>
													</div>
													
													
													</div>
												<!-- /.modal-content -->
												</div>
												<!-- /.modal-dialog -->
												</div>	
					
											
											</td>
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


<script>
	$(function() {
		/* $('#example1').DataTable()  */
		$('#example1').DataTable({
			'paging' : true,
			'lengthChange' : true,
			'searching' : true,
			'ordering' : true,
			'info' : true,
			'autoWidth' : true,
			"order": [[ 4, "desc" ]]
		})
	})
</script>

