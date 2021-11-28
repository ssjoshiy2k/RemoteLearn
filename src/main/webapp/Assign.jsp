
<%@page import="com.pict.dao.LoginDao"%>
<%@page import="com.pict.dao.GetAssignment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <style>
         .card {
        background: #fff;
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
        transition: 0.3s;
        width: 16%;
        display: inline-block;
        margin: 10px;
        float :left;
        top: 20%;
        left : 10%;
        border: 3px solid #0f1b2c;
        color:#000;
   
        
        }

        .card:hover {
        box-shadow: 0 8px 16px 0 rgba(0,0,0,0.8);
        }

        .container {
            font-size: 2.0 rem;
        padding: 2px 16px;
        }
        
        
        
.butto {
  box-sizing: border-box;
  appearance: button;
  background-color: #269cc6;
  border: 2px solid #269cc6;
  color: #fff;
  cursor: pointer;
  display: flex;
  text-align: center;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1;
  padding: 1em 0.4em;
  text-decoration: none;
  text-align: center;
  font-family: 'Montserrat', sans-serif;
  width:100%;
  height:100%;
  padding: 10px 30px;

}







       
.butto1{
  box-sizing: border-box;
  appearance: button;
  background-color: #269cc6;
  border: 2px solid #269cc6;
  color: #fff;
  cursor: pointer;
  display: flex;
  text-align: center;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1;
  padding: 1em 0.4em;
  text-decoration: none;
  text-align: center;
  font-family: 'Montserrat', sans-serif;
  padding: 10px 30px;

}




.butto1:hover {
  box-sizing: border-box;
  appearance: button;
  background-color: #555555;
  border: 2px solid #555555;
  color: #fff;
  cursor: pointer;
  display: flex;
  text-align: center;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1;
  padding: 1em 0.4em;
  text-decoration: none;
  text-align: center;
  font-family: 'Montserrat', sans-serif;
  padding: 10px 30px;

}


        
        
        
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assignments</title>
         <script type="text/javascript" src="js/jquery.min.js"></script>
        <script src="js/jquery.min.js"></script>

        <link rel="stylesheet" href="jquery-ui.css">
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/angular.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <link rel="stylesheet" href="js/jquery-ui.css">

    </head>
    <body style="background:#ddebff; color:#fff;">
        <script>
            function create() {
                document.getElementById("AssignNumber").style.display = "block";
            }
            function assigncreate() {
                document.getElementById("creat").style.display = "none";

            }
                $(function () {
                $(".datepicker").datepicker({dateFormat: 'dd-mm-yy'});
            });



        </script>
        <%
             String username = (String) session.getAttribute("username");
            String grpname = request.getParameter("grpname");
            System.out.println("uasrnamei is ..."+username);
            System.out.println("groupname is ..."+grpname);
            int assignCount=0;
            LoginDao dao=new LoginDao();
            assignCount=dao.AssignCount(username, grpname);
            
           
            
        %>    

        <%
         if(username==null || grpname==null){
                response.sendRedirect("Login.jsp");
            }
           
        
        %> 

        
        
    <center>
        
        
  
        
        <br> <br><br> <br><br> <br>
       

        <%
           
            
            System.out.println(username);
            System.out.println(grpname);

            GetAssignment ga = new GetAssignment();
            int num = ga.assignmentCount(username, grpname);
            System.out.println(num);
            String tableName[] = new String[num];
           //introduce these two arrays 
            int count[]=new int[20];
            int total[]=new int[20];
            ga.assignmentList(username, grpname, tableName,count,total);
            //replace till here from line 211
            
            int i = 0;
        %><form action="ThirdPage.jsp" method="get"><%
                while (i < num) {
                    String[] parts = tableName[i].split("(?<=A)");
            %> 
             <div class="card">
                
                    <button name="val" class="butto" value="<%out.println(parts[1]);%> ">Assignment <%out.println(parts[1]);%></button>&nbsp;<br><br> 
                    <div class="container">
                        <!-- Replace the line below ie line number 226 -->
                        <h6><%=count[i]%> of <%=total[i]%> students Approved</h6>
                     </div>
            </div>
            <%
                    i++;
                }
            %>
            <input type="hidden" name="username" value="<%out.println(username);%>">

            <input type="hidden" name="grpname" value="<%out.println(grpname);%>">

        </form>
        <br>
        <br>
        <br>
       
    </center>
    
    
    <table>
    <th>
    <form action="TermWork.jsp" method="get">
        <input type="hidden" name="grpname" value="<%=grpname%>">
        
        <input type="hidden" name="username" value="<%=username%>">
        <button class="butto1" style="position:fixed;left:3%;bottom:3%">Calculate TermWork</button>
   
    </form>
    </th>
    <th>
    <form method="get" action="BatchReport.jsp">
    
        <button class="butto1" style="position: fixed; bottom: 3%;right: 43%;">Get Batch Report</button>
        <input type="hidden" name="grpname" value="<%=grpname%>">
        </form>
    </th>
    <th >
    <form action="SubmissionTicket.jsp" method="get">
            <button class="butto1" style="position: fixed; bottom: 3%;right: 3%;">
                Generate Submission Ticket
            </button>
     <p style="position: fixed; top:5%;right: 5%; color:#000;">
            Total number of Assignments: <%=assignCount%> </p>
     <input type="hidden" name="acount" value="<%=assignCount%>">
     <input type="hidden" name="grpname" value="<%=grpname%>">
    
    </form>
    </th>


</table>
    
</body>
</html>