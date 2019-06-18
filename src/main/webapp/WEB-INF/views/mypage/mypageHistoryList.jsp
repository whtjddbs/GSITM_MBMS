<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        예약 이력
      </h1>
		<ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">My Page</a></li>
        <li class="active">예약이력</li>
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
								<input type="text" class="form-control pull-right"
									id="reservationtime">
							</div>
							<!-- /.input group -->
						</div> 
			            <br><input type="button" class="btn  btn-info col-sm-12" value="검색">
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
									<th class = "">회의 구분</th>
									<th class = "">예약자</th>
									<th class = "">예약명</th>
									<th class = "">예약장소</th>
								</tr>
							</thead>
							<tbody>
				                <tr>
									<td>2019.06.07</td>
									<td>내부 회의</td>
									<td>사용자1</td>
									<td>MBMS 구축을 위한 사전미팅</td>
									<td>몰디브</td>
				                </tr>
				                </tbody>
				                <tfoot>
				                <tr>
									<th class = "">예약일</th>
									<th class = "">회의 구분</th>
									<th class = "">예약자</th>
									<th class = "">예약명</th>
									<th class = "">예약장소</th>
				                </tr>
				                </tfoot>
						</table>
					</div>
					<!-- /.box-body -->
				<!-- /.box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
				</div>	
				<!-- /. box -->	
			</div>
			<!-- /.col(right:col-md-9) -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
</div>

   
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