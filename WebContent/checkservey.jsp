<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="serveyweb.ServeyDAO" %>
<%
ServeyDAO sdao= new ServeyDAO();
int count=sdao.selectServeyCount();

%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="assets/css/index.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>설문 결과</title>
</head>
<body>
<%
if(count==0){
%>
<script type="text/javascript">alert("현재 진행된 설문이 없어 추후 다시 확인 바랍니다.")
location.href="index.jsp";
</script>
<% 
} 
%>
<lable>현재 참여 인원은 :  <%=count%></lable>
<form>
<a href="serveyrank.jsp"><input type="button" value="1 장르 순위 보기"></a><br><br>
<a href="agerank.jsp"><input type="button" value="2 연령대 별 장르 순위 보기"><label></label></a><br><br>
<a href="checkgender.jsp"><input type="button" value="3 성별 장르 순위"></a><br><br>
<a  href="serveyonsong.jsp"><input type="button" value="4 장르별 추천 노래 보기"></a><br><br>
</form>

</body>
</html>