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
	<% String idStr = request.getParameter("id");
	   int idInt = Integer.parseInt(idStr);
	%>
	<p class = "title"><a href = "homepage.jsp?id=<%= idStr%>" class = "goatrip">GoATrip</a><p><br/>
	<div class = "container">
		<%
		UserDAO userdao = new UserDAO();
		BookDAO bookdao = new BookDAO();
			
		String action = request.getParameter("action");
		String location = request.getParameter("location");
		String type = request.getParameter("type");
		
		if("create".equals(action))
		{
			Book book = new Book(null, new Date(), location, type);
			userdao.addBook(idInt, book);
		}
		else if("delete".equals(action))
		{
			String bookId = request.getParameter("bookId");
			int bookIdInt = Integer.parseInt(bookId);
			bookdao.deleteBook(bookIdInt);
			%>
			<META HTTP-EQUIV=REFRESH CONTENT="0; URL=book.jsp?id=<%= idStr%>">
			<%
		}
		
		User user = userdao.findUserById(idInt);
		List<Book> books = user.getBooks();
		
		%>
	
	<h1>My Booking Information</h1>
		<form action="book.jsp">
			<input type="hidden" name="id" value="<%= idStr%>" />
			<table class="table">
				<tr>
					<th>Date</th>
					<th>Location</th>
					<th>Type</th>
					<th>&nbsp;</th>
				</tr>
				<tr>
					<td><input class="form-control" name="date" readonly/></td>
					<td><input name="location" class="form-control"/></td>
					<td><input name="type" class="form-control"/></td>
					<td>
						<button class="btn btn-primary" type="submit" name="action" value="create">Create</button>
					</td>
				</tr>
				<%
					for (Book book : books)
					{
			%>		<tr>
						<td><%= book.getDate() %></td>
						<td><%= book.getLocation() %></td>
						<td><%= book.getType() %></td>
						<td>
						<a class="btn btn-danger" href="book.jsp?action=delete&id=<%=idStr%>&bookId=<%=book.getId()%>">Delete</a>
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