<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String filename="checkgender.jsp"; %>
<!DOCTYPE html>
<html>
<head>
<script src="assets/js/servey.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="assets/css/servey.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>성별 장르 순위</title>
</head>
<body>
<form method="post" name="gen" action="genderrank.jsp">
<label>성별 선호도를 보고싶은 성별을 입력해주세요</label><br><br>
<div>
<input type="radio" name="gender" value="m"><label>남성</label>
<input type="radio" name="gender" value="f"><label>여성</label>
</div><br>
<input type="button" value=확인 onclick="gendercheck()">
</form>
</body>
</html>