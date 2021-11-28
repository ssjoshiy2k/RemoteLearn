
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.pict.dao.GetStudent"%>
<%@page import="java.util.Date"%>
<%@page import="com.pict.dao.Records"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Records..</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<!-- load jQuery UI CSS theme -->
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<link href="egkepq.css">
<link href="style.css">


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
	background: #269cc6;
	content: '';
	display: block;
	position: relative;
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




<script language="javascript">
		var str; 
                var ta = document.getElementById('totala');
		function f() {
		var dataTable = document.getElementById('data-table');
		var checkItAll = dataTable.querySelector('input[name="select_all"]');
		var inputs = dataTable.querySelectorAll('tr>td>input');
		inputs.forEach(function(input) {
		input.checked = true;
		});  
		}
	  
		function uf() {
		var dataTable = document.getElementById('data-table');
		var checkItAll = dataTable.querySelector('input[name="select_all"]');
		var inputs = dataTable.querySelectorAll('tr>td>input');
		inputs.forEach(function(input) {
		input.checked = false;
		});  
		}
		
	       
	      
	       
        $(function() {
        $( ".datepicker" ).datepicker({ dateFormat: 'dd-mm-yy', minDate: 0 });
        });
	  
		   function set() {
		var text="";
		var dataTable = document.getElementById('data-table');
		var checkItAll = dataTable.querySelector('input[name="check_arr"]');
		var inputs = dataTable.querySelectorAll('tr>td>input[name="check_arr"]');
		inputs.forEach(function(input) {
		if(input.checked === true) text+="1";
		else text+="0";
		});

		var input = document.getElementById("set");
		input.value = text;
	      //  window.alert(text);
		}
	  
		

		$.fn.MessageBox = function() {
		     set();
		    
		jQuery.fn.pop = [].pop;
		jQuery.fn.shift = [].shift;
		var $TABLE = $('#table');
		var $rows = $TABLE.find('tr:not(:hidden)');
		var headers = [];
		var data = [];
		$($rows.shift()).find('th:not(:empty)').each(function () {
		headers.push($(this).text());
		});
	       
		$rows.each(function () {
		var $td = $(this).find('td');
		var h = {};
		headers.forEach(function (header, i) {
		h[header] = $td.eq(i).text();   
		});
	    
		data.push(h);
		
		  set();
	   });
             var table = $("table");
var mks;
var flag = true;
                var ta = document.getElementById('xyz');
               // alert(ta.value);
var counter= parseInt(ta.value,10);
//alert(counter);
var iii=0;

    table.find('tr:gt(0)').each(function (i) {

                iii++;
        if( iii > counter) return false;

        var $tds = $(this).find('td');
            mks = $tds.eq(3).text();
            rrr = $tds.eq(0).text();
          //  alert(rrr);
          if(  0 > parseInt(mks) || 10 < parseInt(mks) || isNaN(parseInt(mks))) {
         alert ('Enter  valid marks for  ' +  rrr);
        
         
         flag = false;
         return false;
     }
    });
    
      if( !flag) {return false;
          
      }

	   
	    var ii= JSON.stringify(data);
	       
		var input;
		
		set();
		
		var AssignmentName = JSON.stringify(data, ["Assignment Name"]);
		input = document.getElementById("assname1");
		input.value = AssignmentName;
	 
		
		
		var Marks = JSON.stringify(data, ["Marks"]);
		input = document.getElementById("marks");
		input.value = Marks;
		
		
	       var ScheduledDate = $("#data-table").find('input[name="sch2"]').serializeArray();
	       var c = JSON.stringify(ScheduledDate);
		input = document.getElementById("schstr");
		input.value = c;
	       
	       
	       var SubmissionDate = $("#data-table").find('input[name="sub2"]').serializeArray();
	       var c = JSON.stringify(SubmissionDate);
		input = document.getElementById("substr");
		input.value = c;
		
		
	};

		</script>
</head>

<body style="background: #ddebff; color: #000;">

	<%   
		    String username=(String)session.getAttribute("username");
		int rollNo=Integer.parseInt(request.getParameter("studRollNo"));
                
		
		session.setAttribute("rn",rollNo);
		String rn = request.getParameter("studRollNo");
		String studRecord[][]=new String[20][6];
		GetStudent gs=new GetStudent();
		String gname = gs.getgrpname(rollNo);
		int GroupCode = gs.getgrpcode(gname);
		int SubjectCode = gs.getsubcode(username,GroupCode);
		String subname=gs.getsubname(SubjectCode);
                session.setAttribute("gc",GroupCode);
		session.setAttribute("sc",SubjectCode);
		DateFormat dateFormat = new SimpleDateFormat("dd/mm/yyyy");
		Date date = new Date();
		
		int number=gs.StudentRecord(username, rollNo, studRecord);
		int i=0;
		%>

	<h3>
		<%out.println("Subject : "+subname);%>
	</h3>

	<center>
		<h2>
			<%out.println("Roll No. : "+rollNo);%>
		</h2>
	</center>
	<input type="hidden" name="totala" id="xyz" value="<%=number%>" />
	<br>
	<hr>
	<form action="NewStudentRecordDisplay" method="POST">
		<div id="table">
			<table class="table" id="data-table" cellpadding="10px"
				cellspacing="20px" style="border: 1px solid #000">
				<tr>
					<th>Assignment Name</th>
					<th>Scheduled Date</th>
					<th>Submission Date</th>
					<th>Marks</th>
					<th>Approved</th>
				</tr>
				<% for (i = 0; i < number; i++) {%>
				<tr>
					<td id="assname">
						<%out.println(studRecord[i][0]);%>
					</td>
					<td contenteditable="true"><input class="datepicker"
						name="sch2" value="<%out.println(studRecord[i][1]);%>"></td>
					<td contenteditable="true"><input class="datepicker"
						name="sub2" value="<%out.println(studRecord[i][2]);%>"></td>
					<td contenteditable="true"><%=studRecord[i][3] %></td>
					<%
		            if (studRecord[i][4].equals("1")) {
		        %><td><input type="checkbox"
						class="option-input checkbox" name="check_arr"
						value="<%out.println(studRecord[i][0]);%> " checked><br>
					<br></td>
					<% } else { %>
					<td><input type="checkbox" class="option-input checkbox"
						name="check_arr" value="<%out.println(studRecord[i][0]);%>"><br>
					<br></td>
					<%  } %>
				</tr>
				<% }
		        %>
			</table>
		</div>

		<input type="hidden" name="rollno" id="rollno" value="<%=rn%>;" /> <input
			type="hidden" name="set" id="set" /> <input type="hidden"
			name="sub1" id="substr" /> <input type="hidden" name="sch1"
			id="schstr" /> <input type="hidden" name="marks" id="marks" /> <input
			type="hidden" name="assname" id="assname1" /> <input type="hidden"
			name="grpcode" id="grpcode" value="<%=GroupCode%>;" /> <input
			type="hidden" name="subcode" id="subcode" value="<%=SubjectCode%>;" />
		<input type="hidden" name="gname" id="gname" value="<%=gname%>;" /> <input
			type="submit" style="width: 20%" class="btn"
			onClick=" return $(this).MessageBox();" value="submit">

	</form>
</body>
</html>