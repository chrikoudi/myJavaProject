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
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/main.css">
<script src="./js/bootstrap.js"></script>
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-default">
	<div class="container-fluid">

		<div class="navbar-header navbar-default navbar">
			<a class="navbar-brand" href="/myProject/index.jsp">WebSiteName</a>
		</div>
		<ul class="nav navbar-nav">
			<form class="form-inline" method="post" action="/myProject/index.jsp">
				<div class="form-group">
					<label for="username">Username:</label> <input type="text"
						class="form-control" id="username">
				</div>
				<div class="form-group">
					<label for="password">Password:</label> <input type="password"
						class="form-control" id="password">
				</div>
				<button type="submit" class="btn btn-success">Submit</button>
			</form>
		</ul>
	</div>
	</nav>

	<div class="container fixHeight">
		<h1 align="center">
			<%
				Statement statement = conn.createStatement();
				String getQuestion = "SELECT question FROM poll;";
				ResultSet question = statement.executeQuery(getQuestion);

				while (question.next()) {
					out.print(question.getString(1));
				}
			%>
		</h1>

	</div>

	<footer align="right">
	<p style="padding-right: 5%;">
		<i> <%
 	if (conn == null) {
 		out.print("connection failed");
 	} else {
 		out.print("connection succeeded");
 	}
 %>
		</i>
	</p>
	</footer>
</body>
</html>



