
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.pict.dao.ConnectDatabase"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.lang.reflect.Method"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.pict.dao.MakeString"%>
<%@page import="com.pict.dao.GetAssignment"%>
<%@page import="com.pict.dao.LoginDao"%>
<%@page import="com.pict.dao.GetAssignment"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome</title>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<!-- load jQuery UI CSS theme -->
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">

<script>

        function show1() {

            document.getElementById('box').style.display = 'block';
        }
        function show2() {
            document.getElementById('dropdown').style.display = 'block';
        }
        function getrollno() {
            document.getElementById('student').style.display = 'none';
            document.getElementById('getnum').style.display = 'block';
        }
        function create() {
            document.getElementById("AssignNumber").style.display = "block";
        }
        function assigncreate() {
            document.getElementById("creat").style.display = "none";

        }
        $(function () {
            $(".datepicker").datepicker({dateFormat: 'dd-mm-yy' ,minDate: 0 });
        });

        function change() {
            document.getElementById("pass").style.display = "none";
            document.getElementById("newpass").style.display = "block";

        }
        function delet() {
            document.getElementById("delet").style.display = "none";
            document.getElementById("assignno").style.display = "block";
        }
      function isOneChecked1() {
            // All <input> tags...
            var chx = document.getElementsByTagName('input');
            for (var i=0; i<chx.length; i++) {
    // If you have more than one radio group, also check the name attribute
    // for the one you want as in && chx[i].name == 'choose'
    // Return true from the function on first match of a checked item
                if (chx[i].type == 'radio' && chx[i].checked) {
                    return true;
                    } 
                }
  // End of the loop, return false
                alert("Please select any batch ..");
            return false;
        }
        
        function isOneChecked2() {
            // All <input> tags...
            var chx = document.getElementsByTagName('input');
            for (var i=0; i<chx.length; i++) {
    // If you have more than one radio group, also check the name attribute
    // for the one you want as in && chx[i].name == 'choose'
    // Return true from the function on first match of a checked item
                if (chx[i].type == 'radio' && chx[i].checked) {
                    return true;
                    } 
                }
  // End of the loop, return false
                alert("Please select any subject ..");
            return false;
        }
        
        function isRollWritten(){
            
            var x = document.forms["meechTo"]["studRollNo"].value;
                 if (x == "") {
                        alert("Roll No must be filled out");
                        return false;
                    }
                    
                    return true;
            
        }
        
        function rollWrittenProperly(){
            
            var x = document.forms["meechTo"]["studRollNo"].value;
            
                   if (isNaN(x) || x < 3001 || x > 3999) {
                        alert("rollmust be proper");
                        return false;
                        } /*else {
                         return true;
                        }*/
            }

        $(function () {
            $(".datepicker").datepicker({dateFormat: 'dd-mm-yy', minDate: 0});
        });



    
    </script>
<style>
* {
	font-family: 'Roboto', sans-serif;
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


200px
;


width


:


200px
;


margin-left


:


-80px
;


margin-top


:


-80px
;


opacity


:


0
;


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

.btn2 {
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

.btn2:hover {
	box-sizing: border-box;
	appearance: button;
	background-color: #ff5555;
	border: 2px solid #ff5555;
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
</style>










</head>
<body style="background: #0f1b2c; color: #fff;">
	<div style="display: inline-block">
		<img src="js/default-profile-photo-300x300.jpg"
			style="float: left; width: 45px; height: 45px; margin: 5px">
		<h4>Welcome ${username}</h4>
	</div>
	<br>
	<hr>
	<h3>Laboratories</h3>

	<center>

		<%
		MakeString ms = new MakeString();

		String teacher;
		teacher = (String) session.getAttribute("username");
		System.out.println("uwe  is " + teacher);
		%>
		<br> <br>



	</center>
	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

	if (session.getAttribute("username") == null) {
		response.sendRedirect("Login.jsp");
	} else {
		/*if(request.getParameter("success").equals("1")){
		 out.println("Response Recorded");
		 }*/
		int i = 0;
		int count = 0;
		String arr[];

		count = ms.getCount(teacher);
		arr = new String[count];
		arr = ms.makestring(teacher);
		i = 0;
		String grpname_create = null;
	%>

	<form id="myform" method="get" action="Assign.jsp" target="frame1"
		onsubmit="return isOneChecked1()">
		<br>
		<%
		while (i < count) {
			String temp = arr[i];
		%>
		<input type="radio" class="option-input radio" name="grpname"
			value="<%=arr[i]%>">
		<%
		out.println(temp);
		%>

		<br> <br>
		<%
		i++;
		}
		}
		%>
		<input type="submit" class="btn first" value="Get Assignments"
			id='ajaxcall'>
	</form>


	<%
	//new code added (arsh)
	int subjectcode = 0;
	String sc_query = "select SubjectCode from SubjectCoordinator where UserID = '" + teacher + "'";
	Statement stmt = null;
	Connection conn = null;
	ConnectDatabase cd = new ConnectDatabase();
	conn = cd.getConnection();
	stmt = conn.createStatement();
	ResultSet rs_sc = stmt.executeQuery(sc_query);
	if (rs_sc.next()) {
		subjectcode = rs_sc.getInt("SubjectCode");
	}
	System.out.println("Subjectcode passed in LoginSuccessful is:" + subjectcode);
	//new code ends here

	LoginDao dao = new LoginDao();
	int assignCount = dao.AssignCount2(teacher, subjectcode);
	//int assignCount =10;
	GetAssignment ga = new GetAssignment();
	if (ga.isCoordinator(teacher)) {
		int i = 0;
	%>

	<div id="creat">
		<button onclick="create()" class="btn">Create Assignment</button>
	</div>
	
	<form action="totadao" method="get">
		<p>
			Total number of Assignments: <input type="text" name="acount"
				value=<%=assignCount%> /> <input type="hidden" value="<%=teacher%>"
				name="username"> <input type="submit" class="btn"
				value="Save">
	</form>

	<form action="AssignCreate" method="get">
		<div id="AssignNumber" style="display: none">


			Create Assignment Number ? <select onclick="assigncreate()"
				id="selectNumber" class="btn" name="AssignNumber">
				<%
				for (i = 1; i <= assignCount; i++) {
					if (ga.dropcheck(i, subjectcode) == 0) {
				%>
				<option value="<%out.println(i);%>" onclick="validate()" class="btn">Assignment
					<%
				out.println(i);
				%>
				</option>
				<%
				}
				}
				%>

			</select> <br> Enter the Scheduled Date for Assignment <input
				class="datepicker" name="sdate"> <input type="hidden"
				name="username" value="<%out.println(teacher);%>"> <input
				type="submit" class="btn" value="Create.">
		</div>
	</form>

	<div id="delet">
		<button onclick="delet()" class="btn">Delete Assignment</button>
	</div>
	<form action="DeleteAssign" method="get">

		<div id="assignno" style="display: none">
			Delete Assignment Number ? <select id="selectNumber"
				name="AssignNumber" class="btn">
				<%
				for (i = 1; i <= assignCount; i++) {
					if (ga.dropcheck(i, subjectcode) != 0) {
				%>
				<option value="<%out.println(i);%>" class="btn" onclick="validate()">Assignment
					<%
				out.println(i);
				%>
				</option>
				<%
				}
				}
				%>

			</select> <input type="submit" class="btn" value="Delete Assignment">
			<br> <input type="hidden" name="username"
				value="<%out.println(teacher);%>">

		</div>
	</form>




	<%
	}
	%>




	<br>
	<hr>






	<br>
	<br>
	<br>

	<h3>Unit Test</h3>
	<%
	// LoginDao dao = new LoginDao();
	int num = dao.showClass((String) session.getAttribute("username"));
	String classes[] = new String[num];
	dao.showClass((String) session.getAttribute("username"), classes);
	System.out.println("The Number of Subject is " + num);
	%>
	<form action="TestMarks.jsp" target="frame1" method="get"
		onsubmit="return isOneChecked2()">
		<%
		for (int i = 0; i < num; i++) {
		%>
		<input type="radio" class="option-input radio" name="subjectName"
			value="<%=classes[i]%>"><%=classes[i]%>
		<br> <br>
		<%
		}
		%>
		<%
		if (num != 0) {
		%>
		<input type="submit" value="Enter Unit Test Marks" class="btn">
		<%
		}
		%>
	</form>


	<br>
	<br>
	<br>

	<button id="student" onclick="getrollno()" class="btn">Search
		Student</button>
	<br>


	<form name="meechTo" id="getnum" action="StudentRecord.jsp"
		target="frame1" onsubmit="return isRollWritten() "
		style="display: none">

		<input type="text" style="width: 50%" name="studRollNo"> <br>
		<input type="submit" class="btn" value="Get Record"
			onclick="return rollWrittenProperly()"> <br>
	</form>





	<br>
	<div id="pass">

		<button class="btn" onclick="change()">Change PassWord</button>

	</div>
	<br>

	<form action="ChangePass" method="get">

		<div id="newpass" style="display: none">
			<input type="hidden" name="username" value="<%=teacher%>">
			Enter the old Password<input type="password" name="oldpass" value="">
			Enter the new Password<input type="password" name="newpass" value="">
			<input type="submit" class="btn" value="Change Password">
		</div>
	</form>

	<br>
	<br>

	<form action="FileUpload.jsp" method="get" target="frame1">

		<input type="submit" class="btn" value="Upload files">


	</form>


	<br>
	<br>
	<form action="Logout" method="get">
		<input type="submit" value="Logout" class="btn2">
	</form>



	<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>



</body>
</html>