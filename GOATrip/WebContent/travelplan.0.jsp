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
	<% String userIdStr = request.getParameter("id");

	TravelPlanDAO travelplandao = new TravelPlanDAO();
	UserDAO userdao = new UserDAO();
	
	int userIdInt = Integer.parseInt(userIdStr);
	
	TravelPlan p = new TravelPlan();
	p.setId(null);
	p.setTitle("New Plan 123");
	p.setDate(new Date());
	p.setDestination("asdf");	
	
	User user = userdao.findUserById(userIdInt);
	out.println(user.getId());
	userdao.addTravelPlan(user.getId(), p);
	
//	user = userdao.findUserById(userIdInt);
	List<TravelPlan> plans = user.getTravelPlans();
	for(TravelPlan plan : plans)
	{
		out.println(plan.getTitle());
		out.println("<br/>");
	}
		
/*		
	String action = request.getParameter("action");
	String title = request.getParameter("title");
	String destination = request.getParameter("destination");
	
	if("create".equals(action))
	{
		int userIdInt = Integer.parseInt(userIdStr);
		TravelPlan travelplan = new TravelPlan(null, title, new Date(), destination);
		userdao.addTravelPlan(userIdInt, travelplan);
	}
	else if("delete".equals(action))
	{
		String planIdStr = request.getParameter("planId");
		int planIdInt = Integer.parseInt(planIdStr);
		travelplandao.deleteTravelPlan(planIdInt);
	}
		
	int userIdInt = Integer.parseInt(userIdStr);
	User user = userdao.findUserById(userIdInt);
	List<TravelPlan> travelPlans = user.getTravelPlans();
		
	for(TravelPlan travelPlan : travelPlans)
	{
		
	}
	*/
		%>
	</div>
</body>
</html>