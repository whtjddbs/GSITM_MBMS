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
		$('#calendar').fullCalendar(
				{
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
					//Random default events
					events : [ {
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
					} ],
					editable : true,
					droppable : true, // this allows things to be dropped onto the calendar !!!
					drop : function(date, allDay) { // this function is called when something is dropped

						// retrieve the dropped element's stored Event Object
						var originalEventObject = $(this).data('eventObject')

						// we need to copy it, so that multiple events don't have a reference to the same object
						var copiedEventObject = $.extend({},
								originalEventObject)

						// assign it the date that was reported
						copiedEventObject.start = date
						copiedEventObject.allDay = allDay
						copiedEventObject.backgroundColor = $(this).css(
								'background-color')
						copiedEventObject.borderColor = $(this).css(
								'border-color')

						// render the event on the calendar
						// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
						$('#calendar').fullCalendar('renderEvent',
								copiedEventObject, true)

						// is the "remove after drop" checkbox checked?
						if ($('#drop-remove').is(':checked')) {
							// if so, remove the element from the "Draggable Events" list
							$(this).remove()
						}

					}
				})

		/* ADDING EVENTS */
		var currColor = '#3c8dbc' //Red by default
		//Color chooser button
		var colorChooser = $('#color-chooser-btn')
		$('#color-chooser > li > a').click(function(e) {
			e.preventDefault()
			//Save color
			currColor = $(this).css('color')
			//Add color effect to button
			$('#add-new-event').css({
				'background-color' : currColor,
				'border-color' : currColor
			})
		})
		$('#add-new-event').click(function(e) {
			e.preventDefault()
			//Get value and make sure it is not null
			var val = $('#new-event').val()
			if (val.length == 0) {
				return
			}

			//Create events
			var event = $('<div />')
			event.css({
				'background-color' : currColor,
				'border-color' : currColor,
				'color' : '#fff'
			}).addClass('external-event')
			event.html(val)
			$('#external-events').prepend(event)

			//Add draggable funtionality
			init_events(event)

			//Remove event from text input
			$('#new-event').val('')
		});

		/** DatePicker **/
		//Date range picker with time picker
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
	    	alert($('##reservationtime').val());
	    });
	    
	})
</script>