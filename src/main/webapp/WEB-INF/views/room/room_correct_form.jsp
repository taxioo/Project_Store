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
			width:100%;
			height: 100%;
		}
		
		#rec_tb{
			width:700px;
			text-align:center;
		}
		
	</style>
</head>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script>
function room_correct(f){
	
	var type = f.room_type.value.trim();
	var price = f.room_price.value.trim();
	var acd_name = f.acd_name.value.trim();
	var id = f.room_id.value.trim();
	var photo = f.room_photo.value;
		
	if(type == ""){
		alert("방 타입을 입력하세요");
		return;
	}
	
	if(price == ""){
		alert("가격을 입력하세요");
		return;
	}
	
	
	var url = "room_correct.do";
	var param = "room_id=" + id + "&room_type="+type+"&room_price="+price+"&acd_name="+acd_name +"&room_photo="+photo;
	sendRequest(url, param, resultFn, "POST");
}

function resultFn(){
	if(xhr.readyState == 4 && xhr.status == 200){
		//삭제 성공 여부에 따라서 경고창을 띄우자 
		var data = xhr.responseText; //"no" or "yes"
		if(data == 'no'){
			alert("수정 실패");
			alert("관리자에게 문의하세요");
			return;
		}else{
			alert("수정 성공");
		}
		
		window.opener.location.reload();
		
		self.close();
		/* location.href="main.do"; */
	}
}
</script>
<body>
	<div class="container-fluid">
		<%@include file="../include/ceo_header.jsp" %>	
			<div class="row">
					<form method="post" enctype="multipart/form-data">
					<div class="col-md-12 mt-5" style="display: flex; justify-content: center;">
					<table border="1" id="rec_tb">
						<tr>
							<td>방타입</td>
							<td colspan="2"><input name="room_type" value="${vo.getRoom_type()}" placeholder="" style="width:100%"></td>
						</tr>
						
						<tr>
							<td>방가격</td>
							<td colspan="2"><input name="room_price" value="${vo.getRoom_price()}" placeholder="금액만 입력해주세요" style="width:100%"></td>
						</tr>
							<!-- 호텔등록 id -->
						<tr>
							<td colspan="3">
								<input type="hidden" name="acd_name" value="${vo.getAcd_name()}">
								<input type="hidden" name="room_photo" value="${vo.getRoom_photo()}">
								<input type="hidden" name="room_id" value="${vo.getRoom_id()}">
								<%session = request.getSession();%>
							</td>
						</tr>
						<tr>
							<td >사업자명</td>	
							<td><input name="ceo_id" value="<%out.print(session.getAttribute("ceo_id"));%>" style="width:100%" readonly ></td>
						</tr>	
						<tr>
							<td><input type="button" value="등록" onclick="room_correct(this.form);" style="width:50%;"></td>
						</tr>
					</table>
							
					</div>
				</form>
			</div>
		<%@include file="../include/footer.jsp" %>	
	</div>	
<!--  부트스트랩 js 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/BootStrap/js/bootstrap.js"></script>
</body>
	
</html>
