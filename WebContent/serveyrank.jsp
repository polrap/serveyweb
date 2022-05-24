<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import="serveyweb.ServeyDAO" %>
<%@ page import="serveyweb.ServeyVO" %>
<%
ServeyDAO sdao= new ServeyDAO();
sdao.selectAll(2);
List<ServeyVO> serveyList=null;
serveyList=sdao.selectAll(2);
%>
<!DOCTYPE html>
<html>
<head>
<link href="assets/css/servey.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>장르 순위 보기</title>
</head>
<body>
<table class="board">

<%
	int i=0;
	for(ServeyVO tmp: serveyList){
		i++;
		%>		
		<tr>
	<td class="attr"><%= tmp.inString()%></td>
	</tr>
<%
	}
%>

</table>
<a href="index.jsp">처음으로 돌아가기</a>
<a href="checkservey.jsp">현황보기로 돌아가기</a>
</body>
</html>