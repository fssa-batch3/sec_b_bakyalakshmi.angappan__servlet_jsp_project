<%@page import="in.fssa.myfashionstudioapp.model.Price"%>
<%@page import="in.fssa.myfashionstudioapp.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

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

<!-- link for the image in the title  -->
<link rel="icon" href="./assets/images/homepage-images/mobile logo.png"
	sizes="96×96" type="image/png">

<!-- link for the bootstrap css -->
<link rel="stylesheet" href="./assets/css/bootstrap css/bootstrap.css">
<!-- link for the common css -->
<link rel="stylesheet" href="./assets/css/header.css">
<link rel="stylesheet" href="./assets/css/product_list.css">
<!-- -->
<link rel="stylesheet" href="./assets/css/style.css">

<!-- style for preloader  -->
<style type="text/css">

#preloader{
	background: #000;
	height: 100vh;
	width:100%;
	position:fixed;
	z-index:100;
}

</style>

<title>My Fashion Studio</title>

</head>

<body>

	<jsp:include page="header.jsp" />

	<%
	List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");
	%>

	<%
	System.out.print(productList);
	%>
	
	<div id="preloader" style="display:none;"></div> 

	<!-- main content -->
	<div class="container-fluid">

		<section class="banner1">
			<div class="bannerone">
				<div class="banner1sub">
					<div>
						<h1>WARDROBE CLASSICS</h1>
						<P>from the quintesstial White tee to blue jean basics & more</P>
					</div>

					<div>
						<img class="firstimg"
							src="./assets/images/homepage-images/banners/banner1-img.png"
							alt="">
					</div>
				</div>
			</div>
		</section>

		<section>

			<div class="categories">
				<h1>categories</h1>
				<div class="categories_list column-gap-5">


					<div onclick="redirectToProductsServlet(2)">

						<!-- men shirts -->
						<img src="./assets/images/categories_images/men-shirt.jpg" alt="">
						<h4>shirts</h4>

					</div>

					<!-- men jeans -->
					<div onclick="redirectToProductsServlet(3)">
						<img src="./assets/images/categories_images/men-jeans.jpg" alt="">
						<h4>jeans</h4>

					</div>

					<!-- men t-shirts -->

					<div onclick="redirectToProductsServlet(1)">
						<img src="./assets/images/categories_images/tshirt.jpg" alt="">
						<h4>t-shirts</h4>

					</div>


					<div onclick="redirectToProductsServlet(5)">

						<img src="./assets/images/categories_images/women-tshirt.jpg"
							alt="">
						<h4>t-shirts</h4>

					</div>



					<div onclick="redirectToProductsServlet(4)">
						<img src="./assets/images/categories_images/trousers.jpg" alt="">
						<h4>trousers</h4>

					</div>



					<div onclick="redirectToProductsServlet(8)">

						<img src="./assets/images/categories_images/skirts.jpg" alt="">
						<h4>skirts</h4>

					</div>

				</div>
			</div>
		</section>

		<section>
			<div class="deals">
				<h1>latest products</h1>

				<div class="categories_list">
					<div class="products">
						<%
						// Set a counter to limit the loop to four iterations
						int loopCounter = 0;

						for (ProductDTO product : productList) {
							// Limit the loop to four iterations
							if (loopCounter < 4) {
						%>
						<div class="smallcontainer"
							onclick="redirectToServlet(<%=product.getId()%>)">
							<div class="images">
								<img class="product_image" src="<%=product.getImage()%>"
									alt="<%=product.getName()%>"
									style="width: 253px; height: 316px;">
							</div>
							<div class="names">
								<h4 class="product_name"><%=product.getName()%></h4>
							</div>
						
							<% Price price = product.getPriceList().get(0); %>
						<div class="prices">
					
						
							<span class="current_price">RS.<%= price.getCurrentPrice() %> </span><span class="mrp_price"><del>RS.<%= (int)price.getPrice() %></del></span><span
								class="product_offer"> (<%= (int) price.getOffer() %> % off)</span>
						</div>
						
						</div>
						<%
						// Increment the loop counter
						loopCounter++;
						} // end if
						} // end productList loop
						%>
					</div>

				</div>


			</div>
		</section>

		<section>
			<div class="delivery">
				<i class="fas fa-shipping-fast"></i> <span>free delivery on
					every order</span>
			</div>
		</section>

		<!-- features -->

		<section class="features">

			<div class="features">
				<div>
					<i class="fa-solid fa-circle-check"></i>
					<h2>assured quality</h2>
				</div>

				<div>
					<i class="fa-solid fa-hand-holding-heart"></i>
					<h2>100% handpicked</h2>
				</div>

				<div>
					<i class="fas fa-shipping-fast"></i>
					<h2>superfast delivery</h2>
				</div>
			</div>
		</section>



		<footer> </footer>


		<script src="./js/vendor/bootstrap.bundle.js"></script>

		<script type="text/javascript">

		document.onreadystatechange = () => {
			  if (document.readyState === "loading") {
				  var loader = document.getElementById("preloader");
				  loader.style.display="block"; 
				  
				  console.log("sdnjs");
			  }
		};
		
		/* header scripts */
		
		  // Function to handle the dropdown item selection
		 function handleDropdownSelection(value) {
		   // Construct the URL based on the selected value
		   var selectedCategory = encodeURIComponent(value); // Ensure value is properly encoded
		
		   var redirectURL = "<%=request.getContextPath()%>/products?category="+ selectedCategory;
		
			// Redirect to the constructed URL
			window.location.href = redirectURL;
		}

			// Add an event listener for each dropdown item
			document.querySelectorAll('.dropdown-item').forEach(function(item) {
				item.addEventListener('click', function() {
					var selectedValue = item.getAttribute('value');
					handleDropdownSelection(selectedValue);
				});
			});
			
		/* search scripts */
		
		function validateForm() {
        var searchInput = document.querySelector('input[name="q"]').value.trim();

        if (searchInput.length === 1) {
            return false;
        }
        return true;
   		}
        
 
        
		   function redirectToProductsServlet(categoryId) {
			   
		        window.location.href ="products?category="+ categoryId;
		   }
				
		
		   function redirectToServlet(productId) {
			   
		        window.location.href ="product?product_id="+ productId;
		    }

		</script> 
</body>



</html>