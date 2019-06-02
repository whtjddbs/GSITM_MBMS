<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>근무지 리스트</h1>
		<ol class="breadcrumb">
			<li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Notice</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">근무지 목록</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="row">
							<div class="col-sm-6">
								지역구 <select>
									<option>종로구</option>
									<option>영등포구</option>
									<option>강남구</option>
									<option>용산구</option>
								</select>
							</div>
							<div class="col-sm-6"></div>
						</div>
						<table id="buildingListTable"
							class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>건물번호</th>
									<th>건물이름</th>
									<th>주소</th>
									<th>우편번호</th>
									<th>비고</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="building">
									<tr>
										<td>${building.buildNo }</td>
										<td>${building.buildName }</td>
										<td>${building.buildAddr }</td>
										<td>${building.buildPost }</td>
										<td>
											<button type="button" class="btn btn-info btn-sm"
												data-toggle="modal" data-target="#modal-info_${building.buildNo }">
												회의실정보</button> 
												
											<input type="button"
											class="btn btn-warning btn-sm" value="수정하기"
											id="${building.buildNo }_updateBtn"
											onclick="location.href='/building/buildingUpdateForm?buildNo=${building.buildNo}'">

											<input type="button" class="btn btn-danger btn-sm"
											data-toggle="modal"
											data-target="#modal-danger_${building.buildNo}" value="삭제하기">


											<div class="modal modal-danger fade"
												id="modal-danger_${building.buildNo}">
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
															<p>${building.buildName }을정말로삭제하시겠습니까?&hellip;</p>
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

									<div class="modal modal-info fade" id="modal-info_${building.buildNo }">
										<!-- 건물 상세보기 modal div -->
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
													<h4 class="modal-title">${building.buildName } 회의실내역</h4>
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
									<!-- /.modal -->
								</c:forEach>



							</tbody>
							<tfoot>
								<tr>
									<th>Rendering engine</th>
									<th>Browser</th>
									<th>Platform(s)</th>
									<th>Engine version</th>
									<th><input type="button" class="btn btn-primary"
										value="근무지 등록하기" id="buildingInsertBtn"
										onclick="location.href='/building/buildingInsertForm'"></th>
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
	$(document).ready(function() {
		$('#example1').DataTable()
		$('#buildingListTable').DataTable({
			'paging' : true,
			'lengthChange' : false,
			'searching' : true,
			'ordering' : true,
			'info' : true,
			'autoWidth' : false
		})
	})
</script>