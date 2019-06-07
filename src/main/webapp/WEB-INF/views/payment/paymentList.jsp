<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>결제 관리
        <small>사용자들의 결제 현황입니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a href="#">DEPARTMENT HEAD</a></li>
        <li class="active">결제 관리</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">비용 결제 리스트</h3>
                         <input type="button" class="btn btn-primary" value="EXCEL로 내보내기" style="float: right;">
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th><input type="checkbox" name="_selected_all_"></th>
                  <th>일자</th>
                  <th>회의 구분</th>
                  <th>신청자</th>
                  <th>비용(원)</th>
                  <th>결제 상태</th>                  
                </tr>
                </thead>
                
                <!--  
                <tbody>
                <tr>
                 <td><input type="checkbox" name="_selected_" value="ROW_1"></td>
					<td>2019.06.07</td>
					<td>내부 회의</td>
					<td>사용자1</td>
					<td>80,000</td>
					<td>결제완료</td>
                </tr>
                 </tbody>
                -->
                
                <tbody>
				<c:forEach var="ReserveHistoryDTO" items="${paymentList}">
					<tr>
					<td><input type="checkbox" name="_selected_" value="ROW_1"></td>
						<td>${ReserveHistoryDTO.startDate}</td>
						<td>${ReserveHistoryDTO.reserveNo}</td>
						<td>${ReserveHistoryDTO.reserveEmpNo}</td>
						<td>${ReserveHistoryDTO.reservePrice}</td>
						<td>${ReserveHistoryDTO.paymentYn}</td>	
					</tr>
				</c:forEach>
				</tbody>
				
                <tfoot>
                <tr>
                  <th><input type="checkbox" name="_selected_all_"></th>
                  <th>일자</th>
                  <th>회의 구분</th>
                  <th>신청자</th>
                  <th>비용(원)</th>
                  <th>결제 상태</th>
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
  
  
  
<script>
//전체선택 및 해제 기능
$('input[name=_selected_all_]').on('change', function(){
$('input[name=_selected_]').prop('checked', this.checked);
});

//선택한 Checkbox 값 가져오기
var arr = $('input[name=_selected_]:checked').serializeArray().map(function(item) { return item.value });
</script>

<script>
	$(function() {
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
    