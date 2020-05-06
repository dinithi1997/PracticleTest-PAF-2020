$(document).ready(function() 
{  
	if ($("#alertSuccess").text().trim() == "")  
	{   
		$("#alertSuccess").hide();  
	}  
	$("#alertError").hide(); }); 
 
// SAVE ============================================ 
$(document).on("click", "#btnSave", function(event) 
{  
	// Clear alerts---------------------  
	$("#alertSuccess").text("");  
	$("#alertSuccess").hide();  
	$("#alertError").text("");  
	$("#alertError").hide(); 
 
	// Form validation-------------------  
	var status = validateItemForm();  
	if (status != true)  
	{   
		$("#alertError").text(status);   
		$("#alertError").show();   
		return;  
	} 
 
	// If valid------------------------  
	var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT"; 
	
	$.ajax( 
	{  
		url : "PaymentAPI",  
		type : type,  
		data : $("#formItem").serialize(),  
		dataType : "text",  
		complete : function(response, status)  
		{   
			onItemSaveComplete(response.responseText, status);  
		} 
	}); 
}); 

function onItemSaveComplete(response, status) 
{  
	if (status == "success")  
	{   
		var resultSet = JSON.parse(response); 

		if (resultSet.status.trim() == "success")   
		{    
			$("#alertSuccess").text("Successfully saved.");    
			$("#alertSuccess").show(); 

			$("#divItemsGrid").html(resultSet.data);   
		} else if (resultSet.status.trim() == "error")   
		{    
			$("#alertError").text(resultSet.data);    
			$("#alertError").show();   
		} 

	} else if (status == "error")  
	{   
		$("#alertError").text("Error while saving.");   
		$("#alertError").show();  
	} else  
	{   
		$("#alertError").text("Unknown error while saving..");   
		$("#alertError").show();  
	} 

	$("#hidItemIDSave").val("");  
	$("#formItem")[0].reset(); 
} 
 
// UPDATE========================================== 
$(document).on("click", ".btnUpdate", function(event) 
{     
	$("#hidItemIDSave").val($(this).closest("tr").find('#hidItemIDUpdate').val());     
	$("#Patient_id").val($(this).closest("tr").find('td:eq(0)').text());     
	$("#Appointment_id").val($(this).closest("tr").find('td:eq(1)').text());     
	$("#Fees").val($(this).closest("tr").find('td:eq(2)').text());
	$("#Card_id").val($(this).closest("tr").find('td:eq(3)').text()); 
}); 

//REMOVE===========================================
$(document).on("click", ".btnRemove", function(event) 
{  
	$.ajax(  
	{   
		url : "PaymentAPI",   
		type : "DELETE",   
		data : "payment_id=" + $(this).data("payment_id"),   
		dataType : "text",   
		complete : function(response, status)   
		{    
			onItemDeleteComplete(response.responseText, status);   
		}  
	}); 
}); 

function onItemDeleteComplete(response, status) 
{  
	if (status == "success")  
	{   
		var resultSet = JSON.parse(response); 

		if (resultSet.status.trim() == "success")   
		{    
			$("#alertSuccess").text("Successfully deleted.");    
			$("#alertSuccess").show(); 
		
			$("#divItemsGrid").html(resultSet.data);   
		} else if (resultSet.status.trim() == "error")   
		{    
			$("#alertError").text(resultSet.data);    
			$("#alertError").show();   
		}

	} else if (status == "error")  
	{   
		$("#alertError").text("Error while deleting.");   
		$("#alertError").show();  
	} else  
	{   
		$("#alertError").text("Unknown error while deleting..");   
		$("#alertError").show();  
	}
}

// CLIENT-MODEL========================================================================= 
function validateItemForm() 
{  
	// Patient Id  
	if ($("#Patient_id").val().trim() == "")  
	{   
		return "Insert Patient Id.";  
	} 
 
	// Appointment Id  
	if ($("#Appointment_id").val().trim() == "")  
	{   
		return "Insert Appointment Id.";  
	} 
	
	//Fees-------------------------------  
	if ($("#Fees").val().trim() == "")  
	{   
		return "Insert Fees.";  
	} 

	// is phone number numerical value  
	var tmpPrice = $("#Fees").val().trim();  
	if (!$.isNumeric(tmpPrice))  
	{   
		return "Insert a numerical value for Fees.";  
	} 
	
	// Card Id  
	if ($("#Card_id").val().trim() == "")  
	{   
		return "Insert Card Id.";  
	} 


	return true; 
}