<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="/resources/dist/img/user2-160x160.jpg"
					class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>조성윤</p>
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>

		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu" data-widget="tree">
			<!-- 사용자 -->
			<li class="header">EMPLOYEE</li>
			<!-- 공지사항 -->
			<li><a href="/notice/noticeList"><i class="fa fa-book"></i>
					<span>공지사항</span> <span class="pull-right-container"> 
					<!-- <span class="label label-primary pull-right">4</span> -->
				</span>
			</a></li>
			<!-- 회의실 -->
			<li class="treeview"><a href="#"> <i class="fa fa-files-o"></i>
					<span>회의실</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="/reserve/roomList"><i class="fa fa-circle-o"></i> 
							회의실 소개</a></li>
					<li><a href="/reserve/reserveSearchForm"><i class="fa fa-circle-o"></i>
							회의실 검색</a></li>
					<li><a href="/reserve/Calendar"><i class="fa fa-circle-o"></i>
							회의실 예약</a></li>
				</ul></li>
			<!-- 마이페이지 -->
			<li class="treeview"><a href="#"> <i class="fa fa-pie-chart"></i>
					<span>마이페이지</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="charts/chartjs.html"><i class="fa fa-circle-o"></i> 
							예약 현황</a></li>
					<li><a href="charts/morris.html"><i class="fa fa-circle-o"></i>
							예약 이력</a></li>
			</ul></li>
			
			<!-- 상위결재자 -->
			<li class="header">DEPARTMENT HEAD</li>
			<li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>결재 관리</span></a></li>
			<li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>결제 관리</span></a></li>
			
			<!-- 관리자 -->
			<li class="header">MANAGER</li>
			<!-- 회의실 -->
			<li class="treeview"><a href="#"> <i class="fa fa-files-o"></i>
					<span>회의실 관리</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="/building/buildingList"><i class="fa fa-circle-o"></i> 
							근무지 관리</a></li>
					<li><a href="layout/boxed.html"><i class="fa fa-circle-o"></i>
							회의실 관리</a></li>
					<li><a href="layout/fixed.html"><i class="fa fa-circle-o"></i>
							비품 관리</a></li>
				</ul></li>
			<!-- 회의실 -->
			<li class="treeview"><a href="#"> <i class="fa fa-files-o"></i>
					<span>예약 관리</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="layout/top-nav.html"><i class="fa fa-circle-o"></i> 
							예약 현황 관리</a></li>
					<li><a href="layout/boxed.html"><i class="fa fa-circle-o"></i>
							예약 통계</a></li>
				</ul></li>
		</ul>
		<!-- GSITM 로고 -->
		<div class="sidebar-logo">
			<div class="image">
				<img src="/resources/img/gsitm_logo.png"
					class="img-circle" alt="GSITM logo">
			</div>
		</div>
	</section>
	<!-- /.sidebar -->
</aside>

<script>
	$(function(){
		
		var treeviewmenu = $('a[href="'+location.pathname+'"]').parent().parent();
		var treeview = $('a[href="'+location.pathname+'"]').parent().parent().parent();
		$('.treeview').removeClass('menu-open');
		treeview.addClass('menu-open');
		treeviewmenu.css('display', 'block');
		$('a[href="'+location.pathname+'"]').parent().addClass('active');
		
	});
</script>