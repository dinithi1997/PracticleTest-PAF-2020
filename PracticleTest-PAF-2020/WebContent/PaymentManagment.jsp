<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Management</title>
<link href="css/bootstrap.min.css" rel = "stylesheet" >
</head>
<body>

<div class="container">

<h1 style="color:black; font-family:Verdana Bold;text-align:center;font-size:500%;">Payment Management</h1>
<hr>
<div class= "row" >
<img src="Images/payment.jpg" alt="" width="1200" height="300"  class="center" >
</div>
<br><br>
<p style="font-size:30px;color:black;font-family:Verdana Bold">Please fill in this form to get Service.</p>
 
<hr>
	
	<form method="post" action="PaymentManagment.jsp">
 <div class="form-group owner">
                <label for="owner">Owner</label>
                <input type="text" class="form-control" id="owner">
            </div>
             <div class="form-group phone number">
                <label for="phone number">Phone Number</label>
                <input type="tel" class="form-control" id="phone number">
            </div>
            
            <div class="form-group CVV">
                <label for="cvv">CVV</label>
                <input type="text" class="form-control" id="cvv">
            </div>
            <div class="form-group" id="card-number-field">
                <label for="cardNumber">Card Number</label>
                <input type="text" class="form-control" id="cardNumber">
            </div>
           
            <div class="form-group" id="expiration-date">
                <label>Expiration Date</label>
              <select>
                    <option value="01">January</option>
                    <option value="02">February </option>
                    <option value="03">March</option>
                    <option value="04">April</option>
                    <option value="05">May</option>
                    <option value="06">June</option>
                    <option value="07">July</option>
                    <option value="08">August</option>
                    <option value="09">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                </select>
                <select>
                    <option value="16"> 2016</option>
                    <option value="17"> 2017</option>
                    <option value="18"> 2018</option>
                    <option value="19"> 2019</option>
                    <option value="20"> 2020</option>
                    <option value="21"> 2021</option>
                </select>
            </div>
            <div class="form-group" id="credit_cards">
                <img src="Images/Visa.jpg" id="visa">
              <img src="Images/mastercard.jpg" id="mastercard">
            </div>
               <input type="checkbox" name="remember"> Remember me
<br>
<hr>
<br>
     <div class="form-group" id="pay-now">
                <button type="submit" class="btn" id="confirm-purchas"  style = "color:white;align-items: center;background-color: #4CAF50;height:auto; width:auto; float: left;">Confirm</button>
                
            
            </div>
</form>
<br>
<br>
<table border="2" style="border:1px solid black;text-align:center;margin-left:auto;margin-right:auto;">
 <tr>
 <th>Owner</th>
<th>Phone Number</th>
<th>CVV</th>
<th>Card Number</th>
<th>Expiration Date</th>
<th>Update</th>
<th>Remove</th>
 </tr>
 <tr>
 <td><%out.print(session.getAttribute("owner")); %></td>
 <td><%out.print(session.getAttribute("phone number")); %></td>
 <td><%out.print(session.getAttribute("cvv")); %></td>
 <td><%out.print(session.getAttribute("cardNumber")); %></td>
 <td><%out.print(session.getAttribute("expirationdate")); %></td>


 <td><input name="btnUpdate" type="button" value="Update" class="center" style = "background-color: #4CAF50;padding: 5px 18px;border-radius: 4px; color:white"></td>
 <td><input name="btnRemove" type="button" value="Remove" class = "center" style = "background-color: #4CAF50;padding: 5px 18px;border-radius: 4px; color:white"></td>
 </tr>
</table>
	
</div>

</body>
</html>