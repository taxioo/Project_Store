<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
	<!-- 부트스트랩 css 사용 -->
	<style>
		.container-fluid{
			background: url("${pageContext.request.contextPath}/resources/img/background1.jpg");
			background-size: cover;
		}
		
		#rec_tb{
			width:700px;
			text-align:center;
		}
		table{
			width:70%;
			align:center;
			border: 5px double;
			background-color:white;
			cursor:hand;
		}
		
		th, td {
	    border-bottom: 1px solid #444444;
	    padding: 10px;
	  }
	</style>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/BootStrap/css/bootstrap.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1/datepicker-ko.js"></script>
<script>

	function reservation(r){
		var res = r
		
		var id = '<%=(String)session.getAttribute("id") %>';
		var start_date = document.getElementById("start_date").value;
		var end_date = document.getElementById("end_date").value;
		if(id=="null"){
			alert("로그인이 필요한 서비스입니다.");
			location = "login_form.do";
		}else{
			
			if(start_date == end_date){
				alert("대실은 현재 불가합니다.");
				return
			}
			
		location = "reservation_form.do?res=" + res + "&start_date=" + start_date + "&end_date=" + end_date;
		}
		
		method = "post";
		submit();
	}
	
	$(function() {
		$("#start_date").datepicker({
            dateFormat: 'yy.mm.dd'
           	,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능  
            ,minDate: "today" //최소 선택일자
           	,dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'] // 요일의 한글 형식.
            ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.
           	,onSelect: function() { 
                 var date1 = $.datepicker.formatDate("yymmdd",$("#start_date").datepicker("getDate")); 
           	},onClose: function( selectedDate ) { 
            	//시작일(startDate) datepicker가 닫힐때 
            	//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            	$("#end_date").datepicker( "option", "minDate", selectedDate );
            }
        });
        
        $("#end_date").datepicker({
            dateFormat: 'yy.mm.dd'
           	,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능  
           	,onSelect: function() { 
                 var date2 = $.datepicker.formatDate("yymmdd",$("#date2").datepicker("getDate"));
           	}
        });
        
        $('#start_date').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
        $('#end_date').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
    });
            
           	
	
</script>
<body>
	<div class="container-fluid">
		<%@include file="../include/header.jsp" %>	
			<div class="row">
				<div class="col-md-12">
					<c:forEach items="${pen_list}" var="acd">
						<table  class="mt-3 text-center" id="t_head" style="width:98%; border:1px solid;" align="center">
								<!-- 숙박이미지  -->
							<tr>
								<td rowspan="3" style="width:28%;"><img src="${pageContext.request.contextPath}/resources/upload/${acd.acd_name}/${acd.acd_photo}"></td>
								<td class = "text-center"><h1>${acd.acd_name}</h1></td>
							</tr>
							
							<tr >
								<td colspan="2">${acd.acd_addr}</td>
							</tr>
						</table>
					</c:forEach>
				</div>  	
						  	
				<!-- 탭 아이템 -->
				<div class="col-md-12">
					  <form>
					  <div class="col-md-12 mt-3">		  	
						  	<div class="jumbotron text-center" width="50%;" align="center">
						  		<h1 class="mr-mb-5 ">숙박일</h1>
						  		<input class="form-control-lg mr-sm-5" type="text" name="start_date" id="start_date" size="7" placeholder="입실일" autocomplete="off"/>
						  		
							    <input class="form-control-lg mr-sm-5" type="text" name="end_date" id="end_date" size="7" placeholder="퇴실일" autocomplete="off"/>
						  	</div>
						</div>
						  	<div class="row">
						    <!-- 방 리스트  -->
								<c:forEach items="${room_list}" var="rm">
									<div class="col-sm-12 col-lg-4 mt-4 ">
										<table class="text-center"  border="1" style="width:100%; height:380px;">
											<tr>
												<td style="width:50%; background-size:cover;" rowspan="4" 
													background="${pageContext.request.contextPath}/resources/upload/${rm.acd_name}/Room/${rm.room_photo}">
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<h4>${rm.room_type}</h4>
												</td>
											</tr>
											
											<tr>
												<td style="width:20%;">
													<h5>금액 :</h5>
												</td>
												
												<td>
													<h5>${rm.room_price} 원</h5>
												</td>
											</tr>
											<tr>
												<td>
													<h5>최대 인원수 :</h5>
												</td>
												
												<td>
													<h5>${rm.room_cnt} 명</h5>
												</td>
											</tr>
											<tr>
												<td colspan="3" align="right" style="height:10%;">
													<input id="rm_bt1" type="button" value="예약하기" onclick="reservation('${rm.room_id}');">
												</td>
											</tr>
										</table>
									</div>
								</c:forEach>
							</div>
						</form>
					  </div>
			</div>
		<%@include file="../include/footer.jsp" %>	
	</div>	
<!--  부트스트랩 js 사용 -->
</body>
</html>
