<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>JDBC Connection example</title>
    </head>
  <body>
    <h1>Create Job Search</h1>

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

  String visbility = "PUBLIC";
  String title = "Computer Vision and AI";
  String description = "I am a good candidate because...";
  String resume = "resume.pdf";
  int distance = 100;
  int startTime = 5;
  int endTime = 20;
  int userID = 40;


	Statement stmt = con.createStatement();

	String sql = "INSERT INTO listings (visbility_status, description, title) VALUE('" + visbility + "', '" + description + "', '" + title + "')";
  stmt.executeUpdate(sql);

  String sql3 = "SELECT listing_id FROM listings WHERE description = '" + description + "'";
  ResultSet rs = stmt.executeQuery(sql3);

  rs.next();

  int listingID = rs.getInt(1);

  String sql2 = "INSERT INTO job_search_postedby_student (user_id, listing_id) VALUE(" + userID + "," + listingID + ")";
  stmt.executeUpdate(sql2);

  String sql4 = "INSERT INTO job_search (listing_id, distance_range, resume, start_time, end_time, desired_major) VALUE(" + listingID + ", " + distance + ", '" + resume + "'," + startTime + "," + endTime + ",'" + desired_major "')";
  stmt.executeUpdate(sql4);

  con.close();
} catch(SQLException e) {
          out.println("SQLException caught: " + e.getMessage());
      }
%>

</div>
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>
