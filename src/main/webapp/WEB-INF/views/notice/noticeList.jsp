<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.notice_col1 { width: 10%; }
	.notice_col2 { width: 10%; }
	.notice_col3 { width: 50%; }
	.notice_col4 { width: 10%; }
	.notice_col5 { width: 20%; }


</style>

<!-- 아래 테이블 내림차순 정렬하는 자바스크립트 -->
<script type="text/javascript">
	$(document).ready(function() {
		
	    $('#example1').DataTable( {
	        "order": [[ 0, "desc" ]]
	    	
	    } );
	   
	    
	} );
</script>






<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			공지사항
		</h1>
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
						<h3 class="box-title">MBMS 공지사항</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
							
								<tr>
									<th class = "notice_col1">글번호</th>
									<th class = "notice_col2">작성자</th>
									<th class = "notice_col3">제목</th>
									<th class = "notice_col4">첨부</th>
									<th class = "notice_col5">작성일</th>
								</tr>
							</thead>
							<tbody>
	
								<c:forEach var="noticeDTO" items="${noticeList}">
									<tr>
										
										
											<td>${noticeDTO.notice_no}</td>
											<td>${noticeDTO.writer_emp_no}</td>
											<td><a href='view?notice_no=${noticeDTO.notice_no}'>${noticeDTO.notice_subject}</a></td>
											<td>미구현</td>
											<td>${noticeDTO.notice_date}</td>
										
										
									</tr>
								</c:forEach>
								
								
								
								
							</tbody>
							<tfoot>
								<tr>
									<th>글번호</th>
									<th>작성자</th>
									<th>제목</th>
									<th>첨부</th>
									<th>작성일</th>
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
		$('#example1').DataTable()
		$('#example2').DataTable({
			'paging' : true,
			'lengthChange' : false,
			'searching' : false,
			'ordering' : true,
			'info' : true,
			'autoWidth' : false
		})
	})
</script>