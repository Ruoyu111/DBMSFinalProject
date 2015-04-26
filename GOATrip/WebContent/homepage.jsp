<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.project.orm.dao.*, edu.neu.cs5200.project.orm.models.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="tree.ico">
<title>GoATrip home</title>
<link rel="stylesheet" type="text/css" href="homeStyle.css" media="screen" />
</head>
<body >
	<%
	String idStr = request.getParameter("id");
	int userId = Integer.parseInt(idStr);
	UserDAO userdao = new UserDAO();
	User user = userdao.findUserById(userId);
	List<User> leaders = user.getLeaders();
	String action = request.getParameter("action");
	String noteId = request.getParameter("noteId");
	
	if("unlike".equals(action))
	{
		int noteIdInt = Integer.parseInt(noteId);
		userdao.unlikeNote(userId, noteIdInt);
	}
	else if("like".equals(action))
	{
		int noteIdInt = Integer.parseInt(noteId);
		userdao.likeNote(userId, noteIdInt);
	}
	
	%>
	<p class = "title"><a href = "homepage.jsp?id=<%= idStr%>" class = "goatrip">GoATrip</a><p>
	<div id = "logout"><a href="signIn.jsp" class="btn btn-default top-left"><span class="glyphicon glyphicon-log-out"></span> Logout</a></div>
	<div class = "container">
		<form>
			<table>
				<tr>
					<td><button class="btn btn-lg btn-success btn-block "  type="submit" name="action" value="note"><a href="note.jsp?id=<%= idStr%>" class="button">Note</a></button></td>
					<td><button class="btn btn-lg btn-success btn-block "  type="submit" name="action" value="travelplan"><a href="travelplan.jsp?id=<%= idStr%>" class="button">Travel Plan</a></button></td>
					<td><button class="btn btn-lg btn-success btn-block "  type="submit" name="action" value="book"><a href="book.jsp?id=<%= idStr%>" class="button">Book</a></button></td>
					<td><button class="btn btn-lg btn-success btn-block "  type="submit" name="action" value="searchusers"><a href="searchusers.jsp?id=<%= idStr%>" class="button">Search Users</a></button></td>
					<td><button class="btn btn-lg btn-success btn-block "  type="submit" name="action" value="searchlocation"><a href="api.jsp?id=<%= idStr%>" class="button">Search Location</a></button></td>
				</tr>
			</table>
		</form>
		<h1>Friend's Notes</h1>
		<form action="homepage.jsp">
		<table class="table">
			<tr>
				<th>Title</th>
				<th>CreateDate</th>
				<th>Author</th>
				<th>&nbsp;</th>
				<th>&nbsp;</th>
				<th>&nbsp;</th>
			</tr>
		<%
			for(User leader : leaders)
			{
				List<Note> notes = leader.getNotes();
				for(Note note : notes)
				{
					%>
						<tr>
							<td><%= note.getTitle()  %></td>
							<td><%= note.getCreateDate() %></td>
							<td><%= leader.getUserName() %></td>
							<td><a class="btn btn-info" href="followerView.jsp?id=<%= idStr%>&noteId=<%=note.getId() %>">View</a></td>
							<%
								List likedUsers = note.getLikedUsers();
								if(likedUsers.contains(user) == true)
								{
									%>
									<td><a href="homepage.jsp?action=unlike&id=<%= idStr%>&noteId=<%=note.getId()%>" class="btn btn-default"><span class="glyphicon glyphicon-thumbs-down"></span>Unlike</a></td>
									<%
								}
								else if(likedUsers.contains(user) == false)
								{
									%>
									<td><a href="homepage.jsp?action=like&id=<%= idStr%>&noteId=<%=note.getId()%>" class="btn btn-default"><span class="glyphicon glyphicon-thumbs-up"></span>Like</a></td>
									<%
								}
							%>
							<td><a href="comment.jsp?id=<%= idStr%>&noteId=<%= note.getId()%>" class="btn btn-default"><span class="glyphicon glyphicon-comment"></span> Comment</a></td>
						</tr>
					<%
				}
			}
		%>
		</table>
		</form>
	</div>
</body>
</html>