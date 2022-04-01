<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<script type="text/javascript">
</script>
    
</head>
<body>
<div id="wrap">
    <br>
    <b><font size="4" color="gray">비밀번호 변경</font></b>
    <hr size="1" width="460">
    <br>
    <div id="chk">
        <form id="pwdForm">
            <input type="password" name="pwd" id="userPwd">
            <input type="button" value="비밀번호 변경" onclick="pwdCheck(this.form);">
        <br>
        <input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
        </form>
    </div>
</div>    
</body>
</html>
