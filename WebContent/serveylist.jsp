<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="serveyweb.ServeyDAO" %>
<%@ page import = "java.util.List" %>
<%@ page import ="serveyweb.ServeyVO" %>
<%@ page import="serveyweb.SongVO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% 
int age=Integer.parseInt(request.getParameter("age"));
char gender=request.getParameter("gender").charAt(0);
int serveyNum=1;
int count=0;
String fileName="insertServey.jsp";
List<ServeyVO> serveyList=null;
int selectquery=1;
ServeyDAO slist=ServeyDAO.getInstance();
count=slist.selectServeyCount();
if(count>=0){
	serveyList=slist.selectAll(selectquery);
}

%>

<!DOCTYPE html>
<html>
<head>
<script src="assets/js/serveylist.js"></script>
<meta charset="UTF-8">
<title>설문조사 장르 항목</title>
</head>
<body>
<form method="post" action="<%=fileName %>" name="serveylistinfo">
<input type="hidden" name="age" value="<%=age %>">
<input type="hidden" name="songCount" value="0">
<input type="hidden" name="gender" value="<%=gender %>">
<table>
    <tr>
        <th id="num">번 호</th>
        <th id="title">장르명</th>
    </tr>
    <%
    int serveyIndex=0;
    		for( serveyIndex=0; serveyIndex<serveyList.size(); serveyIndex++) {  		
    %>
    <tr>
        <td>
      <input type="radio" name="serveyCode" value=<%=serveyIndex +1%>><%=serveyIndex+1 %> <%= serveyList.get(serveyIndex) %>
   	<%}
    		if(serveyIndex==serveyList.size()) {
    			%>
    			<input type="hidden" name="num" value="<%= serveyIndex +1 %>"/>
    			<br><input type="radio" name="serveyCode" value=<%=serveyIndex +1 %> ><%=serveyIndex+1 %> <label>기타()</label><br>
    			<br><label><%=serveyIndex +1%>  기타를 선택하신 경우 하단에 장르 이름을 입력해주세요</label>
    			<br><input type="text" name="serveycodename">
    	<%	}
    %>
    <br><label>선택하신 장르 중 가장 좋아하시는 음악의 제목을 입력해주세요</label>
    <br><input type="text" name="songName">
    <br><input type="button" value="확인" onclick="servaycode()">
    </td>
    </tr>
    </table>
</form>    
</body>
</html>