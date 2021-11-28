<%-- 
    Document   : BatchReport
    Created on : 6 Oct, 2017, 11:51:23 AM
    Author     : sameer
--%>

<%@page import="com.pict.dao.GetAssignment"%>
<%@page import="com.pict.dao.BatchRecordDao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Total Batch Report</title>
        
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
        <center><h2>Batch Report</h2></center>
    <br><br><hr><br><br>
        <%
            String username = (String) session.getAttribute("username");
            String grpname = request.getParameter("grpname");
        %>
        <form action="Assign.jsp" method="POST">
            <input type="hidden" name="grpname" value="<%=grpname%>">
            <input class="btn" type="submit" value ="Back">

        </form>
      
            <center> <input class="btn" type="submit" value="Download PDF" name="download" onclick="window.print()" /> </center> 
    
            
            <br><br>
        <%

            GetAssignment ga = new GetAssignment();
            int num = ga.assignmentCount(username, grpname);
            System.out.println("number is " + num);
            String tableName[] = new String[num];
            int count[]=new int[20];
            int total[]=new int[20];
            ga.assignmentList(username, grpname, tableName,count,total);

            int report1[][] = new int[22][num];

            int i = 0;

            BatchRecordDao brd = new BatchRecordDao();
            int roll[] = new int[2];

            brd.StudRollNo(username, grpname, roll);
            brd.report(username, grpname, report1);
        %>
        <table>
            <th>Roll Number</th>    
                <%
                    while (i < num) {
                        String[] parts = tableName[i].split("(?<=A)");
                %> 
            <th>Assignment <%out.println(parts[1]);%></th>
                <% i++;
                    }

                    int j = 0;
                    while (roll[0] < roll[1]) {
                        int k = 0;
                      //  System.out.println("k is " + k);

                %>
            <tr><td><%=roll[0]%></td>
                <%
                    i = 0;
                    
                    while (i < num) {
                %>
                <td><%=report1[j][k]%></td><%
                        k++;
                        System.out.println("k is " + k);
                        i++;
                    }
                %></tr><%
                          j++;
                          System.out.println("j is "+j);
                          roll[0]++;

                      }
                %>
        </table>


      
    </body>
</html>