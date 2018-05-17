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
			<a class="navbar-brand" href="/myProject/index.jsp">Home</a>
		</div>
		<%
			String username = request.getParameter("username");
			if (username != null) {
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
			String questionStr = "";
			while (question.next()) {
				questionStr = question.getString(1);
			}
		%>
		
		
	<%
		String newPoll = request.getParameter("pollQuestion");
		if (newPoll != null && !newPoll.equals("")) {
			String updateQuestion = "UPDATE poll SET question = '"
					+ newPoll + "' WHERE id = 1;";
			if (statement.executeUpdate(updateQuestion) == 1) {
				String getNewQuestion = "SELECT question FROM poll WHERE id=1;";
				ResultSet newQuestion = statement
						.executeQuery(getNewQuestion);

				while (newQuestion.next()) {
					questionStr = newQuestion.getString(1);
				}
			} else {
				out.print("not ok");
			}

		}
	%>
		<h1 align='center' style='padding-top: 12vh;' id="result"><%= questionStr %></h1>

		<hr>
		<div class="col-md-6" style="margin: 0 auto; text-align: center;">
			<form class="form-control" style="height: 20vh; padding-top: 3vh;"
				method="post" action="/myProject/admin.jsp">
				<label><b>Change the poll question:</b></label><input type="text"
					class="col-md-10" name="pollQuestion" id="pollQuestion"> <br>
				<div class="form-group">
					<button type="submit" class="btn btn-success"
						style="margin-top: 10%;">Confirm</button>
					<button class="btn btn-danger" style="margin-top: 10%;"
						onlick="clearText();">Cancel</button>
				</div>
			</form>
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

	<script>
		function clearText() {
			document.getElementById("pollQuestion").value = "";
		}
	</script>
</body>
</html>