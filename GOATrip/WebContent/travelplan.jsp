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
	<p class = "title"><a href = "homepage.jsp" class = "goatrip">GoATrip</a><p><br/>
	<div class = "container">
		<h1>My Notes</h1>
		<form action="note.jsp">
			<table class="table table-striped">
			<tr>
				<th>Title</th>
				<th>Date</th>
				<th>Destination</th>
				<th>&nbsp;</th>
			</tr>
			<tr>
				<td><input name="title" class="form-control"/></td>
				<td><input name="date" class="form-control"/></td>
				<td><input name="destination" class="form-control"/></td>
				<td>
					<button class="btn btn-primary" type="submit" name="action" value="create">Create</button>
				</td>
			</tr>
		<%
			for(Movie movie : movies)
			{
		%>		<tr>
					<td>
						<a href="movieDetails.jsp?id=<%= movie.getId() %>">
						<%= movie.getTitle() %>
						</a>
					</td>
				<td><%= movie.getPlot() %></td>
				<td><%= movie.getPoster() %></td>
				<td>
					<a href="movies.jsp?action=delete&id=<%= movie.getId() %>" class="btn btn-danger">Delete</a>
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