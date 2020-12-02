<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %> 

	  <html> 
<head> 
<title>Student Profile</title> 
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link href="https://fonts.googleapis.comcss?family=Poppins:600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head> 
<body> 
<div class="container">
    <div class="img">
        <img src="img/bck1.png">
    </div>

<%
String db = "Jobmark"; 
String user = "root"; 
String password = "Thefinalshot01!";

try {
	
	java.sql.Connection con;
	
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Jobmark?useUnicode = true&useJDBCComplaintTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", user, password);

	
	int ui = (int) session.getAttribute("userId"); 
	
	Statement stmt = con.createStatement();
	
	String sql = "SELECT * FROM Student WHERE userId ='" + ui + "'";
	
	ResultSet rs = stmt.executeQuery(sql);
	
	int i = 0; 
	
	while (rs.next()) {
		i++;
	}
	
	System.out.println("this is aqui" + i);
	
	if(i == 0) {
    	%>
    <div class="login-content">
        <form action="student.jsp" method = "POST">
            <img src="img/avatar.svg">
            <h2 class="title">Student Profile</h2>
            <div class="input-div one">
            <div class = "i">
              <i class="fas fa-user"></i>
              </div>
                <div class="div">
                    <input type="text" class="input" name ="major" placeholder = "Enter Major Here">
                    
                </div>
            </div>
                        <div class="input-div one">
            <div class = "i">
              <i class="fas fa-user"></i>
              </div>
                <div class="div">
                    <input type="text" class="input" name ="location" placeholder = "Enter Location Here">
                </div>
            </div>
            
            <div class="input-div pass">
                <div class="i">
                    <i class="fas fa-lock"></i>
                </div>
                <div class="div">
                    <input type="email" class="input" name ="email" placeholder = "Enter Email Here">
                </div>
            </div>
            <br>
            <input type="submit" class="btn" value="Create Student Profile">
        </form>
        </div>	   
 	<%
 	
 	String major = request.getParameter("major");
 	
 	String location = request.getParameter("location");
 	
 	String email = request.getParameter("email");
 	
 	if (ui != 0 && major != null && major != "" && location != null && location != "" && email != null && email != "") {
 		

 		String add = "INSERT INTO Student (userId, major, studentEmail, location) VALUE('" + ui + "', '" + major + "', '" + email + "', '" + location + "')";
 		
 		System.out.println("this is the query" + add); 
 		
 		stmt.executeUpdate(add); 	
 		
 		 String redirectURL = "./student.jsp";
         response.sendRedirect(redirectURL);	
 		
 	}
    } else {
    
    	
    	%>
   	 <div class="login-content">
 
        <form action="student.jsp" method = "POST">
            <img src="img/avatar.svg">
            <h2 class="title">Job Search</h2>
            <div class="input-div one">
            <div class = "i">
              <i class="fas fa-user"></i>
              </div>
                <div class="div">
                    <input type="text" class="input" name ="jobtitle" placeholder = "Enter Job Title">
                    
                </div>
            </div>
                        <div class="input-div one">
            <div class = "i">
              <i class="fas fa-user"></i>
              </div>
                <div class="div">
                    <input type="text" class="input" name ="distance" placeholder = "Enter Distance Eg: 8 - 10 im miles">
                </div>
            </div>
            
            <div class="input-div pass">
                <div class="i">
                    <i class="fas fa-lock"></i>
                </div>
                <div class="div">
                    <input type="text" class="input" name ="availability" placeholder = "Enter Time Eg: 9:00AM - 6:00PM">
                </div>
            </div>
            <br>
            <input type="file"  accept = ".pdf" value="Upload Resume">
        </form>
    </div>
   	
   	<% 
   	
   	
    } 
	
	
	    
	   
	rs.close();
	con.close();
} catch (Exception e) {
	System.out.println("This is the error -> " + e);
}


%>


</div>
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>