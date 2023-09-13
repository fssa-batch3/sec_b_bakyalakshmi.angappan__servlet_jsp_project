<%@page import="in.fssa.myfashionstudioapp.model.Price"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.myfashionstudioapp.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>product-details</title>

<link rel="stylesheet" href="product_detail.css">

</head>
<body>

    <!-- Include the header.jsp file here -->
    <jsp:include page="header.jsp" />

    <%
    ProductDTO product = (ProductDTO) request.getAttribute("product");
    %>

    <div class="content">
        <div class="sizecontainer">

            <div class="inputsizecontainer">
            
            </div>

        </div>

        <div class="leftside">
            <div class="product_image">
                <img id="product_image" src="https://iili.io/HvByRhQ.webp"
                    alt="Typography Printed Cotton Casual T-Shirt">
            </div>
        </div>
        <div class="rightside">
            <div class="names">
                <h5 id="product_name"> <%= product.getName()%> </h5>
            </div>
            <div class="prices">
                <div class="current_price" id="selectedPrice" ></div>
            </div>
            <p class="headingsize">Select size</p>
            <div class="size">
            
          <!-- loop hear all the sizes  -->  
          <% List<Price> priceList = product.getPriceList() ;%>
          
		<% for (Price price : priceList) { %>
		
		   <input class="size_no productsize" id="productsize<%= price.getSize().getId() %>" type="radio"
		       name="rad" value="<%= price.getSize().getId() %>"><label for="productsize<%= price.getSize().getId() %>"> <%= price.getSize().getValue()  %></label>
		<% } %>

 
             
           </div>
            <div class="buttons">
                <button class="buynow" id="bag">BUY NOW</button>
            </div>
            <div class="product_details">
            
                <div class="accordion">
                    <h6>Product Description</h6>
                </div>
                <div class="panel">
                    <p><%= product.getDescription() %> </p>
                </div>
            </div>
        </div>
    </div>
    
    
    <script>

    document.addEventListener("DOMContentLoaded", function() {
    	
        var sizeRadios = document.querySelectorAll("input[name='rad']");
        
        
        var selectedPrice = document.getElementById("selectedPrice");
        
        console.log(selectedPrice);
        
        sizeRadios.forEach(function(radio) {
            radio.addEventListener("change", function() {
                var selectedSize = radio.value;
                var price = getPriceForSize(selectedSize);
                selectedPrice.textContent = "Price: RS." + price.toFixed(2); // Display price with 2 decimal places
            });
        });

        // Define price data object (replace with your actual data)
        var priceData = {
            // Define prices for each size
            <% for (Price price : priceList) { %>
                "<%= price.getSize().getId() %>": <%= price.getPrice() %>,
            <% } %>
        };
        
        // Get the first size from the price data object
        var firstSize = Object.keys(priceData)[0];
        
        // Set the default price to the first size's price
        var defaultPrice = getPriceForSize(firstSize);
        selectedPrice.textContent = "Price: RS." + defaultPrice.toFixed(2); // Display default price

        // Function to get the price for a selected size
        function getPriceForSize(size) {
            return priceData[size] || 0; // Default to 0 if size is not found
        }
    });


    </script>
</body>
</html>
