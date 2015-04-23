<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.project.orm.dao.*, edu.neu.cs5200.project.orm.models.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="tree.ico">
<title>GoATrip home</title>
<link rel="stylesheet" type="text/css" href="createNoteStyle.css" media="screen" />
</head>
<body >
	<% String idStr = request.getParameter("id");%>
	<p class = "title"><a href = "homepage.jsp?id=<%= idStr%>" class = "goatrip">GoATrip</a><p><br/>
	This is create page!

</body>
</html>