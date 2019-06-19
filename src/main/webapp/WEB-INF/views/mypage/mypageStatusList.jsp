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

    <!-- Main content -->
    <section class="content">   
    		<c:forEach var="mypage" items="${mypageStatusList}">
			<div class="row">
				<div class="col-md-12">
	      			<div class="box">
	        			<div class="box-header with-border">
				          <h3 class="box-title">${mypage.startDate} (${mypage.buildName} ${mypage.roomName})</h3>
				          <div class="box-tools pull-right">
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

<!-- 												<div style="width: 400px; margin-top:7px;" class="box"> -->
<!-- 										              <table style="width: 400px; align-content: right;" class="table table-condensed"> -->
<!-- 										                <tr> -->
<!-- 											              <th style="width: 130px; color: black;"><small>이름(사원번호)</small></th> -->
<!-- 												          <th style="width: 130px; color: black;"><small>직급</small></th> -->
<!-- 										                  <th style="width: 130px; color: black;"><small>조직</small></th> -->
<!-- 										                </tr> -->
										                
<!-- 										                <tr> -->
<%-- 										                  <td style="color: black;"><small>${mypage.empName}</small></td> --%>
<%-- 										                  <td style="color: black;"><small>${mypage.empPosition}</small></td> --%>
<%-- 										                  <td style="color: black;"><small>${mypage.deptName}</small></td> --%>
<!-- 										                  <td> -->
<!-- 										                </tr>  -->
<!-- 										             </table> -->
<!-- 										            /.box-body -->
<!-- 										          </div> -->
										          <!-- /.box -->	
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
								
				          </div>	         
				        </div>
	        				<div class="box-body" >
	        				<table>
	        					<tr role='row'>
								<td><img src='https://hjbc.co.kr/promotion/1702/images/pic01.jpg' style="width: 230px;" hspace=50></td>
	        					<td>			
						        <h5>회의 구분 및 회의명 : ${mypage.category} / ${mypage.purpose}</h5>
						        
						        <h5>비용 결제 : 
							        <c:if test="${mypage.paymentYn == 0 }">
										<span>미결제</span>
									</c:if>
									<c:if test="${mypage.paymentYn == 1 }">
										<span>결제 완료</span>
									</c:if>
									(${mypage.reservePrice} 원)
						        </h5>
						        
						        <h5>1차 결재
							        <c:if test="${mypage.approval1Yn == 0 }">
										<span>미승인</span>
									</c:if>
									<c:if test="${mypage.approval1Yn == 1 }">
										<span style = "color:blue">승인 완료</span> (${mypage.approval1Date})
									</c:if>
						        </h5>        
						        
						        <h5>2차 결재
								    <c:if test="${mypage.approval2Yn == 0 }">
										<span>미승인</span>
									</c:if>
									<c:if test="${mypage.approval2Yn == 1 }">
										<span style = "color:blue">승인 완료</span> (${mypage.approval1Date})
									</c:if>
								</h5>
								
								 </td>
								 </tr>
								 </table>
						    </div>
						    
						    <div class="box-footer">
						    	<div class="box-tools pull-right">
						    
						      	<button type="button" class="btn btn-info btn-sm" data-toggle="modal" 
				          		data-target="#modal-info_${mypage.reserveNo}">상세 예약 정보</button>
												
								<input type="button" class="btn btn-danger btn-sm" data-toggle="modal" 
								data-target="#modal-danger_${mypage.reserveNo}" value="예약 취소 요청">
						      	</div>
						    
						        <h5>현재 예약 상태 : 
							        <c:choose>
							        <c:when test="${mypage.approval1Yn == 0 }"><span style = "color:red"><strong>1차 승인 대기중</strong></span></c:when>
							        <c:when test="${mypage.approval1Yn == 1 && mypage.approval2Yn == 0}"><span style = "color:red"><strong>2차 승인 대기중</strong></span></c:when>
							        <c:when test="${mypage.approval1Yn == 1 && mypage.approval2Yn == 1}"><span style = "color:blue"><strong>예약 완료 (확정)</strong></span></c:when>
							        </c:choose>
						      	</h5>
						      						       
					        </div>	  
					    </div>
					</div>
				</div>
			</c:forEach> 
		</section>
</div>
</div>
</div>
</section>
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
