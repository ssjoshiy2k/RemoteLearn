
<%@page import="com.pict.dao.GetStudent"%>
<%@page import="com.pict.dao.Records"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Records..</title>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<!-- load jQuery UI CSS theme -->
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
        <link href="egkepq.css">
        <link href="style.css">
        
        
        
              <style>
            
            
           
        
        
    *{font-family: 'Roboto', sans-serif;}

@keyframes click-wave {
  0% {
    height: 40px;
    width: 40px;
    opacity: 0.35;
    position: relative;
  }
  100% {
    height: 200px;
    width: 200px;
    margin-left: -80px;
    margin-top: -80px;
    opacity: 0;
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
  height:30px;
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
    
    
    

       
        
    <script language="javascript">
        var str; 

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
        var checkItAll = dataTable.querySelector('input[name="check"]');
        var inputs = dataTable.querySelectorAll('tr>td>input[name="check"]');
        inputs.forEach(function(input) {
        if(input.checked === true) text+="1";
        else text+="0";
        });

        var input = document.getElementById("set");
        input.value = text;
      //  window.alert(text);
        }
  
        

        $.fn.MessageBox = function() {
    //        alert("called");
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
        
       
       var marks_val = new Array();
       var iii=0;
        $rows.each(function () {
        var $td = $(this).find('td');
        var h = {};
        headers.forEach(function (header, i) {
        h[header] = $td.eq(i).text();   
        });
    
        data.push(h);
         var ii= JSON.stringify(data);
         
         
     //   window.alert(ii);
       
   });

var table = $("table");
var mks,rrr;
var flag = true;
var counter=0;
    table.find('tr:gt(0)').each(function () {
        var $tds = $(this).find('td');
        counter++;
        if( counter > 20) return false;
            mks = $tds.eq(5).text();
            rrr = $tds.eq(0).text();
       //    alert(mks + '  =  ' + rrr);
           var ma = parseInt(mks,10);
          if(  0 > ma || 10 < ma || isNaN(ma)) {
         alert ('Enter valid marks for Roll no. ' +  rrr + 'mrks : ' + ma);
         
         flag = false;
         //return false;
     }
    });
    
      if( !flag) {return false;   
      }
        var input;
        
        set();
     
        var Rollno = JSON.stringify(data, ["Roll No"]);
        input = document.getElementById("rollno");
        input.value = Rollno;
      //  window.alert("Roll no = " + Rollno);
        
   
        
        
        var GroupCode = JSON.stringify(data, ["GroupCode"]);
        input = document.getElementById("grpcode");
        input.value = GroupCode;     
       // window.alert("grpcode = " + GroupCode);
        
        
        var SubjectCode = JSON.stringify(data, ["SubjectCode"]);
        input = document.getElementById("subcode");
        input.value = SubjectCode;
     //   window.alert("subcode = " + SubjectCode);

        var Marks = JSON.stringify(data, ["Marks"]);
            
        input = document.getElementById("marks");
        input.value = Marks;
      //  window.alert("marks = " + Marks);  
        
        
       var ScheduledDate = $("#data-table").find('input[name="sch2"]').serializeArray();
       var c = JSON.stringify(ScheduledDate);
        input = document.getElementById("schstr");
        input.value = c;
     //  window.alert("sch = " + JSON.stringify(ScheduledDate));
       
       
       var SubmissionDate = $("#data-table").find('input[name="sub2"]').serializeArray();
       var c = JSON.stringify(SubmissionDate);
        input = document.getElementById("substr");
        input.value = c;
    //  alert("sub = " + JSON.stringify(SubmissionDate));
        
        
};

        </script>
    </head>
    
    <body style="background:#ddebff; color:#000 ;">
        
        <%   
            String uname = request.getParameter("username");
            String gname = request.getParameter("grpname");
            String assign_no = "A"+request.getParameter("val");
            session.setAttribute("assign_no", assign_no);
            session.setAttribute("gname", gname);
            session.setAttribute("uname", uname);
            
            String FrontAssign = "Assignment "+ request.getParameter("val");
            
            
            
            ResultSet rs = null;
            Records rc = new Records();
            GetStudent gs=new GetStudent();
            int gcode=gs.getgrpcode(gname);
            rs = gs.studentName(gname,uname,assign_no);
        // rs = rc.record(assign_no,uname,gname);
        %>
        
        
           <center> <h2><%out.println(FrontAssign);%></h2></center>
        
        <form action="Assign.jsp" method="POST">
        
            <input type="hidden" name="grpname" value="<%=gname%>">
            <input type="submit" class="btn2"  value="BACK">
        
        </form>
            
        <form action="UpdateInfo" method="POST">
        <div id="table">
        <table class="table" id="data-table" cellpadding="10px" cellspacing="20px" border="0px" style="border : 1px solid #000">
            <hr>
       
               <thead>
        <th>Roll No</th>
        <th  style="display : none">SubjectCode</th>
        
        <th  style="display : none">GroupCode</th>
        <th>ScheduledDate</th>
        <th>SubmissionDate</th>
        <th>Marks</th>
        <th style="display : none" >Approved</th>
        <th  style="display : none" >xx</th>
        <th> <p class="btn" id="demo" onclick="f()">Check all!!</p></th>
        <th> <p  class="btn" onclick="uf()">Un Check all!!</p></th>

        
        
        </thead>

        <% while(rs.next()) {%>
        <tr>   
                <td ><%=rs.getInt("Rollno") %></td>
        <td contenteditable="true"  style="display : none"><%=rs.getInt("SubjectCode") %></td>
        <td contenteditable="true"  style="display : none"><%=gcode %></td>
        <td contenteditable="true"><input class="datepicker" name = "sch2" value="<%=rs.getString("ScheduledDate") %>"></td>
        <td contenteditable="true"><input class="datepicker" name= "sub2" value="<%=rs.getString("SubmissionDate") %>"></td>
        <td contenteditable="true"><%=rs.getInt("Marks") %></td>
        <td contenteditable="true"  style="display : none"><%=rs.getInt("Approved") %></td>
            <%
                if (rs.getInt("Approved") == 1) {
            %>  <td><input type="checkbox" name="check" class="option-input checkbox" checked ></td>
                    <% } else { %>
                <td><input type="checkbox" class="option-input checkbox" name="check" ></td>
                <% } %>
                <%
                %></tr>
          <%}
          %>
        </table>
        </div>
        
        <input type="hidden" name="rollno" id="rollno" /> 
        <input type="hidden" name="set" id="set" />
        <input type="hidden" name="sub1" id="substr"/> 
        <input type="hidden" name="sch1" id="schstr"/>
        <input type="hidden" name="marks" id="marks"/>
        <input type="hidden" name="grpcode" id="grpcode"/>
        <input type="hidden" name="subcode" id="subcode"/>
        <input type="submit" style="width: 15%" class="btn" onClick=" return $(this).MessageBox();" value="SUBMIT">

        </form>
   </body>   
</html>