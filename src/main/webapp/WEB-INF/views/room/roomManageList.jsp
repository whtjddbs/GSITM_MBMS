<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>회의실 소개</h1>
		<ol class="breadcrumb">
			<li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">RoomList</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">전체</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="row">
							<div class="col-sm-3">
								<label for="buildingSelect">지사</label> <select
									name="buildingSelect" id="buildingSelect" class="form-control">
									<option value="">전체</option>
									<c:forEach var="building" items="${buildings }">
										<option value="${building.buildNo }">${building.buildName }</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-sm-3">
								<label for="roomTypeSelect">구분</label> <select
									name="buildingTypeSelect" id="roomTypeSelect"
									class="form-control">
									<option value="">전체</option>
									<option value="회의실">회의실</option>
									<option value="교육실">교육실</option>
								</select>
							</div>
							<div class="col-sm-6"></div>
						</div>
						<table id="roomListTable" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>회의실 사진</th>
									<th>회의실명</th>
									<th>주요시설</th>
									<th>수용인원</th>
									<th>요금</th>
									<th>지사</th>
									<th>구분</th>
									<th>비고</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${rooms }" var="room" varStatus="status">
									<tr role='row'>
										<td><img src='${room.roomImg }' style="width: 300px;">?</td>
										<td>${room.roomName }</td>
										<td>1. 강의용 책상, 의자<br>2. 빔프로젝터<br>3. 음향기기</td>
										<td>${room.roomNumEmp }명</td>
										<td>시간당 ${room.roomPrice }원</td>
										<td>${room.buildNo}</td>
										<td>${room.roomType}</td>
										<td>
											<input type="button" class="btn btn-info btn-sm infoBtn"
												data-toggle="modal" id="roomView_${room.roomNo }"
												data-target="#modal-info_${building.buildNo }" value="상세보기">
											
												
											<input type="button" class="btn btn-warning btn-sm updateBtn"
											value="수정하기" id="${room.roomNo }"
											onclick="location.href='/building/buildingUpdateForm?buildNo=${building.buildNo}'">

											<input type="button" class="btn btn-danger btn-sm deleteBtn"
											data-toggle="modal"
											data-target="#modal-danger_${building.buildNo}" value="삭제하기" id="roomDelete_${room.roomNo }" >
											
										<div class="modal modal-info fade" id="roomView_${room.roomNo }_modal">
										<!-- 건물 상세보기 modal div -->
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
													<h4 class="modal-title">${building.buildName } 비품내역</h4>
												</div>
												<div class="modal-body">
													<p>준비중 <br>준비중<bR>준비중 <br>&hellip;</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-outline pull-left"
														data-dismiss="modal">닫기</button>
													
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>


											 <div class="modal modal-danger fade"
												id="roomDelete_${room.roomNo}_modal">
												<!-- 삭제 modal div -->
												<!-- Modal Div -->
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h4 class="modal-title">근무지 삭제하기</h4>
														</div>
														<div class="modal-body">
															<p>${room.roomName }을정말로삭제하시겠습니까?&hellip;</p>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-outline pull-left"
																data-dismiss="modal">취소</button>
															<button type="button" class="btn btn-outline"
																onclick="location.href='/building/buildingDelete?buildNo=${building.buildNo}'">삭제하기</button>
														</div>
													</div>
													<!-- /.modal-content -->
												</div>
												<!-- /.modal-dialog -->
											</div> <!-- /.modal -->
										</td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<th>Rendering engine</th>
									<th>Browser</th>
									<th>Platform(s)</th>
									<th>Engine version</th>
									<th >원빈</th>
									<th >원빈</th>
									<th>Platform</th>
									<th><input type="button" class="btn btn-primary"
										value="회의실 등록하기" id="roomInsertBtn"
										onclick="location.href='/room/roomInsertForm'"></th>
								</tr>
							</tfoot>
						</table>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->

		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<form action="/reserve/reserveForm" method="post" id="reserveListForm">
	<input type="hidden" id="selectedRoomNo" name="roomNo">
</form>

<!-- page script -->
<script>
	$(function() {
		var table;
		
		table = $('#roomListTable').DataTable({
			'paging' : true,
			'lengthChange' : false,
			'searching' : true,
			'ordering' : true,
			'info' : true,
			'autoWidth' : true,
			'order' : [ [ 1, "desc" ] ],
			"destroy": true,
			"pagingType" : "full_numbers",
			"columnDefs" : [ {
				"targets" : [ 5 ],
				"visible" : false,
				"searchable" : true
				}, {
				"targets" : [ 6 ],
				"visible" : false,
				"searchable":true
				} ]
		});
		
		//조건별 회의실 검색
	      $(document).on('change', '#buildingSelect, #roomTypeSelect', function(){
	         $("input[type='search']").val($("#buildingSelect").val()+" "+$("#roomTypeSelect").val());
	         $("input[type='search']").trigger('keyup');
	      });
		
		$('.content').on('click','.infoBtn',function(){
			alert(this.id);
			let id = "#"+this.id+"_modal";
			$(id).modal();
		})
		
		$('.content').on('click','.updateBtn',function(){
			alert("update");
			let id ="#roomUpdate_"+this.id;
		})
		
		$('.content').on('click','.deleteBtn',function(){
			alert(this.id);
			let id = "#"+this.id+"_modal";
			$(id).modal();
		})
		
/* 	$('#roomListTable').DataTable({
			"columnDefs" : [ {
				"targets" : [ 5 ],
				"visible" : false,
				"searchable" : true
			}, {
				"targets" : [ 6 ],
				"visible" : false,
				"searchable":true
			} ]
		}); */

	})
</script>