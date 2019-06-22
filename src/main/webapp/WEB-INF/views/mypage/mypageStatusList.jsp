<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        예약 현황
        <small>현재 예약 현황을 볼 수 있습니다.</small>
      </h1>
		<ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">My Page</a></li>
        <li class="active">예약현황</li>
      	</ol> 
    </section>   

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-3">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">조건 검색</h3>
						<br>
					</div>
					<div class="box-body">
						<!-- Date and time range -->
						<div class="form-group">
							<label>예약 날짜</label>
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-clock-o"></i>
								</div>
								<input type="text" class="form-control pull-right" id="reservationtime">
							</div>
							<!-- /.input group -->
						</div> 
			            <br><input type="button" class="btn  btn-info col-sm-12" id="availableMypageSearchBtn" value="검색">
					</div><br>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col(left:col-md-3) -->
			
	<div class="col-md-9">
	<div class="box box-primary">
<!-- /.content-wrapper -->		
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
					<!-- /.box-header -->
					<div class="box-body">
						<table id="example1" class="table table-bordered table-striped">
							
							<thead>
								<tr>
									<th class = "">예약일</th>
									<th class = "">회의명</th>
									<th class = "">예약 요청 현황</th>
									<th class = "">비고</th>		
								</tr>
							</thead>
							
							<tbody id="mypage_tbody">
			               
							<c:forEach var="mypage" items="${mypageStatusList}">
								<tr>
									<td>${mypage.startDate}</td>
									<td>${mypage.purpose}</td>
									<td>
										<c:choose>
									        <c:when test="${mypage.approval1Yn == 0 }">1차 승인 대기중</c:when>
									        <c:when test="${mypage.approval1Yn == 1 && mypage.approval2Yn == 0}">2차 승인 대기중</c:when>
									        <c:when test="${mypage.approval1Yn == 1 && mypage.approval2Yn == 1}"><span style = "color:blue">예약 완료 (확정)</span></c:when>
							        	</c:choose>
									</td>
									<td> 	
													<button type="button" class="btn btn-info btn-sm" data-toggle="modal" 
							          					data-target="#modal-info_${mypage.reserveNo}">상세 예약 정보</button>
							          					
							          				<input type="button" class="btn btn-danger btn-sm" data-toggle="modal" 
														data-target="#modal-danger_${mypage.reserveNo}" value="예약 취소 요청">
							          					
													<div class="modal modal-info fade" id="modal-info_${mypage.reserveNo}">
														<!-- 예약 상세보기 modal div -->
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
					
																<h4 class="modal-title">상세 예약내역</h4>
															</div>
													<div class="modal-body">
														<p><strong>예약 신청 정보</strong></p>
														<p>회의 일정 : ${mypage.startDate} ~ ${mypage.endDate} (예약 신청일 : ${mypage.reserveDate})</p>
														<p>회의 장소 : ${mypage.buildName} ${mypage.roomName}</p>
														<p>회의 구분 및 목적 : ${mypage.category} / ${mypage.purpose}</p>
														<p>간식 신청 여부 : ${mypage.snackYn}</p>
														<p>참석자 : ${mypage.empCount}명</p>
														
														<br><p><strong>예약 승인 현황</strong></p>
															<p>1차 결재 : 
														        <c:if test="${mypage.approval1Yn == 0 }">
																	<span>미승인</span>
																</c:if>
																<c:if test="${mypage.approval1Yn == 1 }">
																	<span style = "color:blue">승인 완료</span> (${mypage.approval1Date})
																</c:if>
										        			</p>        
									        
													        <p>2차 결재 : 
															    <c:if test="${mypage.approval2Yn == 0 }">
																	<span>미승인</span>
																</c:if>
																<c:if test="${mypage.approval2Yn == 1 }">
																	<span style = "color:blue">승인 완료</span> (${mypage.approval1Date})
																</c:if>
															</p>
															
															<p>비용 결제 : 
														        <c:if test="${mypage.paymentYn == 0 }">
																	<span>미결제</span>
																</c:if>
																<c:if test="${mypage.paymentYn == 1 }">
																	<span>결제 완료</span>
																</c:if>
																(${mypage.reservePrice} 원)
									        				</p>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-outline"
															data-dismiss="modal">닫기</button>
													</div>
													</div>
												<!-- /.modal-content -->
												</div>
												<!-- /.modal-dialog -->
												</div>	
										
												<div class="modal modal-danger fade" id="modal-danger_${mypage.reserveNo}">
													<!-- 삭제 modal div -->
													<!-- Modal Div -->
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
																<h4 class="modal-title">예약 취소하기</h4>
															</div>
															<div class="modal-body">
																<p>해당 예약 요청을 취소하시겠습니까?</p>
															</div>
															<div class="modal-footer">
																	<button type="button" class="btn btn-outline pull-left" data-dismiss="modal">돌아가기</button>
																
																<form action="mypageDelete" method="post" class = "btn_del_upd">
			              											<input type="hidden" name="reserveNo" value="${mypage.reserveNo}">
																	<button type="submit" class="btn btn-outline" >취소 요청하기</button>
																</form>
															
															</div>
														</div>
														<!-- /.modal-content -->
													</div>
													<!-- /.modal-dialog -->
												</div> <!-- /.modal -->	
										</td>
										</tr>
										</c:forEach>
			
										</tbody>		               		       
									</table>
								</div>
			   				 <!-- Main content -->
							</div>
						</div>
					</section>
					</div>
				</div>
				</div>
				</section>
			</div>
	
<script>
	$(function() {
		var employeeNo;
		var selectedStart;
		var selectedEnd;
		
		var calendar = $('#calendar').fullCalendar({
			select: function(startDate, endDate, jsEvent, view, resource) {
				selectedStart = startDate.format('YYYY-MM-DD');
				selectedEnd = endDate.format('YYYY-MM-DD');
				$('#reservationtime').data('daterangepicker').setStartDate(selectedStart);
				$('#reservationtime').data('daterangepicker').setEndDate(selectedEnd);
			},
			eventClick: function(event){
				console.log(event);
				$('#modal-reservationStartDate').val(moment(event.startDate).format("YYYY-MM-DD"));
				$('#modal-reservationEndDate').val(moment(event.endDate).format("YYYY-MM-DD"));				
			},
			contentHeight: "auto",
			googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE" // Google API KEY
		});
		
		//회의실 예약 : 지사, 회의실구분별 예약목록 조회
		function getReservationList() {
			$.ajax({
	            type : "POST",
	            data : {"buildNo" : $('#buildingSelect').val(),
	            		"roomType" : $('#roomTypeSelect').val()},
	            dataType : "json",
	            success : function(data) {
	            	var events = [];
	            	
	            	$.each(data.reservationList, function(index, item) {
	            		var oneEvent = new Object();
	            		oneEvent.start = new Date(item.STARTDATE);
	            		oneEvent.end = new Date(item.ENDDATE);
	 
	            		//이벤트 목록에 추가
	            		events[index] = oneEvent;
	            	});
	            },
	            error : function(data) {
	               alert('roomSelect click error!');
	            }
	        });
		}
				
		//페이지로딩시 전체 예약현황 셋팅
		getReservationList();
		
		/** DatePicker **/
		//좌측 회의실 검색부분
		$('#reservationtime').daterangepicker({
			timePicker : true,
			timePickerIncrement : 30,
			minDate : new Date(),
			format : 'YYYY/MM/DD',
			locale : {
				format : 'YYYY/MM/DD'
			}
		})
	    
	    //검색 버튼 클릭
	    $('#availableMypageSearchBtn').click(function(){
	    	let picker = $('#reservationtime').data('daterangepicker');
	    	console.log(moment(picker.startDate).format('YYYY/MM/DD') + " - " + moment(picker.endDate).format('YYYY/MM/DD'));
	    	$('#reseveStatusForm').submit();
	    });
	    
	})
</script>
		


<script>
	$(function() {
		$('#example1').DataTable({
			'paging' : true,
			'lengthChange' : false,
			'searching' : false,
			'ordering' : true,
			'info' : true,
			'autoWidth' : false
		})
	})
</script>
