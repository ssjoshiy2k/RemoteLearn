<%-- 
    Document   : TermWork
    Created on : 26 Sep, 2017, 12:38:53 PM
    Author     : sameer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="com.pict.dao.*"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Term Work</title>
        
        
        
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

td{
  padding: 15px;
  text-align: left;
  vertical-align:middle;
  font-weight: 300;
  font-size: 18px;
  color: #000;
  border-bottom: solid 1px rgba(0,0,0,1);
}
        
        
        
    </style>
        
        
    </head>
    <body style="background:#ddebff; color:#000;">
    <center>
        <h2>Student Term Work</h2>
    </center>

    <%
        CalculateTermWork ctw = new CalculateTermWork();
        String username = request.getParameter("username");
        String groupname = request.getParameter("grpname");

        ResultSet rs = ctw.termWork(username, groupname);


    %>

     <form action="Assign.jsp" method="POST">
        
            <input type="hidden" name="grpname" value="<%=groupname%>">
            <input type="submit" class="btn2"  value="BACK">
        
        </form>
            <hr>
    <table  id="data-table" cellpadding="10px" cellspacing="20px" style="border : 1px solid #000">
        <tr>
            <th>Roll No</th>
            
            <th>Term Work /25</th>
            <th>Term Work /50</th>


        </tr>

        <% while (rs.next()) {%>
        <tr>   
            <td ><%=rs.getInt("Rollno")%></td>
            <td ><%=rs.getInt("OutOf25")%></td>
            <td ><%=rs.getInt("OutOf50")%></td>


            <% }
            %></tr>
            
    </table>




</body>
</html>