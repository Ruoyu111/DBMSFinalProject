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
		int UserIdInt = Integer.parseInt(UserIdStr);
		User user = userdao.findUserById(UserIdInt);
		String action2 = request.getParameter("action2");
		
		if("follow".equals(action2))
		{
			String resultIdStr = request.getParameter("resultId");
			int resultIdInt = Integer.parseInt(resultIdStr);
			userdao.follow(UserIdInt,resultIdInt);
		}
		else if("unfollow".equals(action2))
		{
			String resultIdStr = request.getParameter("resultId");
			int resultIdInt = Integer.parseInt(resultIdStr);
			userdao.unfollow(UserIdInt,resultIdInt);
		}
		
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
						<%
							List<User> followers = resultUser.getFollowers();
							if (followers.contains(user) == true)
							{
								%>
								<td><a href="searchusers.jsp?id=<%= UserIdStr%>&action=search&search=<%= resultUser.getUserName()%>&action2=unfollow&resultId=<%= resultId%>" class="btn btn-default"><span class="glyphicon glyphicon-minus"></span> Unfollow</a></td>
								<%
							}
							else if (followers.contains(user) == false)
							{
								%>
								<td><a href="searchusers.jsp?id=<%= UserIdStr%>&action=search&search=<%= resultUser.getUserName()%>&action2=follow&resultId=<%= resultId%>" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span> Follow</a></td>
								<%
							}
						%>
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