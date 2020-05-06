<%@ page import="model.Payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Service</title>
<link rel="stylesheet" href="Views/bootstrap.min.css"> 
<script src="Components/jquery-3.4.1.min.js"></script> 
<script src="Components/Payment.js"></script> 
</head>
<body>
<div class="container"> 
	<div class="row">  
		<div class="col-6"> 
			<h1>PAYMENT SERVICE</h1>
				<form id="formItem" name="formItem" method="post" action="Doctors.jsp">  
					Patient Id:  
					<input id="Patient_id" name="Patient_id" type="text" class="form-control form-control-sm">  
					<br> Appointment Id:  
					<input id="Appointment_id" name="Appointment_id" type="text" class="form-control form-control-sm">  
					<br>Fees:  
					<input id="Fees" name="Fees" type="text" class="form-control form-control-sm">
					<br> Card Id:  
					<input id="Card_id" name="Card_id" type="text" class="form-control form-control-sm">  
					<br>  
					<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">  
					<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value=""> 
				</form>
				
				<div id="alertSuccess" class="alert alert-success">
					<%
						out.print(session.getAttribute("statusMsg"));
					%>
				</div>
				<div id="alertError" class="alert alert-danger"></div>
				
				<br>
				<div id="divItemsGrid">
					<%
						Payment payObj = new Payment();
						out.print(payObj.readPayment());
					%>
				</div>
				
				 
			</div>
		</div>
</div>
</body>
</html>