<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="serveyweb.ServeyDAO" %>
<%@ page import = "java.util.List" %>
<%@ page import ="serveyweb.ServeyVO" %>
<%@ page import="serveyweb.SongVO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
if(request.getParameter("age")==null){
	%>
	<script type="text/javascript">location.href="index.jsp"; alert("잘못된 접근 입니다.")</script>
<% }else{

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
<link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
<script src="assets/js/serveylist.js"></script>
<meta charset="UTF-8">
<title>설문조사 장르 항목</title>
</head>
<body>
<div class="mx-auto">
<form method="post" action="<%=fileName %>" name="serveylistinfo" class="px-4 py-3">
<input type="hidden" name="age" value="<%=age %>">
<input type="hidden" name="songCount" value="0">
<input type="hidden" name="gender" value="<%=gender %>">

<table  class="table table-striped table-dark">
	<br><br>
    <tr>
        <th id="num" >번 호</th>
        <th id="title" style="width:20%; ">장르명</th>
    </tr>
    <% int serveyIndex=0;
    		for( serveyIndex=0; serveyIndex<serveyList.size(); serveyIndex++) {  		
    %>
    <tr>
    <td class="tdnum"> <input type="radio" name="serveyCode" value=<%=serveyIndex +1%>><%=serveyIndex+1 %></td><td><%= serveyList.get(serveyIndex) %></td></tr>
   	<%}
    	if(serveyIndex==serveyList.size()) {
   		%>
   			<tr>
   			<td class="tdnum"><input type="hidden" name="num" value="<%= serveyIndex +1 %>"/>
   			<input type="radio" name="serveyCode" value=<%=serveyIndex +1 %> ><%=serveyIndex+1 %></td><td>[기타()]</td></tr>
   			
    			
    	<%	}
   	 %>
     </table>
   <table class="serveycheck">
    <tr class="serveycheck"><td><label class="label" for="serveycodename"><%=serveyIndex +1%>  기타를 선택하신 경우 하단에 장르 이름을 입력해주세요 </label><td></tr>
    <tr class="serveycheck"><td><input type="text" name="serveycodename" id="serveycodename" placeholder="장르이름을 넣어주세요"onmouseover="serveyplace()" onmouseout="serveyplaceOver()"><td></tr>
    <tr class="serveycheck"><td><label class="label" for="songName">선택하신 장르 중 가장 좋아하시는 음악의 제목을 입력해주세요</label><td></tr>
    <tr class="serveycheck"><td><input type="text" name="songName" id="songName" placeholder="장르이름을 넣어주세요"onmouseover="songplace()" onmouseout="songplaceOver()"><td></tr>
    <tr class="serveycheck"><td><input  class="btn btn-primary" type="button" value="확인" onclick="servaycode()"><td></tr>
   </table>
   <%} %>
</form>    
</div>
</body>
</html>