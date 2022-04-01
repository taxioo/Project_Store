<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
	<!-- 부트스트랩 css 사용 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/BootStrap/css/bootstrap.css">
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
</head>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script>

	function refreshMemList(){
		location.reload();
	}
	
	function room_delete(f){
		
		if(!confirm("삭제하시겠습니까?")){
			return;
		}
		
		var room_id = f.room_id.value.trim();
		var room_photo = f.room_photo.value.trim();
		var acd_name = f.acd_name.value.trim();
		
		var url = "room_delete.do";
		var param = "room_id=" + room_id + "&room_photo=" + room_photo + "&acd_name=" + acd_name;
		sendRequest(url, param, deleteFn, "POST");
	}
	
	function deleteFn(){
			if(xhr.readyState == 4 && xhr.status == 200){
			
			var data = xhr.responseText; //"no" or "yes"
			if(data == 'no'){
				alert("삭제가 실패했습니다");
				alert("관리자에게 문의하세요");
				return;
			}else if(data == 'yes'){
				alert("삭제가 성공했습니다.");
			}
			refreshMemList();
		}
	}
	
	function room_correct(a){
		var _width = '650';
	    var _height = '380';
	 
	    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	    var _left = Math.ceil(( window.screen.width - _width )/2);
	    var _top = Math.ceil(( window.screen.height - _height )/2); 

		var room_id = a;
		
		window.open("room_correct_form.do?room_id=" + a, "correct", 'width='+ _width +
											  ', height='+ _height +
											  ', left=' + _left + 
											  ', top='+ _top );
	}
	
</script>
<body>
	<div class="container-fluid">
		<%@include file="../include/ceo_header.jsp" %>	
			<div class="row">
				<div class="col-md-12">
					
					<c:forEach items="${pen_list}" var="acd">
						<table class="mt-3 table-hover" border="1"  id="t_head" style="width:100%;">
								<!-- 숙박이미지  -->
							<tr>
								<td class="text-center" rowspan="2" style="width:28%;"><img src="${pageContext.request.contextPath}/resources/upload/${acd.acd_name}/${acd.acd_photo}"></td>
								<td><h3>${acd.acd_name}</h3></td>
								<td>${acd.acd_type}</td>
							</tr>
							
							<tr>
								<td colspan="2">${acd.acd_addr}</td>
							</tr>
							<c:if test="${str eq 'yes'}">
								<tr>
									<td colspan="3"><input type="button" value="방 등록" 
									onclick="location.href='room_insert_form.do?acd_name=' + '${acd.acd_name}' + '&acd_num=' + '${acd.acd_num}' "></td>
								</tr>
							</c:if>
						</table>
					</c:forEach>
				</div>
				<!-- 탭 -->
				<div class="col-md-12 mt-5">
					<ul class="nav nav-pills nav-justified" style="border:1px; background-color:white;">
						<li class="nav-item" >
							<a class="nav-link active" data-toggle="tab" href="#room">방정보</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#status">총 판매내역</a>
						</li>
						
					</ul>
				</div>
				
				<!-- 탭 아이템 -->
				<div class="col-md-12">
					<div class="tab-content" style="background-color:white;">
						<!-- 아이템1 -->
					  <div class="tab-pane fade show active" id="room">
				  	  <c:if test="${str eq 'yes'}">
						    <!-- 방 리스트  -->
						  		<div class="row">
								<c:forEach items="${room_list}" var="rm">
					  			<form class="col-md-4 mt-4" id="delete"> 
										<table border="1" style="width:100%;">
											<tr>
												<td style="width:30%;">
												<img src="${pageContext.request.contextPath}/resources/upload/${rm.acd_name}/Room/${rm.room_photo}"></td>
												<td>${rm.room_type} <br> ${rm.room_price} 
												<br>
												<input type="hidden" value="<%out.print(session.getAttribute("ceo_id")); %>" name="ceo_id" id="ceo_id">
												<input type="hidden" value="${rm.acd_name}" name="acd_name" id="acd_name">
												<input type="hidden" value="${rm.room_id}" name="room_id" id="room_id">
												<input type="hidden" value="${rm.room_photo}" name="room_photo" id="room_photo">
												<input id="rm_bt1" type="button" value="수정하기" onclick="room_correct('${rm.room_id}');">
												<input id="rm_bt2" type="button" value="삭제하기" onclick="room_delete(this.form);">
												</td>
											</tr>
										</table>
								</form>
								</c:forEach>
								</div>
						</c:if>
						<!-- 방을 1개도 등록하지 않았을때 -->
						<c:if test="${str ne 'yes'}">
							<div class="col-md-12 text-center mt-5">
								<h1>방을 먼저 등록해주세요 </h1>
								<c:forEach items="${pen_list}" var="acd">
								<h3><input type="button" value="방 등록" onclick="location.href='room_insert_form.do?acd_name='+ '${acd.acd_name}'
								 + '&acd_num=' + '${acd.acd_num}' "></h3>
								</c:forEach>
							</div>
						</c:if>
					  </div>
			
			
					  	<!-- 아이템2 -->
					  <div class="tab-pane fade" id="status">
					  	<form>
					  		<div class="col-sm-12">
					  			<div class="jumbotron">
					  				총 금액 : ${total_price}
					  			</div>
					  		</div>
					  		<c:forEach items="${room_list}" var="rm">
									<div class="col-md-12 mt-4">
										<table border="1" style="width:100%;">
											<tr>
												<td style="width:15%;" rowspan="3">
												<img src="${pageContext.request.contextPath}/resources/upload/${rm.acd_name}/Room/${rm.room_photo}"></td>
											</tr>
											<tr>
												<th width="15%"> 숙박 타입 : </th>
												<td width="15%">${rm.room_type}</td>
												<th width="20%">예약된 횟수</th>
												<td width="20%">${rm.cnt}</td>
											</tr>
											
											<tr>
												<th width="15%"> 숙박 금액  : </th>
												<td width="15%">${rm.room_price}</td>
												<th width="20%"> 총 금액</th>
												<td width="20%">${rm.room_price * rm.cnt}</td>
											</tr>
										</table>
									</div>
							</c:forEach>
						</form>
					  </div>
					  
					  
					</div>
				</div>
			</div>
		<%@include file="../include/footer.jsp" %>	
	</div>	
<!--  부트스트랩 js 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/BootStrap/js/bootstrap.js"></script>
</body>
	
</html>
