<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.cs5200.project.orm.dao.*, edu.neu.cs5200.project.orm.models.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="tree.ico">

    <title>GoATrip Signin page</title>

    <!-- Bootstrap core CSS -->
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <!-- <link href="http://getbootstrap.com/examples/signin/signin.css" rel="stylesheet"> -->
    
    <link rel="stylesheet" type="text/css" href="mystyles.css" media="screen" />
    
  </head>
<body>

    <div class="container">
    
    <%
    UserDAO dao = new UserDAO();
 	
 	String action = request.getParameter("action");
 	String username = request.getParameter("username");
 	String password = request.getParameter("password");
 	
 	if("signin".equals(action))
 	{
 		signinDAO signindao = new signinDAO();
 		int check = signindao.signinCheck(username, password);
 		
 		if(check > 0)
 		{
 			%>
 				<META HTTP-EQUIV=REFRESH CONTENT="1; URL=homepage.jsp?id=<%= String.valueOf(check)%>">
 				<p class="success">Login success!</p>
 			<%
 			
 		}
 		
 		else
 		{
 			%>
 				<p class="error">ERROR: username/password pair not found! <a href="signIn.jsp" class="button top-button signup-button">Click here</a> to re-enter your username and passowrd.</p>
 			<%
 		}
 	
 	}
    %>
    

      <form action="signIn.jsp" class="form-signin">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputUsername" class="sr-only">Username</label>
        <input type="text" name="username" class="form-control" placeholder="Username" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit" name="action" value="signin">Sign in</button>
        <p class="text-center sign-up"><a href="register.jsp" class="button top-button signup-button">Sign up</a> for a new account</p>
      </form>

    </div> <!-- /container -->


    <!-- <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <!-- <script src="http://getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js"></script> -->
  </body>
</html>