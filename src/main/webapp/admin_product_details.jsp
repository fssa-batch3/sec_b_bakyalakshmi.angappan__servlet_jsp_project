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

<title>product-view</title>

    <style>
        /* Define CSS styles for your table and its elements */
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid #000;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body>


<h1>Details of the product</h1>

<% ProductDTO product = (ProductDTO)request.getAttribute("product");	%>

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