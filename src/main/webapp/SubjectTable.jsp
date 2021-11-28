
<%@page import="com.pict.dao.GetStudent"%>
<%@page import="com.pict.dao.SubjectTable"%>
<%@page import="com.pict.dao.Records"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    
    <head>
            <link rel="stylesheet" href="style.css" type="text/css" media="screen">

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Records..</title>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script src="js/jquery.min.js"></script>
        <link rel="stylesheet" href="js/jquery-ui.css">
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/angular.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <link rel="stylesheet" href="js/jquery-ui.css">
<link rel="stylesheet" href="js/font-awesome.min.css">

        <style>

            input {
            background-color:transparent;
            border: 0px solid;
            }
            input:focus {
            outline:none;
            }
            
        </style>
        
        
    <script language="javascript">
        var str; 
        function displayResult()
        {
            document.getElementById("data-table").insertRow(-1).innerHTML = '<td contenteditable="true"></td>';
        }
        $.fn.MessageBox = function() {
          //  alert("called");
            
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
         
       
   });
      var ii= JSON.stringify(data);
     //   window.alert(ii);
        
        var input = document.getElementById("subjectname");
        input.value = ii;
};

        </script>
       <style>
            
td{
  padding: 15px;
  text-align: center;
  vertical-align:middle;
  font-weight: 300;
  font-size: 18px;
  color: #000;
  background-color: #fff;
 
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
  font-size: 1rem;
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
  font-size: 1rem;
  font-weight: 400;
  line-height: 1;
  margin: 5px;
  padding: 1em 0.4em;
  text-decoration: none;
  text-align: center;
  
}

    
        </style>        
    </head>
    
    <body style="background:#ddebff; color:#000;"><center>
        <div style="background:#0f1b2c; color: #fff;"><br><h1>Subject Table</h1><br><hr></div><br>
        <%   
  
            ResultSet rs,ry = null;
            SubjectTable rc = new SubjectTable();
           rs = rc.giveresult();
           ry = rc.giveresult();
        %>
        <% if(ry.next()) {  %>
         <form action="DeleteSubject" method="POST">
       
        <div>
        <table cellpadding="10px" cellspacing="20px" border="0px" style="border : 1px solid #000">
            <center><h3>Subject Entries</h3></center>
       
        <th>Sr no.</th>
        <th>Subject Name</th>

        <% while(rs.next()) {%>
        <tr>   
            <td><%=rs.getInt("SubjectCode") %></td>
             <td><%=rs.getString("SubjectName") %></td>
              <td><button name="subjectcode" value="<%=rs.getInt("SubjectCode") %>">Delete Subject</button></td>
       
        </tr>
        <% } %>
        </table>
        </div>  
        
         </form>
             <% } %>
        

        <br>
      <form action="SubjectTable" method="POST">
        <div id="table">
        <table class="table" id="data-table" cellpadding="10px" cellspacing="20px" border="0px" style="width : 300px; border : 1px solid #000">
       <center><h3>Add New Entry</h3></center>
        <th>SubjectName</th>
      <tr>
          <td contenteditable="true"></td>
           </tr>        
       
        </table>
        </div>
        
        <input type="hidden" name="subjectname" id="subjectname" /> 
        <button type="button" class="btn" onclick="displayResult()">Add More</button>            
        <input type="submit" class="btn" onClick=" $(this).MessageBox();" value="Submit">

      </form>
        </center>
   </body>   
</html>