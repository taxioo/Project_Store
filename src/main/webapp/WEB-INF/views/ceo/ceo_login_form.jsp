<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<!-- 부트스트랩 css 사용 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/BootStrap/css/bootstrap.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
	<style>
		.id {
		  width: 50%;
		  outline:none;
		  color: #636e72;
		  font-size:16px;
		  height:50px;
		  background: none;
		  margin:3% 0;
		}

		.pw {
		  width: 50%;
		  outline:none;
		  color: #636e72;
		  font-size:16px;
		  height:50px;
		  background: none;
		  margin:3% 0;
		}
		
		.btn{position:relative;
			  left:25%;
			  transform: translateX(-50%);
			  margin-bottom: 40px;
			  width:50%;
			  height:40px;
			  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
			  background-position: left;
			  background-size: 200%;
			  color:white;
			  font-weight: bold;
			  border:none;
			  cursor:pointer;
			  transition: 0.4s;
			  display:inline;}
		#login_body{padding: 20% 20%;}
	</style>
	</head>
		<script src="https://kit.fontawesome.com/f49c593d7a.js" crossorigin="anonymous"></script>
		<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js	"></script>
		<script>
  function ceo_send(f){
		var id = f.id.value.trim();
		var pwd = f.pwd.value.trim();
		
		if(id==""){
			alert("아이디를 입력해주세요")
			return;
		}
		if(pwd==""){
			alert("비밀번호를 입력해주세요")
			return;
		}
		
		
		var url = "ceo_login.do";
		var param = "id="+id+"&pwd="+ encodeURIComponent(pwd);
		sendRequest(url, param, resultFn, "POST");
		
	}
	
	function resultFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			//삭제 성공 여부에 따라서 경고창을 띄우자 
			var data = xhr.responseText; //"no" or "yes"
			if(data == 'no'){
				alert("로그인 실패");
				alert("아이디, 비밀번호를 똑바로 입력하세요");
				return;
			}else{
				alert("로그인 성공");
			}
			location.href="ceo_main.do";
		}
	}
	
</script>
<body>
<div class= "container-fluid">
	<%@include file="../include/ceo_header.jsp" %>
	<div class="row" id="login_row">
	  <div class="col-md-12 text-center align-self-center" id="login_body">
	<form action="index.html" method="post" class="loginForm">
	  <h1>Login</h1>
	    <input type="text" class="id" name = "id" placeholder="ID">
	  
	  
	  <div class="passForm">
	    <input type="password" class="pw" name="pwd" placeholder="PW">
	  </div>
	  
	  <button type="button" class="btn" onclick="ceo_send(this.form);">
	    LOG IN
	  </button>
	  
	  	<div class="bottomText">
	    <a href="ceo_search_id.do">아이디 / 비밀번호 찾기 </a>
	    </div>
		</form>
	  </div>
	</div>
</div>
<!--  부트스트랩 js 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/BootStrap/js/bootstrap.js"></script>
</body>
</html>

