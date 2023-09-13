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
<title>product-list</title>
</head>


<body>

	<h1>List of products</h1>

	<% List<ProductDTO> productList = (List<ProductDTO>)request.getAttribute("productList"); %>
	
	

	<table border="1">

		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Description</th>
			<th>Gender</th>
			<th>Category</th>
			<th>Price</th>	
			<th>Actions</th>	
		</tr>

	<% for(ProductDTO product : productList ){ %>
		<tr>
			<td><%= product.getId() %></td>
			<td><%= product.getName() %></td>
			<td><%= product.getDescription() %></td>
			<td><%= product.getCategory().getGender().getName() %></td>
			<td><%= product.getCategory().getName() %></td>
			
			<% List<Price> priceList =   product.getPriceList(); %>

		<% for(Price price : priceList ){ %>
			<td><%= price.getPrice() %></td>
			<%} %>
			
			<td>
			<a href="product/details?product_id=<%=product.getId()%>">
			<button class="view" type="submit">View</button>
			</a>
			</td>
				<td>
			<a href="product/edit?product_id=<%=product.getId()%>">
			<button type="submit">edit</button>
			</a>
			</td>
			<td>
			<a href="product/delete?product_id=<%=product.getId()%>">
			<button type="submit">delete</button>
			</a>
			</td>
	
		</tr>
	<%} %>

	</table>
</body>
</html>