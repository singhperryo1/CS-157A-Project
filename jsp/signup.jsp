<%@ page language="java" contentType="text/html; charset = UTF-8" pageEncoding="UTF-8" %> 

<%@ page import = "java.sql.*" %> 
<html> 
<head> 
<title>Jobmark Sign Up</title> 
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
        <form action="signup.jsp" method = "POST">
            <img src="img/avatar.svg">
            <h2 class="title">Sign Up</h2>
            <div class="input-div one">
            <div class = "i">
              <i class="fas fa-user"></i>
              </div>
                <div class="div">
                    <input type="text" class="input" name ="userId" placeholder = "Enter User Id Here">
                    
                </div>
            </div>
                        <div class="input-div one">
            <div class = "i">
              <i class="fas fa-user"></i>
              </div>
                <div class="div">
                    <input type="text" class="input" name ="username" placeholder = "Enter Name Here">
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
            <input type="submit" class="btn" value="Sign Up">
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
	
	String username = request.getParameter("username");
	
	String upassword = request.getParameter("password");
	
	int flag = 0; 
	
	for (int i = 0; i < userId.length(); i++) {
		if (userId.charAt(i) < '0' && userId.charAt(i) > '9') {
			flag = 1; 
		}
	}
	
	if (flag == 0 && username != null && username != "" && upassword != null && upassword != "") {
		
	Statement stmt = con.createStatement();
	
	int ui = Integer.parseInt(userId); 
	
	String check = "SELECT name FROM User WHERE userId ='" + ui + "'";
	
	
	ResultSet rs = stmt.executeQuery(check);
	
	
	if (!rs.next()) {
	
	String sql = "INSERT INTO User (userId, name, password, registrationDate) VALUE('" + ui + "', '" + username + "', '" + upassword + "', CURDATE())";

	
	stmt.executeUpdate(sql);
	
    %>
	   <h2 class="float-left">You are now Signed Up!<a href = "./home.jsp" class = "float-right"><h2>Sign In</h2></a></h2>
	<%
    
	
	} else {
		  %>
		   <h2 class="float-left">User Id already exists. Please try different one!</h2>
		<%
	}
    
    con.close();
    
	}
	}  catch (Exception e) {
		System.out.println("This is the error -> " + e);
	}
    	%>

</div>
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>