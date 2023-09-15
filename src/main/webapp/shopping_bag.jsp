<%@page import="in.fssa.myfashionstudioapp.model.Size"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.fssa.myfashionstudioapp.model.Price"%>
<%@page import="in.fssa.myfashionstudioapp.model.Bag"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./assets/css/shopping_bag.css">

<link rel="stylesheet" href="./assets/css/header.css">
<link rel="stylesheet" href="./assets/css/footer.css">
<link rel="stylesheet" href="./assets/css/myorder.css">
<link rel="stylesheet" href="./assets/css/shopping_bag.css">

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


	<div class="main_content">
		<div class="container">

			<div class="address">
				<div>
					<p>Deliver to: bakya</p>
					<div class="filladdress">no 513 rr nagar , Kodungaiyur ,
						chennai - 12</div>
				</div>

				<div class="changeaddress">
					<button>change address</button>
				</div>
			</div>

			<div class="order_list">
				<%
				for (Bag item : bagList) {
				%>

				<div class="order_details">

					<a
						href="<%=request.getContextPath()%>/removefrombag?product_id=<%=item.getId()%>&size_id=<%=item.getSize().getId()%>">
						<div class="x-mark">
							<i class="fa-solid fa-xmark"></i>
						</div>
					</a>

					<div class="product_thumbnail">
						<img src="<%=item.getImage()%>" alt="<%=item.getName()%>">
					</div>

					<div class="product_list">

						<div class="product_details">

							<h4 class="brand_name"></h4>
							<p class="product_name"><%=item.getName()%></p>
						</div>

						<div>


							<%
							Size size = item.getSize();
							%>

							<label><b>Size:</b></label> <span class="span_size"> <%=size.getValue()%>
							</span> <label><b>Qty:</b></label>

							<form action="updatequantity" method="POST">

								<select class="quantity"
									id="quantitySelect_<%=item.getId()%>_<%=item.getSize().getId()%>"
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
									value="<%=item.getId()%>"> <input type="hidden"
									name="size_id" value="<%=item.getSize().getId()%>">
							</form>

							<%-- <select class="quantity" value="<%= item.getQuantity() %>" data-product_id="<%=item.getId() %>"data-size_id="<%=item.getId() %>" required> --%>

						</div>

						<div>

							<!-- loop and get product price -->


							<%
							List<Price> priceList = item.getPriceList();
							%>

							<%
							for (Price price : priceList) {
							%>

							<span class="product_price"> Rs.<%=item.getQuantity() * price.getPrice()%></span>

							<%
							}
							%>

							<!--   <span class="original_price"><del></del></span>
        <span class="product_offer"> ( % off)</span> -->
						</div>

						<div>
							delivery in <span class="date">2 days</span>
						</div>

						<div class="buttons">
							<div>
								<button class="movetobag" data-bag_id="">move to
									wishlist</button>
							</div>
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

		double Sum = 0;
		if (bagList1 != null) {

			for (Bag bag : bagList1) {
				List<Price> priceList = bag.getPriceList();

				for (Price price : priceList) {
			Sum += bag.getQuantity() * price.getPrice();

				}

			}
		}
		%>

		<%
		httpSession.setAttribute("sum", Sum);
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
							<td>total amount</td>
							<td>Rs.<%=Sum%></td>
						</tr>

					</tbody>
				</table>

				<div class="placeorder">
					<small>cash on delivery only<small>
							<button type="submit">place order</button>
				</div>
			</div>

		</div>

		<!-- sidecontainer -->
	</div>

	<%
	}

	else {
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





</body>
</html>