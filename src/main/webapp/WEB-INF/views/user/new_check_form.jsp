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
	<script>
function send(f){
	var name = f.name.value.trim();
	var tel = f.tel.value.trim();
	var tel_pattern = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	
	if(name==""){
		alert("이름을 입력해주세요");
		return;
	}
	if(tel==""){
		alert("전화번호를 입력해주세요");
		return;
	}
	if(!tel_pattern.test(tel)){
		alert("-없이 입력해주세요");
		return;
	}
	

	
	var url = "check_new.do";
	var param = "name="+name+"&tel="+ tel;
	sendRequest(url, param, result, "POST");
}

function result(){
	if(xhr.readyState == 4 && xhr.status == 200){
		//삭제 성공 여부에 따라서 경고창을 띄우자 
		var name = document.getElementById("name").value;
		var tel = document.getElementById("tel").value;
		var data = xhr.responseText; //"no" or "yes"
		var tel1 = tel.substr(0, 3);
		var tel2 = tel.substr(3, 4);
		var tel3 = tel.substr(7, 4);
		
		if(data == 'no'){
			alert("가입하신 아이디가 있습니다.");
			return;
		}else{
			alert("가입하실수 있습니다.");
		}
		location.href="new_form.do?name="+ name + "&tel1=" + tel1 + "&tel2=" + tel2 + "&tel3=" + tel3;
		//list.do?page="?name="+ name + "&tel2=" + tel2 + "&tel3=" + tel3"
	}
	
}
  </script>
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
		
<body>
<div class= "container-fluid">
	<%@include file="../include/header.jsp" %>
	<div class="row" id="login_row">
	  <div class="col-md-12 text-center align-self-center" id="login_body">
	<form action="index.html" method="post" class="loginForm">
		  <h1>회원가입</h1>
		  <h5>회원가입전 아이디 중복검사를 실행합니다.</h5>
	      <div class="idForm">
	        <input type="text" class="id" id="name" name = "name" placeholder="Name">
	      </div>
	      <div class="passForm">
	        <input type="text" class="pw" id="tel" name="tel" placeholder="Tel">
	      </div>
		  
		  <button type="button" class="btn" onclick="send(this.form);">
		    	회원가입
		  </button>
	</form>
	  </div>
	</div>
</div>
<!--  부트스트랩 js 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/BootStrap/js/bootstrap.js"></script>
</body>
</html>

