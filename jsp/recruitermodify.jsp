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

                  <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="recruitermodify.jsp">Modify your Job Listing</a>
                  </li>

                  <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="recruiterremove">Remove your Job Listing</a>
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
            <h1 class="text-center">Modify your Job Listing</h1>
            <div class="login-wrap">
                <form class="form-horizontal" role="form"  action="recruitercreate.jsp" method = "POST">
                  <div class="form-group">
                      <label for="inputVisibility" class="col-sm-0 control-label">
                          Visibility</label>
                      <div class="col-sm-9">
                          <input type="text" class="form-control" name="inputVisibility" placeholder="Public/Private" required>
                      </div>
                  </div>
                  <div class="form-group">
                      <label for="inputTitle" class="col-sm-0 control-label">
                          Title</label>
                      <div class="col-sm-9">
                          <input type="text" class="form-control" name="inputTitle" placeholder="Title" required>
                      </div>
                  </div>
                  <div class="form-group">
                      <label for="inputDescription" class="col-sm-0 control-label">
                          Description</label>
                      <div class="col-sm-9">
                          <input type="text" class="form-control" name="inputDescription" placeholder="Description" required>
                      </div>
                  </div>
                  <div class="form-group">
                      <label for="inputRequirements" class="col-sm-0 control-label">
                          Requirements (ex. Software Engineering)</label>
                      <div class="col-sm-9">
                          <input type="text" class="form-control" name="inputRequirements" placeholder="Job Requirements" required>
                      </div>
                  </div>
                    <div class="form-group">
                        <label for="inputWebsite" class="col-sm-0 control-label">
                            Website</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="inputWebsite" placeholder="Website" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputResponsibilities" class="col-sm-0 control-label">
                            Responsibilities</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="inputResponsibilities" placeholder="Job Responsibilities" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputSalary" class="col-sm-0 control-label">
                            Estimated Salary</label>
                        <div class="col-sm-9">
                            <input type="number" class="form-control" name="inputSalary" placeholder="Salary" required>
                        </div>
                    </div>
                    <br>

                    <div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="submit" class="btn btn-success btn-sm">
                                Modify</button>
                            <button type="reset" class="btn btn-default btn-sm">
                                Reset</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <%
        String db = "Jobmark";
        String user = "root";
        String password = "Thefinalshot01!";

        try {

        	java.sql.Connection con;

        	Class.forName("com.mysql.cj.jdbc.Driver");
        	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Jobmark?useUnicode = true&useJDBCComplaintTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", user, password);

          String visibility = request.getParameter("inputVisibility");

          String title = request.getParameter("inputTitle");

          String description = request.getParameter("inputDescription");

          String website = request.getParameter("inputWebsite");

          String requirements = request.getParameter("inputRequirements");

          String responsibilities = request.getParameter("inputResponsibilities");

          String salary = request.getParameter("inputSalary");

          Statement stmt = con.createStatement();

          int ui = (int) session.getAttribute("userId");

          if(visibility != null && title != null && description != null & responsibilities != null && website != null && salary != null){
            String sql1 = "SELECT listingId FROM joblistings_postedby_recruiter WHERE recruiterUserId =" + ui ;
            ResultSet rs = stmt.executeQuery(sql1);
            rs.next();
            int listingId = rs.getInt(1);

            String sql = "UPDATE listing SET visibilityStatus = '" + visibility + "', description ='" + description + "', title ='" + title + "' WHERE listingId = '" + listingId + "')";
            stmt.executeUpdate(sql);
            //out.println(sql);

            String sql4 = "UPDATE joblisting SET requirements = '" + requirements + "', website = '" + website + "', responsibilities ='" + responsibilities + "', estimatedEarnings ='" + salary + "' WHERE listingId = '" + listingId + "')";
            stmt.executeUpdate(sql4);
            //out.println(sql4);
          }



        	}  catch (Exception e) {
        		//out.println("This is the error -> " + e);
        	}
            	%>
    </div>

</body>
</html>
