<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
	<!-- 부트스트랩 css 사용 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/BootStrap/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1/jquery-ui.min.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1/datepicker-ko.js"></script>
	
	<style>
		html, body {
		    height: 100%;
		}
		.container-fluid {
		    height: 100%;
			background: url("${pageContext.request.contextPath}/resources/img/background1.jpg");
			background-size: cover;
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
<script>

 
</script>
<body>
	<div class="container-fluid">
		
		<%@include file="../include/header.jsp" %>
			<div class="row">
				<c:if test="${str eq 'yes'}">
				<div class="col-md-12 ">
					<form id="acd_name">
						<c:forEach items="${list}" var="acd">
						<table class="mt-3 table-hover" border="1"  id="t_head" align="center">
								<!-- 숙박이미지  -->
							<tr onclick="location.href='cus_room_list.do?acd_name=' + '${acd.acd_name}'" >
							
								<td class="text-center" rowspan="2" style="width:28%;"><img src="${pageContext.request.contextPath}/resources/upload/${acd.acd_name}/${acd.acd_photo}"></td>
								<td><h3>${acd.acd_name}</h3></td>
								<td>${acd.acd_type}</td>
							</tr>
							
							<tr>
								<td colspan="2">${acd.acd_addr}</td>
							</tr>
						</table>
						</c:forEach>
					</form>
				 </div>
				</c:if>
				
				
				<c:if test="${str eq 'no'}">
					<div class="col-md-12 text-center">
					<table class="text-center" margin-top="30%;" align="center" border="0">
						<tr>
							<td>
								<h1>죄송합니다</h1>
							</td>
						</tr>
						
						<tr>
							<td>
								<h1>검색하신 호텔은 서비스 준비중입니다.</h1>
							</td>
						</tr>
					</table>
					</div>
				</c:if>
			 </div>	
	</div>	
		<%@include file="../include/footer.jsp" %>	
<!--  부트스트랩 js 사용 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/BootStrap/js/bootstrap.js"></script>
</body>
	
</html>
