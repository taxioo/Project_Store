<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<!-- 부트스트랩 css 사용 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/BootStrap/css/bootstrap.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
	<script>
	function ceo_send(f){
		//check
		
		var ceo_id = f.id.value.trim();
		var ceo_name = f.name.value.trim();
		var ceo_pwd = f.pwd.value.trim();
		var ceo_tel = f.tel.value;
		
		///유효성 체크
		if(ceo_id == ""){
			alert("아이디를 입력하셔야 합니다");
			return;
		}
		
		if(ceo_pwd == ""){
			alert("비밀번호를 입력하셔야 합니다");
			return;
		}
		if(ceo_name == ""){
			alert("이름을 입력하셔야 합니다");
			return;
		}
		
		/* alert(ceo_id);
		alert(ceo_pwd);
		alert(ceo_name);
		alert(ceo_tel); */
		f.method = "post";
		f.action = "ceo_insert.do";
		f.submit();
	}
	
	//idcheck
	function checkValue(){
        
        if(!form.id.value){
            alert("아이디를 입력하세요.");
            return false;
        }
        
        if(form.idDuplication.value != "idCheck"){
            alert("아이디 중복체크를 해주세요.");
            return false;
        }

	}
	
 	function goFirstForm() {
        location.href="ceo_login_main.do";
    }    
    
    // 아이디 중복체크 화면open
    function openIdChk(){
    	alert("이거는 되니?");
    	var openWin;
    	

        window.name = "parentForm";
        openWin = window.open("ceo_IdCheckForm.do",
                	"chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
        
    	//openWin.document.getElementById("userId").value = document.getElementById("id").value;
    	}

    // 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
    // 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
    // 다시 중복체크를 하도록 한다.
    function inputIdChk(){
        document.userId.idDuplication.value ="idUncheck";
    }
  	</script>
	<style>
		.id {
		  outline:none;
		  color: #636e72;
		  font-size:16px;
		  height:50px;
		  background: none;
		}

		.pw {
		  outline:none;
		  color: #636e72;
		  font-size:16px;
		  height:50px;
		  background: none;
		}
		
		.btn{position:relative;
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
		
		#new_bcg{width: 40%; width: 40%; float: none; margin:0 auto; background: white;}
		.new_background{background-image : url(${pageContext.request.contextPath}/resources/img/background.jpg);}
	</style>
	</head>
		<script src="https://kit.fontawesome.com/f49c593d7a.js" crossorigin="anonymous"></script>
		<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js	"></script>
		
<body>
<div class= "container-fluid">
	<%@include file="../include/ceo_header.jsp" %>
	<div class="new_background">
	<div class="input-form-backgroud row" id="new_bcg"> 
	<div class="input-form col-md-12 mx-auto">
		<h2 class="mb-3 text-center"  style="margin: 50px 0px;">회원가입</h2> 
		<form class="validation-form" style="margin-top:50px;" id="login_form" name="userInfo" novalidate> 
			<div class="row">
				<div class="col-md-12">
					<h6>ID</h6>
				</div>
				 
				<div class="col-md-8 mb-3"> 
					<input type="text" class="form-control" name="ceo_id" id="id" onkeydown="inputIdChk()" readonly="readonly" required>  
				</div>
				
				<div class="col-md-4 mb-5" >
					<input type="button" style="background: #429dff;" class="form-control" 
						   value="중복검사" placeholder="" onclick="openIdChk()" required>
                    <input type="hidden" name="idDuplication" value="idUncheck" >
				</div>
				
				<div class="col-md-12 mb-5"> 
					<h6>비밀번호</h6>
					<input type="password" class="form-control" id="pwd"  name = "ceo_pwd" placeholder="비밀번호를 입력하세요" required>
				</div> 
			</div>
				
			<!-- 이름  -->	
			<div class="row"> 
				<div class="col-md-12 mb-5"> 
					<h6>이름</h6>
					<input type="text" class="form-control" name="ceo_name" id="name" readonly="readonly" value="${name}" placeholder = "이름을 입력해주세요"required> 
					<div class="invalid-feedback"> 이름을 입력해주세요. </div> 
				</div>
			</div>
					
			<!-- 전화번호  -->
			<div class="row">
				<div class="col-md-12">
					<h6>전화번호</h6>
				</div>
				<div class="col-md-12 mb-5"> 
				<input type="text" class="form-control" id="tel"  name = "ceo_tel" value="${tel}" readonly="readonly" required> 
				</div>
			</div>
			
					
			<!-- 가입완료  -->
			<div class="row">
				<div class="col-md-12">
					<hr class="mb-4"> 
					<button class="btn btn-primary btn-lg btn-block" type="submit" onclick="ceo_send(this.form);">가입 완료</button>
				</div>
			</div>	 
		</form> 
		</div> 
	</div>
	</div> 
</div>
<!--  부트스트랩 js 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/BootStrap/js/bootstrap.js"></script>
</body>
</html>