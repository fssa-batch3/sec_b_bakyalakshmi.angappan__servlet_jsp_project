<%@page import="in.fssa.myfashionstudioapp.model.User"%>
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
<link rel="stylesheet" href="./assets/css/account.css">
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

<title>profile</title>
</head>
<body>

<jsp:include page="header.jsp" />


<% User user = (User) request.getAttribute("user"); %>


	<main>

		<div class="header-account">
			<div class="">
				<h2>Your Profile</h2>
			</div>

			<div>
				<a href="<%=request.getContextPath()%>/logout" class="logout">
				<span id="logout" onClick="logOut()">Log out</span> <i
					class="fa-solid fa-chevron-right"></i>
					</a>
			</div>
		</div>

		<div class="account">

			<div class="addressbook">

				<div class="heading">
					<h5>Address Book</h5>
				</div>

				<!-- <i class="fa-solid fa-location-dot"></i> -->

				<div class="createdAddress"></div>



				<div class="add btn">
					<i class="fa-solid fa-plus"></i> ADD NEW ADDRESS
				</div>


			</div>

			<!-- Html code for add address page -->



			<div class="profile_details">
				<div class="profile_details_table">

					<div class="heading">
						<div>
							<h3>profile details</h3>
						</div>

						<!-- unused code to delete a user -->

						<!-- <div>
                                    <button id="remove" onClick="del(event)"><i class="fa-solid fa-trash"></i></button>
                                </div> -->
					</div>

					<table id="user_data">

						<caption></caption>

						<tr>
							<th></th>
						</tr>

							<tr>
								<td>User Name</td>
								<td id="username"> <%= user.getUserName() %></td>
							</tr>

							<tr>
								<td>Mobile Number</td>
								<td id="mobile_number"> <%= user.getPhoneNumber() %></td>
							</tr>

							<tr>
								<td>Email Address</td>
								<td id="email"><%= user.getEmail() %></td>
							</tr>

				<%-- 			<tr>
								<td>Gender</td>
								<td id="gender"><%= user %></td>
							</tr> --%>

				<!-- 			<tr>
								<td>Date of Birth</td>
								<td id="dateofbirth"></td>
							</tr> -->

							<!-- <tr>
                                    <td>address</td>
                                    <td id="address"></td>
                                    </tr> -->

						</tbody>
					</table>
					<div class="profile-editButton">
						<button>EDIT</button>
					</div>
				</div>
			</div>
		</div>

		<footer> </footer>
	</main>



Logout</a>


</body>
</html>