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
                        <a class="nav-link " aria-current="page" href="#">Home</a>
                    </li>
                </ul>
                <!-- Left links -->
                <ul class="navbar-nav ml-auto mb-2 mb-rg-0">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Login</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#">Sign Up</a>
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
            <h1 class="text-center">Please login with your credentials in form below</h1>
            <div class="login-wrap">
                <form class="form-horizontal" role="form" action="login.jsp" method = "POST">
                    <div class="form-group">
                        <label for="inputUser" class="col-sm-3 control-label">
                            User ID</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="inputUser" placeholder="UserName" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPsw" class="col-sm-3 control-label">
                            Password</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" name="inputPsw" placeholder="Password" required>
                        </div>
                    </div>

                    <br>

                    <div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="submit" class="btn btn-success btn-sm">
                                Sign in</button>
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


	String userId = request.getParameter("inputUser");

	if (userId != null && userId != "") {

	Statement stmt = con.createStatement();

	String pass = request.getParameter("inputPsw");

	String sql = "SELECT password FROM User WHERE userId ='" + userId + "'";

    ResultSet rs = stmt.executeQuery(sql);

    if(!rs.next()) {
    	%>
 	   <h2 class="float-left">Invalid User Id or Password, try again!</h2>
 	<%
    }

    String p = rs.getString(1);

    rs.close();

    con.close();

    if (p.equals(pass)) {

    	  String redirectURL = "./student.jsp";
        response.sendRedirect(redirectURL);
        session.setAttribute("userId",Integer.parseInt(userId));
	} else {
    	%>
    	   <h2 class="float-left">Invalid User Id or Password, try again!</h2>
    	<%
    }
	}
	}  catch (Exception e) {
		System.out.println("This is the error -> " + e);
	}
 %>
    </div>
</body>
</html>
