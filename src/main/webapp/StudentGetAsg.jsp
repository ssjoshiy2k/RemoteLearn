<%@page import="com.pict.dao.FileDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>StudGetAsg</title>
    </head>
    <%
        int flag=0,sub_code=0;
        String subject = request.getParameter("subj");
        String userid = request.getParameter("userid");
        String stud_query1 = "select AssignmentName from AssignmentExist where SubjectCode=(select SubjectCode from SubjectTable where SubjectName='"+subject+"');";
       // String stud_query2 = "select AssignmentName from AssignmentExist where GroupName=(select GroupName from GroupTable where GroupCode=(select GroupID from GroupStart where StartRollNo <= 3026 and EndRollNo>=3026)) and UserID=(select UserID from UserInfo where SubjectCode=(select SubjectCode from SubjectTable where SubjectName='SL-1') and GroupCode=(select GroupID from GroupStart where StartRollNo <= 3026 and EndRollNo>=3026));
//";
        String ut_query = " select UT1,UT2 from UnitTest where RollNo = "+userid+" and SubjectCode = (select SubjectCode from SubjectTable where SubjectName = '"+subject+"');";
        String subject_query = "select SubjectCode from SubjectTable where SubjectName = '"+subject+"'";
        String stud_query2;
        System.out.println("65676565765");
        String filename[]=new String[10];
        int fileid[]=new int[10];;
        for(int i=0;i<10;i++){
            fileid[i]=-999;
        }
        
        System.out.println("////++==1");
        FileDao fd=new FileDao();
        fd.getFiles(userid,subject,filename,fileid);
        System.out.println("2");
        System.out.println(stud_query1);
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/remoteLearnDb","root","y2kk2y#68-");
        Statement stmt = conn.createStatement();
        Statement stmt2 = conn.createStatement();
        Statement ut_stmt = conn.createStatement();
        Statement subject_stmt = conn.createStatement();
        
        ResultSet sub_rs = subject_stmt.executeQuery(subject_query);
        if(sub_rs.next()){
            sub_code = Integer.parseInt(sub_rs.getString("SubjectCode").trim());
            System.out.println("Sub code:"+sub_code);
        }
    %>
    <body>
    <center>
        <h2><%out.println(subject);%></h2><br>
        <%
            ResultSet rs = stmt.executeQuery(stud_query1);
            
            
            
            String asg_name = null;
            out.println("Submitted Assignments:");
            out.print("<br>");
            while(rs.next()){
                flag = 1;
                asg_name = rs.getString("AssignmentName");
                stud_query2 = "select ScheduledDate,SubmissionDate ,Marks from "+asg_name+" where RollNo = "+userid+" and Approved =1;";
               System.out.println(stud_query2); ResultSet rs2 = stmt2.executeQuery(stud_query2);
                
               if(rs2.next())
                {%>
            <table class="table" id="data-table" cellpadding="10px" cellspacing="20px" style="border : 1px solid #000">
		    <tr>
		        <th>Assignment Name</th>
		        <th>Scheduled Date</th>
		        <th>Submission Date</th>
		        <th>Marks</th>
		        
		    </tr>   
		    <tr>
		       <td id="assname"><%out.println("Assignment" +asg_name);%></td>
                       <td ><%=rs2.getString("ScheduledDate")%></td>
		       <td ><%=rs2.getString("SubmissionDate")%></td>
                       <td ><%=rs2.getString("Marks") %></td>
		        </tr><% }
		        %>
		</table>
	<%	    
            }
            if(flag == 0){
                out.println("None");
            }
            ResultSet ut_rs = ut_stmt.executeQuery(ut_query);
            if(ut_rs.next()){
        %>     <table class="table" id="data-table" cellpadding="10px" cellspacing="20px" style="border : 1px solid #000">
            <tr>
                <th>Roll No</th>
                <th>Unit Test 1</th>
                <th>Unit Test 2</th>

            </tr>
            
            <tr>
               <td ><%= userid%></td>
               <td ><%= ut_rs.getString("UT1")%></td>
               <td ><%= ut_rs.getString("UT2")%></td>
            
            </tr>
          
        </table>
         <%
            }
           
        
            
        %>        
    </center>

    <form method="get" action="FileDownload" enctype="multipart/form-data">
        Click FileName to Download <br>  
        <%
                int i=0;
                System.out.println("aboooooooooooove");
                while(fileid[i]!=-999){
                    %>
                    <button  name="fileid" value="<%=fileid[i]%>"><%=filename[i]%></button>                    
        <%
              i++;  
                }
           
           
           %>
               </form> 


</body>
</html>
