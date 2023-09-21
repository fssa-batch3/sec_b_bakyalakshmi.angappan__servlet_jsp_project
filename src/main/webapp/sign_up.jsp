<%@page import="in.fssa.myfashionstudioapp.model.User"%>
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
<!-- <link rel="stylesheet" href="./assets/css/bootstrap css/bootstrap.css"> -->

<!-- link for the common css -->
<link rel="stylesheet" href="./assets/css/header.css">
<!-- -->
<link rel="stylesheet" href="./assets/css/signup.css">

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

<title>sign-up</title>


</head>
<body>

	<%
	User user = (User) request.getAttribute("user");
	%>

	<div class="container">

		<img src="https://iili.io/J9aNeat.png" alt="">

		<div class="container-form">

			<div class="x-mark">
				<a href="../../index.html"> <i class="fa-solid fa-xmark"></i>
				</a>
			</div>

			<form action="user/create" method="post">

				<h2>create account</h2>

				<div class="form-control">
					<label class="label_field" for="user_name">User name</label> <br>
					<input class="input_field" id="user_name" type="text"
						placeholder="Eg.Marion ame" value="Marion" name="username"
						autocomplete="on">
				</div>

				<div class="form-control">
					<label class="label_field" for="email">Email address</label> <br>
					<input class="input_field" id="email" type="email"
						placeholder="Eg.helloMarion@gmail.com" value="marion90@gmail.com"
						autocomplete="on" name="email">
				</div>

				<div class="form-control ">
					<label class="label_field" for="mobile_number">Mobile
						number</label> <br> <input class="input_field" id="mobile_number"
						type="tel" placeholder="Mobile number" value="9789853625"
						name="mobilenumber" autocomplete="on">
				</div>

				<div class="form-control">
					<label class="label_field" for="password">Password</label> <br>
					<input class="input_field" type="password" id="password"
						placeholder="password" title="" value="9789@623bB" name="password"
						autocomplete="new-password"> <i id="togglePassword" 
						class="fa-solid fa-eye" onclick="togglePasswordVisibility('password')"></i>
				</div>

				<div class="form-control">
					<label class="label_field" for="re_enter_password">Re-enter
						Password</label> <br> 
						
						<input class="input_field" type="password"
						id="re_enter_password" placeholder="password" title=""
						value="9789@623bB"  autocomplete="new-password" oninput="checkPasswordMatch()">
					<p class="error-message" id="password-mismatch-error"
						style="display: none;">Password do not match!</p>
				</div>

				<div class="buttons">

					<%
					String data = (String) request.getParameter("error");
					%>
					<%
					if (data != null) {
					%>
					<p id="error_msg"><%=data%></p>
					<%
					}
					%>

					<div>
						<button type="submit">Create Your MFS Account</button>
					</div>

					<div>
						<span>already have an account?</span> <a href="login">log in</a>
					</div>
				</div>

			</form>

		</div>

	</div>

	<script>
	
    function togglePasswordVisibility(inputId) {
        var passwordInput = document.getElementById(inputId);
        var toggleButton = document.getElementById("togglePassword");

        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            toggleButton.classList.remove("fa-eye");
            toggleButton.classList.add("fa-eye-slash");
        } else {
            passwordInput.type = "password";
            toggleButton.classList.remove("fa-eye-slash");
            toggleButton.classList.add("fa-eye");
        }
    }
    
		function checkPasswordMatch() {
			var passwordField = document.getElementById("password");
			var reEnterPasswordField = document
					.getElementById("re_enter_password");
			var errorElement = document
					.getElementById("password-mismatch-error");

			if (passwordField.value !== reEnterPasswordField.value) {
					errorElement.style.display = "block";
			}
		}
	</script>


</body>
</html>