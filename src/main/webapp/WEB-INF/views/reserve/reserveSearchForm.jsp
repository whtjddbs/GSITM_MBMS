<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			회의실 검색
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Calendar</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
		
			<div class="col-md-3">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">조건 검색</h3>
					</div>
					<div class="box-body">
						<!-- 지사 선택 -->
						<div class="form-group">
							<label for="buildingSelect">지사</label>
							<select name="buildingSelect" id="buildingSelect" class="form-control">
								<option value="">전체</option>
								<c:forEach var="building" items="${buildings }">
									<option value="${building.buildNo }">${building.buildName }</option>
								</c:forEach>
							</select>
						</div>
						
						<!-- 장소유형 선택 -->
						<div class="form-group">
							<label>장소유형</label>
							<select name="roomTypeSelect" id="roomTypeSelect" class="form-control">
								<option value="">전체</option>
								<option value="회의실">회의실</option>
								<option value="교육실">교육실</option>
							</select>
						</div>
						
						<!-- Date and time range -->
						<div class="form-group">
							<label>예약 날짜</label>
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-clock-o"></i>
								</div>
								<input type="text" class="form-control pull-right"
									id="reservationtime">
							</div>
							<!-- /.input group -->
						</div>
						
						<!-- 회의실 규모 -->
						<div class="input-group form-group">
    						<span class="input-group-addon">참석인원</span>
							<input type="number" placeholder="최대인원 (명)" class="form-control input-sm">
						</div>
						<!-- 네트워크 사용 유무 -->
						<div class="form-group">
							<div class="input-group">
								<label class="control-label">네트워크 유/무</label>
								<div class="col-sm-12">
				            	<label class="col-sm-6">
				                	<input type="radio" name="networkYn" class="minimal" checked>
				                 	Yes
				                </label>
				                <label class="col-sm-6">
				                	<input type="radio" name="networkYn" class="minimal">
				                	No
				              	</label>
				              	</div>
			              	</div>
			            </div>
						
						<!-- 네트워크 사용 유무 -->
						<div class="form-group">
							<div class="input-group">
								<label class="control-label">다과준비 유/무</label>
								<div class="col-sm-12">
				            	<label class="col-sm-6">
				                	<input type="radio" name="snackYn" class="minimal" checked>
				                 	Yes
				                </label>
				                <label class="col-sm-6">
				                	<input type="radio" name="snackYn" class="minimal">
				                	No
				              	</label>
				              	</div>
			              	</div>
			            </div>
			            
			            <input type="button" class="btn  btn-info col-sm-12" id="availableRoomSearchBtn" value="검색">

					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col(left:col-md-3) -->

			<div class="col-md-9">
				<div class="box box-primary">
					<div class="box-body no-padding">
						<!-- THE CALENDAR -->
						<div id="calendar"></div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /. box -->
			</div>
			<!-- /.col(right:col-md-9) -->
			
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<div class="modal fade" id="fullcalendar-event-detail-modal">
	<div class="modal-dialog">
	  <div class="modal-content">
	    <div class="modal-header">
	      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        <span aria-hidden="true">&times;</span></button>
	      <h4 class="modal-title">Default Modal</h4>
	    </div>
	    <div class="modal-body">
	    	<!-- 모달 내용 -->
	    	<!-- 지사 선택 -->
			<div class="col-md-12">
				<div class="form-group">
					<div class="col-sm-6">
					<label for="buildingSelect">지사</label>
						<select name="buildingSelect" id="buildingSelect" class="form-control">
							<option value="">전체</option>
							<c:forEach var="building" items="${buildings }">
								<option value="${building.buildNo }">${building.buildName }</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-sm-6">
						<label for="roomSelect">회의실</label> 
						<select name="roomSelect" id="roomSelect" class="form-control">
							<option value="">전체</option>
						</select>
					</div>

					<!-- 회의유형 선택 -->
					<div class="col-sm-12">
						<label>회의구분</label> 
						<select name="category" id="meetingCategory" class="form-control">
							<option value="고객미팅">고객미팅</option>
						</select>
					</div>
					
					<div class="col-sm-12">
						<label>시작일</label>
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-calendar-o"></i>
							</div>
							<input type="text" class="form-control pull-right"
								id="reservationStartDate" readonly>
							<div class="input-group-addon">
		                    	<i class="fa fa-clock-o"></i>
		                    </div>
		                    <input type="text" id="reservationStartTime" class="form-control timepicker" readonly>
						</div>
						<!-- /.input group -->
					</div>
					<div class="col-sm-12">
						<label>종료일</label>
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-calendar-o"></i>
							</div>
							<input type="text" class="form-control pull-right"
								id="reservationEndDate" readonly>
							<div class="input-group-addon">
		                    	<i class="fa fa-clock-o"></i>
		                    </div>
		                    <input type="text" id="reservationEndTime" class="form-control timepicker" readonly>
						</div>
						<!-- /.input group -->
					</div>
		             
				</div>

				<!-- 참석인원 -->
				<div class="col-sm-12">
					<label>참석인원 및 명단</label>
					<div class="input-group">
						<span class="input-group-addon">참석인원</span> 
						<input type="number" placeholder="최대인원 (명)" class="form-control">
						<span class="input-group-addon"><i class="fa fa-users"></i></span>
						<input type="text" class="form-control" placeholder="참석자 명단">
						<div class="input-group-btn">
							<button class="btn btn-outline-secondary" type="button"><i class="fa fa-plus"></i></button>
						</div>
					</div>
				</div>
				
				<!-- 비품 신청 -->
				<div class="col-sm-12">
					<label>비품신청</label>
					<div class="input-group">
						<span class="input-group-addon">비품명</span> 
						<input type="text" placeholder="비품명" class="form-control" readonly>
						<span class="input-group-addon">수량</span>
						<input type="number" class="form-control" placeholder="수량" readonly>
						<div class="input-group-btn">
							<button class="btn btn-outline-secondary" type="button"><i class="fa fa-plus"></i></button>
						</div>
					</div>
				</div>
				
				<!-- 네트워크 사용 유무 -->
				<div class="col-sm-12">
					<label class="control-label">네트워크 유/무</label>
					<div class="col-sm-12">
						<label class="col-sm-6"> 
							<input type="radio" name="networkYn" class="minimal" checked> Yes
						</label>
						<label class="col-sm-6">
							<input type="radio" name="networkYn" class="minimal"> No
						</label>
					</div>
				</div>

				<!-- 다과준비 유무 -->
				<div class="col-sm-12">
					<label class="control-label">다과준비 유/무</label>
					<div class="col-sm-12">
						<label class="col-sm-6"> <input type="radio"
							name="snackYn" class="minimal" checked> Yes
						</label> <label class="col-sm-6"> <input type="radio"
							name="snackYn" class="minimal"> No
						</label>
					</div>
				</div>
				
				<!-- 사용 목적 -->
				<div class="col-sm-12">
					<div class="form=group">
						<label class="control-label">사용 목적</label>
						<textarea class="form-control" rows="5" ></textarea>
					</div>
					<br>
				</div>
				
			</div>
			<!-- /. -->
	    </div>
	    <div class="modal-footer">
	      <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	    </div>
	  </div>
	  <!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- Page specific script -->
<script>
	$(function() {

		/* initialize the external events
		 -----------------------------------------------------------------*/
		function init_events(ele) {
			ele.each(function() {

				// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
				// it doesn't need to have a start or end
				var eventObject = {
					title : $.trim($(this).text())
				// use the element's text as the event title
				}

				// store the Event Object in the DOM element so we can get to it later
				$(this).data('eventObject', eventObject)

				// make the event draggable using jQuery UI
				$(this).draggable({
					zIndex : 1070,
					revert : true, // will cause the event to go back to its
					revertDuration : 0
				//  original position after the drag
				})

			})
		}

		init_events($('#external-events div.external-event'))

		/* initialize the calendar
		 -----------------------------------------------------------------*/
		//Date for the calendar events (dummy data)
		var date = new Date()
		var d = date.getDate(), m = date.getMonth(), y = date.getFullYear()
		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay'
			},
			buttonText : {
				today : 'today',
				month : 'month',
				week : 'week',
				day : 'day'
			},
			eventClick: function(event){
				$('#fullcalendar-event-detail-modal .modal-title').text(event.title);
				
				$('#fullcalendar-event-detail-modal').modal('show');
			}
			//Random default events
			/* events : [ {
				title : 'All Day Event',
				start : new Date(y, m, 1),
				backgroundColor : '#f56954', //red
				borderColor : '#f56954' //red
			}, {
				title : 'Long Event',
				start : new Date(y, m, d - 5),
				end : new Date(y, m, d - 2),
				backgroundColor : '#f39c12', //yellow
				borderColor : '#f39c12' //yellow
			}, {
				title : 'Meeting',
				start : new Date(y, m, d, 10, 30),
				allDay : false,
				backgroundColor : '#0073b7', //Blue
				borderColor : '#0073b7' //Blue
			}, {
				title : 'Lunch',
				start : new Date(y, m, d, 12, 0),
				end : new Date(y, m, d, 14, 0),
				allDay : false,
				backgroundColor : '#00c0ef', //Info (aqua)
				borderColor : '#00c0ef' //Info (aqua)
			}, {
				title : 'Birthday Party',
				start : new Date(y, m, d + 1, 19, 0),
				end : new Date(y, m, d + 1, 22, 30),
				allDay : false,
				backgroundColor : '#00a65a', //Success (green)
				borderColor : '#00a65a' //Success (green)
			}, {
				title : 'Click for Google',
				start : new Date(y, m, 28),
				end : new Date(y, m, 29),
				url : 'http://google.com/',
				backgroundColor : '#3c8dbc', //Primary (light-blue)
				borderColor : '#3c8dbc' //Primary (light-blue)
			} ] */
		});
		
		//회의실 예약 : 지사, 회의실구분별 예약목록 조회
		function getReservationList() {
			$.ajax({
	            type : "POST",
	            url : "/reserve/getReservationList",
	            data : {"buildNo" : $('#buildingSelect').val(),
	            		"roomType" : $('#roomTypeSelect').val()},
	            dataType : "json",
	            success : function(data) {
	            	var month = [];
	            	
	            	$.each(data.reservationList, function(index, item) {
	            		var monthSource = new Object();
	            		monthSource.id = item.RESERVENO;
	            	    monthSource.title = item.PURPOSE;
	            	    monthSource.start = new Date(item.STARTDATE);
	            	    monthSource.end = new Date(item.ENDDATE);
	            	    monthSource.backgroundColor = '#3c8dbc';
						monthSource.borderColor = '#3c8dbc';
						monthSource.roomName = item.ROOMNAME;
	            	    month[index] = monthSource;
	            	});
	            	
	            	$('#calendar').fullCalendar('removeEvents');
        		    $('#calendar').fullCalendar('addEventSource', month);
	            },
	            error : function(data) {
	               alert('roomSelect click error!');
	            }
	        });
		}
		
		//페이지로딩시 전체 예약현황 셋팅
		getReservationList();
		
		//좌측 검색창에서 지사와 회의실구분 변경 시 달력 업데이트
		$('#buildingSelect, #roomTypeSelect').change(function() {
			getReservationList();
		});
		
		/** DatePicker **/
		//좌측 회의실 검색부분
		$('#reservationtime').daterangepicker({
			timePicker : true,
			timePickerIncrement : 30,
			format : 'MM/DD/YYYY h:mm A'
		})
		
		//iCheck for checkbox and radio inputs
	    $('input[type="radio"].minimal').iCheck({
	      radioClass   : 'iradio_minimal-blue'
	    })
	    
	    //검색 버튼 클릭
	    $('#availableRoomSearchBtn').click(function(){
	    	alert($('#reservationtime').val());
	    	getReservationList();
	    });
	    
	})
</script>