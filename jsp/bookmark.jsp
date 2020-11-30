<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>JDBC Connection example</title>
    </head>
  <body>
    <h1>Display Bookmarks</h1>

    <table border="1">
      <tr>
        <td>Website</td>
        <td>Requirements</td>
        <td>Responsibilities</td>
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

  int userID = 31;

	Statement stmt = con.createStatement();

	String sql = "SELECT * FROM student_bookmark JOIN job_listing USING (listing_id) WHERE user_id = " + userID;

  ResultSet rs = stmt.executeQuery(sql);

  while (rs.next()) {
      out.println(rs.getString(4) + " " + rs.getString(5) + " " + rs.getString(6) +  "<br/><br/>");
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
