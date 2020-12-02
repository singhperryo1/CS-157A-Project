<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*" %>

	  <html>
<head>
<title>Recruiter Profile</title>
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

	String sql = "SELECT * FROM Recruiter WHERE userId ='" + ui + "'";

	ResultSet rs = stmt.executeQuery(sql);

	int i = 0;

	while (rs.next()) {
		i++;
	}


	if(i == 0) {
    	%>
    <div class="login-content">
        <form action="recruiter.jsp" method = "POST">
            <img src="img/avatar.svg">
            <h2 class="title">Recruiter Profile</h2>
            <div class="input-div one">
            <div class = "i">
              <i class="fas fa-user"></i>
              </div>
                <div class="div">
                    <input type="text" class="input" name ="company" placeholder = "Enter Company Here">

                </div>
            </div>
            <div class="input-div pass">
                <div class="i">
                    <i class="fas fa-lock"></i>
                </div>
                <div class="div">
                    <input type="email" class="input" name ="workemail" placeholder = "Enter Work Email Here">
                </div>
            </div>
            <br>
            <input type="submit" class="btn" value="Create Recruiter Profile">
        </form>
        </div>
 	<%

 	String major = request.getParameter("company");

 	String email = request.getParameter("workemail");


 	if (ui != 0 && company != null && company != "" && workemail != null && workemail != "") {


 		String add = "INSERT INTO Recruiter (userId, company, workEmail) VALUE('" + ui + "', '" + company + "', '" + location + "')";

 		System.out.println("this is the query" + add);

 		stmt.executeUpdate(add);

 		 String redirectURL = "./recruiter.jsp";
         response.sendRedirect(redirectURL);

 	}
    } else {


    	%>
   	 <div class="login-content">

        <form action="student.jsp" method = "POST">
            <img src="img/avatar.svg">
            <h2 class="title">Job Listing</h2>
            <div class="input-div one">
            <div class = "i">
              <i class="fas fa-user"></i>
              </div>
                <div class="div">
                    <input type="text" class="input" name ="requirements" placeholder = "Enter Requirements">

                </div>
            </div>

            <div class="input-div one">
            <div class = "i">
              <i class="fas fa-user"></i>
              </div>
                <div class="div">
                    <input type="url" class="input" name ="website" placeholder = "Enter Website">
                </div>
            </div>

            <div class="input-div pass">
                <div class="i">
                    <i class="fas fa-lock"></i>
                </div>
                <div class="div">
                    <input type="text" class="input" name ="responsibilities" placeholder = "Enter Responsibilities">
                </div>
            </div>

            <div class="input-div pass">
                <div class="i">
                    <i class="fas fa-lock"></i>
                </div>
                <div class="div">
                    <input type="number" class="input" name ="earnings" placeholder = "Enter Salary">
                </div>
            </div>

            <div class="input-div one">
            <div class = "i">
              <i class="fas fa-lock"></i>
              </div>
                <div class="div">
                    <input type="text" class="input" name ="visbility" placeholder = "Public/Private">
                </div>
            </div>
            <div class="input-div one">
            <div class = "i">
              <i class="fas fa-user"></i>
              </div>
                <div class="div">
                    <input type="text" class="input" name ="description" placeholder = "Enter Description Here">
                </div>
            </div>
            <div class="input-div one">
            <div class = "i">
              <i class="fas fa-user"></i>
              </div>
                <div class="div">
                    <input type="text" class="input" name ="title" placeholder = "Enter Title Here">
                </div>
            </div>
            <br>
              <input type="submit" class="btn" value="Create Job Listing">
        </form>
    </div>

   	<%

    String requirements = request.getParameter("requirements");

    String website = request.getParameter("website");

    String responsibilities = request.getParameter("responsibilities");

    String visbility = request.getParameter("visbility");

    String description = request.getParameter("description");

    String title = request.getParameter("title");

    String addSearch = "INSERT INTO Listing (visibilityStatus, description, title) VALUE('" + visbility + "', '" + description + "', '" + title + "')";

    System.out.println("this is the query" + addSearch);

    stmt.executeUpdate(addSearch);

    String sql3 = "SELECT listingId FROM Listing WHERE description = '" + description + "'";

    ResultSet id = stmt.executeQuery(sql3);

    id.next();

    int listingId = id.getInt(1);

    String addSearch2 = "INSERT INTO JobSearch (listingId, requirements, website, responsibilities, estimatedEarnings) VALUE(" + listingId + ", '" + requirements + "', '" + website + "', '" + responsibilities + "', '" + earnings + "')";

    System.out.println("this is the query" + addSearch2);

    stmt.executeUpdate(addSearch2);

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
