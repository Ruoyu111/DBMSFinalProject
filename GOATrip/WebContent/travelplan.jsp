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
		<%
			TravelPlanDAO travelplandao = new TravelPlanDAO();
			UserDAO userdao = new UserDAO();
			
			
			String action = request.getParameter("action");
			String title = request.getParameter("title");
			String destination = request.getParameter("destination");
		
			if("create".equals(action))
			{
				int idInt = Integer.parseInt(idStr);
				TravelPlan travelplan = new TravelPlan(null, title, new Date(), destination);
				userdao.addTravelPlan(idInt, travelplan);
			}
			else if("delete".equals(action))
			{
				String planIdStr = request.getParameter("planId");
				int planIdInt = Integer.parseInt(planIdStr);
				travelplandao.deleteTravelPlan(planIdInt);
			}
			
			int idInt = Integer.parseInt(idStr);
			User user = userdao.findUserById(idInt);
			List<TravelPlan> travelPlans = user.getTravelPlans();
		%>
	
		
		<h1>My travel plans</h1>
		<form action="travelplan.jsp">
		<input type="hidden" name="id" value="<%= idStr%>" />
			<table class="table table-striped">
			<tr>
				<th>Title</th>
				<th>Date</th>
				<th>Destination</th>
				<th>&nbsp;</th>
			</tr>
			<tr>
					
				<td><input name="title" class="form-control"/></td>
				<td><input class="form-control" name="date" readonly/></td>
				<td><input name="destination" class="form-control"/></td>
				<td>
					<button class="btn btn-primary" type="submit" name="action" value="create">Create</button>
				</td>
			</tr>
		<%
		
			for(TravelPlan travelPlan : travelPlans)
			{
		%>		<tr>
					<td><%= travelPlan.getTitle() %>, <%= travelPlan.getId() %>, <%= travelPlan.getUser().getUserName() %></td>
					<td><%= travelPlan.getDate() %></td>
					<td><%= travelPlan.getDestination() %></td>
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