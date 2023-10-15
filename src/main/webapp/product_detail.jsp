<%@page import="com.google.gson.Gson"%>
<%@page import="in.fssa.myfashionstudioapp.model.Bag"%>
<%@page import="in.fssa.myfashionstudioapp.model.Price"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.myfashionstudioapp.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/bootstrap css/bootstrap.css">
<!-- link for the common css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/header.css">
<!-- -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/product_details.css">
<!-- script for sweet alert -->
<script
	src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js
">
</script>
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


			<div class="inputsizecontainer">


				<h5 class="headingsizechart">
					Size chart <i class="fa-solid fa-xmark sizeclose"></i>
				</h5>

			</div>

		</div>


		<div class="leftside">
			<div class="product_image">
				<img id="product_image" src=" <%=product.getImage()%>"
					alt="Typography Printed Cotton Casual T-Shirt">
			</div>
		</div>

		<div class="rightside">
			<div class="names">
				<h3 id="brand_name"></h3>
				<h5 id="product_name"><%=product.getName()%></h5>
			</div>
			<div class="prices">

				<div class="current_price"></div>
				<div class="product_offer">
					<del id="mrp_price"></del>
					<b id="offer"></b>
				</div>
			</div>

			<div class="color">color : <span style="background-color: <%= product.getColor().getColorHexCode() %>; width: 12px; height: 12px; padding:0px 10px;margin-right:7px"></span> <%=product.getColor().getColorName() %> </div>
			<p class="headingsize">Select size</p>
		<!-- 	<p class="sizechart">sizechart</p> -->
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

			<p class="sizealert"></p>

			<div class="buttons">
				<button class="addtobag" id="bag">ADD TO BAG</button>
				<!-- 				<button class="wishlist" id="wishlist">wishlisted</button> -->
			</div>
			<div class="product_details">
				<h5>product information</h5>

				<div class="accordion">
					<h6>Product details</h6>
				</div>
				<div class="panel" style="display: block;">


					<div class="chlidpanel">

						<div class="firstchlidpanel">

							<div class="components">
								<p class="attribute-key">Pattern</p>
								<p class="attribute-value"><%=product.getPattern()%></p>
							</div>

							<div class="components">
								<p class="attribute-key">Fit</p>
								<p class="attribute-value"><%=product.getFit()%></p>
							</div>

							<div class="components">
								<p class="attribute-key">Material</p>
								<p class="attribute-value"><%=product.getMaterial()%></p>
							</div>

							<div class="components">
								<p class="attribute-key">Length</p>
								<p class="attribute-value"><%=product.getLength()%></p>
							</div>

						</div>

						<div class="Secondchlidpanel">

							<c:if test="${not empty product.getNecklineType()}">

								<div class="components">
									<p class="attribute-key">Neckline Type</p>
									<p class="attribute-value"><%=product.getNecklineType()%></p>
								</div>

							</c:if>

							<c:if test="${not empty product.getSleeveType()}">

								<div class="components">
									<p class="attribute-key">Sleeve Type</p>
									<p class="attribute-value"><%=product.getSleeveType()%></p>
								</div>

							</c:if>


							<c:if test="${not empty product.getRiseType()}">
								<div class="components">
									<p class="attribute-key">Rise Type</p>
									<p class="attribute-value"><%=product.getRiseType()%></p>
								</div>
							</c:if>
							
							<c:if test="${not empty product.getClosureType()}">

								<div class="components">
									<p class="attribute-key">Closure Type</p>
									<p class="attribute-value"><%=product.getClosureType()%></p>
								</div>

							</c:if>

							<div class="components">
								<p class="attribute-key">Occasion</p>
								<p class="attribute-value"><%=product.getOccasion()%></p>
							</div>

							<div class="components">
								<p class="attribute-key">Care</p>
								<p class="attribute-value"><%=product.getCare()%></p>
							</div>
						</div>

					</div>

				</div>



				<div class="accordion">
					<h6>Product Description</h6>
				</div>
				<div class="panel">
					<p><%=product.getDescription()%></p>
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

	        /* size script */	
	        
		
        var priceData = {
                // Define prices for each size
                <%for (Price price : priceList) {%>
                
                    "<%=price.getSize().getId()%>": {
                    	"mrp_price":<%=(int) price.getPrice()%>,
                    	"offer":<%=price.getOffer()%>,
                    	"current_price":<%=price.getCurrentPrice() %>
                    },
                    
                <%}%>
            };

 
    	// selecting all the size radio 
        var sizeRadios = document.querySelectorAll("input[name='rad']");
        // default price to be shown
        sizeRadios[0].checked = true;
        
        var selectedPrice = document.querySelector(".current_price");
        var selectedMrpPrice =  document.querySelector("#mrp_price");
        var selectedOffer=  document.querySelector("#offer");
        
        
      	// Add an event listener on change for each size radios 
        sizeRadios.forEach(function(radio) {
            radio.addEventListener("change", function() {
                var selectedSize = radio.value;
   
                var selectedPriceData = priceData[selectedSize];
              	var mrpPrice = selectedPriceData.mrp_price;
                var offer = selectedPriceData.offer;
                var cuurentPrice = selectedPriceData.current_price;
                
                selectedPrice.textContent =  " RS." + cuurentPrice; 
                selectedMrpPrice.textContent = "MRP RS."+ mrpPrice;
                selectedOffer.textContent ="("+offer+"%OFF)";
                
            });
        });


        
        function getPriceData(selectedSize){
        	return priceData[selectedSize];
        	
        }
        
 
        var firstSize = Object.keys(priceData)[0];
        var firstPriceData = priceData[firstSize];
        var mrpPrice = firstPriceData.mrp_price;
        var offer = firstPriceData.offer;
        var currentPrice = firstPriceData.current_price;
        
        selectedPrice.textContent = "RS." + currentPrice; // Display default price
        selectedMrpPrice.textContent = "MRP RS."+ mrpPrice;
        selectedOffer.textContent ="("+offer+"%OFF)";

        
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
        
        var acc = document.getElementsByClassName("accordion");
        var i;

        for (i = 0; i < acc.length; i++) {
          acc[i].addEventListener("click", function () {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.display === "block") {
              panel.style.display = "none";
            } else {
              panel.style.display = "block";
            }
          });
        }

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

        <%} else {%>

   
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
	     	   
        
        <%}%> 
               
    });
    

    </script>
</body>
</html>
