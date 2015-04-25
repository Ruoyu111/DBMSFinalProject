<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.project.orm.dao.*, edu.neu.cs5200.project.orm.models.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="tree.ico">
<title>GoATrip home</title>
<link rel="stylesheet" type="text/css" href="viewAllCommentsStyle.css" media="screen" />
</head>
<body >
	<% String UserIdStr = request.getParameter("id");%>
	<p class = "title"><a href = "homepage.jsp?id=<%= UserIdStr%>" class = "goatrip">GoATrip</a><p><br/>
	<div class = "container">
	<%
		UserDAO userdao = new UserDAO();
		CommentDAO commentdao = new CommentDAO();
		
		int UserIdInt = Integer.parseInt(UserIdStr);
		User user = userdao.findUserById(UserIdInt);
		List<Comment> comments = user.getComments();
		
		String action = request.getParameter("action");
		
		if("delete".equals(action))
		{
			String commentIdStr = request.getParameter("commentId");
			int commentIdInt = Integer.parseInt(commentIdStr);
			commentdao.deleteComment(commentIdInt);
			%>
			<META HTTP-EQUIV=REFRESH CONTENT="0; URL=viewAllComments.jsp?id=<%= UserIdStr%>">
			<%
		}
	%>
	
	<h1>My Comments</h1>
	<form action="viewAllComments.jsp">
		<input type="hidden" name="id" value="<%= UserIdStr%>" />
			<table class="table table-striped">
			<tr>
				<th>Title</th>
				<th>Content</th>
				<th>Date</th>
				<th>&nbsp;</th>
				<th>&nbsp;</th>
			</tr>
			<%
				for(Comment comment : comments)
				{
			%>		<tr>
					<td><%= comment.getTitle() %></td>
					<td><%= comment.getContent() %></td>
					<td><%= comment.getDate() %></td>
					<td>
					<a class="btn btn-danger" href="viewAllComments.jsp?action=delete&id=<%=UserIdStr%>&commentId=<%= comment.getId() %>">Delete</a>
					</td>
				</tr>
		<%
				}
			%>
	
	</div>

</body>
</html>