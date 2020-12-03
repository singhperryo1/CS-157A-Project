<%@ page language="java" contentType="text/html; charset = UTF-8" pageEncoding="UTF-8" %>

<%@ page import = "java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>JobMark - Your first job await</title>
    <link rel="stylesheet" href="css/bootstrap.css">
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <!-- Container wrapper -->
    <div class="container-fluid">
        <!-- Navbar brand -->
        <a class="navbar-brand" href="#">Jobmark</a>

        <!-- Toggle button -->
        <button
                class="navbar-toggler"
                type="button"
                data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
            <i class="fas fa-bars"></i>
        </button>

        <!-- Collapsible wrapper -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Left links -->
            <ul class="navbar-nav mr-auto mb-2 mb-lg-0">
              <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#">Profile</a>
              </li>

              <li class="nav-item">
                  <a class="nav-link " aria-current="page" href="recruitersearch.jsp">Search for students</a>
              </li>

              <li class="nav-item">
                  <a class="nav-link " aria-current="page" href="recruitercreate.jsp">Create your Job Listing</a>
              </li>
            </ul>
            <!-- Left links -->
            <ul class="navbar-nav ml-auto mb-2 mb-rg-0">
                <li class="nav-item">
                    <a class="nav-link" href="#">Log out</a>
                </li>
            </ul>

        </div>
        <!-- Collapsible wrapper -->
    </div>
    <!-- Container wrapper -->
</nav>
<!-- Navbar -->

<div class="container">
    <div class="row">
        <h1 class="text-center">Search Results</h1>
        <div class="login-wrap">
          <form class="form-horizontal" role="form"  action="recruitersearch.jsp" method = "POST">
            <div class="form-group">
                <label for="inputDistance" class="col-sm-0 control-label">
                    Distance</label>
                <div class="col-sm-9">
                    <input type="number" class="form-control" name="inputDistance" placeholder="Distance" required>
                </div>
            </div>
            <div class="form-group">
                <label for="inputAvailability" class="col-sm-0 control-label">
                    Availability (00:00-24:00)</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="inputAvailability" placeholder="Availability" required>
                </div>
            </div>
              <br>

              <div class="form-group last">
                  <div class="col-sm-offset-3 col-sm-9">
                      <button type="submit" class="btn btn-success btn-sm">
                          Search</button>
                      <button type="reset" class="btn btn-default btn-sm">
                          Reset</button>
                  </div>
              </div>
          </form>
          <%
          String db = "Jobmark";
          String user = "root";
          String password = "Thefinalshot01!";

          try {

          	java.sql.Connection con;

          	Class.forName("com.mysql.cj.jdbc.Driver");
          	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Jobmark?useUnicode = true&useJDBCComplaintTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", user, password);

            String distance = request.getParameter("inputDistance");

            String availability = request.getParameter("inputAvailability");

            Statement stmt = con.createStatement();

            if(distance != null && availability != null){
              String sql = "SELECT * FROM JobSearch JOIN listing USING (listingId) JOIN student_does_jobsearch USING (listingId) JOIN student ON (student_does_jobsearch.studentUserId = student.userId) WHERE availabilityTime = '" + availability + "' AND distanceRange = '" + distance + "'";

              //out.println(sql);

              ResultSet rs = stmt.executeQuery(sql);

              while (rs.next()) {
                  out.println(rs.getString(6) + " " + rs.getString(7) + " " + rs.getString(11) + " " + rs.getString(12) + " " + rs.getString(13) + "<br/><br/>");
              }
            }


              con.close();




          	}  catch (Exception e) {
          		out.println("This is the error -> " + e);
          	}
              	%>
            </form>
        </div>
    </div>
</div>

</body>
</html>
