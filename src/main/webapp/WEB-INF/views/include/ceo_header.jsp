<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<title>Home</title>
	<!-- 부트스트랩 css 사용 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/BootStrap/css/bootstrap.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    
	<!-- fontawesome -->
	<script>
		function go(){
			
			if(!confirm("관리 페이지를 나가시겠습니까?")){
				return;
			}
			
			alert("로그아웃 되었습니다.");
			sessionStorage.clear();
			location.href="main.do";
		}
		
	</script>
	<style>
		#h_1{padding:10px 0px;}
		#collapsibleNavbar{padding-right:30px;}
		
		/* 로고  */
		.navbar-brand{padding-left:30px;
					  font-size:30px;}
	    /* 검색 */
		#input{width:500px;}
		#btn_search{float:right}
		/* 배경 */
				   
	   .img{max-width: 100%; height: auto;}
	   
	   /* 드롭다운 메뉴 */
	   #h_drop{width:250px;
	   		   align:center;}
	   #h_drop_i{padding-top:30px;
	   		  	 padding-bottom:30px;}
	</style>
		<%session = request.getSession();%> <!-- 세션 저장  -->
		<script src="https://kit.fontawesome.com/f49c593d7a.js" crossorigin="anonymous"></script>
			<nav class="navbar navbar-expand-md bg-dark navbar-dark" id="h_1">
				<!-- 로고 -->
				<a class="navbar-brand justify-content-start" onclick="go();">CAMP</a>
				<a class="navbar-brand justify-content-start" href="ceo_main.do">사장님</a>
			</nav>
<!--  부트스트랩 js 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/BootStrap/js/bootstrap.js"></script>

