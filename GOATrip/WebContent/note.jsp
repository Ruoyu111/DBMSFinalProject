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
	<% String idStr = request.getParameter("id");%>
	<p class = "title"><a href = "homepage.jsp?id=<%= idStr%>" class = "goatrip">GoATrip</a><p><br/>
	<div class = "container">
		<h1>My Notes</h1>
		<form action="note.jsp">
		<input type="hidden" name="id" value="<%= idStr%>" />
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
					<a class="btn btn-danger" href="travelplan.jsp?action=delete&id=<%=idStr%>&planId=<%=travelPlan.getId()%>">Delete</a>
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
