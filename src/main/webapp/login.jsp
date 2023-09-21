<!DOCTYPE html>
<html lang="en">

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
<link rel="stylesheet" href="./assets/css/login.css">

<!-- script for sweet alert -->

<script src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js
"></script>
<link href="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css
" rel="stylesheet">


<title>login</title>


</head>

<body>

	<div class="container">
		<img src="https://iili.io/J9aNeat.png" alt="">
		<div class="container-form">

			<form action="user/login" method="get">

				<h2>login</h2>

				<div>
					<label class="label_field">Email Address</label> <br> <input
						class="input_field" type="email" id="email" required name="email"  autocomplete="on"
						pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
						placeholder="Eg.helloMarion@gmail.com"
						value="bakyalakshmi623@gmail.com">
				</div>

				<div>
					<label class="label_field">password</label> <input
						class="input_field" id="password" type="password" required
						placeholder="Password" value="9789@623bB" name="password" autocomplete="new-password">
				</div>

	
				<div>


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
					<button type="submit" id="login">Login</button>
				</div>

				<div>
					<span>New to MFS?</span> <a
						href="<%=request.getContextPath()%>/signup">create new
						account</a>
				</div>

			</form>

			<%-- <% 
HttpSession httpSession = request.getSession(false);
int userId = -1; // Default value, change it as needed
if (httpSession != null) {

  
        userId = (int) httpSession.getAttribute("userId");
System.out.print(userId);
}
%>  --%>

			<script type="text/javascript">
   <%-- var userId = <%= userId %>; // Retrieve the user ID from the server-side code
    
    console.log(userId); --%>

    document.addEventListener("DOMContentLoaded", function() {
        var loginButton = document.getElementById("login");

        loginButton.addEventListener("click", function() {
            if (userId !== -1) {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'You are logged in successfully',
                    showConfirmButton: false,
                    timer: 1000,
                    /* customStyle: {
                        width: '400px' // Set the width here
                    } */
                });
            } else {
                // Handle the case when userId is -1 (not logged in)
                console.log("User not logged in");
            }
        });
    });
</script>


		</div>
	</div>

	<!--    <script src="/js/storage.js"></script> -->

</body>

</html>