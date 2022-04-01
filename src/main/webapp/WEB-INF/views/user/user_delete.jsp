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
		input.underline {
		 border-top: 0px;
		 border-left: 0px;
		 border-right: 0px;
		 border-bottom: 1px solid;
		 width: 70%;
		 heigth: 50%;
		 font-size: x-large;
		}
		input:focus {outline:none;}
		
		#btn-col{
			width:73%;
			margin:auto;
		}
	</style>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js	"></script>
<script>
	function user_delete(f){
		var id = '${id}';
		var pwd = '${pwd}';
		var check_pwd = f.pwd.value.trim();

		var con_test = confirm("정말 삭제하시겠습니까?");
		
		if(con_test){
			
			if(pwd != check_pwd){
				alert("비밀번호가 틀립니다");
				return;
			}
			
			method= "post";
			location.href="user_delete.do?id=" + id;
		}else{
			return;
		}
		
		
		
	}
	

</script>
<body>
	<div class="container-fluid">
		<%@include file="../include/header.jsp" %>	
			<form>
				<div class="col-sm-12 mt-5">
				<table class="text-center" align="center">
					<tr>
						<td>
							<h5>회원탈퇴를 하시려면 안내 및 동의가 필요합니다.</h5>
							<h5>정말로 회원탈퇴를 진행하시겠습니까</h5>
						</td>
					</tr>
					<tr>
						<td><input class="underline" name="pwd" type="password" placeholder="비밀번호를 입력하세요" width="100%;"></td>
					</tr>
				</table>
				<div class="col-sm-12" id="btn-col" align="center">
					<button type="button" class="btn btn-info btn-lg btn-block" onclick="user_delete(this.form);">회원탈퇴하기</button>
				</div>
				</div>
			</form>	
		<%@include file="../include/footer.jsp" %>	
	</div>	
<!--  부트스트랩 js 사용 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/BootStrap/js/bootstrap.js"></script>
</body>
	
</html>
