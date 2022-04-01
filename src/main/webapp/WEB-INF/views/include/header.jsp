<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<html>
<head>
	<title>Home</title>
	<!-- 부트스트랩 css 사용 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/BootStrap/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1/jquery-ui.min.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1/datepicker-ko.js"></script>
	<!-- fontawesome -->
	
	<style>
		#h_1{padding:10px 0px;}
		#collapsibleNavbar{padding-right:30px;}
		
		/* 로고  */
		.navbar-brand{padding-left:30px;
					  font-size:30px;}
	    /* 검색 */
		#input{width:400px;}
		#btn_search{float:right}
	   
	   /* 드롭다운 메뉴 */
	   #h_drop{width:250px;
	   		   align:center;}
	   #h_drop_i{padding-top:30px;
	   		  	 padding-bottom:30px;}
	   		  	 
	</style>
</head>
<script>
	function enterkey(f) {
	    if (window.event.keyCode == 13) {
	    	var text = f.search.value.trim();
			location = "search.do?text=" + text;
			method = "GET";
			submit();
	    }
	}

	function search_acd(f){
		var text = f.search.value.trim();
		var date1 = document.getElementById("date1").value;
		var date2 = document.getElementById("date2").value;
		var room_cnt =f.room_cnt.value;
		if(text == ""){
			alert("검색어를 입력하세요");
			return;
		}
		
		if(date1 == date2){
			alert("현재 대실은 준비중입니다.")
			return;
		}
		
		location = "search.do?text=" + text + "&start_date=" + date1 + 
					"&end_date="+ date2 + "&room_cnt=" + room_cnt;
	}
	
    $(function() {
        $("#date1").datepicker({
            dateFormat: 'yy.mm.dd'
           	,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능  
            ,minDate: "today" //최소 선택일자
           	,onSelect: function() { 
                 var date1 = $.datepicker.formatDate("yymmdd",$("#date1").datepicker("getDate")); 
           	},onClose: function( selectedDate ) { 
            	//시작일(startDate) datepicker가 닫힐때 
            	//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            	$("#date2").datepicker( "option", "minDate", selectedDate );
            }
        });
        
        $("#date2").datepicker({
            dateFormat: 'yy.mm.dd'
           	,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능  
           	,onSelect: function() { 
                 var date2 = $.datepicker.formatDate("yymmdd",$("#date2").datepicker("getDate"));
           	}
        });
        
        $('#date1').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
        $('#date2').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
    });
    

    function my_reserve_list(){
    	
    	var user_num = document.getElementById("user_num").value;
    	
    	location.href= "my_reserve_list.do?user_num=" + user_num;
    }
</script>
		<%session = request.getSession();%> <!-- 세션 저장  -->
		<script src="https://kit.fontawesome.com/f49c593d7a.js" crossorigin="anonymous"></script>
		<body>
		<nav class="navbar navbar-expand-md bg-dark navbar-dark" id="h_1">
				<!-- 로고 -->
				<a class="navbar-brand justify-content-start" href="main.do">CAMP</a>
				<!-- Navbar links -->
				<div class="collapse navbar-collapse justify-content-center" id="collapsibleNavbar">
					<!-- <!-- 검색  -->
					<form class="form-inline">
					    <input class="form-control-lg mr-sm-3" id="input" name="search" placeholder="Search">
					    <input class="form-control-lg mr-sm-3" type="text" name="date1" id="date1" size="7" placeholder="입실일"/>
					    -
					    <input class="form-control-lg mr-sm-3" type="text" name="date2" id="date2" size="7" placeholder="퇴실일"/>
					    <input id="user_num" value="${num}" type="hidden">
					    
					    <select name="room_cnt" class="form-control-lg mr-sm-3">
					    	<option value="2">인원수 선택</option>
						    <option value="1">1</option>
						    <option value="2">2</option>
						    <option value="3">3</option>
						    <option value="4">4</option>
						    <option value="5">5</option>
						    <option value="6">6</option>
					    </select>
					    <input class="form-control-lg mr-sm-3" type="button" value="검색" onclick="search_acd(this.form)" 
					    		onkeyup="enterkey(this.form);" width="80px;">
				    </form>
				    
				    
				 </div>
				    <ul>
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle justify-content-end" href="#" id="navbardrop" 
						data-toggle="dropdown"><i class="fa-solid fa-bars fa-3x" style="color: white;"></i></a>
							
							<div class="dropdown-menu dropdown-menu-right" id="h_drop">
								<% if(session.getAttribute("id") == null){%>
									<a class="dropdown-item" id="h_drop_i" href="login_form.do"><p class="text-center">로그인</p></a>
									<a class="dropdown-item" id="h_drop_i" href="new_check.do"><p class="text-center">회원가입</p></a>
								<%}else{ %>
									<table  align="center" width="70%" height="200px">
										<tr align="center" >
											<td colspan="2" width="50%" height="30%" ><%out.print(session.getAttribute("name")); %></td>
										</tr>
									</table>
									<a class="dropdown-item" id="h_drop_i" onclick="location.href='mypage.do?user_num=' + '${num}'"><p class="text-center">마이페이지</p></a>
									<a class="dropdown-item" id="h_drop_i" onclick="my_reserve_list();"><p class="text-center">예약내역</p></a>
									<a class="dropdown-item" id="h_drop_i" href="logout.do"><p class="text-center">로그아웃</p></a>
								<%} %>
							</div>
						</li>
					</ul>
			</nav>
		</body>
<!--  부트스트랩 js 사용 -->
</html>

