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
				<table class="text-center mt-5" border="1"  width="70%" height="14%" align="center" style="background-color:white;">
					<tr>
						<th colspan="2"><h2>${store_vo.start_date}</h2></th>
					</tr>
					
					<tr>
						<td>
							<h4>숙소 예약번호 : ${store_vo.res_num}</h4>
						</td>
						<td>
							<h6>예약한 날짜 : ${store_vo.res_date}</h6>
						</td>
					</tr>
				</table>
				
				<table class="text-center" border="1"  width="70%" height="40%" align="center" style="background-color:white;">
					<tr>
						<td>숙소이름: </td>
						<td>${acd_name}</td>
					</tr>
					
					<tr>
						<td>숙박날짜 : </td>
						<td>${store_vo.start_date} ~ ${store_vo.end_date}</td>
					</tr>
					
					<tr>
						<th colspan="2">예약자 정보</th>
					</tr>
					<c:forEach items="${us_list}" var="us_list">
					<tr>
						<td>이름</td>
						<td>${us_list.name}</td>
					</tr>
					
					<tr>
						<td>휴대폰 번호</td>
						<td>${us_list.tel1}-${us_list.tel2}-${us_list.tel3}</td>
					</tr>
					
					<tr>
						<td>인원수 : </td>
						<td>${store_vo.res_cnt} 명</td>
					</tr>
					</c:forEach>
				</table>
				
				<table class="text-center" border="1"  width="70%" height="14%" align="center" style="background-color:white;">
					<tr>
						<th colspan="2">가격</th>
					</tr>
					<c:forEach items="${rm_list}" var="rm_list">
					<tr>
						<td>예약금액</td>
						<td>${rm_list.room_price }</td>
					</tr>
					</c:forEach>
				</table>
			</form>	
		<%@include file="../include/footer.jsp" %>	
	</div>	
<!--  부트스트랩 js 사용 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/BootStrap/js/bootstrap.js"></script>
</body>
	
</html>
