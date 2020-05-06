
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.4.1.min.js"></script>
<script src="Components/payment.js"></script>

</head>
<body>

<div class="container">


<h1 style="color:black; font-family:Verdana Bold;text-align:center;font-size:500%;">Online Payment</h1>
<hr>
<div class= "row" >
<img src="Images/payment.jpg" alt="" width="1200" height="300"  class="center" >
</div>
<br><br>
<p style="font-size:30px;color:black;font-family:Verdana Bold">Please fill in this form to get Service.</p>
 
<hr>
	
	<form method="post" action="PaymentManagment.jsp">
<div>
			Payment ID
			<input id="paymentId" name="paymentId" type="number" class="form-control form-control-sm" placeholder="Enter Payment ID"> <br> 
          </div>
          
          <div>
			Patient ID
			<input id="patientId" name="patientId" type="number" class="form-control form-control-sm" placeholder="Enter Patient ID"> <br> 
          </div>
          
          <div>
			Hospital ID
			<input id="hospitalId" name="hospitalId" type="number" class="form-control form-control-sm" placeholder="Enter Hospital ID"> <br> 
          </div>
          
           <div>
			Doctor ID
			<input id="doctorId" name="doctorId" type="number" class="form-control form-control-sm" placeholder="Enter Doctor ID"> <br> 
          </div>
          <div>
			Appointment ID
			<input id="appointmentId" name="appointmentId" type="number" class="form-control form-control-sm" placeholder="Enter Appointment ID"> <br> 
          </div>
          
          <div>
			Fees
			<input id="Fees" name="Fees" type="number" class="form-control form-control-sm" placeholder="Enter Fees"> <br> 
          </div>
          <div>
          Expiry Date:
					 <input id="expiryDate" name="expiryDate" type="date" class="form-control form-control-sm" placeholder="Enter Expiry Date"> <br>
          </div>
          
           <div>
          Expiry Month:
					 <input id="expiryMonth" name="expiryMonth" type="date" class="form-control form-control-sm" placeholder="Enter Expiry Month"> <br>
          </div>
          
            <div>
			Card ID
			<input id="cardId" name="cardId" type="number" class="form-control form-control-sm" placeholder="Enter Card ID"> <br> 
          </div>
          
          
            
            <div class="form-group" id="credit_cards">
                <img src="Images/Visa.jpg" id="visa">
              <img src="Images/mastercard.jpg" id="mastercard">
            </div>
            <div>
             <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary"> 
					 <input type="hidden" id="hidIDSave" name="hidIDSave" value="">
				</div>
<br>
<hr>
<br>
    </form>
<br>
<br>
<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				<div id="divItemsGrid">
					<%
				//	Payment paymentObj = new Payment();
					//out.print(paymentObj.readInput());
					%>
				</div>
				<br>
				
			
				


</div>

</body>

</html>