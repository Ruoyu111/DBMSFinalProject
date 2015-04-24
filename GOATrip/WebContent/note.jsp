<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.project.orm.dao.*, edu.neu.cs5200.project.orm.models.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="tree.ico">
<title>GoATrip home</title>
<link rel="stylesheet" type="text/css" href="noteStyle.css" media="screen" />
</head>
<body >
	<% String UserIdStr = request.getParameter("id");%>
	<p class = "title"><a href = "homepage.jsp?id=<%= UserIdStr%>" class = "goatrip">GoATrip</a><p><br/>
	<div class = "container">
	<%
			NoteDAO notedao = new NoteDAO();
			UserDAO userdao = new UserDAO();
			
			
			String action = request.getParameter("action");
		

			if("delete".equals(action))
			{
				String noteIdStr = request.getParameter("noteId");
				int noteIdInt = Integer.parseInt(noteIdStr);
				notedao.deleteNote(noteIdInt);
			}
			
			int UserIdInt = Integer.parseInt(UserIdStr);
			User user = userdao.findUserById(UserIdInt);
			List<Note> notes = user.getNotes();
		%>
	
	
		<h1>My Notes<a class="btn btn-primary" href="createNote.jsp?id=<%=UserIdStr%>">Create</a></h1>
		
		<form action="note.jsp">
		<input type="hidden" name="id" value="<%= UserIdStr%>" />
			<table class="table table-striped">
			<tr>
				<th>Title</th>
				<th>CreateDate</th>
				<th>LastModified</th>
				<th>&nbsp;</th>
				<th>&nbsp;</th>
				<th>&nbsp;</th>
			</tr>
		<%
		
			for(Note note : notes)
			{
		%>		<tr>
					<td><%= note.getTitle() %></td>
					<td><%= note.getCreateDate() %></td>
					<td><%= note.getPostDate() %></td>
					<td>
					<a class="btn btn-info" href="viewNote.jsp?id=<%=UserIdStr%>&noteId=<%=note.getId() %>">View</a>
					<a class="btn btn-warning" href="modifyNote.jsp?id=<%=UserIdStr%>&noteId=<%=note.getId()%>">Modify</a>
					<a class="btn btn-danger" href="note.jsp?action=delete&id=<%=UserIdStr%>&noteId=<%=note.getId()%>">Delete</a>
					</td>
				</tr>
		<%
			}
		%>
		</table>
		</form>
	</div>
</body>
</html>
