<%@page import="vo.RoomVO"%>
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
		#table{
			width:70%;
			align:center;
			border: 5px double;
			background-color:white;
		}
		#th, #td {
	    border-bottom: 1px solid #444444;
	    padding: 10px;
	  }
	</style>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js	"></script>
<script>


</script>
<body>
	<div class="container-fluid">
		<%@include file="../include/header.jsp" %>	
			<form>
				<table class="mt-4" border="1" width="70%"; align="center" id="table">
					<tr>
						<td class="text-center " colspan="2" id="td">
							<h1>예약내역</h1>
						</td>
					</tr>
				</table>
					<c:forEach items="${rs_list}" var="list" varStatus="status">
					
					<table class="mt-5" width="70%"; align="center" id="table">
					<tr>
						<th class="text-center" id="th">
							<h2>${list.start_date}</h2>
						</th>
						<td class="text-right" id="td">
							<input class="btn btn-info" type="button" value="상세보기" method="post" style="width:20%;"
							onclick="location.href='room_reserve_list.do?room_id=' +'${list.room_id}' + '&res_num=' + ${list.res_num}
							+ '&user_num=' + '${list.user_num}' + '&start_date=' + '${list.start_date }' + '&end_date=' + '${list.end_date }'
							+ '&res_cnt=' + '${list.res_cnt }' + '&status=' + '${list.status }' + '&res_date=' + '${list.res_date}'
							 + '&acd_name=' + '${list.acd_name}'">
						</td>
					</tr>
					
					<tr>
						<td class="text-center" id="td">
							<h5>숙소 예약번호 : ${list.res_num}</h5>
						</td>
						<td id="td">
							<h5>결제한 날짜 : ${list.res_date}</h5>
						</td>
					</tr>
					<tr>
						<td id="td" class="text-center" rowspan="3" width="40%">
						<img src="${pageContext.request.contextPath}/resources/upload/${list.acd_name}/${photo[status.index]}">
						</td>
						<td class="text-center" id="td"><h2>${list.acd_name}</h2></td>
					</tr>
					<tr>
						<td id="td"><h5>이용 날짜 : ${list.start_date} ~ ${list.end_date}</h5></td>
					</tr>
					
					<tr>
						<td id="td"><h5>주소 : ${addr[status.index]}</h5></td>
					</tr>
					</table>
					</c:forEach>
			</form>	
		<%@include file="../include/footer.jsp" %>	
	</div>	
<!--  부트스트랩 js 사용 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/BootStrap/js/bootstrap.js"></script>
</body>
	
</html>
