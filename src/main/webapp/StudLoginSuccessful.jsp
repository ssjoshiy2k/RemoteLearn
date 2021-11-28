
<%@page import="com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream"%>
<%@page import="jdk.internal.misc.FileSystemOption"%>
<%@page import="com.pict.dao.StudentInfo"%>
<%@page import="com.pict.controller.Logout"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>StudLoginSuccess</title>

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
}

@
keyframes click-wave { 0% {
	height: 40px;
	width: 40px;
	opacity: 0.35;
	position: relative;
}

100
%
{
height
:
200px;
width
:
200px;
margin-left
:
-80px;
margin-top
:
-80px;
opacity
:
0;
}
}
.option-input {
	-webkit-appearance: none;
	-moz-appearance: none;
	-ms-appearance: none;
	-o-appearance: none;
	appearance: none;
	position: relative;
	top: 13.33333px;
	right: 0;
	bottom: 0;
	left: 0;
	height: 30px;
	width: 30px;
	transition: all 0.15s ease-out 0s;
	background: #cbd1d8;
	border: none;
	color: #fff;
	cursor: pointer;
	display: inline-block;
	margin-right: 0.5rem;
	outline: none;
	position: relative;
}

.option-input:hover {
	background: #9faab7;
}

.option-input:checked {
	background: #269cc6;
}

.option-input:checked::before {
	height: 30px;
	width: 30px;
	position: absolute;
	content: '✔';
	display: inline-block;
	font-size: 18.88888px;
	text-align: center;
	line-height: 30px;
}

.option-input:checked::after {
	-webkit-animation: click-wave 0.65s;
	-moz-animation: click-wave 0.65s;
	animation: click-wave 0.65s;
	background: #269cc6;
	content: '';
	display: block;
	position: relative;
}

.option-input.radio {
	border-radius: 50%;
}

.option-input.radio::after {
	border-radius: 50%;
}
</style>

</head>
<%
        String username = (String)session.getAttribute("username");
        int count=0,check_count=0;
        
        System.out.println("StudLoginSuccessful : username - "+username);
        
        StudentInfo sInfo=new StudentInfo();
       
        ResultSet rs2=(ResultSet)sInfo.getSubject(username);
        
     
    %>
<body style="background: #ddebff; color: #000;">
	<center>

		<center>
			<h2>
				Welcome
				<%out.println(username);%>
			</h2>
		</center>
		<br>
		<br>
		<hr>
		<br>
		<br>


		<form action="StudentGetAsg.jsp" method="get">
			<table cellpadding="10px" cellspacing="20px" border="0px"
				style="border: 1px solid #000">
				<%
             while(rs2.next()){
                 count++;
                 String subname = rs2.getString("SubjectName");
                 System.out.println("Sub_name:"+subname);
            %>

				<tr>
					<td>
						<button class="btn" name="subj" value="<%=subname%>">
							<%out.println(subname);%>
						</button>
					</td>
					<td><input class="option-input checkbox" type="checkbox"
						name="<%=subname%>" disabled
						<%
                        int Approved = sInfo.getApproved(subname, username);
                        if(Approved == 1){
                            check_count++;
                            out.println("checked");
                        }
                        System.out.println("Yezs!");
             
                        
                   %>>
					</td>
				</tr>

				<% } %>
			</table>


			<br> Submission Ticket: <input type="checkbox"
				class="option-input checkbox" name="SubmissionTicket"
				value="subticket"
				<%if(count == check_count){out.println("checked");}%> disabled>
			<input type="hidden" name="userid" value="<%=username%>">
		</form>
	</center>

	<br>
	<br>


	<form action="Logout" method="get">
		<input style="position: absolute; right: 100px; top: 60px;"
			class="btn" type="submit" value="Logout">
	</form>
</body>
</html>