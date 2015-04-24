<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.project.orm.dao.*, edu.neu.cs5200.project.orm.models.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="tree.ico">
<title>GoATrip home</title>
<link rel="stylesheet" type="text/css" href="modifyNoteStyle.css" media="screen" />
</head>
<body >
	<% String idStr = request.getParameter("id");%>
	<p class = "title"><a href = "homepage.jsp?id=<%= idStr%>" class = "goatrip">GoATrip</a><p><br/>
	<div class = "container">
	<%
		String action = request.getParameter("action");
		String noteId = request.getParameter("noteId");
		int noteidInt = Integer.parseInt(noteId);
		NoteDAO notedao = new NoteDAO();
		Note note = notedao.findNoteById(noteidInt);
		
		if("submit".equals(action))
		{
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			note.setTitle(title);
			note.setContent(content);
			note.setPostDate(new Date());
			notedao.updateNote(note);
			%>
			<p class="success">Modify success!</p>
			<META HTTP-EQUIV=REFRESH CONTENT="1; URL=modifyNote.jsp?id=<%= idStr%>&noteId=<%= noteId%>">
			<%
		}
	%>
	<form action="modifyNote.jsp">
			<input type="hidden" name="id" value="<%= idStr%>" />
			<input type="hidden" name="noteId" value="<%= noteId%>" />
			<h1><input class="form-control" name="title" value="<%=note.getTitle() %>" /></h1>
			<textarea rows="20" cols="50" name="content"><%=note.getContent() %></textarea>
			<h1><button class="btn btn-success top-left" type="submit" name="action" value="submit">Submit</button></h1>
	</form>
	</div>
</body>
</html>