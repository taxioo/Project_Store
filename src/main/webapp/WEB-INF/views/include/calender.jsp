<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<!-- 부트스트랩 css 사용 -->
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/BootStrap/css/bootstrap.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1/jquery-ui.min.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1/datepicker-ko.js"></script>

<script type="text/javascript">
//<![CDATA[
$(function(){
	$("#date1").datepicker();
	
	$("#date2").datepicker({
		showOn: "button",
        buttonImage: "${pageContext.request.contextPath}/resources/img/calendar.gif",
	    buttonImageOnly: false,
		buttonText: "Select date"
	});
	
	$("#date3").datepicker({
		onSelect:function(dateText, inst) {
			console.log(dateText);
			console.log(inst);
		}
	});
});
//]]>
</script>
</head>
<body>
<h3>jQuer UI  달력</h3>
<input type="text" name="date" id="date1" size="12" />
<br/>
<input type="text" name="date" id="date2" size="12" />
<br/>
<input type="text" name="date" id="date3" size="12" />
<input type="button" value="달력" onclick="$('#date3').datepicker('show');" />


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/BootStrap/js/bootstrap.js"></script>
</body>
</html>