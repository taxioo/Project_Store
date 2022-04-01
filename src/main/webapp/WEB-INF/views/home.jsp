<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<!-- 부트스트랩 css 사용 -->
	<style>
		.container-fluid{
			background: url("${pageContext.request.contextPath}/resources/img/background1.jpg");
			background-size: cover;
		}
	</style>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/BootStrap/css/bootstrap.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container-fluid">
		<%@include file="include/header.jsp" %>	
		<div class="row"></div>
			<div class="col-md-12 mt-3 mb-5 text-center">
				<!-- 캐러셀 -->
				<div id="slideWrap" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
					    <div class="carousel-item active">
				      	<img src="${pageContext.request.contextPath}/resources/img/banner/banner1.png" alt="" width="1100" height="500">
					    </div>
					    
					    <div class="carousel-item">
				      	<img src="${pageContext.request.contextPath}/resources/img/banner/banner2.png" alt="" width="1100" height="500">
					    </div>
					    
					    <div class="carousel-item">
				      	<img src="${pageContext.request.contextPath}/resources/img/banner/banner3.jpg" alt="" width="1100" height="500">
					    </div>
					    
					    <%-- <div class="carousel-item">
				      	<img src="${pageContext.request.contextPath}/resources/img/glamping.jpg" alt="" width="1100" height="500">
					    </div> --%>
					    <a class="carousel-control-prev" href="#slideWrap" data-slide="prev">
					    <span style="color: Black;"><i class="fa-solid fa-angles-left fa-3x"></i></span>
					  	</a>
					    <a class="carousel-control-next" href="#slideWrap" data-slide="next">
					    <span style="color: Black;"><i class="fa-solid fa-angles-right fa-3x"></i></span>
						</a>
					</div>
				</div><!-- 캐러셀 끝-->
			</div>

					<!-- 카드 작업 -->
			<div class="row text-center mt-5" id="main_cd" style="margin:0 auto;">
				<div class="col-md-3">
					<div class="card" style="width:400px" >
					<img class="card-img-top" src="${pageContext.request.contextPath}/resources/img/motel.png" alt="Card image">
						<div class="card-body">
							<h4 class="card-title">모텔</h4>
							<a href="acd_list.do?acd_type=모텔" class="btn btn-primary">둘러보기</a>
						</div>
					</div>
				</div>
				
				<div class="col-md-3">
					<div class="card" style="width:400px">
					<img class="card-img-top" src="${pageContext.request.contextPath}/resources/img/hotel.png" alt="Card image">
						<div class="card-body">
							<h4 class="card-title">호텔</h4>
							<a href="acd_list.do?acd_type=호텔" class="btn btn-primary">둘러보기</a>
						</div>
					</div>
				</div>
				
				<div class="col-md-3">
					<div class="card" style="width:400px">
					<img class="card-img-top" src="${pageContext.request.contextPath}/resources/img/penshion.png" alt="Card image">
						<div class="card-body">
							<h4 class="card-title">펜션</h4>
							<a href="acd_list.do?acd_type=펜션" class="btn btn-primary">둘러보기</a>
						</div>
					</div>
				</div>
				
				<div class="col-md-3">
					<div class="card" style="width:400px">
					<img class="card-img-top" src="${pageContext.request.contextPath}/resources/img/glamping.png" alt="Card image">
						<div class="card-body">
							<h4 class="card-title">글램핑</h4>
							<a href="acd_list.do?acd_type=글램핑" class="btn btn-primary">둘러보기</a>
						</div>
					</div>
				</div>
			</div><!-- row -->
			<%@include file="include/footer.jsp" %>	
		</div>
<!--  부트스트랩 js 사용 -->

</body>
</html>
