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
		<%
			String username = request.getParameter("username");
			if (username == null) {
		%>

		<ul class="nav navbar-nav">
			<form class="form-inline" method="post"
				action="/myProject/controller.jsp">
				<div class="form-group">
					<label for="username">Username:</label> <input type="text"
						class="form-control" name="username">
				</div>
				<div class="form-group">
					<label for="password">Password:</label> <input type="password"
						class="form-control" name="password">
				</div>
				<button type="submit" class="btn btn-success">Login</button>
			</form>
		</ul>
		<%
			} else {
		%>
		<ul class="nav navbar-nav">
			<p>
				<%
					out.print("Welcome " + username + "!");
				%>

			</p>
		</ul>
		<%
			}
		%>
	</div>
	</nav>
	<div class="container fixHeight">
		<%
			Statement statement = conn.createStatement();
			String getVote = "SELECT voted FROM participation WHERE username=\'"
					+ username + "\';";
			ResultSet vote = statement.executeQuery(getVote);

			while (vote.next()) {
				if (vote.getString(1) != null) {
					out.print("<h1 align='center'>You have voted: "
							+ vote.getString(1) + "</h1>");
				} else {
		%>

		<div class="col-md-3 centralized">
			<form class="form-control myForm" method="post"
				action="/myProject/index.jsp">
				<h4>You can now vote:</h4>
				<hr>
				<label class="radio"><input type="radio" name="userVote">YES</label>

				<label class="radio"><input type="radio" name="userVote">NO</label>

				<hr>
				<div class="form-group">
					<button type="submit" class="btn btn-success"
						style="margin-left: 65%;">Vote</button>
				</div>
			</form>
		</div>

		<%
			}
			}
		%>

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
