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
			<div class="col-md-8">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">회의실 등록</h3>
					</div>
					<div class="box-body">
						<div class="col-md-12">
							<div class="form-group">
								<form role="form" action="/room/roomInsert" method="post"
									enctype="multipart/form-data">
									<!-- text input -->
									<div class="col-sm-6">
										<label>회의실이름</label> <input type="text" class="form-control"
											name="roomName" placeholder="Enter ...">
									</div>

									<div class="col-sm-6">
										<label>RoomSpace</label> <input type="number"
											class="form-control" name="roomSpace">
									</div>

									<div class="col-xs-6">
										<label>수용 인원</label> <input type="number" class="form-control"
											name="roomNumEmp">
									</div>
									
									<label>회의실 담당자</label>
									<div class="col-xs-6">
										<div class="col-xs-4">
										 	<input type="text" class="form-control"
											name="mgrEmpNo" id="mgrEmpNo">
										</div>
										
										<div class="col-xs-2">
											<input type="button" class='btn btn-default' value="담당자 찾기"
												id="findEmpBtn">
										</div>
</div>
									<div class="col-sm-6">
										<label for="buildingSelect">지사</label> 
										<select name="buildNo" id="buildingSelect" class="form-control">
											<option value="">전체</option>
											<c:forEach var="building" items="${buildings }">
												<option value="${building.buildNo }">${building.buildName }</option>
											</c:forEach>
										</select>
									</div>

									<div class="col-xs-12">
										<label>회의실 대표사진</label>
										<div class=selectedImg>
											<img src=""></img>
										</div>
										<input type="file" value="이미지 찾기" id="roomImg" name="file">
									</div>

									<div class="col-xs-6">
										<label>시간 당 가격</label> <select name="roomPrice"
											class="form-control">
											<option value="">시간당 비용</option>
											<option value="5000">5,000원 / 1시간</option>
											<option value="10000">10,000원 / 1시간</option>
											<option value="20000">20,000원 / 1시간</option>
										</select>
									</div>

									<div class="col-xs-6">
										<label>roomFloor</label> <input type="number"
											class="form-control" name="roomFloor">
									</div>

									<!-- 네트워크 사용가능 유무 -->
									<div class="col-sm-12">
										<label class="control-label">네트워크 유/무</label>
										<div class="col-sm-12">
											<label class="col-sm-6"> 
												<input type="radio" name="networkYn" class="minimal" checked value="y"> Yes
											</label>
											 <label class="col-sm-6"> 
											 	<input type="radio" name="networkYn" class="minimal" value="n"> No
											</label>
										</div>
									</div>

									<div class="col-sm-12">
										<label class="control-label">roomType</label>
										<div class="col-sm-12">
											<div class="col-sm-6">
												<label><input type="radio"
													class="custom-control-input" name="roomType" value="회의실">
													회의실</label>
											</div>
											<div class="col-sm-6">
												<label><input type="radio"
													class="custom-control-input" name="roomType" value="교육실">
													교육실</label>
											</div>
										</div>
									</div>

									<div class="col-xs-12" align=center>
										<input type="submit" class='btn btn-success' value="등록완료">
										<input type="reset" class='btn btn-danger' value="등록취소">
										<input type="button" class='btn btn-default' value="뒤로가기"
											onClick="history.back();">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
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
				<div class="col-sm-3">
				</div>
				<table id="empListTable" class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>사원번호</th>
							<th>이름</th>
							<th>직금</th>
							<th>이메일</th>
							<th>전화번호</th>
							<th>사무실번호</th>
							<th>부서번호</th>	
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${employees }" var="emp" varStatus="status">
							<tr role='row'>
								<td><img src='${emp.empNo }' style="width: 300px;"></td>
								<td>${emp.empName }</td>
								<td>1. 강의용 책상, 의자<br>2. 빔프로젝터<br>3. 음향기기
								</td>
								<td>${emp.empPosition }명</td>
								<td>시간당 ${room.roomPrice }원</td>
								<td><input type="button" class="btn btn-danger btn-sm reserveBtn" id="${room.roomNo }"
									value="예약 하기"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
	
	$("#roomImg").change(function(){
		if(this.files && this.files[0]){
			var reader = new FileReader;
			reader.onload = function(data){
				$(".selectedImg img").attr("src",data.target.result).width(500);
			}
		}
		reader.readAsDataURL(this.files[0]);
	})
	
	$("#findEmpBtn").click(function(){
		$.ajax({
			type:"POST",
			url:"/room/getEmployeeSearch",
			dataType:"json",
			success:function(data){
				$("#empListTable tbody").empty();
				
				$.each(data.employees,function(index,item){
					$('<tr />').append($('<td/>',{
						text : item.EMPNO
					})).append($('<td/>',{
						text : item.EMPNAME
					})).append($('<td/>',{
						text : item.EMPPOSITION
					})).append($('<td/>',{
						text : item.EMPEMAIL
					})).append($('<td/>',{
						text : item.EMPCELLPHONE
					})).append($('<td/>',{
						text : item.EMPOFFICEPHONE
					})).append($('<td/>',{
						text : item.DEPT_NAME
					})).appendTo($('#empListTable tbody'));
					
				});
				table = $('#empListTable').DataTable({
	       			'paging' : true,
	       			'lengthChange' : false,
	       			'searching' : true,
	       			'ordering' : true,
	       			'info' : true,
	       			'autoWidth' : true,
	       			'order' : [ [ 1, "desc" ] ],
	       			"destroy": true,
	       			"pagingType" : "full_numbers"
	       		});

			},
			error:function(data){
				alert('error');
			}
		})
	})
	$("#empListTable").on("click"," tbody tr",function(){
		var searchValue = $("td:eq(0)",this).text();
		$("#mgrEmpNo").val(searchValue);
		$('#findEmpModal').modal('hide');
	})
})
		
</script>


</html>