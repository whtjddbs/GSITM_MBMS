<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        예약 이력
        <small>지금까지의 예약 이력입니다.</small>
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
								<input type="text" class="form-control pull-right" id="reservationtime">
							</div>
							<!-- /.input group -->
						</div> 
			            <br><input type="button" class="btn  btn-info col-sm-12" id="availableRoomSearchBtn" value="검색">
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
									<th class = "">예약 시작일</th>
									<th class = "">예약 종료일</th>
									<th class = "">회의 구분</th>
									<th class = "">회의명</th>
								</tr>
							</thead>
							
			               <tbody>
			               
							<c:forEach var="MypageDTO" items="${mypageHistoryList}">
								<tr>
									<td>${MypageDTO.startDate}</td>
									<td>${MypageDTO.endDate}</td>
									<td>${MypageDTO.category}</td>
									<td>${MypageDTO.purpose}</td>
								</tr>
							</c:forEach>
							 

							</tbody>
											               		       
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
<!-- /.content-wrapper -->

				</div>	
				<!-- /. box -->	
			</div>
			<!-- /.col(right:col-md-9) -->
			</section>
		</div>
		<!-- /.row -->

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
		
	    //검색 버튼 클릭
	    $('#availableRoomSearchBtn').click(function(){
	    	let picker = $('#reservationtime').data('daterangepicker');
	    	console.log(moment(picker.startDate).format('YYYY/MM/DD HH:mm') + " - " + moment(picker.endDate).format('YYYY/MM/DD HH:mm'));
	    	$('#availableRoomListForm').submit();
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

<!--
<script>
	$(function() {
		/* initialize the calendar
		 -----------------------------------------------------------------*/
		//Date for the calendar events (dummy data)
		var date = new Date();
		var d = date.getDate(), m = date.getMonth(), y = date.getFullYear();
		var selectedStart;
		var selectedEnd;
		var calendar = $('#calendar').fullCalendar({
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
					color : '#3c8dbc',
					click: function(event) {
						console.log(selectedStart +" - "+ selectedEnd);
						$('#availableRoomListForm').submit();
					}
				}
			},
			selectable: true,
			select: function(startDate, endDate, jsEvent, view, resource) {
				selectedStart = startDate.format('YYYY-MM-DD HH:mm');
				selectedEnd = endDate.format('YYYY-MM-DD HH:mm');
				$('#reservationtime').data('daterangepicker').setStartDate(selectedStart);
				$('#reservationtime').data('daterangepicker').setEndDate(selectedEnd);
			},
			dayClick: function(date, event, view) {
				console.log(moment(date).format('YYYY/MM/DD HH:mm'));
				console.log(event);
				console.log(view);
			},
			contentHeight: "auto",
			googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE" // Google API KEY

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
	    
	    //검색 버튼 클릭
	    $('#availableRoomSearchBtn').click(function(){
	    	let picker = $('#reservationtime').data('daterangepicker');
	    	console.log(moment(picker.startDate).format('YYYY/MM/DD HH:mm') + " - " + moment(picker.endDate).format('YYYY/MM/DD HH:mm'));
	    	$('#availableRoomListForm').submit();
	    });
	    
	})
</script>
   -->