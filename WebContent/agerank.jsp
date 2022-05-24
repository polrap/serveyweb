<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="serveyweb.JoinDAO" %>
<%@ page import = "java.util.List" %>
<%@ page import="serveyweb.JoinVO" %>
<%
JoinDAO jdao= new JoinDAO();
List<JoinVO> jvo=jdao.selectAll();
%>    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="assets/css/servey.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>연령대별 순위</title>
</head>
<body>
<table class="board">

<%
	int i=0;
	for(JoinVO tmp: jvo){
		if(jvo==null){
			break;
		}
		i++;
		%>		
		<tr>
	<td class="attr"><%= tmp.secondQueryString()%></td>
	</tr>
<%
	}
%>

</table>
<a href="index.jsp">처음으로 돌아가기</a>
<a href="checkservey.jsp">현황보기로 돌아가기</a>
</body>
</html>