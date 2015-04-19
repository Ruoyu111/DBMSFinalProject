<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.project.orm.dao.*, edu.neu.cs5200.project.orm.models.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

		<!-- Bootstrap core CSS -->
    	<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
		
		<link rel="stylesheet" type="text/css" href="registerStyle.css" media="screen" />
        <link rel="icon" href="tree.ico">
<title>GoATrip register page</title>
</head>
<body>
	 <div class="container">
	 
	 	<%
	 	UserDAO dao = new UserDAO();
	 	
	 	String action = request.getParameter("action");
	 	String username = request.getParameter("username");
	 	String password = request.getParameter("password");
	 	String email = request.getParameter("email");
	 	
	 	if("create".equals(action))
	 	{
	 		registerDAO registerdao = new registerDAO();
	 		int check = registerdao.registerCheck(username, email);
	 		if(check == 1)
	 		{
	 			%>
	 				<p class="double">User name already exist! Please try again.</p>
	 			<% 
	 		}
	 		
	 		else if(check == 2)
	 		{
	 			%>
 				<p class="double">Email already exist! Please try again.</p>
 				<% 
	 		}
	 		
	 		else
	 		{
	 			User user = new User();
		 		user.setUserName(username);
		 		user.setPassWord(password);
		 		user.setEmail(email); 
		 		dao.createUser(user);
		 		
		 %>
 				<p class="double2">Congratulations! Register success! Click<a href="signIn.jsp" class="button"> here</a> to login.</p>
 		<% 
	 		}
	 		
	 	}
	 	%>
	 
            <form action="register.jsp">
                <h1>Please register here</h1>
                <label for="inputUsername" class="sr-only">Username</label>
        		<input type="text" name="username" class="form-control" placeholder="Username" required autofocus>
       			<label for="inputPassword" class="sr-only">Password</label>
        		<input type="password" name="password" class="form-control" placeholder="Password" required>
                <!-- You may want to consider adding a "confirm" password box also -->
                <label for="inputEmail" class="sr-only">Email Address</label>
        		<input type="text" name="email" class="form-control" placeholder="Email" required>
                <!-- Valid input types: http://www.w3schools.com/html5/html5_form_input_types.asp -->
                <p class="note">Note: Please make sure your details are correct before submitting form!</p>
                <button class="btn btn-lg btn-success btn-block"  type="submit" name="action" value="create">Create</button>
 				<p class="text-center sign-in"><a href="signIn.jsp" class="button">Back to</a> signIn page</p>
            </form>
        </div>
</body>
</html>