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
		
		#rec_tb{
			width:700px;
			text-align:center;
		}
		
	</style>
</head>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function acd_send(f){
	var name = f.acd_name.value.trim();
	var addr = f.acd_addr.value.trim();
	var type = f.acd_type.value.trim();
	
	if(name == ""){
		alert("숙박명을 입력하세요");
		return;
	}
	
	if(addr == ""){
		alert("숙박명을 입력하세요");
		return;
	}
	
	if(type == ""){
		alert("숙박명을 입력하세요");
		return;
	}
	
	f.action="acd_insert.do";
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
            	document.getElementById("address1").value = '';
                addr += ' ';
            }
            
             $("[name=acd_addr]").val(addr);            // 대체가능
             
             self.close()
 
        }
    }).open();  
}//다음주소api 끝
</script>
<body>
	<div class="container-fluid">
		<%@include file="../include/ceo_header.jsp" %>	
			<div class="row">
					<form method="post" enctype="multipart/form-data">
					<div class="col-md-12 mt-5" style="display: flex; justify-content: center;">
					<table border="1" id="rec_tb">
						<tr>
							<td>숙박명</td>
							<td colspan="2"><input name="acd_name"placeholder="특수문자를 뺴고 입력해주세요" style="width:100%"></td>
						</tr>
						
						<tr>
							<td>숙박주소</td>
							<td><input type="text" class="form-control" id="address1" name="acd_addr" value="" readonly="readonly" required> </td>
							<td><input type="button"  value="주소 찾기" onclick="execution_daum_address();"></td>
						</tr>
						<tr>
							<td>숙박타입</td>
							<td colspan="2">
								<select style="width:100%" name="acd_type">
										<option value="">숙박 타입 선택</option>
  										<option value="모텔">모텔</option>
    									<option value="호텔">호텔</option>
    									<option value="펜션">펜션</option>
    									<option value="글램핑">글램핑</option>
								</select>
							</td>
						</tr>
							<!-- 호텔등록 id -->
						<tr>
							<td>
								사진
							</td>
							<td>
								<%session = request.getSession();%>
								<input type="hidden" name="ceo_id" value="<%out.print(session.getAttribute("ceo_id")); %>">
								<input type="file" name="photo">
							</td>
						</tr>
							
						<tr>
							<td colspan="2"><input type="button" value="등록" onclick="acd_send(this.form);" style="width:50%;"></td>
						</tr>
					</table>
							
					</div>
				</form>
			</div>
		<%@include file="../include/footer.jsp" %>	
	</div>	
<!--  부트스트랩 js 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/BootStrap/js/bootstrap.js"></script>
</body>
	
</html>
