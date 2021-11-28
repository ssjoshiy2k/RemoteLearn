<%-- 
    Document   : SubmissionTicket
    Created on : 28 Sep, 2017, 5:56:40 PM
    Author     : sameer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.pict.dao.SubmissionTicketDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Submission Tickets</title>
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
<body style="background: #ddebff; color: #000;">
	<center>
		<h2>Submission Ticket</h2>
	</center>
	<br>
	<br>
	<hr>
	<br>
	<br>
	<form action="Assign.jsp" method="POST">

		<input type="hidden" name="grpname"
			value="<%=request.getParameter("grpname")%>"> <input
			class="btn" type="submit" value="BACK">

	</form>
	<%
        int assignCount = 0;
        assignCount=Integer.parseInt(request.getParameter("acount").trim());
        SubmissionTicketDao std=new SubmissionTicketDao();
        
         ResultSet rs=std.getTicket((String)session.getAttribute("username"),request.getParameter("grpname"), assignCount);
        
        if(rs==null){
            
            %>First Create Specified Number Of Assignments then
	Submission Tickets will be Generated<%
        
        }
        else{
            %><h4>Submission Tickets</h4>

	<table cellpadding="10px" cellspacing="20px" border="0px"
		style="border: 1px solid #000">
		<th>Roll Number</th>
		<th>Approval</th>
		<%
            while(rs.next()){
        %>
		<tr>
			<td><%=rs.getString("RollNo")%></td>
			<%
                if(rs.getString("Approved").equals("1")){
                
                    %>
			<td><input class="option-input checkbox" type="checkbox" checked
				disabled></td>
			<%
                    
                }
                else{
                    %>
			<td><input type="checkbox" disabled></td>
			<%
                
                
                }
                
                %>
		</tr>





		<%
            }
        }
        %>

	</table>
</body>
</html>