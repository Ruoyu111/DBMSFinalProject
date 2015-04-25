<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.project.orm.dao.*, edu.neu.cs5200.project.orm.models.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="tree.ico">
<title>GoATrip home</title>
<link rel="stylesheet" type="text/css" href="searchusersStyle.css" media="screen" />
</head>
<body >
	<% String UserIdStr = request.getParameter("id");%>
	<p class = "title"><a href = "homepage.jsp?id=<%= UserIdStr%>" class = "goatrip">GoATrip</a><p><br/>
	<%
		String action = request.getParameter("action");
		String keyword = request.getParameter("search");
		UserDAO userdao = new UserDAO();
		
		if("search".equals(action))
		{
			int resultId = userdao.findUserByNameOrEmail(keyword);
			if(resultId < 0)
			{
				%>
				<p class="warning">No user found! Please try again.</p>
				<META HTTP-EQUIV=REFRESH CONTENT="1; URL=searchusers.jsp?id=<%= UserIdStr%>">
				<%
			}
			
			else
			{
				User resultUser = userdao.findUserById(resultId);
				%>
					<table class="table table-striped">
					<tr>
						<th>UserName</th>
						<th>Email</th>
						<th>&nbsp;</th>
					</tr>
					<tr>
						<td><%= resultUser.getUserName() %></td>
						<td><%= resultUser.getEmail() %></td>
					</tr>
				<%
			}
		}
	
	%>
	
	<form action="searchusers.jsp">
		<input type="hidden" name="id" value="<%= UserIdStr%>" />
		<h1><input class="form-control" name="search" placeholder="Please search by username or email address"/></h1>
		<h1><button class="btn btn-info top-left" type="submit" name="action" value="search">Search</button></h1>
	</form>

</body>
</html>