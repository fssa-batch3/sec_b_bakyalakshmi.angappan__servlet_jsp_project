<%@page import="in.fssa.myfashionstudioapp.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>add-product</title>

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

<%-- <% if (request.getAttribute("errorMessages") != null) { %>
    <div class="error">
        <h2>Error(s) occurred:</h2>
        <p><%= request.getAttribute("errorMessages") %></p>
    </div>
<% } %> --%>

	<form action="create" method="post">
		
		<label for="gender">Choose gender</label> 
		
		<select id="gender" name="gender">
			<option id="1" value="1" selected >men</option>
			<option id="2" value="2">women</option>
		</select> <br> 
		
		
		<%-- get all categories  --%>
		<label for="category">Choose category</label> 
		
		
		<select name="category">
			<option id="1" value="1">T-shirts</option>
			<option id="2" value="2">Shirts</option>
			<option id="3" value="3">Jeans</option>
			<option id="4" value="4">Trousers</option>
		</select> <br>
		
		<label for="name">Name</label><br> 
		
		<input type="text" 
			name="name"> <br> 
			
		<label for="description">Description</label><br>
		
		<input type="text"  name="description"> <br> 
			
 		<input type="button" onclick="addSize()" value="+ Add Size"><br>
			
	 	<div id="sizeContainer">
            
        </div>
	
			
		

 <br>
		
		<input type="submit" name="submit" />
	</form>

</body>
</html>