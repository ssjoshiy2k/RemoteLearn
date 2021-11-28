

<%@page import="java.sql.ResultSet"%>
<%@page import="com.pict.dao.FileDao"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>


<style>
.btn {
	box-sizing: border-box;
	appearance: button;
	background-color: #269cc6;
	border: 2px solid #269cc6;
	border-radius: 0.2em;
	color: #fff;
	cursor: pointer;
	display: flex;
	text-align: center;
	font-size: 0.8rem;
	font-weight: 400;
	line-height: 1;
	margin: 5px;
	padding: 1em 0.4em;
	text-decoration: none;
	text-align: center;
	font-family: 'Montserrat', sans-serif;
}

.btn:hover {
	box-sizing: border-box;
	appearance: button;
	background-color: #555555;
	border: 2px solid #555555;
	border-radius: 0.2em;
	color: #fff;
	cursor: pointer;
	display: flex;
	text-align: center;
	font-size: 0.8rem;
	font-weight: 400;
	line-height: 1;
	margin: 5px;
	padding: 1em 0.4em;
	text-decoration: none;
	text-align: center;
}

td {
	padding: 15px;
	text-align: left;
	vertical-align: middle;
	font-weight: 300;
	font-size: 18px;
	color: #000;
	border-bottom: solid 1px rgba(0, 0, 0, 1);
}
</style>


</head>
<body style="background: #ddebff; color: #000;">
	<center>
		<center>
			<h2>Upload Files</h2>
		</center>
		<br>
		<br>
		<hr>
		<br>
		<br>
		<%
            String username=(String)session.getAttribute("username");
            FileDao fd=new FileDao();
            ResultSet rs1= fd.getSubjects(username);
            ResultSet rs2=fd.getGroups(username);
        
        
        %>

		<form method="POST" action="FileUpload" enctype="multipart/form-data">
			<table>
				<tr>
					<td>PDF file</td>

					<select class="subject" name="subjectname">
						<%  while(true){ if( !rs1.next()) break; %>
						<option class="btn" value="<%= rs1.getString("SubjectName")%>">
							<%= rs1.getString("SubjectName")%>
						</option>
						<% } %>
					</select>

					<select class="group" name="groupname">
						<%  while(true){ if( !rs2.next()) break; %>
						<option class="btn" value="<%= rs2.getString("GroupName")%>">
							<%= rs2.getString("GroupName")%>
						</option>
						<% } %>

					</select>

					<td><input type="file" name="file" id="file" /></td>
				</tr>
				<tr>
					<td colspan="2">FileName: <input type="text" name="FileName"><br>




						<input type="hidden" name="UserID" value="<%=username%>">
						<input class="btn" type="submit" value="Upload" name="upload"
						id="upload" />
					</td>
				</tr>
			</table>
		</form>



	</center>
</body>
</html>