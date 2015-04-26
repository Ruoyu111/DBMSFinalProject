<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.project.orm.dao.*, edu.neu.cs5200.project.orm.models.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="tree.ico">
<title>Admin home</title>
<link rel="stylesheet" type="text/css" href="adminStyle.css" media="screen" />
</head>
<body>
	<% String adminId = request.getParameter("adminId");%>
	<p class = "title">GoATrip<p><br/>
	<%
		UserDAO userdao = new UserDAO();
		String userIdStr = request.getParameter("userId");
		String action = request.getParameter("action");
		
		if("delete".equals(action))
		{
			int userIdInt = Integer.parseInt(userIdStr);
			userdao.deleteUser(userIdInt);
			%>
				<META HTTP-EQUIV=REFRESH CONTENT="0; URL=admin.jsp?adminId=<%= adminId%>">
			<%
		}
	%>
	
	
	<h1>All Users</h1>
	<form action="admin.jsp">
	<input type="hidden" name="adminId" value="<%= adminId%>" />
		<table class="table">
			<tr>
				<th>UserName</th>
				<th>Email</th>
				<th>&nbsp;</th>
			</tr>
			<%
			UserDAO dao = new UserDAO();
			List<User> users = dao.findAllUsers();
			for(User user : users)
			{
				%>
					<tr>
						<td><%= user.getUserName() %></td>
						<td><%= user.getEmail() %></td>
						<td><a class="btn btn-danger" href="admin.jsp?action=delete&adminId=<%= adminId %>&userId=<%= user.getId() %>">Delete</a></td>
					</tr>
				<%
			}
			%>
	
	</form>
</body>
</html>