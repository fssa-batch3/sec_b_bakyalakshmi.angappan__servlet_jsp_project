<%@page import="in.fssa.myfashionstudioapp.model.Category"%>
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

<script
	src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js
"></script>
<link
	href="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css
"
	rel="stylesheet">


<title>product-list</title>

</head>
<body>

	<!-- Include the header.jsp file here -->
	<jsp:include page="header.jsp" />

	<%
	List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");
	%>

	<%
	Category category = (Category) request.getAttribute("category");

	// from search servlet
	String categoryName = (String) request.getAttribute("categoryName");
	String genderName = (String) request.getAttribute("genderName");
	%>

	<main>
		<div class="heading_top">
			<h3 class="heading_top_gender">



				<!-- for gender name from the category || gender name -->
				<%= (category != null || genderName != null) 
		? ((category != null) ? category.getGender().getName() : genderName): "" %></h3>

			<!-- for category name from the category || category name -->
			<h1 class="heading_top_category"><%=(category != null || categoryName != null) ? ((category != null) ? category.getName() : categoryName) : "ALL PRODUCTS"%></h1>

			<div class="sort_container">
				<small class="totalproduct"><%=productList.size()%> Items
					Found</small>

			</div>

		</div>

		<div class="products">

			<%
			for (ProductDTO product : productList) {
			%>


			<div class="smallcontainer"
				onclick="redirectToServlet(<%=product.getId()%>)">
				<div class="images">
					<img class="product_image" src="<%=product.getImage()%>"
						alt="<%=product.getName()%>">
				</div>
				<div class="names">
					<h4 class="product_name"><%=product.getName()%></h4>
				</div>

				<%
				Price price = product.getPriceList().get(0);
				%>
				<div class="prices">


					<span class="current_price">RS.<%=price.getCurrentPrice()%>
					</span><span class="mrp_price"><del>
							RS.<%= (int) price.getPrice()%></del></span><span class="product_offer">
						(<%=(int) price.getOffer()%> % off)
					</span>
				</div>
			</div>


			<%
			} // end productList loop
			%>
		</div>



			<% if(productList.size() != 0){ %>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">

				<%
				String categoryParam = "";
				if (category != null) {
					categoryParam = "&category=" + category.getId();
				}

				int totalPageCount = 20;
				int pagesToShow = 10;
				int currentPage = 1;
				if (request.getParameter("p") != null) {
					currentPage = Integer.parseInt(request.getParameter("p"));
				}

				String searchParam = "";

				if (request.getParameter("q") != null) {
					searchParam = "&q=" + request.getParameter("q");
				}

				int clampStart = Math.max(currentPage - (pagesToShow / 2), 1);
				int clampEnd = Math.min(currentPage + (pagesToShow / 2), totalPageCount);
				%>


				<li class="page-item <%=currentPage == 1 ? "disabled" : ""%>"><a
					class="page-link"
					href="<%=request.getContextPath()%>/products?p=<%=currentPage - 1%><%=categoryParam%>">Previous</a></li>

				<%
				for (int pageno = clampStart; pageno <= clampEnd; pageno++) {
				%>
				<li class="page-item <%=pageno == currentPage ? "active" : ""%>">

					<%
					if (request.getParameter("q") != null) {
					%> <a class="page-link"
					href="<%=request.getContextPath()%>/search?p=<%=pageno%><%=searchParam%>"><%=pageno%></a>
					<%
					} else {
					 %> <a class="page-link"
					href="<%=request.getContextPath()%>/products?p=<%=pageno%><%=categoryParam%>">
						<%=pageno%></a> <%
					 }
					 %>
				</li>
				<%
				}
				%>

				<li class="page-item<%=currentPage == 20 ? "disabled" : ""%>"><a
					class="page-link"
					href="<%=request.getContextPath()%>/products?p=<%=currentPage + 1%><%=categoryParam%>">Next</a></li>

			</ul>
		</nav>
		
					<% } %>

	</main>


	<div class="line"></div>


	<script
		src="<%=request.getContextPath()%>/js/vendor/bootstrap.bundle.js"></script>

	<script type="text/javascript">

			// Function to handle the dropdown item selection
			 function handleDropdownSelection(value) {
			   var selectedCategory = value;
			
			   var redirectURL = "<%=request.getContextPath()%>/products?category="+ selectedCategory;
				window.location.href = redirectURL;
			}

			// Add an event listener for each dropdown item
			document.querySelectorAll('.dropdown-item').forEach(function(item) {
				item.addEventListener('click', function() {
					var selectedValue = item.getAttribute('value');
					handleDropdownSelection(selectedValue);
				});
			});
				
				
		   function redirectToServlet(productId) {
			   
		        window.location.href ="product?product_id="+ productId;
		    }
		   

	        
		</script>


</body>
</html>
