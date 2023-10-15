<%@page import="in.fssa.myfashionstudioapp.model.Price"%>
<%@page import="in.fssa.myfashionstudioapp.service.PriceService"%>
<%@page import="in.fssa.myfashionstudioapp.dto.ProductDTO"%>
<%@page import="in.fssa.myfashionstudioapp.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.myfashionstudioapp.service.ProductService"%>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
            integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer">
<title>product-list</title>

<style>
/* Reset some default styles for better consistency */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f0f0f0;
}

/* Style the header section */
h1 {
    text-align: center;
    margin: 20px 0;
}


.createproduct {
    display: inline-block;
    padding: 10px 20px;
    background-color: #000;
    color: #fff;
    text-decoration: none;
    border: none;
    cursor: pointer;
    float: right; /* Align to the right */
    margin-top: 10px; /* Add some margin for spacing */
}

/* Style the table */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table, th, td {
    border: 1px solid #ccc;
}

th, td {
    padding: 10px;
    text-align: left;
}

/* Style the "View" button in light green */
.view-details {
    padding: 5px 10px;
    background-color: #00ff00; /* Light green background color */
    color: #fff;
    border: none;
    cursor: pointer;
}

/* Style the "Edit" button in yellow */
.edit-details {
    padding: 5px 10px;
    background-color: #ffff00; /* Yellow background color */
    color: #000; /* Black text color */
    border: none;
    cursor: pointer;
}

/* Style the "Delete" button in red */
.delete-details {
    padding: 5px 10px;
    background-color: #ff0000; /* Red background color */
    color: #fff;
    border: none;
    cursor: pointer;
}

/* Style the links for better visibility */
a {
    text-decoration: none;
    color: #000; /* Black text color */
}

/* Style table header */
th {
    background-color: #000; /* Black background color */
    color: #fff;
}

/* Style odd rows with a light background color */
tr:nth-child(odd) {
    background-color: #f2f2f2;
}

/* Hover effect on table rows */
tr:hover {
    background-color: #ddd;
}


</style>
</head>


<body>

	<a href="product/new">
			<button class="createproduct" type="submit">+ create product</button>
			</a>

	<h1>Inventory</h1>

	<% List<ProductDTO> productList = (List<ProductDTO>)request.getAttribute("productList"); %>
	
	

	<table border="1">

		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Description</th>
			<th>Gender</th>
			<th>Category</th>

			<th>Actions</th>	
		</tr>

	<% for(ProductDTO product : productList ){ %>
		<tr>
			<td><%= product.getId() %></td>
			<td><%= product.getName() %></td>
			<td><%= product.getDescription() %></td>
			<td><%= product.getCategory().getGender().getName() %></td>
			<td><%= product.getCategory().getName() %></td>
			

			
			<td>
			<a href="product/details?product_id=<%=product.getId()%>">
			<button class="view" type="submit" class="view-details">View</button>
			</a>
			</td>
				<td>
			<a href="product/edit?product_id=<%=product.getId()%>">
			<button type="submit" class="edit-details">edit</button>
			</a>
			</td>
			<td>
			<a href="product/delete?product_id=<%=product.getId()%>">
			<button type="submit" class="delete-details">delete</button>
			</a>
			</td>
	
		</tr>
	<%} %>

	</table>
</body>
</html>