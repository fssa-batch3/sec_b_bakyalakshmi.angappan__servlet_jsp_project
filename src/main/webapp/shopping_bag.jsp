<%@page import="in.fssa.myfashionstudioapp.model.Address"%>
<%@page import="in.fssa.myfashionstudioapp.model.Bag"%>
<%@page import="in.fssa.myfashionstudioapp.model.OrderItem"%>
<%@page import="in.fssa.myfashionstudioapp.model.Size"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.fssa.myfashionstudioapp.model.Price"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
<link rel="stylesheet" href="./assets/css/shopping_bag.css">
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
<title>shopping-bag</title>
</head>
<body>

	<jsp:include page="header.jsp" />

	<%
	HttpSession httpSession = request.getSession(false);

	List<Bag> bagList = null;

	if (httpSession != null) {
		bagList = (List<Bag>) httpSession.getAttribute("bag_list");
	}
	%>



	<div class="line"></div>

	<div>
		<h2 class="heading_top">shopping bag</h2>
	</div>


	<%
	if (bagList != null && !bagList.isEmpty()) {
	%>


	<!-- find the address and get as request   -->

	<%
	Address address = (Address) request.getAttribute("address");
	%>


	<div class="main_content">
		<div class="container">

			<c:choose>
				<c:when test="${address != null}">
					<div class="address">
						<div>
							<p>Deliver to:</p>
							<div class="filladdress"><%=address.getAddress()%>
								,
								<%=address.getCity()%>
								-
								<%=address.getPincode()%></div>
						</div>
						
						
						<a href="<%=request.getContextPath()%>/address/edit?address_id=<%= address.getId() %>&source=bag">
							<div class="edit btn">
								EDIT
							</div>
						</a>
						

					</div>
				</c:when>
				<c:otherwise>
					<div class="address">
						<div>
							<p style="font-size: 16px; color: red;" class="blink">Kindly
								Add your delivery address to place order !</p>

						</div>

						<a href="<%=request.getContextPath()%>/address/add?source=bag">
							<div class="add btn">
								<i class="fa-solid fa-plus"></i> ADD NEW ADDRESS
							</div>
						</a>

					</div>
				</c:otherwise>
			</c:choose>




			<div class="order_list">
				<%
				for (Bag item : bagList) {
				%>

				<%
				Size size = item.getPrice().getSize();
				%>


				<div class="order_details">

					<a
						href="<%=request.getContextPath()%>/removefrombag?product_id=<%=item.getProduct().getId()%>&size_id=<%=size.getId()%>">
						<div class="x-mark">
							<i class="fa-solid fa-xmark"></i>
						</div>
					</a>

					<div class="product_thumbnail">
						<img src="<%=item.getProduct().getImage()%>"
							alt="<%=item.getProduct().getName()%>">
					</div>

					<div class="product_list">

						<div class="product_details">

							<h4 class="brand_name"></h4>
							<p class="product_name"><%=item.getProduct().getName()%></p>
						</div>

						<div>



							<label><b>Size:</b></label> <span class="span_size"> <%=size.getValue()%>
							</span>

							<form action="updatequantity" method="POST">
								<label><b>Qty:</b></label>
								 <select class="quantity"
									id="quantitySelect_<%=item.getProduct().getId()%>_<%=size.getId()%>"
									name="quantity" value="<%=item.getQuantity()%>" required
									onchange="this.form.submit()">

									<option selected disabled hidden>

										<%=item.getQuantity()%>

									</option>
									<option value="1" class="opt">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>

								</select>

								<!-- Include other form inputs as needed -->
								<!-- For example, hidden inputs to capture product and size IDs -->
								<input type="hidden" name="product_id"
									value="<%=item.getProduct().getId()%>"> <input
									type="hidden" name="size_id" value="<%=size.getId()%>">
							</form>

							<%-- <select class="quantity" value="<%= item.getQuantity() %>" data-product_id="<%=item.getId() %>"data-size_id="<%=item.getId() %>" required> --%>

						</div>

						<div>

							<!-- loop and get product price -->



							<%
							Price price = item.getPrice();
							%>

							<!-- Total Price - (Total Price * (Percentage Discount / 100))  -->

					

							<span class="product_price"> Rs.<%=item.getQuantity() * price.getCurrentPrice() %></span>

							<span class="original_price"><del>
									Rs.<%=item.getQuantity() * Math.round(price.getPrice()) %></del></span> <span class="product_offer"> (<%=(int) price.getOffer()%>
								% off)
							</span>
						</div>

						<div>
							delivery in <span class="date">2 days</span>
						</div>

					</div>



				</div>

				<%
				}
				%>

			</div>

		</div>

		<%
		ArrayList<Bag> bagList1 = (ArrayList<Bag>) session.getAttribute("bag_list");

		int Sum = 0;
		if (bagList1 != null) {

			for (Bag item : bagList1) {

				Sum += item.getQuantity() * item.getPrice().getCurrentPrice();

			}

		}
		%>

		<%
		httpSession.setAttribute("total_price", Sum);
		%>



		<!-- sidecontainer -->
		<div class="side_container">

			<div class="details">
				<h3>bag total</h3>
				<table>
					<caption></caption>
					<tbody>
						<tr>
							<th></th>
						</tr>


						<tr class="table_row">
							<td>sub-total</td>
							<td>Rs.<%=Sum%></td>
						</tr>

						<tr>
							<td>TOTAL AMOUNT</td>
							<td>Rs.<%=Sum%></td>
						</tr>

					</tbody>
				</table>

				<div class="placeorder">
					<small>cash on delivery only<small>


							<form action="placeorder" method="post">

								<input type="hidden" name="delivery_address_id"
									id="delivery_address_id"
									value="<%=address != null ? address.getId() : null%>">
								<button type="submit">place order</button>
							</form>
				</div>
			</div>

		</div>

		<!-- sidecontainer -->
	</div>

	<%
	} else {
	%>
	<!-- Display a "No Products" message if the session is null or bagList is empty -->
	<div class="no-products-message"
		style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 60vh; font-size: 100px; color: #fff;">
		<i class="fa-solid fa-face-frown"
			style="font-size: 100px; margin-bottom: 20px; color: #eee;"></i>
		<p style="font-size: 40px; color: #eee;">There are no products in
			your shopping bag.</p>
	</div>

	<%
	}
	%>




	<div class="line"></div>



	<!-- change address -->
	<div class="inputcontainer">

		<div class="inputchangeaddress">
			<h5>change address</h5>
			<div class="changeaddressx-mark">
				<i class="fa-solid fa-xmark"></i>
			</div>
			<!-- dynamic change address -->
			<div class="alllocaladdress"></div>

			<button class="btn add">add new address</button>
		</div>

	</div>


	<script
		src="<%=request.getContextPath()%>/js/vendor/bootstrap.bundle.js"></script>

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