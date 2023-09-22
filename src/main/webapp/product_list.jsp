<%@page import="in.fssa.myfashionstudioapp.model.Price"%>
<%@page import="in.fssa.myfashionstudioapp.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="./assets/css/bootstrap css/bootstrap.css">
<!-- link for the common css -->
<link rel="stylesheet" href="./assets/css/header.css">
<!-- -->
<link rel="stylesheet" href="./assets/css/product_list.css">

<!-- script for sweet alert -->

<script src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js
"></script>
<link href="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css
" rel="stylesheet">


<title>product-list</title>

</head>
<body>

	<!-- Include the header.jsp file here -->
	<jsp:include page="header.jsp" />

	<%
	List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");
	%>

	<main>
		<div class="heading_top">
			<h3 class="heading_top_gender"></h3>
			<h1 class="heading_top_category">all products</h1>
			<small class="totalproduct"><%=productList.size()%> Items
				Found</small>
		</div>

		<div class="products">

			<%
			for (ProductDTO product : productList) {
			%>
<%-- 			<a href="product?product_id=<%=product.getId()%>"
				style="width: 286px"> --%>
				<div class="smallcontainer" onclick="redirectToServlet(<%= product.getId() %>)">
					<div class="images">
						<img class="product_image" src="<%=product.getImage()%>"
							alt="<%=product.getName()%>" style="width: 253px; height: 316px;">
					</div>
					<div class="names">
						<h4 class="product_name"><%=product.getName()%></h4>
					</div>

					<%
					List<Price> priceList = product.getPriceList();
					for (Price price : priceList) {
					%>

					<div class="prices">
						<span class="size">size : <%=price.getSize().getValue()%></span> <span
							class="current_price">RS.<%=price.getPrice()%></span>
					</div>
					<%
					} // end priceList loop
					%>
				</div>

<!-- 			</a> -->
			<%
			} // end productList loop
			%>
		</div>
	</main>

	<div class="line"></div>


	<script src="<%= request.getContextPath() %>/js/vendor/bootstrap.bundle.js"></script>

	<script type="text/javascript">
		
		   function redirectToServlet(productId) {
			   
		        window.location.href ="product?product_id="+ productId;
		    }
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
		</script>
	

</body>
</html>
