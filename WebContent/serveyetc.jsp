<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="serveyweb.SongVO" %>
<%@ page import="serveyweb.MainCtrl" %>
<jsp:useBean id="sdao" class="serveyweb.ServeyDAO"/>
<jsp:useBean id="svo" class="serveyweb.ServeyVO"/>
<jsp:useBean id="songdao" class="serveyweb.SongDAO"/>
<jsp:useBean id="udao" class="serveyweb.UserDAO"/>
<jsp:useBean id="songvo" class="serveyweb.SongVO" scope="request"/>
	<jsp:setProperty name="songvo" property="*"/>
<jsp:useBean id="uvo" class="serveyweb.UserVO"/>
<jsp:setProperty name="uvo" property="*"/>
<%
int age=Integer.parseInt(request.getParameter("age"));
char gender=request.getParameter("gender").charAt(0);
MainCtrl mc=new MainCtrl();
int servey=Integer.parseInt(request.getParameter("serveyCode"));
String serveyName=request.getParameter("serveycodename");
String songname=request.getParameter("songName");
if(mc.etc(age, gender, servey,serveyName)){
	servey=sdao.lastServey_Code();
	if(mc.makeUser(servey, age, gender)){
		mc.songIn(age, gender, servey,songname);
	}
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장르 기타 입력</title>
</head>
<body>
<h3>설문에 참여해주셔서 감사합니다.</h3>
<a href="index.jsp">처음으로 돌아가기</a>
</body>
</html>