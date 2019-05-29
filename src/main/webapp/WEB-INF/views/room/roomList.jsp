<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
						<h3 class="box-title">지사명</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="row">
							<div class="col-sm-6">
								<select>
									<option value="">전체</option>
									<option value="삼환빌딩">삼환빌딩</option>
									<option value="GS강남타워">GS강남타워</option>
								</select>
								<select>
									<option>몰디브</option>
									<option>1층교육장</option>
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
									<th>비고</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${rooms }" var="room" varStatus="status">
									<tr>
										<td><img src='${room.roomImg }' style="width: 300px;"></td>
										<td>${room.roomName }</td>
										<td>1. 강의용 책상, 의자<br>2. 빔프로젝터<br>3. 음향기기</td>
										<td>${room.roomNumEmp }명</td>
										<td>시간당 ${room.roomPrice }원</td>
										<td><input type="button" class="btn btn-danger btn-sm" value="예약 하기"></td>
									</tr>
								</c:forEach>
								<!-- Sample -->
								<tr>
									<td><img src='/resources/img/room/room001.jpg' style="width: 300px;"></td>
									<td>1층 교육장</td>
									<td>1. 강의용 책상, 의자<br>2. 빔프로젝터<br>3. 음향기기</td>
									<td>00명</td>
									<td>시간당 10,000원</td>
									<td><input type="button" class="btn btn-danger btn-sm" value="예약 하기"></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<th>회의실 사진</th>
									<th>회의실명</th>
									<th>주요시설</th>
									<th>수용인원</th>
									<th>요금</th>
									<th>비고</th>
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

<!-- page script -->
<script>
	$(function() {
		var table = $('#roomListTable').DataTable({
			'paging' : true,
			'lengthChange' : false,
			'searching' : false,
			'ordering' : true,
			'info' : true,
			'autoWidth' : true,
			'order' : [ [ 1, "desc" ] ],
			"pagingType" : "full_numbers"
		})
	})
</script>