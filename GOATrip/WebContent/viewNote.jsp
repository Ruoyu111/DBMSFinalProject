<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.project.orm.dao.*, edu.neu.cs5200.project.orm.models.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="tree.ico">
<title>GoATrip home</title>
<link rel="stylesheet" type="text/css" href="viewNoteStyle.css" media="screen" />
</head>
<body >
	<% String UserIdStr = request.getParameter("id");%>
	<p class = "title"><a href = "homepage.jsp?id=<%= UserIdStr%>" class = "goatrip">GoATrip</a><p><br/>
	<%
		String noteId = request.getParameter("noteId");
		int noteidInt = Integer.parseInt(noteId);
		NoteDAO notedao = new NoteDAO();
		Note note = notedao.findNoteById(noteidInt);
	%>
	
	<h1><%= note.getTitle() %> <a class="btn btn-warning" href="modifyNote.jsp?id=<%=UserIdStr%>&noteId=<%=note.getId()%>">Modify</a></h1>
	<p><%= note.getContent() %></p>
</body>
</html>