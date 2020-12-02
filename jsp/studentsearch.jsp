<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>JDBC Connection example</title>
    </head>
  <body>
    <h1>Student Search</h1>

    <table border="1">
      <tr>
        <td>Website</td>
        <td>Earnings</td>
        <td>Starting Time</td>
   </tr>

<%
String db = "jobmark";
String user = "root";
String password = "root";

try {

	java.sql.Connection con;

	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobmark?serverTimezone=EST5EDT", user, password);


	/*String major = request.getParameter("major");

  String earnings = request.getParameter("earnings");

  String startTime = request.getParameter("startTime");

  String endTime = request.getParameter("endTime");*/

  String major = "Software Engineering";
  int earnings = 10;
  int startTime = 5;
  int endTime = 10;

	Statement stmt = con.createStatement();

	String sql = "SELECT * FROM job_listing WHERE desired_major ='" + major + "' AND start_time < " + startTime + " AND end_time > " + endTime + " AND estimated_earnings > " + earnings;

  ResultSet rs = stmt.executeQuery(sql);

  while (rs.next()) {
      out.println(rs.getString(2) + " " + rs.getString(5) + " " + rs.getString(6) + "<br/><br/>");
  }

  rs.close();

  con.close();
} catch(SQLException e) {
          out.println("SQLException caught: " + e.getMessage());
      }
%>

</div>
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>
