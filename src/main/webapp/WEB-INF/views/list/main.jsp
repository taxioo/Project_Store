<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
	<!-- 부트스트랩 css 사용 -->
	
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/BootStrap/css/bootstrap.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</head>
<script>
</script>
<body>
	<div class="container-fluid">
		<%@include file="../include/header.jsp" %>
			<div class="row">
				<div class="col-md-12 ">
					<form  id="acd_name">
						<c:forEach items="${list}" var="acd">
						<table class="mt-3 table-hover" border="1"  id="t_head" onclick="location.href='cus_room_list.do?acd_name=' + '${acd.acd_name}'" 
								style="cursor:hand" align="center">
							<!-- 숙박이미지  -->
							<tr >
								<td class="text-center" rowspan="2" style="width:28%;">
								<img src="${pageContext.request.contextPath}/resources/upload/${acd.ceo_id}/${acd.acd_name}/${acd.acd_photo}"></td>
								<td style="width:40%;"><h3>${acd.acd_name}</h3></td>
								<td>${acd.acd_type}</td>
							</tr>
								
							<tr>
								<td colspan="2">${acd.acd_addr}</td>
							</tr>
							
						</table>
						</c:forEach>
					</form>
				 </div>
			 </div>	
	</div>	
		<%@include file="../include/footer.jsp" %>	
<!--  부트스트랩 js 사용 -->
</body>
	
</html>
