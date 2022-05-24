<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="serveyweb.JoinDAO" %>
<%@ page import = "java.util.List" %>
<%@ page import="serveyweb.JoinVO" %>
<%
char gender=request.getParameter("gender").charAt(0);
JoinDAO jdao= new JoinDAO();
List<JoinVO> jvo=jdao.selectGender(gender);
%>   
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
<table class="board">

<%
	if(jvo==null){%>
	<script type="text/javascript">alert("현재 선택하신 성별을 설문이 진행되지 않아 추후 다시 확인 바랍니다.")
location.href="index.jsp";
</script>
	
	<% 	
	}else{
	int i=0;
	for(JoinVO tmp: jvo){
		i++;
		%>		
		<tr>
	<td class="attr"><%= tmp.genderQueryString()%></td>
	</tr>
<%
	}
	}
%>

</table>
<a href="index.jsp">처음으로 돌아가기</a>
<a href="checkservey.jsp">현황보기로 돌아가기</a>
</body>
</html>