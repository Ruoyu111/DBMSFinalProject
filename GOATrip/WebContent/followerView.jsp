<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.project.orm.dao.*, edu.neu.cs5200.project.orm.models.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="tree.ico">
<title>GoATrip home</title>
<link rel="stylesheet" type="text/css" href="followerViewStyle.css" media="screen" />
</head>
<body >
	<% String idStr = request.getParameter("id"); %>
	<p class = "title"><a href = "homepage.jsp?id=<%= idStr%>" class = "goatrip">GoATrip</a><p><br/>
	<%
		int idInt = Integer.parseInt(idStr);
		NoteDAO notedao = new NoteDAO();
		UserDAO userdao = new UserDAO();
		User user = userdao.findUserById(idInt);
		String action = request.getParameter("action");
		String noteId = request.getParameter("noteId");
		int noteIdInt = Integer.parseInt(noteId);
		Note note = notedao.findNoteById(noteIdInt);
		
		if("unlike".equals(action))
		{
			userdao.unlikeNote(idInt, noteIdInt);
			%>
			<META HTTP-EQUIV=REFRESH CONTENT="0; URL=followerView.jsp?id=<%= idStr%>&noteId=<%= noteId%>">
			<%
		}
		else if("like".equals(action))
		{
			userdao.likeNote(idInt, noteIdInt);
			%>
			<META HTTP-EQUIV=REFRESH CONTENT="0; URL=followerView.jsp?id=<%= idStr%>&noteId=<%= noteId%>">
			<%
		}
	%>
	<div class = "container">
		<h1><%= note.getTitle() %></h1>
		<form action="userView.jsp">
			<%
				List<User> likedUsers = note.getLikedUsers();
				boolean contains = false;
				for(User user1 : likedUsers)
				{
					if(user1.getUserName() == user.getUserName())
						contains = true;
				}
				if(contains)
				{
					%>
						<a href="followerView.jsp?action=unlike&id=<%= idStr%>&noteId=<%=note.getId()%>" class="btn btn-default"><span class="glyphicon glyphicon-thumbs-down"></span>Unlike</a>
					<%
				}
				else if(!contains)
				{
					%>
						<a href="followerView.jsp?action=like&id=<%= idStr%>&noteId=<%=note.getId()%>" class="btn btn-default"><span class="glyphicon glyphicon-thumbs-up"></span>Like</a>
					<%
				}
					%>
		<p><%= note.getContent() %></p>
		</form>
	</div>
</body>
</html>