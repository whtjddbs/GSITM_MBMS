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
					<form id="availableRoomList" method="post" action="availableRoomList">
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
									<input type="text" class="form-control pull-right" name="reservationtime"
										id="reservationtime">
								</div>
								<!-- /.input group -->
							</div>
							
							<!-- 회의실 규모 -->
							<div class="input-group form-group">
	    						<span class="input-group-addon">참석인원</span>
								<input type="number" name="empCount" placeholder="최대인원 (명)" class="form-control input-sm">
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
					</form>
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
	    <div class="modal-body" style="display: inline-block">
	    	<!-- 모달 내용 -->
	    	<!-- 지사 선택 -->
			<div class="col-md-12">
				<div class="form-group">
					<div class="col-sm-6">
						<label for="buildingSelect">지사</label>
						<input type="text" id="modal-buildName" class="form-control" disabled>
					</div>
					<div class="col-sm-6">
						<label for="roomSelect">회의실</label> 
						<input type="text" id="modal-roomName" class="form-control" disabled>
					</div>

					<!-- 회의유형 선택 -->
					<div class="col-sm-12">
						<label>회의구분</label> 
						<input type="text" id="modal-meetingCategory" class="form-control" disabled>
					</div>
					
					<div class="col-sm-12">
						<label>시작일</label>
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-calendar-o"></i>
							</div>
							<input type="text" class="form-control pull-right" id="modal-reservationStartDate" disabled>
							<div class="input-group-addon">
		                    	<i class="fa fa-clock-o"></i>
		                    </div>
		                    <input type="text" id="modal-reservationStartTime" class="form-control timepicker" disabled>
						</div>
						<!-- /.input group -->
					</div>
					<div class="col-sm-12">
						<label>종료일</label>
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-calendar-o"></i>
							</div>
							<input type="text" class="form-control pull-right" id="modal-reservationEndDate" disabled>
							<div class="input-group-addon">
		                    	<i class="fa fa-clock-o"></i>
		                    </div>
		                    <input type="text" id="modal-reservationEndTime" class="form-control timepicker" disabled>
						</div>
						<!-- /.input group -->
					</div>
		             
				</div>

				<!-- 참석인원 -->
				<div class="col-sm-12">
					<label>참석인원 및 명단</label>
					<div class="input-group">
						<span class="input-group-addon">참석인원</span> 
						<input type="number" placeholder="최대인원 (명)" class="form-control" id="modal-empCount" disabled>
						<span class="input-group-addon"><i class="fa fa-users"></i></span>
						<input type="text" class="form-control" placeholder="참석자 명단" disabled>
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
						<input type="text" placeholder="비품명" class="form-control" disabled>
						<span class="input-group-addon">수량</span>
						<input type="number" class="form-control" placeholder="수량" disabled>
						<div class="input-group-btn">
							<button class="btn btn-outline-secondary" type="button"><i class="fa fa-plus"></i></button>
						</div>
					</div>
				</div>
				
				<!-- 네트워크 사용 유무 -->
				<div class="col-sm-12">
					<label class="control-label">네트워크 사용 유/무</label>
					<div class="col-sm-12">
						<label class="col-sm-6"> 
							<input type="radio" name="modal-networkYn" class="minimal" value="Y" checked disabled> Yes
						</label>
						<label class="col-sm-6">
							<input type="radio" name="modal-networkYn" class="minimal" value="N" disabled> No
						</label>
					</div>
				</div>

				<!-- 다과준비 유무 -->
				<div class="col-sm-12">
					<label class="control-label">다과준비 유/무</label>
					<div class="col-sm-12">
						<label class="col-sm-6"> <input type="radio"
							name="modal-snackYn" class="minimal" value="Y" checked disabled> Yes
						</label> <label class="col-sm-6"> <input type="radio"
							name="modal-snackYn" class="minimal" value="N" disabled> No
						</label>
					</div>
				</div>
				
				<!-- 사용 목적 -->
				<div class="col-sm-12">
					<div class="form-group">
						<label class="control-label">사용 목적</label>
						<textarea id="modal-purpose" class="form-control" rows="5" disabled></textarea>
					</div>
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.0/gcal.js"></script>
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
				left : 'prev,next today reserveBtn',
				center : 'title',
				right : 'month,agendaWeek,agendaDay'
			},
			buttonText : {
				today : 'today',
				month : 'month',
				week : 'week',
				day : 'day'
			},
			customButtons: {
				reserveBtn: {
					text: '예약하기',
					click: function() {
						alert('clicked custom button 1!');
					}
				}
			},
			eventClick: function(event){
				console.log(event);
				$('#fullcalendar-event-detail-modal .modal-title').text(event.title);
				$('#modal-buildName').val(event.buildName);
				$('#modal-roomName').val(event.roomName);
				$('#modal-meetingCategory').val(event.category);
				$('#modal-reservationStartDate').val(moment(event.startDate).format("YYYY-MM-DD"));
				$('#modal-reservationEndDate').val(moment(event.endDate).format("YYYY-MM-DD"));
				$('#modal-reservationStartTime').val(moment(event.startDate).format("HH:mm"));
				$('#modal-reservationEndTime').val(moment(event.endDate).format("HH:mm"));
				$('#modal-empCount').val(event.empCount);
				$('input:radio[name=modal-networkYn]:input[value="'+event.networkYn+'"]').iCheck('check');
				$('input:radio[name=modal-snackYn]:input[value="'+event.snackYn+'"]').iCheck('check');
				$('#modal-purpose').text(event.purpose);
				
				$('#fullcalendar-event-detail-modal').modal('show');
			},
			dayClick: function(event) {
				alert('dayClick');
			},
			contentHeight: "auto",
			googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE" // Google API KEY

			//Random default events
			/* 
				backgroundColor : '#f56954', //red
				backgroundColor : '#f39c12', //yellow
				backgroundColor : '#0073b7', //Blue
				backgroundColor : '#00c0ef', //Info (aqua)
				backgroundColor : '#00a65a', //Success (green)
				backgroundColor : '#3c8dbc', //Primary (light-blue)
			*/
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
	            	var events = [];
	            	
	            	$.each(data.reservationList, function(index, item) {
	            		var oneEvent = new Object();
	            		oneEvent.id = item.RESERVENO;
	            		oneEvent.title = item.PURPOSE;
	            		oneEvent.start = new Date(item.STARTDATE);
	            		oneEvent.end = new Date(item.ENDDATE);
	            		oneEvent.backgroundColor = '#3c8dbc';
	            		oneEvent.borderColor = '#3c8dbc';
	            		//추가정보
	            		oneEvent.roomName = item.ROOMNAME;
	            		oneEvent.roomNo = item.ROOMNO;
	            		oneEvent.networkYn = item.NETWORKYN;
	            		oneEvent.buildNo = item.BUILDNO;
	            		oneEvent.buildName = item.BUILDNAME;
	            		oneEvent.reserveNo = item.RESERVENO;
	            		oneEvent.startDate = item.STARTDATE;
	            		oneEvent.endDate = item.ENDDATE;
	            		oneEvent.purpose = item.PURPOSE;
	            		oneEvent.category = item.CATEGORY;
	            		oneEvent.empCount = item.EMPCOUNT;
	            		oneEvent.snackYn = item.SNACKYN;
	            		//이벤트 목록에 추가
	            		events[index] = oneEvent;
	            	});

	            	var holiday = new Object();
	            	holiday.googleCalendarId = "ko.south_korea#holiday@group.v.calendar.google.com";
	            	holiday.className = "koHolidays";
	            	holiday.color = "#FF0000";
	            	holiday.textColor = "#FFFFFF";
	            	
	            	$('#calendar').fullCalendar('removeEvents');
        		    $('#calendar').fullCalendar('addEventSource', events);
        		    $('#calendar').fullCalendar('addEventSource', holiday);
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
			timePicker24Hour: true,
			minDate : new Date(),
			format : 'YYYY/MM/DD HH:mm',
			locale : {
				format : 'YYYY/MM/DD HH:mm'
			}
		})
		
		//iCheck for checkbox and radio inputs
	    $('input[type="radio"].minimal').iCheck({
	      radioClass   : 'iradio_minimal-blue'
	    })
	    
	    //검색 버튼 클릭
	    $('#availableRoomSearchBtn').click(function(){
	    	let picker = $('#reservationtime').data('daterangepicker');
	    	console.log(moment(picker.startDate).format('YYYY/MM/DD HH:mm') + " - " + moment(picker.endDate).format('YYYY/MM/DD HH:mm'));
	    	$('#availableRoomList').submit();
	    });
	    
	})
</script>