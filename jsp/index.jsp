<% @ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %> 

<% @ page import = "java.sql.*" %> 
<html> 
<head> 
<title>Animated Login Form </title> 
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
        <form action="index.html">
            <img src="img/avatar.svg">
            <h2 class="title">Welcome</h2>
            <div class="input-div one">
                <div class="i">
                    <i class="fas fa-user"></i>
                </div>
                <div class="div">
                    <h5>Username</h5>
                    <input type="text" class="input" name ="username">
                </div>
            </div>
            <div class="input-div pass">
                <div class="i">
                    <i class="fas fa-lock"></i>
                </div>
                <div class="div">
                    <h5>Password</h5>
                    <input type="password" class="input" name ="password">
                </div>
            </div>
            <a href="#">Forgot Password?</a>
            <input type="submit" class="btn" value="Login">
        </form>
    </div>
</div>
<% 
String db = "JOBMARK"; 
String user = "root"; 
String password = "";
try {
	java.sql.Connection.con; 
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	con = DriveManager.getConnection("jdbc:mysql://localhost:3306/JOBMARK?useUnicode = true"&useJDBCComplaintTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC, user, password);
	Statement stmt = con.createStatement();

	String name = request.getParamter("username"); 

	ResultSet result = stmt.executeQuery("SELECT password FROM JOBMARK.password WHERE user.name = name"); 

	if (request.getParameter("password") == result) {
	   response.sendRedirect("home.jsp"); 
	}

} 
%> 
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>