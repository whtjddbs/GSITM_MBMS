<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/resources/css/scrollbar.css" />
<style>
 	.employeeList-left {overflow: hidden;}
 	.employeeList-right > #style-1 {overflow-x: hidden;}
	
	/* 직원 목록 */
	#employeeListTable {width: 100%;}
	table.dataTable tbody tr.selected {
        color: white;
        background-color: #eeeeee; !important  /* Not working */
    }
    
	/* 참석 명단 */
    #attendants-list {list-style: none;}
    #attendants-list > li {cursor: pointer;}
    #attendants-list-title > * {display: inline-block;}
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
		    		<div class="scrollbar" id="style-1">
						<div class="force-overflow">
							<div id="jstree_demo_div"></div>
						</div>
				    </div>
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
		    		<div id="attendants-list-title">
		    			<h4>참석자 명단</h4>
		    			( <span id="attendants-count">0</span> 명)
		    		</div>
		    		<div class="scrollbar" id="style-1">
						<div class="force-overflow">
							<ul id="attendants-list">
		    				</ul>
						</div>
				    </div>
		    		
		    	</div>
	    	</div>
	    </div>
	    <div class="modal-footer">
	      <button type="button" class="btn btn-primary col-lg-2 pull-right" data-dismiss="modal">확인</button>
	      <button type="button" id="employeeList-modal-reset" class="btn btn-default col-lg-2 pull-right">초기화</button>
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
		
		table.on( 'select', function ( e, dt, type, indexes ) {
		    if ( type === 'row' ) {
		        var data = table.rows( indexes ).data();
		        table.rows( indexes ).remove().draw();
		        
		        $('#attendants-list').append($('<li/>', {
		        	'data-empNo' : data[0][0],
		        	'data-empName' : data[0][1],
		        	'data-empPosition' : data[0][2],
		        	'data-deptNo' : data[0][3],
		        	text : data[0][1] + " " + data[0][2]
		        }));
		        
		        $('#attendants-count').text($('#attendants-list > li').length);
		    }
		} );
		
		$('#attendants-list').on('click', 'li', function() {
			let empno = $(this).data('empno');    
			let empname = $(this).data('empname');    
			let empposition = $(this).data('empposition');  
			let deptno = $(this).data('deptno');    
			table.row.add([empno, empname, empposition, deptno]).draw();
			
			$(this).remove();
			
			$('#attendants-count').text($('#attendants-list > li').length);
		});
		
		$('#employeeList-modal').on('hide.bs.modal', function (e) {
			$('#empCount').val($('#attendants-count').text());
			
			if($('#attendants-count').text() =='1') {
				$('#empList').val($('#attendants-list > li:eq(0)').text());
			} else if($('#attendants-count').text()!='0') {
				$('#empList').val($('#attendants-list > li:eq(0)').text()+" 외 "+(parseInt($('#attendants-count').text())-1)+"명");
			} else {
				$('#empList').val('');
			}
		})
		
		$('#employeeList-modal-reset').click(function(){
			$('#attendants-list > li').trigger('click');
		});
	});
</script>