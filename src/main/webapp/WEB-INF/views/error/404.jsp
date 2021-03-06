<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>404 Error Page</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Examples</a></li>
			<li class="active">404 error</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="error-page">
			<h2 class="headline text-yellow">404</h2>

			<div class="error-content">
				<h3>
					<i class="fa fa-warning text-yellow"></i> 404 Page not found.
				</h3>

				<p>
					페이지를 찾을 수 없습니다.<br>
					올바른 페이지를 다시 입력하거나 관리자의 도움을 받으세요.
				</p>


				<form class="search-form" method=get action="https://www.google.co.kr/search" target="_blank">
					<div class="input-group">
						<input type="text" name="q" class="form-control" placeholder="Search">

						<div class="input-group-btn">
							<button type="submit" name="submit" class="btn btn-warning btn-flat">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
					<!-- /.input-group -->
				</form>
			</div>
			<!-- /.error-content -->
		</div>
		<!-- /.error-page -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

