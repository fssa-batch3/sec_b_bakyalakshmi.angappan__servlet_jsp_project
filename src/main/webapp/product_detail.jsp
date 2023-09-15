<%@page import="in.fssa.myfashionstudioapp.model.Price"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.myfashionstudioapp.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="./assets/css/header.css">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="/assets/css/footer.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link
            href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
            integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
            crossorigin="anonymous" referrerpolicy="no-referrer">
        
        <link rel="stylesheet" href="./assets/css/bootstrap css/bootstrap.css">
        <link rel="stylesheet" href="/assets/css/myorder.css">
 
		<link rel="stylesheet" href="product_list.css">
		
		<link rel="stylesheet" href="product_detail.css">
<title>product-details</title>


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
                <img id="product_image" src=" <%= product.getImage() %>"
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
		       name="rad" value="<%= price.getSize().getId() %>">
		       <label for="productsize<%= price.getSize().getId() %>">
		        <%= price.getSize().getValue()  %></label>
		<% } %>
             
           </div>
           
           
            <div class="buttons">
                <button class="buynow" id="buynow">BUY NOW</button>
        		<button class="buynow" id="bag">add to bag</button>
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
    
   <!-- first size should be selected first -->
    <script>

    document.addEventListener("DOMContentLoaded", function() {
    	
        var sizeRadios = document.querySelectorAll("input[name='rad']");
        sizeRadios[0].checked = true;
        // append price 
        var selectedPrice = document.getElementById("selectedPrice");
        
        console.log(selectedPrice);
        
        sizeRadios.forEach(function(radio) {
            radio.addEventListener("change", function() {
                var selectedSize = radio.value;
                
                var sizeId = selectedSize
                var price = getPriceForSize(selectedSize);
                selectedPrice.textContent =  " RS." + price.toFixed(2); // Display price with 2 decimal places
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
            return priceData[size] ; // Default to 0 if size is not found
        }
    });
    
    
    var sizeRadios = document.querySelectorAll("input[name='rad']");

    var product_id = "<%= product.getId() %>"; // Get product ID initially

    document.getElementById("bag").addEventListener("click", function() {
        var selectedSize = getSelectedSize();
        
       
        if (selectedSize !== null) {
            var size_id = selectedSize;
            var redirectURL = "user/bag?product_id=" + product_id + "&size_id=" + size_id;
            window.location.href = redirectURL;
        } else {
            alert("Please select a size before adding to the bag.");
        }
    });

    function getSelectedSize() {
        for (var i = 0; i < sizeRadios.length; i++) {
            if (sizeRadios[i].checked) {
                return sizeRadios[i].value;
            }
        }
        return null; // Return null if no size is selected
    }

    


    </script>
</body>
</html>
