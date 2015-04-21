<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="tree.ico">
<title>GoATrip home</title>
<link rel="stylesheet" type="text/css" href="homeStyle.css" media="screen" />
</head>
<body >
	<%
	String idStr = request.getParameter("id");
	%>
	<p class = "title"><a href = "homepage.jsp?id=<%= idStr%>" class = "goatrip">GoATrip</a><p>
	<div class = "container">
		<form>
			<table>
				<tr>
					<td><button class="btn btn-lg btn-success btn-block "  type="submit" name="action" value="note"><a href="note.jsp?id=<%= idStr%>" class="button">Note</a></button></td>
					<td><button class="btn btn-lg btn-success btn-block "  type="submit" name="action" value="travelplan"><a href="travelplan.jsp?id=<%= idStr%>" class="button">Travel Plan</a></button></td>
					<td><button class="btn btn-lg btn-success btn-block "  type="submit" name="action" value="book"><a href="book.jsp?id=<%= idStr%>" class="button">Book</a></button></td>
				</tr>
			</table>

		</form>
	</div>
</body>
</html>