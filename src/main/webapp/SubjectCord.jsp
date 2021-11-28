
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.pict.dao.SubjectAllotment"%>
<%@page import="com.pict.dao.SubjectCord"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="style.css" type="text/css" media="screen">
    
    <script>



        
$(document).ready(function() {
 
    $("#add").click(function() {
      $('#data-table tbody>tr.row:last').clone(true).insertAfter('#data-table tbody>tr.row:last');
      return false;
    });
    



    
    $("#call").click(function() {
  //  alert("popup");
    var subject = "[";
    var teacher = "[";
   
    
$("tr.row").each(function() {
    var q1 = $(this).find("select.subject").val();
    var q2 = $(this).find("select.teacher").val();
    
    subject+="{\"subject\" : ";
    subject+= "\"" + q1 + "\"";
    subject+="},";
    
    teacher+="{\"teacher\" : ";
    teacher+= "\"" + q2 + "\"";
    teacher+="},";
  
 
  
});
subject = subject.substring(0, subject.length - 1);
teacher = teacher.substring(0, teacher.length - 1);


subject+="]";
teacher+="]";


    //  alert(subject); 
    //  alert(teacher); 
   
      
      var input;
               input = document.getElementById("subject");
        input.value = subject;
        
         input = document.getElementById("teacher");
        input.value = teacher;
        
});
});

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
    <body style="background:#ddebff; color:#000;" ><center>
        <div style="background:#0f1b2c; color: #fff;"><br><h1>Subject Coordinator</h1><br><hr></div><br>
        
         <%   
  
            ResultSet rs,rs3 = null;
        
             SubjectCord ry = new SubjectCord ();
        //   rs = rc.giveresult();
          rs3 = ry.giveresult();
          rs = ry.giveresult();
        //   rs = rc.giveresult();
           String subject,name;
           
        %>
        <% if(true) {  %>   
        <form action="DeleteCoord" method="POST">
        <div>
        <table cellpadding="10px" cellspacing="20px" border="0px" style="border : 1px solid #000">
            
       <th>Teacher Name</th>
        <th>Subject</th>
        

        <% while(rs3.next() && rs.next()) {  
            
       // subject = rc.subjectname(rs.getInt("SubjectCode"));
         name = ry.name(rs3.getString("UserID"));
         subject = ry.subname(rs.getInt("SubjectCode"));
        
        %>
        <tr>   
<td><%= name %></td>
  <td><%= subject %></td>          
  <td><button class="btn" name="username" value="<%=rs3.getString("UserID")%>">Remove Coordinator</button></td>         

        </tr>
        <% } %>
        </table>
        </div>  
        </form>
        <% } %>
     
       
        
        
        <%
            SubjectAllotment sa=new SubjectAllotment();
           
            int n = sa.totalsub();
        %>
        <br>
        <form action="SubjectCord" method="POST">
   <table id="data-table" align="center" class="bordered" cellpadding="10px" cellspacing="20px" border="0px" style="border : 1px solid #000">
<thead>
    <tr><th>Teacher Name</th>
    <th>Subject</th></tr>
    
</thead>
<tbody>
     <% while ( n > 0) {   ResultSet rs1=sa.getTeachers();
            ResultSet rs2=sa.getSubject(); %>
     <tr class="row">
          
     
          <td><select class="teacher">
        <%  while(true){ if( !rs1.next()) break; %>
            <option class="btn" value="<%= rs1.getString("UserName")%>" > <%= rs1.getString("UserName")%> </option>
        <% } %>
        </select>
          </td>
          <td><select class="subject">
        <%  while(true){ if( !rs2.next()) break; %>
            <option class="btn" value="<%= rs2.getString("SubjectName")%>" > <%= rs2.getString("SubjectName")%> </option>
        <% } %>
        </select>
          </td>
  
       </tr>
   <% n--; }%>
</tbody>
   </table>

   <input type="hidden" name="subject" id="subject" /> 
         <input type="hidden" name="teacher" id="teacher" />

        <input class="btn" type="submit" id="call" value="submit">

        </form>
    </center>
    </body>
</html>