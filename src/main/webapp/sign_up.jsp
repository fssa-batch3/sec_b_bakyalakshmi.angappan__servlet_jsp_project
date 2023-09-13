<%@page import="in.fssa.myfashionstudioapp.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">

<title>sign-up</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.container {
    font-family: 'Jost', sans-serif;
    margin-top: 8%;
    display: flex;
    justify-content: center;
    align-items: center;
}

img {
    width: 200px;
    position: absolute;
    bottom: 87%;
}

.container-form {
    position: relative;
    width: 30%;
    height: 85%;
    padding: 2%;
    margin-top: 2%;
    background-color: white;
    border: 2px solid #eee;
    border-radius: 5px;
    text-transform: capitalize;
}

div.x-mark i {
    color: #555;
    float: right;
    font-size: 25px;
    position: absolute;
    top: 2%;
    right: 3%;
}

.container-form h2 {
    font-weight: 500;
    padding-top: 1%;
    padding-bottom: 6%;
    text-transform: capitalize;
    font-size: 30px;
}

.container-form .label_field {
    font-size: 18px;
    font-weight: 500;
}

.container-form .input_field{
    font-family: 'Jost', sans-serif;
    padding-left: 2%;
    width: 100%;
    height: 30px;
    border: 1px solid #000;
    margin-top: 1%;
}


.container-form .form-control.success .input_field {
    font-family: 'Jost', sans-serif;
    padding-left: 2%;
    width: 100%;
    height: 30px;
    border: 1px solid #000;
    margin-top: 1%;
}

.container-form .form-control.error .input_field {
    font-family: 'Jost', sans-serif;
    padding-left: 2%;
    width: 100%;
    height: 30px;
    border: 1px solid #e74c3c;
    margin-top: 1%;
}

.form-control small{
    /* visibility:hidden; */
    color:#e74c3c;
    font-size:12px;
}

.container-form div{
    margin-bottom: 1.5%;
}

.container-form #togglePassword{
    position:relative;
    font-size: 14px;
    color:grey;
    bottom:28px;
    left:22rem;
}

/* 
.container-form .input_field{
    font-family: 'Jost', sans-serif;
    padding-left: 2%;
    width: 100%;
    height: 30px;
    border: 1px solid #FF0000;
    margin-top: 1%;
} */

.container button {
    font-family: 'Jost', sans-serif;
    margin-top: 6%;
    font-size: 18px;
    width: 100%;
    background-color: #000;
    color: #fff;
    padding: 3%;
    border: none;
    border: 1px solid #000;
    border-radius: 5px;
    letter-spacing: 1px;

}

.container div:last-child span {
    font-size: 18px;
}

.container div:last-child a {
    font-family: 'Jost', sans-serif;
    text-decoration: none;
    font-size: 14px;
    font-weight: 700;
    color: #000;

}

#error_msg {
        color: red; 
        font-size:15px;
 }


@media(max-width:360px) {
    .container-form {
        width: 80%;
        margin-top: 6rem;
    }
}
</style>

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
					<label class="label_field">User name</label> <br> <input
						class="input_field" id="full_name" type="text"
						placeholder="Eg.Marion ame" value="Marion" name="username">

				</div>

				<div class="form-control">
					<label class="label_field">Email address</label> <br> <input
						class="input_field" id="email" type="email"
						placeholder="Eg.helloMarion@gmail.com" value="marion90@gmail.com"
						name="email">


				</div>

				<div class="form-control ">
					<label class="label_field">Mobile number</label> <br> <input
						class="input_field" id="mobile_number" type="tel"
						placeholder="Mobile number" value="9789853625" name="phonenumber">
				</div>

				<div class="form-control">
					<label class="label_field">Password</label> <br> <input
						class="input_field" type="password" id="password"
						placeholder="password" title="Must contain 6 characters only"
						value="9789@623bB" name="password"> <i id="togglePassword"
						class="fa-solid fa-eye"></i>
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

</body>
</html>