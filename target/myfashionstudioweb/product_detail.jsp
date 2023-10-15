<%@page import="com.google.gson.Gson"%>
<%@page import="in.fssa.myfashionstudioapp.model.Bag"%>
<%@page import="in.fssa.myfashionstudioapp.model.Price"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.myfashionstudioapp.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- link for the google fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<!-- link for the font awesome icons -->
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">

<!-- link for the bootstrap css -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap css/bootstrap.css">
<!-- link for the common css -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/header.css">
<!-- -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/product_detail.css">
<!-- script for sweet alert -->
<script
	src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js
"></script>
<link
	href="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css
"
	rel="stylesheet">

<style>
.swal-wide {
	font-size: 18px !important;
	width: 400px !important;
}
</style>
<title>product-details</title>


</head>
<body>

	<!-- Include the header.jsp file here -->
	<jsp:include page="header.jsp" />

	<%
	ProductDTO product = (ProductDTO) request.getAttribute("product");
	%>
<%-- 
<% System.out.print("exist in product details" + (int)request.getAttribute("existInBag")) ;%> --%>



	<div class="content">
		<div class="sizecontainer">

			<div class="inputsizecontainer"></div>

		</div>

		<div class="leftside">
			<div class="product_image">
				<img id="product_image" src=" <%=product.getImage()%>"
					alt="Typography Printed Cotton Casual T-Shirt">
			</div>
		</div>
		<div class="rightside">
			<div class="names">
				<h5 id="product_name">
					<%=product.getName()%>
				</h5>
			</div>
			<div class="prices">
				<div class="current_price" id="selectedPrice"></div>
			</div>
			<p class="headingsize">Select size</p>
			<div class="size">

				<!-- loop hear all the sizes  -->
				<%
				List<Price> priceList = product.getPriceList();
				%>

				<%
				for (Price price : priceList) {
				%>

				<input class="size_no productsize"
					id="productsize<%=price.getSize().getId()%>" type="radio"
					name="rad" value="<%=price.getSize().getId()%>"> <label
					for="productsize<%=price.getSize().getId()%>"> <%=price.getSize().getValue()%></label>
				<%
				}
				%>

			</div>


			<div class="buttons">
				<!-- 	<button class="buynow" id="buynow">BUY NOW</button> -->


				<button class="buynow" id="bag">add to bag</button>
			</div>
			<div class="product_details">

				<div class="accordion">
					<h6>Product Description</h6>
				</div>
				<div class="panel">
					<p><%=product.getDescription()%>
					</p>
				</div>


			</div>



		</div>
	</div>

	<script
		src="<%=request.getContextPath()%>/js/vendor/bootstrap.bundle.js"></script>

	<!-- first size should be selected first -->
	<script>
	
    /* header script */
    
   		// Add an event listener for each dropdown item
		document.querySelectorAll('.dropdown-item').forEach(function(item) {
			item.addEventListener('click', function() {
				var selectedValue = item.getAttribute('value');
				handleDropdownSelection(selectedValue);
			});
		});
	
		// Function to handle the dropdown item selection
		 function handleDropdownSelection(value) {
		   // Construct the URL based on the selected value
		   var selectedCategory = encodeURIComponent(value); // Ensure value is properly encoded
		
		   var redirectURL = "<%=request.getContextPath()%>/products?category="+ selectedCategory;
		
			// Redirect to the constructed URL
			window.location.href = redirectURL;
			
		}
		
		

    document.addEventListener("DOMContentLoaded", function() {
        	
 
    	// selecting all the size radio 
        var sizeRadios = document.querySelectorAll("input[name='rad']");
        sizeRadios[0].checked = true;
        
     	// select the input to append price  
        var selectedPrice = document.getElementById("selectedPrice");
        
       	// Add an event listener on change for each size radios 
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
            <%for (Price price : priceList) {%>
                "<%=price.getSize().getId()%>": <%=price.getPrice()%>,
            <%}%>
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
        
        // Function to check if existInBag parameter is present in the URL
        function checkExistInBagParameter() {
       	 
       	 
            const url = new URL(window.location.href);
            const existInBag = url.searchParams.get("existInBag");
            
            if (existInBag === "1") {
            	
                Swal.fire({
              	  icon: 'warning',
              	  text: 'product aldready exist in bag!',
      			showConfirmButton: false,
      			customClass: 'swal-wide',
      			timer: 2000
              	})
                
                // Remove the existInBag parameter from the URL
                url.searchParams.delete("existInBag");

                // Delay for 2 seconds (2000 milliseconds) before redirection
                setTimeout(function() {
                    // Redirect to the updated URL without existInBag parameter
                    window.location.href = url.toString();
                }, 2000);
            }
        }

        // Check for existInBag parameter on page load
        checkExistInBagParameter();

        
    });
    
    



    
    // on clicking the add to bag button

    document.getElementById("bag").addEventListener("click", function() {
    	
    	
/*         var selectedSize = getSelectedSize(); */
        
        <%HttpSession httpSession = request.getSession(false);%>
        
        <%if (httpSession != null && httpSession.getAttribute("userId") == null) {%>
        
        // if the user is not logged in alert
        
        Swal.fire({
        	  icon: 'warning',
        	  title: 'Oops...',
        	  text: 'login to add the bag!',
			  customClass: 'swal-wide',
			showConfirmButton: false,
			timer: 1000
        	})

        <%} else { %>

   
    	// selecting all the size radio 
        var sizeRadios = document.querySelectorAll("input[name='rad']");
    	
    	var sizeId = getSelectedSize();
    	
        function getSelectedSize() {
            for (var i = 0; i < sizeRadios.length; i++) {
                if (sizeRadios[i].checked) {
                	
                	console.log()
                	return sizeRadios[i].value;
                }
            }
            return null; // Return null if no size is selected
        }
 		
 		var productId = <%=product.getId()%>;
 		 
        // if the user logged in add to bag

         if (productId != null && sizeId !== null) {

        	 const Toast = Swal.mixin({
        		  toast: true,
        		  position: 'top-end',
        		  showConfirmButton: false,
        		  timer: 500,
        		  timerProgressBar: true,
        		  didOpen: (toast) => {
        		    toast.addEventListener('mouseenter', Swal.stopTimer)
        		    toast.addEventListener('mouseleave', Swal.resumeTimer)
        		  }
        		})

        		Toast.fire({
        		  icon: 'success',
        		  title: 'product added to bag'
        		})

	     var redirectURL = "user/bag?product_id=" + productId + "&size_id=" + sizeId; 
	     
	      window.location.href = redirectURL;
	         
	     	 }  
	     	   
        
        <% } %> 
               
    });

    
    
 


    
  
    </script>
</body>
</html>
