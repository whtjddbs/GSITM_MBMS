<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>회의실 검색</h1>
		<ol class="breadcrumb">
			<li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Calendar</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-8">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">조건 검색</h3>
					</div>
					<div class="box-body">
						<!-- 지사 선택 -->
						<div class="form-group">
							<label for="buildingSelect">지사</label> <select
								name="buildingSelect" id="buildingSelect" class="form-control">
								<option value="">전체</option>
								<c:forEach var="building" items="${buildings }">
									<option value="${building.buildNo }">${building.buildName }</option>
								</c:forEach>
							</select>
						</div>

						<!-- 장소유형 선택 -->
						<div class="form-group">
							<label>장소유형</label> <select name="roomTypeSelect"
								id="roomTypeSelect" class="form-control">
								<option value="">전체</option>
								<option value="회의실">회의실</option>
								<option value="교육실">교육실</option>
							</select>
						</div>

						<!-- Date and time range -->
						<div class="form-group">
							<label>예약 날짜</label>
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-clock-o"></i>
								</div>
								<input type="text" class="form-control pull-right"
									id="reservationtime">
							</div>
							<!-- /.input group -->
						</div>

						<!-- 회의실 규모 -->
						<div class="input-group form-group">
							<span class="input-group-addon">참석인원</span> <input type="number"
								placeholder="최대인원 (명)" class="form-control input-sm">
						</div>
						<!-- 네트워크 사용 유무 -->
						<div class="form-group">
							<div class="input-group col-sm-12">
								<label class="control-label">네트워크 유/무</label>
								<div class="col-sm-12">
									<label class="col-sm-6"> <input type="radio"
										name="networkYn" class="minimal" checked> Yes
									</label> <label class="col-sm-6"> <input type="radio"
										name="networkYn" class="minimal"> No
									</label>
								</div>
							</div>
						</div>

						<!-- 네트워크 사용 유무 -->
						<div class="form-group">
							<div class="input-group col-sm-12">
								<label class="control-label">다과준비 유/무</label>
								<div class="col-sm-12">
									<label class="col-sm-6"> <input type="radio"
										name="snackYn" class="minimal" checked> Yes
									</label> <label class="col-sm-6"> <input type="radio"
										name="snackYn" class="minimal"> No
									</label>
								</div>
							</div>
						</div>

						<input type="button" class="btn  btn-info col-sm-12"
							id="availableRoomSearchBtn" value="검색">

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