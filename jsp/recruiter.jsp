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
            <h1 class="text-center">Create your Recruiter profile</h1>
            <div class="login-wrap">
                <form class="form-horizontal" role="form" action="recruiter.jsp" method = "POST">
                    <div class="form-group">
                        <label for="inputCompany" class="col-sm-3 control-label">
                            Company</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="inputCompany" placeholder="Your company" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="col-sm-3 control-label">
                            Work Email</label>
                        <div class="col-sm-9">
                            <input type="email" class="form-control" name="inputEmail" placeholder="Your work email" required>
                        </div>
                    </div>

                    <br>

                    <div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="submit" class="btn btn-success btn-sm">
                                Create</button>
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

        	String company = request.getParameter("inputCompany");

        	String email = request.getParameter("inputEmail");

        	Statement stmt = con.createStatement();

          int ui = (int) session.getAttribute("userId");

          if(company != null && email != null){
            String sql = "INSERT INTO Recruiter (userId, company, workEmail) VALUE('" + ui + "', '" + company + "', '" + email + "')";
            //out.println(sql);

            stmt.executeUpdate(sql);

            con.close();
          }



        	}  catch (Exception e) {
        		out.println("This is the error -> " + e);
        	}
            	%>
    </div>

</body>
</html>
