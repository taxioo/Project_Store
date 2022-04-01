<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
	<title>Home</title>
	<!-- 부트스트랩 css 사용 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/BootStrap/css/bootstrap.css">
	<style>
		table{
			width:70%;
			height:70%;
			align:center;
			border-radius: 8px;
			border-collapse: collapse;
			background-color:white;
		}
		tr{
			border: 5px double;
		}
		form{
			width:100%;
			height:100%;
		}
	</style>
</head>
<script>
function room_send(f){
	var type = f.room_type.value.trim();
	var price = f.room_price.value.trim();
	var acd_name = f.acd_name.value.trim();
	var ceo_id = f.ceo_id.value.trim();
	var acd_num = f.acd_num.value;
	
	if(type == ""){
		alert("방 타입을 입력하세요");
		return;
	}
	
	if(price == ""){
		alert("가격을 입력하세요");
		return;
	}
	
	f.action="room_insert.do";
	f.submit();
}
</script>
<body>
	<div class="container-fluid">
		<%@include file="../include/ceo_header.jsp" %>	
					<form method="post" enctype="multipart/form-data">
					<div class="col-sm-12 mt-5" >
					<table width="70%" align="center" >
						<tr>
							<th class="text-center">방타입</th>
							<td colspan="2"><input class="form-control" name="room_type"placeholder="특수문자를 뺴고 입력해주세요"></td>
						</tr>
						
						<tr>
							<th class="text-center">방가격</th>
							<td colspan="2"><input class="form-control" name="room_price" placeholder="금액만 입력해주세요"></td>
						</tr>
						<tr>
							<th class="text-center">
								인원수
							</th>
							<td>
							<select class="form-control" style="width:100%" name="room_cnt">
									<option value="">최대 인원수 선택</option>
									<option value="2">2명</option>
   									<option value="3">3명</option>
   									<option value="4">4명</option>
   									<option value="5">5명</option>
   									<option value="6">6명</option>
							</select>
							</td>
						</tr>
						<tr>
							<th class="text-center">
								사진
							</th>
							<td>
								<input type="hidden" name="acd_name" value="${acd_name}">
								<input type="hidden" name="acd_num" value="${acd_num}">
								<%session = request.getSession();%>
								
								<input type="file" name="rm_photo">
							</td>
						</tr>
						<tr>
							<th class="text-center">사업자명</th>	
							<td><input class="form-control" name="ceo_id" value="<%out.print(session.getAttribute("ceo_id"));%>" readonly ></td>
						</tr>	
						<tr >
							<td align="center" colspan="2"><input class="form-control text-center" style="background: #429dff; " 
										type="button" value="등록" onclick="room_send(this.form);"></td>
						</tr>
					</table>
							
					</div>
				</form>
		<%@include file="../include/footer.jsp" %>	
	</div>	
<!--  부트스트랩 js 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/BootStrap/js/bootstrap.js"></script>
</body>
	
</html>
