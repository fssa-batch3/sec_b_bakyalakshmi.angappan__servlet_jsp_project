<%@page import="in.fssa.myfashionstudioapp.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>update-product</title>


    <script>
        function addSize() {
            var container = document.getElementById("sizeContainer");
            var sizeDiv = document.createElement("div");
            sizeDiv.innerHTML = `
                <label for="size">Size</label>
		        <select name="size">
		   			<option id="1" value="1">Xs</option>
		   			<option id="2" value="2">S</option>
		   			<option id="3" value="3">M</option>
		   			<option id="4" value="4">L</option>
		   		</select>
                <label for="price">Price</label>
                <input type="number" name="price"><br>
            `;
            container.appendChild(sizeDiv);
        }
    </script>

</head>
<body>

<% ProductDTO product = (ProductDTO)request.getAttribute("product"); %>
<% int selectedCategoryId = product.getCategory().getId(); %>

<form action="update" method="post">
		
		<%-- get all genders  --%>
		<label for="gender">Choose gender</label> 
		
		<select name="gender" id="genderSelect">
			<option value="1">men</option>
			<option value="2">women</option>
		</select> <br> 
		
		
		<%-- get all categories  --%>
		<label for="category" >Choose category</label> 
		<select  name="category" id="categorySelect">
			<option value="1">T-shirts</option>
			<option value="2">Shirts</option>
			<option value="3">Jeans</option>
			<option value="4">Trousers</option>
		</select> <br>

		<label for="name" >Name</label><br> 
		
		<input type="text" value="<%= product.getName() %>"
			name="name"> <br> 
			
		<label for="description">Description</label><br>
		
		<input type="text" name="description" value="<%= product.getDescription() %>"> <br> 
		
		<input type="button" onclick="addSize()" value="+ Add Size"><br>
		
					
	 	<div id="sizeContainer">
            
        </div>
	
		
		   <input type="submit" name="update" value="Update">
	</form>

<script>
    var selectedCategoryId = <%= selectedCategoryId %>;
    var selectCategoryElement = document.getElementById("categorySelect");

    for (var i = 0; i < selectCategoryElement.options.length; i++) {
        if (selectCategoryElement.options[i].value == selectedCategoryId) {
            selectCategoryElement.options[i].selected = true;
            break;
        }
    }
<%--     
    var selectedGenderId = <%= selectedCategoryId %>;
    var selectGenderElement = document.getElementById("genderSelect");

    for (var i = 0; i < selectGenderElement.options.length; i++) {
        if (selectGenderElement.options[i].value == selectedCategoryId) {
        	selectGenderElement.options[i].selected = true;
            break;
        }
    } --%>
</script>
	


</body>


</html>