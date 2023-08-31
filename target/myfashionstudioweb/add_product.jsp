<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>add-product</title>
</head>
<body>

	<form action="create" method="post">
		
		<%-- get all genders  --%>
		<label for="gender">Choose gender</label> 
		
		<select name="gender">
			<option value="1">men</option>
			<option value="2">women</option>
		</select> <br> 
		
		
		<%-- get all categories  --%>
		<label for="category">Choose category</label> 
		
		
		<select name="category">
			<option value="1">T-shirts</option>
			<option value="2">Shirts</option>
			<option value="3">Jeans</option>
			<option value="4">Trousers</option>
		</select> <br>
		
		<label for="name">Name</label><br> 
		
		<input type="text" 
			name="name"> <br> 
			
		<label for="description">Description</label><br>
		
		<input type="text"  name="description"> <br> 
		
<!-- 		<label for="size">Choose size</label> 

		<input type="checkbox" name="size" value="1"  value="xs">
		<label for="1">XS</label>
		
		<input type="checkbox" name="size" value="2"  value="xl">
		<label for="2">XL</label>
		
		<input type="checkbox" name="size" value="3"  value="l">
		<label for="3">L</label> <br>  -->
		
		<label for="size">Size</label>
		<input
			type="number"  name="size">
		
		<label for="price">price</label>
		<input
			type="number"  name="price"> <br> 
			
		

 <br>
		
		<input type="submit" name="submit" />
	</form>

</body>
</html>