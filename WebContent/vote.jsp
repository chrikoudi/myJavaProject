<%@ page import="java.sql.Connection"%>
<%@ page import="myProject.DbManager"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	DbManager db = new DbManager();
	Connection conn = db.getConnection();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<p align="center">
		<%
			String username = request.getParameter("username");
			Statement statement = conn.createStatement();
			String getVote = "SELECT voted FROM participation WHERE username=\'"
					+ username + "\';";
			ResultSet vote = statement.executeQuery(getVote);

			while (vote.next()) {
				out.print("You have voted: " + vote.getString(1));
			}
		%>
	</p>
</body>
</html>