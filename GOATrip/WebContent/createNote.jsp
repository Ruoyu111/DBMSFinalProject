<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.project.orm.dao.*, edu.neu.cs5200.project.orm.models.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="tree.ico">
<title>GoATrip home</title>
<link rel="stylesheet" type="text/css" href="createNoteStyle.css" media="screen" />
</head>
<body >
	<% String idStr = request.getParameter("id");%>
	<p class = "title"><a href = "homepage.jsp?id=<%= idStr%>" class = "goatrip">GoATrip</a><p><br/>
	<div class = "container">
		<%
		UserDAO userdao = new UserDAO();
		
		String action = request.getParameter("action");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		if("submit".equals(action))
		{
			int idInt = Integer.parseInt(idStr);
			Note note = new Note(null, title, content, new Date(), new Date(), null);
			userdao.addNote(idInt, note);
			%>
			<p class="success">Submit success!</p>
			<META HTTP-EQUIV=REFRESH CONTENT="1; URL=note.jsp?id=<%= idStr%>">
			<%
		}
		%>
	
		<form action="createNote.jsp">
			<input type="hidden" name="id" value="<%= idStr%>" />
			<h1><input class="form-control" name="title" placeholder="Write title here"/></h1>
			<textarea placeholder="Describe your trip here..." rows="20" cols="50" name="content"></textarea><br>
			<h1><button class="btn btn-success top-left" type="submit" name="action" value="submit">Submit</button></h1>
		</form>
	</div>
</body>
</html>