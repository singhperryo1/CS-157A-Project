<% 
String db = "JOBMARK"; 
String user = "root"; 
String password = "";
try {
	java.sql.Connection.con; 
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	con = DriveManager.getConnection("jdbc:mysql://localhost:3306/JOBMARK?useUnicode = true"&useJDBCComplaintTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC, user, password);
	Statement stmt = con.createStatement();
	String search = request.getParamter("search"); 
	String availabilityTime = request.getParamter("availability"); 
	String distanceRange = request.getParamter("distance"); 
	
	if(availabilityTime != NULL && distanceRange != NULL){
		ResultSet result = stmt.executeQuery("SELECT * FROM JOBMARK.Listings WHERE title LIKE '%" + search + "%' AND visibilityStatus = 'TRUE' AND availabilityTime <> " + availabilityTime + " AND distanceRange > " + distanceRange);
	} else if(availabilityTime != NULL) {
		ResultSet result = stmt.executeQuery("SELECT * FROM JOBMARK.Listings WHERE title LIKE '%" + search + "%' AND visibilityStatus = 'TRUE' AND availabilityTime <> " + availabilityTime);
	} else if(distanceRange != NULL){
		ResultSet result = stmt.executeQuery("SELECT * FROM JOBMARK.Listings WHERE title LIKE '%" + search + "%' AND visibilityStatus = 'TRUE' AND distanceRange > " + distanceRange);
	} else {
		ResultSet result = stmt.executeQuery("SELECT * FROM JOBMARK.Listings WHERE title LIKE '%" + search + "%' AND visibilityStatus = 'TRUE'");
	}
	if (request.getParameter("search") == result) {
	   response.sendRedirect("home.jsp"); 
	}
} 
%> 

<% 
String db = "JOBMARK"; 
String user = "root"; 
String password = "";
try {
	java.sql.Connection.con; 
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	con = DriveManager.getConnection("jdbc:mysql://localhost:3306/JOBMARK?useUnicode = true"&useJDBCComplaintTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC, user, password);
	Statement stmt = con.createStatement();
	String search = request.getParamter("search"); 
	String earnings = request.getParamter("earnings"); 
	String requirements = request.getParamter("requirements"); 
	
	if(earnings != NULL && requirements != NULL){
		ResultSet result = stmt.executeQuery("SELECT * FROM JOBMARK.Listings WHERE title LIKE '%" + search + "%' AND visibilityStatus = 'TRUE' AND estimatedEarnings <> " + earnings + " AND requirements <> " + requirements);
	} else if(earnings != NULL) {
		ResultSet result = stmt.executeQuery("SELECT * FROM JOBMARK.Listings WHERE title LIKE '%" + search + "%' AND visibilityStatus = 'TRUE' AND estimatedEarnings <> " + earnings);
	} else if(requirements != NULL){
		ResultSet result = stmt.executeQuery("SELECT * FROM JOBMARK.Listings WHERE title LIKE '%" + search + "%' AND visibilityStatus = 'TRUE' AND requirements <> " + requirements);
	} else {
		ResultSet result = stmt.executeQuery("SELECT * FROM JOBMARK.Listings WHERE title LIKE '%" + search + "%' AND visibilityStatus = 'TRUE'");
	}
	if (request.getParameter("search") == result) {
	   response.sendRedirect("home.jsp"); 
	}
} 
%> 