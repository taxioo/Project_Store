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
	</style>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js	"></script>
<script>
	function user_delete_check(){
		var id = '${vo.id}';
		var pwd = '${vo.pwd}';
		
		var con_test = confirm("정말 삭제하시겠습니까?");
		
		if(con_test){
			method= "post";
			location.href="user_delete_check.do?id=" + id + "&pwd=" + pwd;
		}else{
			return;
		}
		
	}
	
	function user_correct(){
		var id = '${vo.id}'
		location.href="user_correct_form.do";
	}

</script>
<body>
	<div class="container-fluid">
		<%@include file="../include/header.jsp" %>	
			<form>
				<div class="col-sm-12 text-center">
					<div class="jumbotron">
						<h2>마이페이지</h2>
					</div>
				</div>
				
				<div class="col-sm-12">
					<table class="text-center" align="center" border-radius="10px">
						<tr>
							<th colspan="2" style="background-color:#17A2B8;">아이디 </th>
						</tr>
						
						<tr>
							<th>아이디</th>
							<td>${vo.id}</td>
						</tr>
						<tr padding-top="100px;">
							<th colspan="2" style="background-color:#17A2B8;">개인정보</th>
						</tr>
						<tr>
							<th>이름</th>
							<td>${vo.name}</td>
						</tr>
						
						<tr>
							<th>전화번호</th>
							<td>${vo.tel1} - ${vo.tel2} - ${vo.tel3} </td>
						</tr>
						
						<tr>
							<th>주민번호</th>
							<td>${vo.jumin1} - ${vo.jumin2}</td>
						</tr>
						<tr>
							<th colspan="2" style="background-color:#17A2B8;">상세정보</th>
						</tr>
						
						<tr>
							<th>이메일</th>
							<td>${vo.email}</td>
						</tr>
						<tr>
							<th>주소</th>
							<td> 우편번호 ( ${vo.postcode} ) </br></br>${vo.address1} ${vo.address2}</td>
						</tr>
						<tr>
							
							<td colspan="2">
								<button type="button" class="btn btn-primary btn-lg" onclick="user_correct()">회원수정</button></n>
								<button type="button" class="btn btn-danger btn-lg" onclick="user_delete_check()">회원탈퇴</button>
							</td>
						</tr>
					</table>
				</div>	
			</form>	
		<%@include file="../include/footer.jsp" %>	
	</div>	
<!--  부트스트랩 js 사용 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/BootStrap/js/bootstrap.js"></script>
</body>
	
</html>
