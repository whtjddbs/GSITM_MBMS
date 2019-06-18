<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>회의실 예약</h1>
		<ol class="breadcrumb">
			<li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">reserve</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row row-centered">
			<div class="col-md-10 col-md-offset-1">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">회의실 예약</h3>
					</div>
					<div class="box-body">
						<!-- 지사 선택 -->
						<div class="col-md-12">
							<div class="form-group">
								<div class="col-sm-6">
								<label for="buildingSelect">지사</label> 
									<select name="buildingSelect" id="buildingSelect" class="form-control" onchange="selectBuilding(this.options[this.selectedIndex].value)">
										<c:forEach var="building" items="${buildings }" varStatus="status">
											<c:if test="${status.first}">
												<option value="${building.buildNo }" selected="selected">${building.buildName }</option>
											</c:if>
											<c:if test="${!status.first}">
												<option value="${building.buildNo }">${building.buildName }</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-6">
									<label for="roomSelect">회의실</label>
									<select name="roomSelect" id="roomSelect" class="form-control">
										<c:forEach var="building" items="${buildings }" varStatus="status">
												<c:forEach var="room" items="${building.rooms }">
														<option class="building${building.buildNo }" value="${room.roomNo }">${room.roomName }</option>
												</c:forEach>
										</c:forEach>
									</select>
								</div>
	
								<!-- 회의유형 선택 -->
								<div class="col-sm-12">
									<label>회의구분</label> 
									<select name="category" id="meetingCategory" class="form-control">
										<option value="고객미팅">고객미팅</option>
										<option value="프로젝트회의">프로젝트회의</option>
										<option value="교육">교육</option>
										<option value="기타">기타</option>
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
										<input type="text" class="form-control pull-right"
											id="reservationStartTime" data-toggle="dropdown" readonly>
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
										<input type="text" class="form-control pull-right"
											id="reservationEndTime" data-toggle="dropdown" readonly>
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
										<button class="btn btn-outline-secondary" data-toggle="modal" data-target="#employeeList-modal" type="button"><i class="fa fa-plus"></i></button>
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
								<div class="form-group">
									<label class="control-label">사용 목적</label>
									<textarea class="form-control" rows="5" ></textarea>
								</div>
								<br>
							</div>
	
							<div class="col-sm-12">
								<input type="button" class="btn  btn-info col-sm-12"
									id="availableRoomSearchBtn" value="예약">
							</div>

						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.col-md-12 -->
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

<!-- modal -->
<div class="modal fade" id="employeeList-modal">
	<div class="modal-dialog modal-lg">
	  <div class="modal-content">
	    <div class="modal-header">
	      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        <span aria-hidden="true">&times;</span></button>
	      <h4 class="modal-title">참석 명단</h4>
	    </div>
	    <div class="modal-body" style="display: inline-block">
	    	<!-- 모달 내용 -->
	    	<div class="col-lg-3">
	    	</div>
	    	<div class="col-lg-6">
	    	</div>
	    	<div class="col-lg-3">
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

<style>
	.dropdown-menu > li:hover {cursor: pointer;}
	.dropdown-menu > li.disabled {color: #999; text-decoration: line-through;}
</style>
<script>
	var setEndDate;
	var setStartDate;

	// 2. 지사 선택시 지사내 회의실 목록 roomSelect 태그에 출력
	function selectBuilding(buildNo) {
		$('#roomSelect option').hide();
		$('#roomSelect').find('.building'+buildNo).show();
		$('#roomSelect').val($('#roomSelect').find('.building'+buildNo).first().val());
		$('#roomSelect').trigger('change');
	}
	
	// 조성윤의 timepicker plugin
	(function($) {
		$.fn.myTimepicker = function(options) {
			
			$(this).next().remove();
			
			$(this).after($('<ul/>', {
				id : $(this).prop('id')+'Drop',
				'class' : 'dropdown-menu dropdown-menu-right pre-scrollable',
				style : 'width: 50%'
			}));
			
			var settings = $.extend({
	            minTime: "08:30",
	            maxTime: "18:00",
	            startTime: "09:00",
	            endTime: "17:30",
	            nextTarget: "",
				disableTimes: [],
				click : function () {
					
				}
	        }, options);
			
			var timeInput = $(this);
			var dropdown = $(this).next();
			// 최초 타임테이블 생성
			for(var i = moment(settings.startTime,'HH:mm'); i <= moment(settings.endTime, 'HH:mm'); i.add(30, 'm')) {
				dropdown.append($('<li/>', {
					'class': 'dropdown-item'
				}).append($('<a/>',{
					text: i.format('HH:mm')
				})));
				
				if(i < moment(settings.minTime, 'HH:mm') || i > moment(settings.maxTime, 'HH:mm')) {
					dropdown.find('li:last-child').addClass('disabled');
				}
			}
			
			// myTimepicker 클릭 이벤트
			dropdown.children().click(function(){
				if($(this).hasClass('disabled')) return false;
				timeInput.val($(this).text());
				if(settings.nextTarget != "") {
					let target = settings.nextTarget;
					$(target).datepicker('destroy');
					
					$.ajax({
						type : "POST",
			            url : "/reserve/getNextReservation",
			            data : {"buildNo" : $('#buildingSelect').val(),
			            		"roomNo" : $('#roomSelect').val(),
			            		"startDate" : $('#reservationStartDate').val()+" "+$('#reservationStartTime').val()},
			            dataType : "json",
			            success : function(data) {
// 			            	alert(moment(data.nextReservationTime.STARTDATE).format('YYYY/MM/DD HH:mm')+" - "
// 			            			+ moment(data.nextReservationTime.ENDDATE).format('YYYY/MM/DD HH:mm'));
			            		
			            	// 종료일 picker 생성
			            	$(target).datepicker({
								format: 'yyyy/mm/dd',
								todayBtn: true,
								todayHighlight: true,
								startDate: moment($('#reservationStartDate').val(), 'YYYY/MM/DD').format('YYYY/MM/DD'),
// 								endDate: moment(data.nextReservationTime.STARTDATE).format('YYYY/MM/DD'),
								daysOfWeekDisabled: [0,6],
								language: 'ko',
								zIndexOffset: 100,
								title: '종료일'
							}).on('changeDate', function(e) {
// 								$('#reservationStartDate').datepicker('setEndDate', moment(e.date).format('YYYY/MM/DD'));
								$('#reservationEndDate').datepicker('hide');
								
								let rEndDate = moment($('#reservationEndDate').datepicker('getEndDate')).format('YYYY/MM/DD');
								
								$('#reservationEndTime').myTimepicker({
									startTime: "09:30",
									endTime: "18:00",
									minTime: moment($('#reservationStartDate').val()==$('#reservationEndDate').val()?$('#reservationStartTime').val():'09:00','HH:mm').add(30,'m').format('HH:mm'),
									maxTime: moment((data.nextReservationTime!=null && rEndDate==$('#reservationEndDate').val())? data.nextReservationTime.STARTDATE : Date.parse('18:00')).format('HH:mm')
								});
								
								settingStartDateAllowTimes($('#reservationEndDate').val()+" 00:00", '#reservationEndTimeDrop', false);/////////////
								if(rEndDate==$('#reservationEndDate').val()) {
				            		// 마지막날 선택 시
				            		for(var item = moment(setEndDate.format('HH:mm'),'HH:mm'); item<moment('18:00', 'HH:mm'); item.add(30, 'm')) {
					            		let hour = item.format('HH');
					            		let min = item.format('mm');
					            		let i = (hour-9)*2;
					            		i += min > 0 ? 1 : 0;
					            		$('reservationEndTimeDrop > li:eq('+i+')').addClass('disabled');
					            	}
				            	}
							});
			            	
			            	
			            	if(data.nextReservationTime!=null) {
			            		setEndDate = moment(data.nextReservationTime.STARTDATE);
								$('#reservationEndDate').datepicker('setEndDate', moment(data.nextReservationTime.STARTDATE).format('YYYY/MM/DD'));
			            	}
			            	
							$('#reservationEndDate').datepicker('show');
			            }
					});
				}
			})
			
			$(this).parent().addClass('open');
			return this;
		}
	}( jQuery ));
	
	// datepicker 초기 설정 함수
	function resetDatePicker(startDateElement, endDateElement, startTimeElement, endTimeElement) {
		$(startDateElement).val('');
		$(endDateElement).val('');
		$(startTimeElement).val('');
		$(endTimeElement).val('');
		// 뿌셔뿌셔
		$(startDateElement).datepicker('destroy');
		$(endDateElement).datepicker('destroy');
		$(startTimeElement).next().remove();
		$(endTimeElement).next().remove();
		
		$(startDateElement).datepicker({
			format: 'yyyy/mm/dd',
			todayBtn: true,
			todayHighlight: true,
			startDate: moment().format('YYYY/MM/DD'),
			daysOfWeekDisabled: [0,6],
			language: 'ko',
			zIndexOffset: 100,
			title: '시작일'
		}).on('changeDate', function(e) {
			if(moment(e.date).format('YYYY/MM/DD')!=$(startDateElement).val()) {
				$(endDateElement).val('');
				$(startTimeElement).val('');
				$(endTimeElement).val('');
			}
			
// 			$(endDateElement).datepicker('setStartDate', moment(e.date).format('YYYY/MM/DD'));
			$(startDateElement).datepicker('hide');
			$('#reservationStartTime').myTimepicker({
				nextTarget: '#reservationEndDate'
			});
			settingStartDateAllowTimes($('#reservationStartDate').val()+" 00:00", '#reservationStartTimeDrop', true);
		});
	}
	
	// 선택한 회의실의 시작일 선택가능한 시간설정 
	function settingStartDateAllowTimes(dateString, dropdownElement, startFlag) {
		$.ajax({
            type : "POST",
            url : "/reserve/getTimeByDate",
            data : {"buildNo" : $('#buildingSelect').val(),
            		"roomNo" : $('#roomSelect').val(),
            		"startDate" : dateString},
            dataType : "json",
            success : function(data) {
            	console.log(JSON.stringify(data.reservationList));
            	let disableTimes = getDisableTimeList(dateString, data.reservationList, startFlag);
            	$(dropdownElement).children().each(function(index, item){
            		if($.inArray($(item).text(), disableTimes) != -1){
            			$(item).addClass('disabled');
            		}
            	});
            }
		});
	}
	
	function getDisableTimeList(oneDate, disabledTimes, startFlag) {
		let disableTimeArray = new Array();
		
		if(moment().format('YYYY/MM/DD')==moment(oneDate).format('YYYY/MM/DD')) {
			let from = new Date();
			from.setHours(9, 0);
			let dateRange = {STARTDATE: from, ENDDATE: new Date()}
			disabledTimes.push(dateRange);
		}
		
		$.each(disabledTimes, function(index, item) {
			if(startFlag) {	// 시작일
				for(var i = moment(item.STARTDATE); i < moment(item.ENDDATE); i.add(30, 'm')) {
					if($.inArray(i.format("HH:mm"), disableTimeArray) == -1) {
						disableTimeArray.push(i.format('HH:mm'));
					}
				}
			} else {
				for(var i = moment(item.ENDDATE); i > moment(item.STARTDATE); i.add(-30, 'm')) {
					if($.inArray(i.format("HH:mm"), disableTimeArray) == -1) {
						disableTimeArray.push(i.format('HH:mm'));
					}
				}
			}
		});
		
		return disableTimeArray;
	}
	
	$(function(){
		/**
			#### Controller로부터 받아올 정보
			#	model : 지사 목록 (buildings), 전체 직원 목록 (employees)
			#	session : 예약정보 (reservationInfo)
			
			1. 지사 목록을 buildingSelect 태그에 출력
			2. 선택된 지사의 회의실 목록을 roomSelect 태그에 출력
			3. 회의실 선택 => 예약 시작일의 예약정보를 조회하여 datetimepicker에 반영
							비품 목록을 불러오기
			4. 시작일(onSelectDate) 선택 시 예약정보를 조회하여 선택가능 시간(allowTimes) 반영
			5. 시작일 시간 선택 시 시작날짜 이전일 선택을 막고 종료일 datetimepicker 생성 및 show
			6. 종료일(onSelectDate) 선택 시 예약정보를 조회하여 선택가능 시간(allowTimes) 반영
			7. 전체 직원 목록 불러오기 
		**/
		
		// 예약할 회의실 번호를 가지고 들어왔으면 초기세팅 
		if('${roomDTO}'!='') {
			$('#buildingSelect').val('${roomDTO.buildNo}');
			selectBuilding('${roomDTO.buildNo}');
			$('#roomSelect').val('${roomDTO.roomNo}');
		}else {
			$('#buildingSelect').trigger('change');
			$('#roomSelect').trigger('change');
		}
			
		// 예약일 초기설정
		resetDatePicker('#reservationStartDate', '#reservationEndDate', '#reservationStartTime', '#reservationEndTime');
		
		// 3. 회의실 선택 시 관련 정보를 가져온다
		$('#roomSelect').change(function(){
			$.ajax({
	            type : "POST",
	            url : "/reserve/getReservationInfo",
	            data : {"buildNo" : $('#buildingSelect').val(),
	            		"roomNo" : $('#roomSelect').val(),
	            		"roomType" : ""},
	            dataType : "json",
	            success : function(data) {
	            	//회의실 변경 시 예약일 초기화
// 	            	alert("roomSelect success : "+JSON.stringify(data));
	            	resetDatePicker('#reservationStartDate', '#reservationEndDate', '#reservationStartTime', '#reservationEndTime');
	            },
	            error : function(data) {
	               alert('roomSelect click error!');
	            }
	        });
		});
		
		
		//iCheck for checkbox and radio inputs
	    $('input[type="radio"].minimal').iCheck({
	      radioClass   : 'iradio_minimal-blue'
	    })
	    
	   	//회의실 검색에서 저장한 예약정보 설정
	   	if('${reservationInfo.startDate}'!='' && '${reservationInfo.endDate}'!='') {
			var startDate = moment('${reservationInfo.startDate}');
			var endDate = moment('${reservationInfo.endDate}');
			console.log(startDate + " - " + endDate);
			
		   	$('#reservationStartDate').val(startDate.format('YYYY/MM/DD'));
		   	$('#reservationEndDate').val(endDate.format('YYYY/MM/DD'));
		   	$('#reservationStartTime').val(startDate.format('HH:mm'));
		   	$('#reservationEndTime').val(endDate.format('HH:mm'));
	   	}
	    
	});
</script>