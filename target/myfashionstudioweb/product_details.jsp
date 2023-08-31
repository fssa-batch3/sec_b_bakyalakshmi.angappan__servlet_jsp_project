<%@page import="in.fssa.myfashionstudioapp.model.Price"%>
<%@page import="in.fssa.myfashionstudioapp.service.SizeService"%>
<%@page import="in.fssa.myfashionstudioapp.service.PriceService"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.myfashionstudioapp.service.ProductService"%>
<%@page import="in.fssa.myfashionstudioapp.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<h1>Product Details</h1>

<% 	ProductService productService = new ProductService(); 	%>
<% 	ProductDTO product = productService.findProductDetailsByProductId(23);	%>

<table border="1">
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>gender</th>
        <th>Category</th>
        <th>Sizes</th>
        <th>Prices</th>
    </tr>
    
        <tr>
            <td><%= product.getName()%></td>
            <td><%= product.getDescription()%></td>
            <td><%= product.getCategory().getGender().getName()%></td>
            <td><%= product.getCategory().getName()%></td>

            
            
        <% List<Price> priceList = product.getPriceList(); %>
        
        <td>
         <%  for(Price price : priceList) {%>
         <ul><%= price.getSize().getValue()%></ul>
         <%} %>
        </td>
        
        <td>
         
         <%  for(Price price : priceList) { %>
         <ul><%= price.getPrice() %></ul>
         <%} %>
       </td>
        </tr>
        
 

</table>

</body>
</html>