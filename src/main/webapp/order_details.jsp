<%@page import="in.fssa.myfashionstudioapp.model.OrderItem"%>
<%@page import="in.fssa.myfashionstudioapp.dto.OrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

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
<link rel="stylesheet" href="./assets/css/order_details.css">
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
<title>order-details</title>


</head>
<body>


	<jsp:include page="header.jsp" />

	<%
	OrderDTO order = (OrderDTO) request.getAttribute("order");
	%>
	
	<% System.out.print(order); %>

	<div class="heading_top">
		<h2>Order Details</h2>
	</div>

	<div class="container">


		<div class="order_id">
		<b>
			ORDER ID #
			<%=order.getOrderCode()%></b>
		</div>

		<%
		List<OrderItem> orderItemList = order.getOrderItemList();
		%>

		<%
		System.out.print(orderItemList);
		%>




		<div class="product_details_container">



			<div class="othercontainer">
				<div class="otherorders">
					<h5>Items in this order</h5>
				</div>

				<%
				for (int i = 0; i < orderItemList.size(); i++) {
				%>

				<%
				OrderItem orderItem = orderItemList.get(i);
				%>


				<div class="order_list">
					<div class="product_thumbnail">
						<img class="product_image" width="100px"
							src="<%=orderItem.getProduct().getImage()%>" alt="Women">
					</div>

					<div class="details">
						<p class="itembrand_name"></p>
						<p class="itemproduct_name"><%=orderItem.getProduct().getName()%></p>

						<div class="itemproduct_sizeandqty">
							<p class="itemproduct_size">
								size:
								<%=orderItem.getPrice().getSize().getValue()%></p>

							<p>
								qty:
								<%=orderItem.getQuantity()%></p>

						</div>

						<p>
							rs:
							<%=orderItem.getPrice().getPrice()%></p>
						
							
							<a class="cancel_link" href="<%= request.getContextPath() %>/cancelorder?order_item_id=<%= orderItem.getId() %>" style="<% if (orderItem.isCancel()) { %>display: none;<% } else { %>display: inline-block;<% } %>">Cancel Item</a>
					</div>


						<span class="status"><%= orderItem.isCancel() ? "cancelled" : orderItem.getStatus()  %></span>

					<div class="arrowmark">
						<i class="fa-solid fa-chevron-right"></i>
					</div>


				</div>

			</div>




			<%
			}
			%>


			<div class="delivery_address">
				<h5>Delivery Address</h5>

				<div class="address">
					<div>
						<p><%=order.getUser().getUserName()%></p>
					</div>

					<div class="filladdress">No 114, Valluvan Street, Otteri ,
						Near School , Chennai - 600012.</div>
				</div>
			</div>


			<div>
				<div class="Total_order_price">
					<h5>Total order price</h5>

					<div class="total_price">
						Rs.<%=order.getTotalPrice()%></div>
				</div>
			</div>




			<!--             <div class="seller_details">
                Seller: Globus stores Private Ltd.
            </div>
 -->


		</div>
		

<script src="<%= request.getContextPath() %>/js/vendor/bootstrap.bundle.js"></script>

<script type="text/javascript">

			//Detect when the user navigates back
			window.onpopstate = function(event) {
			    // Reload the current page
			    window.open(location.href, '_self');
			};
			
			
				function redirectToServlet(orderId) {
					window.location.href = 'order_details?order_id=' + orderId;
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