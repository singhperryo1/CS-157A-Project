<%@ page language="java" contentType="text/html; charset = UTF-8" pageEncoding="UTF-8" %> 

<%@ page import = "java.sql.*" %> 
<html> 
<head> 
<title>Jobmark Sign In</title> 
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link href="https://fonts.googleapis.comcss?family=Poppins:600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head> 
<body> 
<div class="container">
    <div class="img">
        <img src="img/login.svg">
    </div>
    <div class="login-content">
        <form action="home.jsp" method = "POST">
            <img src="img/avatar.svg">
            <h2 class="title">Welcome</h2>
            <div class="input-div one">
                <div class="i">
                    <i class="fas fa-user"></i>
                </div>
                <div class="div">
                    <input type="text" class="input" name ="userId" placeholder = "960000000">
                </div>
            </div>
            <div class="input-div pass">
                <div class="i">
                    <i class="fas fa-lock"></i>
                </div>
                <div class="div">
                    <input type="password" class="input" name ="password" placeholder = "Enter Password Here">
                </div>
            </div>
            <br>
            <input type="submit" class="btn" value="Login">
            <div>
            <br>
            <br>
             <h4 class="title float-left">Don't Have an Account? <a href = "./signup.jsp"><h4>Sign Up</h4></a></h4>
            </div>
        </form>
    </div>
<%
String db = "Jobmark"; 
String user = "root"; 
String password = "Thefinalshot01!";

try {
	
	java.sql.Connection con;
	
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Jobmark?useUnicode = true&useJDBCComplaintTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", user, password);

	
	String userId = request.getParameter("userId");
	
	if (userId != null && userId != "") {
		
	Statement stmt = con.createStatement();
	
	String pass = request.getParameter("password");
	
	String sql = "SELECT password FROM User WHERE userId ='" + userId + "'";
	
    ResultSet rs = stmt.executeQuery(sql);
    
    if(!rs.next()) {
    	%>
 	   <h2 class="float-left">Invalid User Id or Password, try again!</h2>
 	<%
    }
    
    String p = rs.getString(1);
    
    rs.close();
    
    con.close();
   
    if (p.equals(pass)) {
    	
    	  String redirectURL = "./dashboard.jsp";
        response.sendRedirect(redirectURL);	 
        session.setAttribute("userId",Integer.parseInt(userId)); 
	} else {
    	%>
    	   <h2 class="float-left">Invalid User Id or Password, try again!</h2>
    	<%
    }
	}
	}  catch (Exception e) {
		System.out.println("This is the error -> " + e);
	}
 %>

</div>
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>