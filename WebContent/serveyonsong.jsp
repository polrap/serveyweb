<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="serveyweb.JoinDAO" %>
<%@ page import = "java.util.List" %>
<%@ page import="serveyweb.JoinVO" %>
<%
JoinDAO jdao= new JoinDAO();
List<JoinVO> jvo=jdao.selectThree();
%>   
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="assets/css/servey.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="board">

<%
	int i=0;
	for(JoinVO tmp: jvo){
		i++;
		%>		
		<tr>
	<td class="attr"><%= tmp.threeQueryString()%></td>
	</tr>
<%
	}
%>

</table>
<a href="index.jsp">처음으로 돌아가기</a>
<a href="checkservey.jsp">현황보기로 돌아가기</a>
</body>
</html>