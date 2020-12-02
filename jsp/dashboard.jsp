
<%@ page import = "java.sql.*" %> 
<html> 
<head> 
<title>Jobmark Home Page</title> 
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link href="https://fonts.googleapis.comcss?family=Poppins:600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head> 
<body>
<br>
<br>
<div class = "float-left">
 <a href = "./home.jsp"><img src="img/jmlogo.png" height = "30" width = "100"></a>
</div>
<nav class="navbar navbar-expand-lg navbar-light float-right">
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="nav-item nav-link" href="./student.jsp">Student</a>
      <a class="nav-item nav-link" href="./recruiter.jsp">Recruiter</a>
    </div>
  </div>
</nav>
<div class="container">
    <div class="img">
        <img src="img/login.svg">
    </div>
     <div class="login-content">
        <form>
            <h2>Jobmark</h2>
            <h4><b><em>Streamlining hiring process</em></b></h4>
            <h4><em>for students & recruiters</em></h4>
            <br>
            <br>
             <a href = "https://docs.google.com/document/d/1PvtQjJ5Hs73BHYEurYnNafjDKORnckJgRkB7y1bVXZ8/edit" target ="_blank" class="btn">Learn More</a> 
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>