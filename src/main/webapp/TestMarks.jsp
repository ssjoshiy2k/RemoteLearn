
<%@page import="com.pict.dao.GetUnitTestInfo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.pict.dao.GetStudent"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Records..</title>


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


<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="js/jquery.min.js"></script>

<link rel="stylesheet" href="js/jquery-ui.css">
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/angular.min.js"></script>
<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" href="js/jquery-ui.css">

<script>
      $.fn.MessageBox = function() {

           // window.alert("call"); 
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
       //  var ii= JSON.stringify(data);
       // window.alert(ii);
       
   });


    var table = $("table");
    var mks;    var flag = true;
    table.find('tr:gt(0)').each(function (i) {
        var $tds = $(this).find('td');
            mks = $tds.eq(1).text();
            rrr = $tds.eq(0).text();
          //  alert(rrr);
          if(  0 > parseInt(mks) || 31 < parseInt(mks) || isNaN(parseInt(mks))) {
         alert ('Enter valid marks for Roll no. for UT1 ' +  rrr);
         flag = false;
            return false;
     }
    });
    
    
    if( !flag ) {
      return false;
  }
    
    var mk; 

    var flag1 = true;

    table.find('tr:gt(0)').each(function (i) {
        var $tds = $(this).find('td');
            mk = $tds.eq(2).text();
            rrr = $tds.eq(0).text();
          //  alert(rrr);
          if(  0 > parseInt(mk) || 31 < parseInt(mk) || isNaN(parseInt(mk))) {
         alert ('Enter valid marks for Roll no. for UT 2 ' +  rrr);
         flag1=false;
            return false;
         }
    });
    
    if( !flag1 ) {
      return false;
  }
        
        var Rollno = JSON.stringify(data, ["Roll No"]);
        input = document.getElementById("rn");
        input.value = Rollno;
       //  window.alert("Roll no = " + Rollno);
   
        var Marks1 = JSON.stringify(data, ["Unit Test 1"]);
        input = document.getElementById("marks1");
        input.value = Marks1;
       //window.alert("marks = " + Marks1);  
       
        var Marks2 = JSON.stringify(data, ["Unit Test 2"]);
        input = document.getElementById("marks2");
        input.value = Marks2;
       //window.alert("marks = " + Marks2);  
      
};

    
            </script>



<body style="background: #ddebff; color: #000;">
	<%
          String subname = request.getParameter("subjectName");
           
          String uname = (String)session.getAttribute("username");
          
          
          GetUnitTestInfo dao = new GetUnitTestInfo();
          int subcode = dao.getSubCode(subname);
          ResultSet rs   = dao.getTable(subcode,uname);
          
         
         session.setAttribute("subcode", subcode);
         
        %>
	<%
        if(uname==null || subname==null){
                response.sendRedirect("Login.jsp");
            }
         
        String FrontFinal="Unit Test Marks  :  "+subname;
        
        
        %>


	<center>
		<h2>
			<% out.println(FrontFinal);%>
		</h2>
	</center>
	<br>
	<br>
	<hr>
	<br>
	<br>

	<form action="SetMarksOfStudent" method="POST">
		<div id="table">
			<table class="table" id="data-table" cellpadding="10px"
				cellspacing="20px" style="border: 1px solid #000">
				<tr>
					<th>Roll No</th>
					<th>Unit Test 1</th>
					<th>Unit Test 2</th>

				</tr>

				<% while(rs.next()) {%>
				<tr>
					<td id="rollno"><%= rs.getInt("RollNo")%></td>
					<td contenteditable="true" id="ma"><%= rs.getInt("UT1")%></td>
					<td contenteditable="true" id="ma"><%= rs.getInt("UT2")%></td>

				</tr>
				<% }
          %>
			</table>
		</div>


		<input type="hidden" name="rollno" id="rn" /> <input type="hidden"
			name="marks1" id="marks1" /> <input type="hidden" name="marks2"
			id="marks2"> <input type="submit" class="btn"
			style="width: 15%" onClick=" return $(this).MessageBox();"
			value="submit">

	</form>

</body>
</html>