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
	function send(f){
		//check
		//var tel_pattern = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		var email_pattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		
		var id = f.id.value.trim();
		var pwd = f.pwd.value.trim();
		var name = f.name.value.trim();
		
		var jumin1 = f.jumin1.value;
		var jumin2 = f.jumin2.value;
		
		var tel1 = f.tel1.value;
		var tel2 = f.tel2.value;
		var tel3 = f.tel3.value;
		
		var postcode = f.postcode.value;
		var address1 = f.address1.value.trim();
		var address2 = f.address2.value.trim();
		var email = f.email.value.trim();
		
		///유효성 체크
		if(id == ""){
			alert("아이디를 입력하셔야 합니다");
			return;
		}else if(id.length < 5){
			alert("6자리 이상 입력하셔야 합니다." )
		}
		
		if(pwd == ""){
			alert("비밀번호를 입력하셔야 합니다");
			return;
		}
		if(name == ""){
			alert("이름을 입력하셔야 합니다");
			return;
		}
		if(jumin1==""){
			alert("주민번호를 입력해");
			return;
		}
		if(jumin2==""){
			alert("뒷자리 입력해");
			return;
		}
		if(!email_pattern.test(email)){
			alert("입력된 값은 이메일이 아닙니다.");
			return;
		}
		
		
		f.method = "post";
		f.action = "insert.do";
		f.submit();
	}
	

	 
	/* 다음 주소 연동 */
	function execution_daum_address(){
		new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
 
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    addr += extraAddr;
                
                } else {
                	document.getElementById("address2").value = '';
                    addr += ' ';
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 //$(".postcode").val(data.zonecode);
	             $("[name=postcode]").val(data.zonecode);    // 대체가능
	             //$(".address1").val(addr);
	             $("[name=address1]").val(addr);            // 대체가능
	             
	             // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
	             document.getElementById("address2").focus();
	 
	        }
	    }).open();  
	}//다음주소api 끝
	
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
        location.href="main.do";
    }    
    // 아이디 중복체크 화면open
    function openIdChk(){
    	var openWin;
        window.name = "parentForm";
        openWin = window.open("IdCheckForm.do",
                	"chkForm", "width=500, height=300, resizable = no, scrollbars = no");
    	}
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
	<%@include file="../include/header.jsp" %>
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
					<input type="text" class="form-control" name="id" id="id" onkeydown="inputIdChk()" readonly="readonly" required>  
				</div>
				
				<div class="col-md-4 mb-5" >
					<input type="button" style="background: #429dff;" class="form-control" 
						   value="중복검사" placeholder="" onclick="openIdChk()" required>
                    <input type="hidden" name="idDuplication" value="idUncheck" >
				</div>
				
				<div class="col-md-12 mb-5"> 
					<h6>비밀번호</h6>
					<input type="password" class="form-control" id="pwd"  name = "pwd" placeholder="비밀번호를 입력하세요" required>
				</div> 
			</div>
				
			<!-- 이름  -->	
			<div class="row"> 
				<div class="col-md-12 mb-5"> 
					<h6>이름</h6>
					<input type="text" class="form-control" name="name" id="name" readonly="readonly" value="${name}" placeholder = "이름을 입력해주세요"required> 
					<div class="invalid-feedback"> 이름을 입력해주세요. </div> 
				</div>
			</div>
			
			<!-- 주민번호 -->
			<div class="row"> 
				<div class="col-md-12">
					<h6>주민번호</h6>
				</div> 
				<div class="col-md-6 mb-5">
					<input type="text" class="form-control" name="jumin1" id="jumin1" value="" placeholder="920910" required> 
				</div> 
				
				<div class="col-md-6 mb-5">  
					<input type="password" class="form-control" name="jumin2" id="jumin2" value="" placeholder="2112122" required> 
				</div>
			</div>
					
			<!-- 전화번호  -->
			<div class="row">
				<div class="col-md-12">
					<h6>전화번호</h6>
				</div>
				<div class="col-md-2 mb-5"> 
				<input type="text" class="form-control" id="tel1"  name = "tel1" placeholder="010" value="${tel1}" readonly="readonly" required> 
				</div>
				<div class="col-md-5 mb-5"> 
				<input type="text" class="form-control" id="tel2"  name = "tel2" placeholder="1111" value="${tel2}" readonly="readonly" required> 
				</div>
				<div class="col-md-5 mb-5"> 
				<input type="text" class="form-control" id="tel3"  name = "tel3" placeholder="2222" value="${tel3}" readonly="readonly" required> 
				</div>
				<div class="invalid-feedback"> 전화번호를 입력해주세요. </div> 
			</div>
			
			<!-- 이메일  -->
			<div class="row">	
				<div class="col-md-12 mb-5"> 
					<h6>E-mail</h6>
					<input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" value="" required> 
				</div>
			</div>
			
			<!-- 우편번호 -->
			<div class="row">
				<div class="col-md-3 mb-3"> 
				<h6>우편번호</h6>
						<input type="text" class="form-control" name="postcode" id="postcode" value="" readonly="readonly" required> 
				</div> 
			
					
				<div class="col-md-12 mb-3"> 
					<input type="text" class="form-control" id="address1" name="address1" value="" readonly="readonly" required> 
				</div> 
				
				<div class="col-md-12 mb-1"> 
					<input type="text" class="form-control" id="address2" name="address2" value="" placeholder=""> 
				</div>
				
				<div class="col-md-3 mb-5">
					<label for="postcode"></label> 
					<div class="address_button" onclick="execution_daum_address();">
						<input type="button"  value="주소 찾기">
					</div>
				</div>
			</div>
					
			<!-- 가입완료  -->
			<div class="row">
				<div class="col-md-12">
					<hr class="mb-4"> 
					<button class="btn btn-primary btn-lg btn-block" type="submit" onclick="send(this.form);">가입 완료</button>
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

