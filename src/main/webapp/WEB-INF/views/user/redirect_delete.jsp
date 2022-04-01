<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<script type="text/javascript"> 
	var message = '${msg}';  
	alert(message);
	location.href="main.do";
</script>
</body>
</html>