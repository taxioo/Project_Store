<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
	</style>
</head>
<body>
	<div class="container-fluid">
		<%@include file="../include/ceo_header.jsp" %>	
		<div class="row align-items-center" align="center">
			<div class="col-md-12 text-center">
				<div class="jumbotron">
					<h1>환영합니다 사장님</h1> 
				</div>
			</div>
			
			<div class="col-md-6 text-center" align="center">
				<div class="card" style="width:50%;" align="center">
				<img class="card-img-top" src="${pageContext.request.contextPath}/resources/img/new.png" alt="Card image">
					<div class="card-body">
					<h4 class="card-title">회원가입</h4>
					<a href="ceo_new_check_form.do" class="btn btn-primary">Sign in</a>
					</div>
				</div>
			</div>
			
			<div class="col-md-6 text-center" align="center">
				<div class="card" style="width:50%;" align="center">
				<img class="card-img-top" src="${pageContext.request.contextPath}/resources/img/login.png" alt="Card image">
					<div class="card-body">
					<h4 class="card-title">로그인</h4>
					<a href="ceo_login_form.do" class="btn btn-primary">login</a>
					</div>
				</div>
			</div>
		</div><!-- row -->
		<%@include file="../include/footer.jsp" %>	
	</div>	
<!--  부트스트랩 js 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/BootStrap/js/bootstrap.js"></script>
</body>
	
</html>
