
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>

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
	-webkit-animation: click-wave 0.65s;
	-moz-animation: click-wave 0.65s;
	animation: click-wave 0.65s;
	background: #269cc6;
	content: '';
	display: block;
	position: relative;
}

.option-input.radio {
	border-radius: 50%;
}

.option-input.radio::after {
	border-radius: 50%;
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
	font-size: 1rem;
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
	font-size: 1rem;
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

<body style="background: #0f1b2c; color: #fff;">

	<div style="display: inline-block">
		<img src="js/default-profile-photo-300x300.jpg"
			style="float: left; width: 45px; height: 45px; margin: 5px">
		<h4>Welcome Administrator</h4>
	</div>
	<hr>
	<br>


	<form id="grouptable" action="GroupTable.jsp" target="frame1">
		<input type="submit" value="Group Table" class="btn"> <br>

	</form>


	<form id="subjectTable" action="SubjectTable.jsp" target="frame1">
		<input type="submit" value="Subject Table" class="btn"> <br>

	</form>


	<form id="logintable" action="LoginTable.jsp" target="frame1">
		<input type="submit" value="Login Table" class="btn"> <br>

	</form>



	<form id="SubjectAllotment" action="SubjectAllotment.jsp"
		target="frame1">
		<input type="submit" value="Subject Allotment" class="btn"> <br>

	</form>



	<form id="SubjectCoord" action="SubjectCord.jsp" target="frame1">
		<input type="submit" value="Subject Coordinator" class="btn">

	</form>



	<br>
	<form action="Logout" method="get">
		<input type="submit" value="Logout" class="btn2">
	</form>

	<br>


	<form action="ClrRecord" method="get"
		style="position: relative; margin-top: 100%;">

		<input type="submit" value="Clear Records" class="btn2">
	</form>


</body>
</html>