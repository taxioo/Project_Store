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
			align:center;
			border: 5px double;
			background-color:white;
			cursor:hand;
		}
		
		th, td {
	    border-bottom: 1px solid #444444;
	    padding: 10px;
	  }
	  
		
	</style>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js	"></script>
<script>
function kakaopay(f){
	var room_id = '${rm_vo.room_id}';
	var acd_name = '${rm_vo.acd_name}';
	var price = '${rm_vo.room_price}';
	var name = '${us_vo.name}';
	var res_cnt = f.res_cnt.value;
	
	var start_date = f.start_date.value;
	var end_date = f.end_date.value;
	
	//alert(start_date);
	//alert(end_date);
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp40743792'); 
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
	IMP.request_pay({
		pg: 'kakao',
		pay_method: 'card',
		merchant_uid: 'merchant_' + new Date().getTime(),
		name: '숙박명 : ' + acd_name,
		amount: price,
		buyer_name: name,
		}, function (rsp) {
			console.log(rsp);
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += 	'숙박명 : ' + acd_name +
					'\n결제 금액 : ' + rsp.paid_amount +
					'\n예약자 : ' + name;
			alert(msg);
			

			location = "reserve.do?user_num=" + '${us_vo.user_num}' + '&res_cnt=' + res_cnt + 
						"&date1=" + start_date + "&date2=" + end_date + "&room_id=" + room_id + 
						"&acd_name=" + acd_name;
	} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
			alert(msg);
	});
}

</script>
<body>
	<div class="container-fluid">
		<%@include file="../include/header.jsp" %>	
				<form method="post" action="location.href='reserve.do'">
			<div class="row">
				<div class= "col-sm-12">
					<div class="jumbotron text-center">
						<h2>예약하기</h2>
					</div>
				</div>
				
				<div class= "col-sm-12 text-center" id="tb-col">
					<table  align="center" >
						<tr>
							<th class="text-center" colspan="2">이용자정보</th>
						</tr>
						
						<tr>
							<th>이름<input type="hidden" name="room_id" value="${rm_vo.room_id}"></th>
							<td>${us_vo.name}</td>
						</tr>
						
						<tr>
							<th>전화번호</th>
							<td>${us_vo.tel1} - ${us_vo.tel2} - ${us_vo.tel3}</td>
						</tr>
					</table>
				</div>
				
				<div class= "col-sm-12 text-center mt-3" id="tb-col">
					<table align="center">
						<tr>
							<th class="text-center" colspan="2">숙박정보</th>
						</tr>
						
						<tr>
							<th>숙박명</th>
							<td>${rm_vo.acd_name}</td>
						</tr>
						
						<tr>
							<th>룸 타입</th>
							<td>${rm_vo.room_type}</td>
						</tr>
						
						<tr>
							<th>숙박  인원수</th>
							<td>
								<input name="res_cnt" placeholder="2" value="2"> / 최대인원  ${rm_vo.room_cnt} 
							</td>
						</tr>
						
						<tr>
							<th>숙박  날짜</th>
							<td>
								<input name="start_date" value="${start_date }" readonly> / <input name="end_date" value="${end_date }" readonly>
							</td>
						</tr>
						
					</table>
				</div>	
				
				<div class= "col-sm-12 text-center mt-3" id="tb-col">
					<table align="center">
						<tr>
							<th class="text-center" colspan="2">결제하기</th>
						</tr>
						<tr>
							<th>예약금액</th>
							<td>${rm_vo.room_price}</td>
						</tr>
						<tr>
							<td colspan="3"><input type="button" value="결제하기" onclick="kakaopay(this.form);"></td>
						</tr>
					</table>
				</div>
			</div>
				</form>	
		<%@include file="../include/footer.jsp" %>	
	</div>	
<!--  부트스트랩 js 사용 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/BootStrap/js/bootstrap.js"></script>
</body>
	
</html>
