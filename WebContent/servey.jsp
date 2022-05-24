<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="assets/js/servey.js"></script>
<title>설문조사 작성</title>
</head>
<body>
<form name="serveyinfo" method="post" action="serveylist.jsp">
<label>자신의 연령 대를 입력해주세요</label><br><br>
<label>Ex)20대 이면 20일 입력 부탁드립니다.</label><br><br>
<input name="age" type="text"><br><br>
<label>성별을 체크 부탁드립니다.</label><br><br>

<div>
<input name="gender" type="radio" value="m"><label>남성</label>
<input name="gender" type="radio" value="f"><label>여성</label>
</div>
<input type="button" value="완료" onclick="valueCheck()">
</form>

</body>
</html>