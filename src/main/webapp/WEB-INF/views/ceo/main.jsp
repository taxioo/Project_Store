<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script>
 function send(a){
		var acd_name = a;
		alert(acd_name);
		
		location = "room_list.do?acd_name= ";
		method="post";
        submit();
 }
</script>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js	"></script>
<body>
	<div class="container-fluid">
		<%@include file="../include/ceo_header.jsp" %>
			<div class="row" align="center">
				<div class="col-md-12 mt-5">
					<div class="jumbotron" style="width:70%; bacground-color: blue;" >
						<input type="button"  value = "숙박 등록하기" onclick="location.href='acd_insert_form.do'">
						<input type="button"  value = "로그아웃" onclick="location.href='logout.do'" style="margin-left:80%;">
					</div>
				</div>
				<div class="col-md-12 ">
					<form   id="acd_name">
						<c:forEach items="${list}" var="acd">
						<table class="mt-3 table-hover" id="t_head" align="center">
								<!-- 숙박이미지  -->
							<tr  onclick="location.href='room_list.do?acd_name=' + '${acd.acd_name}'" 
								style="cursor:hand">
								<td class="text-center" rowspan="2" style="width:28%;"><img src="${pageContext.request.contextPath}/resources/upload/${acd.acd_name}/${acd.acd_photo}"></td>
								<th><h3>${acd.acd_name}</h3></th>
								<td>${acd.acd_type}</td>
							</tr>
							
							<tr>
								<th colspan="2">${acd.acd_addr}</th>
							</tr>
							
							<tr>
								<td><input type="button" value="방 등록" onclick="location.href='room_insert_form.do?acd_name='+ '${acd.acd_name}' + '&acd_num=' + '${acd.acd_num}'"></td>
							</tr>
						</table>
						</c:forEach>
							
					</form>
				 </div>
			 </div>	
		<%@include file="../include/footer.jsp" %>	
	</div>	
<!--  부트스트랩 js 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/BootStrap/js/bootstrap.js"></script>
</body>
	
</html>
