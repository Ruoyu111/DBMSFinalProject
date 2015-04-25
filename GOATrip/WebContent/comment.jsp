<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.project.orm.dao.*, edu.neu.cs5200.project.orm.models.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="tree.ico">
<title>GoATrip home</title>
<link rel="stylesheet" type="text/css" href="commentStyle.css" media="screen" />
</head>
<body >
	<% String UserIdStr = request.getParameter("id");
	   String noteIdStr = request.getParameter("noteId");
	%>
	<p class = "title"><a href = "homepage.jsp?id=<%= UserIdStr%>" class = "goatrip">GoATrip</a><p><br/>
	<div class = "container">
	<%
		UserDAO userdao = new UserDAO();
		
		String action = request.getParameter("action");
		String title = request.getParameter("title");
		String comment = request.getParameter("comment");
		
		
		if("submit".equals(action))
		{
			int userIdInt = Integer.parseInt(UserIdStr);
			int noteIdInt = Integer.parseInt(noteIdStr);
			Comment com = new Comment (null, title, comment, new Date());
			userdao.addComment(userIdInt, noteIdInt, com);
			%>
			<p class="success">Submit success!</p>
			<META HTTP-EQUIV=REFRESH CONTENT="1; URL=homepage.jsp?id=<%= UserIdStr%>">
			<%
		}
		%>
		<h1>Make a comment</h1>
		<form action="comment.jsp">
			<input type="hidden" name="id" value="<%= UserIdStr%>" />
			<input type="hidden" name="noteId" value="<%= noteIdStr%>" />
			<h1><input class="form-control" name="title" placeholder="Write comment title here"/></h1>
			<textarea placeholder="Make your comment here..." rows="10" cols="50" name="comment"></textarea><br>
			<h1><button class="btn btn-success top-left" type="submit" name="action" value="submit">Submit</button></h1>
			<a href="viewAllComments.jsp?id=<%= UserIdStr%>&action=viewallcomments" class="btn btn-default"><span class="glyphicon glyphicon-list-alt"></span> View All My Comments</a>
		</form>
	
	</div>

</body>
</html>