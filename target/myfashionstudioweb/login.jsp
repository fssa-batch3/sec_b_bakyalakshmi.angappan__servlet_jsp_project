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

<style>
	
.position-absolute {
  position: absolute !important;
}

.swal-wide {
	font-size: 18px !important;
	width: 400px !important;
}

</style>


<title>login</title>


</head>

<body>

	<div class="container">
		<img src="https://iili.io/J9aNeat.png" alt="">
		<div class="container-form">
		
		<div class="x-mark">
				<a href="<%= request.getContextPath() %>/home"> <i class="fa-solid fa-xmark"></i>
				</a>
			</div>

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

					<%
					String data = request.getParameter("error");
					%>
					<%
					if (data != null) {
					%>
		
				
				<p class="mb-0 mt-2" id="error_msg"> <i class="fa fa-circle-info"></i> <%= data %> </p>

		
					<%
					}
					%>

					 
			
	

	

				
				<button type="submit" id="login">Login</button>
				

				<div>
					<span>New to MFS?</span> <a
						href="<%=request.getContextPath()%>/signup">create new
						account</a>
				</div>

			</form>
	
		</div>
	</div>
	
	
	<script>
	
	// Detect when the user navigates back
    window.onpopstate = function(event) {
        // Reload the current page
        window.open(location.href, '_self');
    };

	 var loginButton = document.getElementById("login");

        loginButton.addEventListener("click", function() {
        	
        	<%HttpSession httpSession = request.getSession(false);%>
        	
        	<% System.out.print(httpSession.getAttribute("userId"));%>
            
            <%if (httpSession != null && httpSession.getAttribute("userId") != null  ) { %>
            
            const Toast = Swal.mixin({
      		  toast: true,
      		  position: 'top-end',
      		  showConfirmButton: false,
      		  timer: 500,
      		  timerProgressBar: true,
      		  didOpen: (toast) => {
      		    toast.addEventListener('mouseenter', Swal.stopTimer)
      		    toast.addEventListener('mouseleave', Swal.resumeTimer)
      		  }
      		})

      		Toast.fire({
      		  icon: 'success',
      		  title: 'product added to bag'
      		})
                
                
            <%} %> 
        }); 
     
     
     </script>


</body>

</html>