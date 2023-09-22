<!-- before login -->

<%-- Check if the user is in an active session --%>
<%
HttpSession httpSession = request.getSession(false);
%>

<%
if (httpSession != null && httpSession.getAttribute("userId") == null) {
%>

<header id="desktop-header">
	<nav class="navbar navbar-expand-lg">

		<div class="container-fluid d-flex justify-content-evenly">
			<a class="mx-1 navbar-brand" href="<%=request.getContextPath()%>/home"> <img
				src="<%=request.getContextPath()%>/assets/images/homepage-images/logo.png"
				alt="my fashion studio logo" />
			</a>

			<div
				class="me-5 collapse d-flex justify-content-evenly flex-basis-35% navbar-collapse"
				id="navbarSupportedContent">


				<ul class="navbar-nav mb-1 mb-lg-0 mx-auto">

					<li class="nav-item dropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="false" value=1>men
						<ul class="dropdown-menu " id="cate_men">
							<li class="dropdown-item" value="1">T-Shirt</li>
							<li class="dropdown-item" value="2">Shirts</li>
							<li class="dropdown-item" value="3">Jeans</li>
							<li class="dropdown-item" value="4">Trousers</li>
						</ul>
					</li>

				</ul>

				<ul class="navbar-nav mb-1 mb-lg-0 mx-auto">

					<li class="nav-item dropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="false" value=2>

						WOMEN

						<ul class="dropdown-menu" id="cate_women">
							<li class="dropdown-item" value="5">T-Shirt</li>
							<li class="dropdown-item" value="6">Shirts</li>
							<li class="dropdown-item" value="7">Jeans</li>
							<li class="dropdown-item" value="8">Skirts</li>
						</ul>
					</li>

				</ul>

				<ul class="all_section navbar-nav mb-1 mb-lg-0 mx-auto">

					<a href="<%=request.getContextPath()%>/products">
						<li class="nav-item">ALL</li>
					</a>


				</ul>

			</div>



			<form class="searchbar" role="search">
				<input class="form-control me-8 " type="search"
					placeholder="search for products,brands and more"
					aria-label="Search">


			</form>

			<button class="btn btn-dark seller_btn mx-3">
				<i class="fa-regular fa-user"></i> SELLER
			</button>

			<div class="mx-1 icons">
				<a href="<%=request.getContextPath()%>/login">
					<div id="profile">
						<div>
							<i class="fa-solid fa-user"></i>
						</div>
						<div id="account">login/signup</div>
					</div>
				</a>

				<%--         <a href="${root}/pages/homepage/login.html">
                <div><i class="fa-solid fa-heart"></i></div>
                <div>wishlist</div>
            </a> --%>

				<a href="<%=request.getContextPath()%>/login">
					<div>
						<i class="fa-solid fa-bag-shopping"></i>
					</div>
					<div>bag</div>
				</a>
			</div>

		</div>
	</nav>
</header>


<%
} else {
%>

<header id="desktop-header">
	<nav class="navbar navbar-expand-lg">

		<div class="container-fluid d-flex">

			<a class="mx-1 navbar-brand" href="<%=request.getContextPath()%>/home"> <img
				src="./assets/images/homepage-images/logo.png"
				alt="my fashion studio logo" />
			</a>

		<div class="me-5 collapse d-flex justify-content-evenly flex-basis-35% navbar-collapse">

				<ul class="navbar-nav mb-1 mb-lg-0 mx-auto">

					<li class="nav-item dropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="false" value=1>men
						<ul class="dropdown-menu " id="cate_men">
							<li class="dropdown-item" value="1">T-Shirt</li>
							<li class="dropdown-item" value="2">Shirts</li>
							<li class="dropdown-item" value="3">Jeans</li>
							<li class="dropdown-item" value="4">Trousers</li>
						</ul>
					</li>

				</ul>

				<ul class="navbar-nav mb-1 mb-lg-0 mx-auto">

					<li class="nav-item dropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="false" value=2>

						WOMEN

						<ul class="dropdown-menu" id="cate_women">


							<li class="dropdown-item" value="5">T-Shirt</li>
							<li class="dropdown-item" value="6">Shirts</li>
							<li class="dropdown-item" value="7">Jeans</li>
							<li class="dropdown-item" value="8">Skirts</li>

						</ul>
					</li>

				</ul>

				<ul class=" all_section navbar-nav mb-1 mb-lg-0 mx-auto">

					<a href="<%=request.getContextPath()%>/products">
						<li class="nav-item">ALL</li>
					</a>

				</ul>

			</div>





			<form class="searchbar" role="search">
				<input class="form-control me-10 " type="search"
					placeholder="search for products,brands and more"
					aria-label="Search">


			</form>

			<!--     <button class="btn btn-dark seller_btn mx-3"><i class="fa-regular fa-user"></i> SELLER </button>  -->


			<div class="mx-1 icons">

				<a href="<%=request.getContextPath()%>/my_profile">
					<div id="profile">
						<div>
							<i class="fa-solid fa-user"></i>
						</div>
						<div id="account">profile</div>
					</div>
				</a>

				<%--            <a href="${root}/pages/orders/wishlist.html">
                <div><i class="fa-solid fa-heart"></i></div>
                <div>wishlist</div>
            </a> --%>

				<a href="<%=request.getContextPath()%>/shoppingbag">
					<div>
						<i class="fa-solid fa-bag-shopping"></i>
					</div>
					<div>bag</div>
				</a>
			</div>

		</div>
	</nav>
</header>

<%
}
%>




