<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Digital Record Book</title>
  <link rel="shortcut icon" href="PICT_logo1.PNG">
  <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css">
     
    
    <style>
        
        
.btn {
  box-sizing: border-box;
  appearance: button;
  background-color: #1500ff;
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

<body>
    
    <img src="images/PICT_logo1.PNG" style="position:absolute;width:100px;height:100px;top:30px;left:120px">
    <div style="border:thin;background: #fff;height: 120px;">
    <center><h1>Pune Institute of Computer Technology</h1></center>
    <center><h1>Digital Record Book</h1></center></div>
    
    
  <div class="wrapper" >
  <ul class="tabs clearfix" data-tabgroup="first-tab-group">
      <li><a href="#tab1" class="active"><b>LOGIN</b></a></li>
    <li><a href="#tab2"><b>SIGN UP</b></a></li>
    
  </ul>
  <section id="first-tab-group" class="tabgroup">
    <div id="tab1"> 
      <h2>LOGIN</h2>
      
     <h3 style="position: absolute;left:470px;top:335px; color: red">*Invalid Credentials...! Please try again...!</h3>
      <form   name="LoginForm" action="Login" method="get">
         <center><p><b>Username : </b><input  type="text" name="Username"><br><br></center>
        <center><p><b>Password : </b><input  type="password" name="Password"><br><br></center>
        <center><b><input type="submit" class="btn" value="Log In"></b></center>
        
    </form>

    </div>
    <div id="tab2">
      <h2>SIGN UP</h2>
      <form action="Signup">
            <b>First Name : <input type="text" name="first_name"><br><br>
            Middle Name : <input type="text" name="middle_name"><br><br>
            Last Name : <input type="text" name="last_name"><br><br>
            RollNo : <input type="text" name="UserID"><br><br>
            Password : <input type="text" name="Password"><br><br>
            <input type="submit" class="btn" value="Create Account"></b>
            </form>
    </div>
    
  </section>
     
</div>
    
  <script src='js/jquery-2.2.4.min.js'></script>

    <script src="js/index.js"></script>
   
    
    
<script type="text/javascript">
<!--
    if (top.location!= self.location) {
        top.location = self.location.href
                   //or you can use your logout page as
                   //top.location='logout.jsp' here...
    }
//-->
</script>

</body>
</html>