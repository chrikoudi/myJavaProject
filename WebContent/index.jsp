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
			<form class="form-inline" method="post" action="/myProject/vote.jsp">
				<div class="form-group">
					<label for="username">Username:</label> <input type="text"
						class="form-control" name="username" required="true">
				</div>
				<div class="form-group">
					<label for="password">Password:</label> <input type="password"
						class="form-control" name="password" required="true">
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
				String getQuestion = "SELECT question FROM poll;";
				ResultSet question = statement.executeQuery(getQuestion);
				int yesVotesNum = 0;
				int noVotesNum = 0;
				String questionStr = "";
				while (question.next()) {
					questionStr = question.getString(1);
				}

				String getYesVotes = "SELECT COUNT(*) FROM participation WHERE voted='YES';";
				ResultSet yesVotes = statement.executeQuery(getYesVotes);

				while (yesVotes.next()) {
					yesVotesNum = yesVotes.getInt(1);
				}

				String getNoVotes = "SELECT COUNT(*) FROM participation WHERE voted='NO';";
				ResultSet noVotes = statement.executeQuery(getNoVotes);

				while (noVotes.next()) {
					noVotesNum = noVotes.getInt(1);
				}
			%>

		<div class="row">
			<div class="col-md-6 centralized">
				<table align="center" class="table table-striped table-bordered"
					style="text-align: center">
					<tr>
						<th colspan="2" style="text-align: center"><%= questionStr %></th>
					</tr>
					<tr>
						<td>YES</td>
						<td><%=yesVotesNum%></td>
					</tr>
					<tr>
						<td>NO</td>
						<td><%=noVotesNum%></td>
					</tr>

					<tr>
						<td>COUNTER</td>
						<td><%=yesVotesNum - noVotesNum%></td>
					</tr>

				</table>
			</div>
		</div>
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



