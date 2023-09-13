<%@page import="in.fssa.myfashionstudioapp.model.Price"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.myfashionstudioapp.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="login.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
<title>update-product</title>



<style>
* {
	font-family: 'Jost', sans-serif;
}

body {
	font-family: 'Jost', sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

/* Style the form container */
form {
	font-family: 'Jost', sans-serif;
	max-width: 600px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

/* Style labels and inputs */
label {
	display: block;
	margin-bottom: 5px;
	font-weight: 600;
}

input[type="text"], input[type="number"],  input[type="url"] ,select {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	required: true; /* Added required attribute */
}

/* Style the "+ Add Size" button */
input[type="button"] {
	font-family: 'Jost', sans-serif;
	background-color: #2196f3;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

/* Style the size container */
#sizeContainer {
	border: 1px solid #ccc;
	padding: 10px;
	margin-top: 10px;
	background-color: #f9f9f9;
}

#sizeContainer div {
	display: flex;
	flex-direction: row;
	width: 95%;
	gap: 20px;
	align-items: center;
	background-color: #fff;
	border: 1px;
	padding: 10px;
	margin: 4px;
}

/* Additional styles can be added as needed */

/* Apply styles to error messages if necessary */
.error {
	background-color: #ffcccc;
	padding: 10px;
	margin-top: 10px;
	border: 1px solid #ff0000;
	color: #ff0000;
}

/* Style the "Clear" button */
#clearButton {
	background-color: #ff0000;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#updateproduct {
	font-family: 'Jost', sans-serif;
	font-size: 18px;
	width: 100%;
	background-color: #000;
	color: #fff;
	padding: 1%;
	border: none;
	border: 1px solid #000;
	border-radius: 5px;
	letter-spacing: 1px;
}

img{
    width:200px;
    position : relative;
	left:33%;
    align-items:center;
}

#error_msg{
        color: red; 
        font-size:15px;
}
</style>

</head>
<body>

	<%
	ProductDTO product = (ProductDTO) request.getAttribute("product");
	%>

	<% int selectedCategoryId = -1; %>
	<%
	if (product != null) {
	%>

	<%
	selectedCategoryId = product.getCategory().getId();
	%>

	<%
	}
	%>

	<% int productId = (int)request.getAttribute("product_id");%>


	<form action="update?product_id=<%=productId%>" method="post">
	
	 	<img src="https://iili.io/J9aNeat.png" alt="">

		<h4>Update product</h4>

		<%-- get all genders  --%>
		
		<% int selectedGender = product.getCategory().getGender().getId(); %>
		<label for="gender">Choose gender</label> <select name="gender"
			id="genderSelect"  onchange="toggleCategorySelect()">
			<option value="1">men</option>
			<option value="2">women</option>
		</select> <br>


		<%-- get all categories  --%>
		
		<% int selectedCategory = product.getCategory().getId(); %>
		<label for="category">Choose category</label><select name="category"
			id="menCategory" required>
			<option value="1">T-shirts</option>
			<option value="2">Shirts</option>
			<option value="3">Jeans</option>
			<option value="4">Trousers</option>
			
		</select> <select name="category" id="womenCategory" style="display: none;"
			required>
			<option value="5">T-shirts</option>
			<option value="6">Shirts</option>
			<option value="7">Jeans</option>
			<option value="8">Skirts</option>
		</select>
		
		
			<label for="image">Image Url</label><br> 
		<input type="url"
			name="image" value="<%=product.getImage()%>"  required> <br> 
		
		<label for="name">Name</label><br> <input type="text"
			value="<%=product.getName()%>" name="name"> <br>
			
			 <label
			for="description">Description</label><br>
			
			 <input type="text"
			name="description" value="<%=product.getDescription()%>"> <br>

		<div class="buttons">
			<input type="button" onclick="addSize()" value="+ Add Size">
			<input type="button" id="clearButton" value="Clear">
		</div>

		<div id="sizeContainer">
			<%
			List<Price> priceList = product.getPriceList();
			%>

			<%
			for (Price price : priceList) {
			%>

			<div>
				<input type="hidden" name="size"
					value="<%=price.getSize() != null ? price.getSize().getId() : ""%>" />
				Size: <input type="text"
					value="<%=price.getSize() != null ? price.getSize().getValue() : ""%>"
					readonly /> Price: <input type="text" name="price"
					value="<%=price.getPrice()%>" />


			</div>

			<%
			}
			%>

		</div>

			<%
					String data = (String) request.getParameter("error");
					%>
					<%
					if (data != null) {
					%>
					<p id="error_msg"><%=data%></p>
					<%
					}
					%>
		<br> <input type="submit" name="submit" id="updateproduct"
			value="Update New Product" />
	</form>


	<script>
	

	var selectedGender = "<%= selectedGender %>"; // Assuming you have the selected gender value as a string

	var genderSelectElement = document.getElementById("genderSelect");

	for (var i = 0; i < genderSelectElement.options.length; i++) {
	    if (genderSelectElement.options[i].value === selectedGender) {
	        genderSelectElement.options[i].selected = true;
	        break;
	    }
	}
	
	if(selectedGender == 1){
		
	    var selectedCategoryId = <%=selectedCategory%>;
	    var selectCategoryElement = document.getElementById("menCategory");

	    for (var i = 0; i < selectCategoryElement.options.length; i++) {
	        if (selectCategoryElement.options[i].value == selectedCategoryId) {
	            selectCategoryElement.options[i].selected = true;
	            break;
	        }
	    }
	}else{
		
		
	    var selectedCategoryId = <%=selectedCategory%>;
	    var selectCategoryElement = document.getElementById("womenCategory");

	    for (var i = 0; i < selectCategoryElement.options.length; i++) {
	        if (selectCategoryElement.options[i].value == selectedCategoryId) {
	            selectCategoryElement.options[i].selected = true;
	            break;
	        }
	    }
	}
	
	

    
    

	function toggleCategorySelect() {
		
		console.log("in change");
		const genderSelect = document.getElementById('genderSelect');
		const menCategorySelect = document.getElementById('menCategory');
		const womenCategorySelect = document
				.getElementById('womenCategory');

		if (genderSelect.value === '1') {
			menCategorySelect.style.display = 'block';
			womenCategorySelect.style.display = 'none';
		} else if (genderSelect.value === '2') {
			menCategorySelect.style.display = 'none';
			womenCategorySelect.style.display = 'block';
		}
	}
    
   
    
    function addSize() {
        var container = document.getElementById("sizeContainer");
        var sizeDiv = document.createElement("div");

        // Create the label for size selection
        var sizeLabel = document.createElement("label");
        sizeLabel.htmlFor = "size";
        sizeLabel.textContent = "Size:";

        // Create the select element for size selection
        var sizeSelect = document.createElement("select");
        sizeSelect.name = "size";

        // Create the default "Select a size" option
        var defaultOption = document.createElement("option");
        defaultOption.value = "";
        defaultOption.textContent = "Select a size";
        sizeSelect.appendChild(defaultOption);

        // The sizeList variable should be defined separately and populated from your JSP model
       var sizeList = <%=request.getAttribute("sizeList")%>;


        for (var i = 0; i < sizeList.length; i++) {
            var size = sizeList[i];
            var option = document.createElement("option");
            option.value = size.id ;
            option.textContent = size.value;
            sizeSelect.appendChild(option);
        }
        
        // Create a label for the price input
        var priceLabel = document.createElement("label");
        priceLabel.htmlFor = "price";
        priceLabel.textContent = "Price";
        
        // Create an input element for the price
        var priceInput = document.createElement("input");
        priceInput.type = "number";
        priceInput.name = "price";
        priceInput.min = 1;
        priceInput.required = "true";
        
        // Append the label and size selection to the sizeDiv
        sizeDiv.appendChild(sizeLabel);
        sizeDiv.appendChild(sizeSelect);
        sizeDiv.appendChild(priceLabel);
        sizeDiv.appendChild(priceInput);
        
        // Append sizeDiv to the container
        container.appendChild(sizeDiv);
    }

    // JavaScript code to clear the fields
    function clearFields() {
        document.getElementById("sizeContainer").innerHTML = "";
        addSize();
    }

    document.getElementById("clearButton").addEventListener("click", clearFields);
    
</script>



</body>


</html>