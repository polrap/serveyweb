<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="serveyweb.SongVO" %>
<jsp:useBean id="sdao" class="serveyweb.ServeyDAO"/>
<jsp:useBean id="svo" class="serveyweb.ServeyVO"/>
<jsp:useBean id="songdao" class="serveyweb.SongDAO"/>
<jsp:useBean id="udao" class="serveyweb.UserDAO"/>
<jsp:useBean id="songvo" class="serveyweb.SongVO" scope="request"/>
	<jsp:setProperty name="songvo" property="*"/>
<jsp:useBean id="uvo" class="serveyweb.UserVO"/>
<jsp:setProperty name="uvo" property="*"/>


<%
//int servey=Integer.parseInt(request.getParameter("servey"));
int age=Integer.parseInt(request.getParameter("age"));
char gender=request.getParameter("gender").charAt(0);
int servey=Integer.parseInt(request.getParameter("serveyCode"));
String songname=request.getParameter("songName");
boolean flag = sdao.updateInfo(servey);
boolean songflag=songdao.selectOne(songname, servey);

if(songflag==true){
	songdao.updateSongCount(songname, servey);
}else  if(songflag==false){
	songdao.insertSong(songvo);
}
if(udao.selectUser(servey,age,gender)){
	udao.updateUserCount(uvo);
}else if(udao.selectUser(servey, age, gender)==false){
	udao.insertUser(uvo);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>설문에 참여해주셔서 감사합니다.</h3>
<a href="index.jsp">처음으로 돌아가기</a>
</body>
</html>