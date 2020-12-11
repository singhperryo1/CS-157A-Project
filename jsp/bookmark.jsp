<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>JDBC Connection example</title>
    </head>
  <body>
    <h1>JDBC Connection example</h1>

    <table border="1">
      <tr>
        <td>Distance</td>
        <td>Resume</td>
        <td>Start Time</td>
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

  String major = "Biology";
  int earnings = 100000;
  int startTime = 5;
  int endTime = 10;

	Statement stmt = con.createStatement();

	String sql = "SELECT * FROM job_search";

  ResultSet rs = stmt.executeQuery(sql);

  while (rs.next()) {
      out.println(rs.getInt(2) + "<br/><br/>");
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
