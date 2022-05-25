<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<script src="assets/js/servey.js"></script>
<title>설문조사 작성</title>
</head>
<body>
<div class="mx-auto">
<form name="serveyinfo" method="post" action="serveylist.jsp"  class="px-4 py-3"> 
<div  class="form-group">
<h3>설문에 참여해주셔서 감사합니다.</h3>
<hr><br><br>
<div class="container">
<label>자신의 연령 대를 입력해주세요</label><br>
<label>Ex)20대 이면 20일 입력 부탁드립니다.</label><br>
<input name="age" type="text" placeholder="연령대를 넣어주세요" onclick="place()" onmouseover="place()" onmouseout="placeOver()"><br><br>
</div>
<div class="container">
<fieldset>
<legend>성별을 체크 부탁드립니다.</legend>
<input name="gender" type="radio" value="m"><label>남성</label>
<input name="gender" type="radio" value="f"><label>여성</label>
<br><input type="button" value="완료" onclick="valueCheck()" class="btn btn-primary">
</fieldset>
</div>
</div>
</form>
</div>
</body>
</html>