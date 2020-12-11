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
                    <a class="nav-link " aria-current="page" href="studentedit.jsp">Edit your profile</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link " aria-current="page" href="studentsearch.jsp">Search your job</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link " aria-current="page" href="studentcreate.jsp">Create your Job Search</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link " aria-current="page" href="studentremove.jsp">Remove your Search</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link " aria-current="page" href="bookmark.jsp">Bookmark</a>
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
        <table border="2">
        <tr>
        <td>Major</td>
        <td>Website</td>
        <td>Requirements</td>
        <td>Salary</td>
        <td>Bookmark</td>
        </tr>
          <%
          String db = "Jobmark";
          String user = "root";
          String password = "Thefinalshot01!";

          try {

          	java.sql.Connection con;

          	Class.forName("com.mysql.cj.jdbc.Driver");
          	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Jobmark?useUnicode = true&useJDBCComplaintTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", user, password);

            String major = (String) session.getAttribute("major");
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM JobListing WHERE requirements = '" + major + "'";

            //out.println(sql);


            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
              %>
              <tr>
    <td><%=rs.getString(2) %></td>
    <td><%=rs.getString(3) %></td>
    <td><%=rs.getString(4) %></td>
    <td>$<%=rs.getInt(5) %></td>
    <td><input class="btn btn-primary btn-sm" type="submit" value="Submit"></td>
</tr>
<%
            }

              con.close();




          	}  catch (Exception e) {
          		out.println("This is the error -> " + e);
          	}
              	%>
            </form>

    </div>
</div>

</body>
</html>
