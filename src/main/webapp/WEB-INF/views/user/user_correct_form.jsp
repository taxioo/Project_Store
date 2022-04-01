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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
		
		// 아이디 중복체크 화면open
		function openIdChk(){
			var openWin;
			
		
		    window.name = "parentForm";
		    openWin = window.open("IdCheckForm.do",
		            	"chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
		    
			//openWin.document.getElementById("userId").value = document.getElementById("id").value;
			}
		
		// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
		// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
		// 다시 중복체크를 하도록 한다.
		function inputIdChk(){
		    document.userId.idDuplication.value ="idUncheck";
		}

		function mypage_correct(f){
			
			f.method="POST";
			f.action = "user_correct.do";
			f.submit();
		}
		
		//비밀번호 변경
		
		function setPwd(){
			window.name = "pwdForm";
		    openWin = window.open("pwdForm.do",
		            	"pwdForm", "width=500, height=300, resizable = no, scrollbars = no");
			
		}
</script>
<body>
	<div class="container-fluid">
		<%@include file="../include/header.jsp" %>	
			<form id="login_form" name="userInfo">
				<div class="col-sm-12 text-center">
					<div class="jumbotron">
						<h2>마이페이지</h2>
					</div>
				</div>
				
				<div class="col-sm-12">
					<table class="text-center" align="center" border-radius="10px">
						<tr>
							<th colspan="3" style="background-color:#17A2B8;">아이디 / 비밀번호 </th>
						</tr>
						<tr>
							<th>아이디</th>
							<td align="center">
								<input type="text" class="form-control" name="id" id="id" onkeydown="inputIdChk()" readonly="readonly" value="${vo.id}" style="width:70%;"required>
							</td>
							<td>
								<input type="button" style="background: #429dff;" class="form-control" 
						  			   value="아이디 변경" placeholder="" onclick="openIdChk()" required>
                    			<input type="hidden" name="idDuplication" value="idUncheck" >
							</td>
						</tr>
						
						<tr>
							<th>비밀번호</th>
							<td align="center"><input class="form-control" type="password" name = "pwd" value="${vo.pwd}" style="width:70%;" readonly></td>
							<td><input type="button" style="background: #429dff;" class="form-control" value="비밀번호 변경"onclick="setPwd()"></td>
						</tr>
						<tr padding-top="100px;">
							<th colspan="3" style="background-color:#17A2B8;">개인정보</th>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								${vo.name} <input type="hidden" name="name" value="${vo.name}">
								<input type="hidden" name="user_num" value="${vo.user_num}">
							</td>
						</tr>
						
						<tr>
							<th>전화번호</th>
							<td>
								<div class="row">
									<div class="col-md-4">
									<input name="tel1" value="${vo.tel1}" class="form-control" >
									</div>
									<div class="col-md-4">
									<input name="tel2" value="${vo.tel2}" class="form-control">
									</div>
									<div class="col-md-4">
									<input name="tel3" value="${vo.tel3}" class="form-control">
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>주민번호</th>
							<td>${vo.jumin1} - ${vo.jumin2}
								<input type="hidden" value="${vo.jumin1}" name="jumin1">
								<input type="hidden" value="${vo.jumin2}" name="jumin2">
							</td>
						</tr>
						<tr>
							<th colspan="3" style="background-color:#17A2B8;">상세정보</th>
						</tr>
						
						<tr>
							<th>이메일</th>
							<td align="center">
								<input name="email" value="${vo.email}" class="form-control" style="width:70%;">
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td align="center">
								<input type="text" class="form-control" name="postcode" id="postcode" value="${vo.postcode}" readonly="readonly" style="width:70%;" required> 
							    <input type="text" class="form-control" id="address1" name="address1" value="${vo.address1}" readonly="readonly" style="width:70%;" required>
							    <input type="text" class="form-control" id="address2" name="address2" value="${vo.address2}" style="width:70%;" placeholder=""> 
							</td>
							<td class="address_button" onclick="execution_daum_address();" ><input type="button" style="background: #429dff;" class="form-control"  value="주소 찾기"></td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" class="btn btn-primary btn-lg" onclick="mypage_correct(this.form)">회원수정</button></n>
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
