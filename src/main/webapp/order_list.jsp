<%@page import="in.fssa.myfashionstudioapp.model.OrderItem"%>
<%@page import="in.fssa.myfashionstudioapp.dto.OrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="./assets/css/header.css">
<link rel="stylesheet" href="./assets/css/style.css">

<link rel="stylesheet" href="./assets/css/order_list.css">
<link rel="stylesheet" href="./assets/css/order_details.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">

<link rel="stylesheet" href="./assets/css/bootstrap css/bootstrap.css">

<link rel="stylesheet" href="product_list.css">


<title>order-list</title>

</head>
<body>

	<!-- Include the header.jsp file here -->
	<jsp:include page="header.jsp" />

	<div class="heading_top">
		<h2>My orders</h2>
	</div>


	<%
	List<OrderDTO> orderList = (List<OrderDTO>) request.getAttribute("orderList");
	%>

	<%
	System.out.println(orderList);
	%>

	<div class="fullcontainer">

		<%
		for (OrderDTO orderDTO : orderList) {
		%>




		<div class="fluid-container"
			onclick="redirectToServlet('<%=orderDTO.getOrderCode()%>')">

			<div class="product_delivery">

				<div class="product_order">
					<p>
						order Id #<%=orderDTO.getOrderCode()%></p>
					<p>
						ordered at #<%=orderDTO.getOrderredAt()%></p>
				</div>

				<%
				List<OrderItem> OrderItemList = orderDTO.getOrderItemList();
				%>

				<%
				OrderItem firstOrderItem = OrderItemList.get(0);
				%>

				<%
				if (OrderItemList.size() != 1) {
				%>

				<div class="orderpicture">

					<div class="smallglimpse">

						<%
						for (int i = 1; i < OrderItemList.size(); i++) {

							OrderItem orderItem = OrderItemList.get(i);

							System.out.println(orderItem.getProduct().getName());
						%>
						<img class="img1" src="<%=orderItem.getProduct().getImage()%>"
							alt="<%=orderItem.getProduct().getName()%>">
						<%
						}
						%>


					</div>

					<span class="spanproduct"> + <%=OrderItemList.size() - 1%>
						Items <span></span></span>
				</div>

				<%
				}
				%>

			</div>

			<div class="order_list">
				<div class="product_thumbnail">
					<img class="product_image"
					style="width:109px;" src="<%=firstOrderItem.getProduct().getImage()%>" alt="Women">
				</div>

				<div class="details">
					<p class="itembrand_name"></p>
					<p class="itemproduct_name"><%=firstOrderItem.getProduct().getName()%></p>

					<div class="itemproduct_sizeandqty">
						<p class="itemproduct_size">
							size:
							<%=firstOrderItem.getPrice().getSize().getValue()%></p>

						<p>
							qty:
							<%=firstOrderItem.getQuantity()%></p>

					</div>

					<p>
						rs:
						<%=firstOrderItem.getPrice().getPrice()%></p>

					<a class="cancel_link" href="<%= request.getContextPath() %>/cancelorder?order_item_id=<%= firstOrderItem.getId() %>" style="<% if (firstOrderItem.isCancel()) { %>display: none;<% } else { %>display: inline-block;<% } %>">Cancel Item</a>

				</div>

				<span class="status"><%= firstOrderItem.isCancel() ? "cancelled" : firstOrderItem.getStatus()  %></span>

				<div class="arrowmark">
					<i class="fa-solid fa-chevron-right"></i>
				</div>

			</div>

		</div>	
		</a>

		<%
		}
		%>

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