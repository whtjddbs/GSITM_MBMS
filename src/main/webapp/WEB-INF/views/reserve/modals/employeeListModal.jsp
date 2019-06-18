<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.employeeList-left {overflow: scroll; overflow-y: hidden;}
	.employeeList-right {}
	#employeeListTable {width: 100%;}
	table.dataTable tbody tr.selected {
        color: white;
        background-color: #eeeeee;  /* Not working */
    }
</style>

<!-- modal -->
<div class="modal fade" id="employeeList-modal">
	<div class="modal-dialog modal-lg">
	  <div class="modal-content">
	    <div class="modal-header">
	      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        <span aria-hidden="true">&times;</span></button>
	      <h4 class="modal-title">참석 명단</h4>
	    </div>
	    <div class="modal-body">
	    	<!-- 모달 내용 -->
	    	<div class="row employeeList-body">
		    	<div class="col-lg-3 employeeList-left">
		    		<h4>조직도</h4>
		    		<div id="jstree_demo_div"></div>
		    	</div>
		    	<div class="col-lg-6 employeeList-md">
		    		<table id="employeeListTable" class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>사원번호</th>
								<th>이름</th>
								<th>직함</th>
								<th>부서번호</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${employees }" var="employee" varStatus="status">
								<tr role='row'>
									<td>${employee.EMPNO }</td>
									<td>${employee.EMPNAME }</td>
									<td>${employee.EMPPOSITION }</td>
									<td>${employee.DEPT_NAME }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
		    	</div>
		    	<div class="col-lg-3 employeeList-right">
		    		<h4>참석자 명단</h4>
		    		<ul id="attendants-list">
		    			<li>조성윤 인턴</li>
		    			<li>조성윤 인턴</li>
		    		</ul>
		    	</div>
	    	</div>
	    </div>
	    <div class="modal-footer">
	      <button type="button" class="btn btn-primary col-lg-2 pull-right">확인</button>
	      <button type="button" class="btn btn-default col-lg-2 pull-right" data-dismiss="modal">취소</button>
	    </div>
	  </div>
	  <!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- jsTree -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<!-- dataTable extension select -->
<link rel="stylesheet" href="https://cdn.datatables.net/select/1.3.0/css/select.dataTables.min.css">
<script src="https://cdn.datatables.net/select/1.3.0/js/dataTables.select.min.js"></script>
<!-- dataTable extension buttons -->
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.bootstrap.min.css">
<script src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>

<script>
	$(function(){
		var depts = new Array();
		<c:forEach items="${departments}" var="dept">
			var deptObject = new Object();
			deptObject.id = '${dept.DEPT_NO}';
			deptObject.parent = '${dept.MGR_DEPT_NO}'=='' ? '#' : '${dept.MGR_DEPT_NO}';
			deptObject.text = '${dept.DEPT_NAME}';
			deptObject.icon = "fa fa-folder-o";
			depts.push(deptObject);
		</c:forEach>
		
		$('#jstree_demo_div').jstree({'core' : {
			'data' : depts
		}});
		
		$('#jstree_demo_div').bind('select_node.jstree', function(event, data){
		    var id = data.instance.get_node(data.selected).id;        //id 가져오기
		    var text = data.instance.get_node(data.selected).text; 
		    $('input[type=search]').val(text);
		    $('input[type=search]').trigger('keyup');
		})

		var table = $('#employeeListTable').DataTable({
			'lengthChange' : false,
			'searching' : true,
			'ordering' : true,
			'info' : false,
			'autoWidth' : false,
			'order' : [ [ 1, "asc" ] ],
			'destroy': true,
			'dom': '<"top"f>rt<"bottom"p><"clear">',
			select: {
	            style: 'multi'
	        },
	        "columnDefs": [
	            {
	                "targets": [ 3 ],
	                "visible": false
	            }
	        ]
		});
	});
</script>