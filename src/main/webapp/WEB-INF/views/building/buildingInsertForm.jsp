<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
						<form role="form" action="/building/buildingInsert" method="post">
							<!-- text input -->
							<div class="form-group">
								<label>근무지이름</label> <input type="text" class="form-control" name="buildName"
									placeholder="Enter ...">
							</div>
							
							<label>우편 번호</label>
							<div class="row">
								<div class="col-xs-3">
									<input type="text" class="form-control" name="buildPost">
								</div>
								<div class="col-xs-4">
									<input type="button" class="btn btn-default" value="검색하기">
								</div>
							</div>

							<div class="form-group">
								<label>근무지 주소</label>
								<div class="row">
									<div class="col-xs-7">
										<input type="text" class="form-control" name="buildAddr">
									</div>
								</div>
							</div>

							<div class="form-group" align=center>
								<input type="submit" class='btn btn-success' value="등록완료">
								<input type="reset" class='btn btn-danger' value="등록취소">
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
</body>
</html>