<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="../../../resources/dist/js/postSearch.js"></script>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>근무지 등록</h1>
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
					<!-- /.box-header -->
					<div class="box-body">
						<form role="form" action="/room/roomInsert" method="post">
							<!-- text input -->
							<div class="form-group">
								<label>회의실이름</label> <input type="text" class="form-control"
									name="roomName" placeholder="Enter ...">
							</div>

							<label>RoomSpace</label>
							<div class="row">
								<div class="col-xs-3">
									<input type="number" class="form-control" name="roomSpace">
								</div>
							</div>


							<label>수용 인원</label>
							<div class="row">
								<div class="col-xs-7">
									<input type="number" class="form-control" name="roomNumEmp">
								</div>
							</div>

							<label>회의실 담당자</label>
							<div class="row">
								<div class="col-xs-3">
									<input type="text" class="form-control" name="mgrEmpNo">
								</div>
								<div class="col-xs-3">
									<input type="button" class='btn btn-default' value="담당자 찾기"
										id="findEmpBtn">

								</div>
							</div>

							<label>회의실 대표사진</label>
							<div class="row">
								<div class="col-xs-3">
									<input type="text" class="form-control" name="roomImg">
								</div>
								<div class="col-xs-3">
									<input type="button" class='btn btn-default' value="이미지 찾기"
										id="findImgBtn">
								</div>
							</div>

							<label>시간 당 가격</label>
							<div class="row">
								<div class="col-xs-3">
									<select name="roomPrice" class="form-control">
										<option value="">시간당 비용</option>
										<option value="5000">5,000원 / 1시간</option>
										<option value="10000">10,000원 / 1시간</option>
										<option value="20000">20,000원 / 1시간</option>
									</select>
								</div>
							</div>

							<label>네트워크 사용유무</label>
							<div class="row">
								<div class="col-xs-3">
									<label><input type="radio" class="custom-control-input"
										name="networkYn" value="y"> 사용가능</label> <label><input
										type="radio" class="custom-control-input" name="networkYn"
										value="n"> 불가능</label>
								</div>
							</div>

							<label>roomFloor</label>
							<div class="row">
								<div class="col-xs-3">
									<input type="number" class="form-control" name="roomFloor">층
								</div>
							</div>


							<label>roomType</label>
							<div class="row">
								<div class="col-xs-3">
									<label><input type="radio" class="custom-control-input"
										name="roomType" value="회의실"> 회의실</label> <label><input
										type="radio" class="custom-control-input" name="roomType"
										value="교육실"> 교육실</label>
								</div>
							</div>

							<div class="form-group" align=center>
								<input type="submit" class='btn btn-success' value="등록완료">
								<input type="reset" class='btn btn-danger' value="등록취소">
								<input type="button" class='btn btn-default' value="뒤로가기"
									onClick="history.back();">
							</div>
						</form>
					</div>
				</div>
				<!-- /.row -->
			</div>
		</div>
	</section>
	<!-- /.content -->
</div>
<!-- 담당자 찾기 모달  -->
<div class="modal fade" id="findEmpModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">담당자 찾기</h4>
			</div>
			<div class="modal-body">
				<p>여기서 이것저것 해보자~ &hellip;</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default pull-left"
					data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

</body>
<script>
	$(document).ready(function(){
		$("#findEmpBtn").click(function(){
			$("#findEmpModal").modal();
		})
	})
</script>
</html>