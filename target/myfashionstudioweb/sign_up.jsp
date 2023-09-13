<%@page import="in.fssa.myfashionstudioapp.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="signup.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
            integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
            crossorigin="anonymous" referrerpolicy="no-referrer">
<title>sign-up</title>

</head>
<body>

 <% User user = (User)request.getAttribute("user"); %> 

	        <div class="container">
            <img src="../../assets/images/homepage-images/logo.png" alt="">

            <div class="container-form">

                <div class="x-mark">
                    <a href="../../index.html">
                        <i class="fa-solid fa-xmark"></i>
                    </a>
                </div>
                
                <form action="user/create" method = "post">

                <h2>create account</h2>

                    <div class="form-control">
                        <label class="label_field">User name</label>
                        <br >
                        <input class="input_field" id="full_name" type="text" placeholder="Eg.Marion ame"  value="Marion" name="username"> 

                    </div>

                    <div class="form-control">
                        <label class="label_field">Email address</label>
                        <br >
                        <input class="input_field" id="email" type="email" placeholder="Eg.helloMarion@gmail.com" value="marion7@gmail.com" name="email">


                    </div>

                    <div class="form-control ">
                        <label class="label_field">Mobile number</label>
                        <br >
                        <input class="input_field" id="mobile_number" type="tel" placeholder="Mobile number" value="9789853625" name="phonenumber"> 
                    </div>

                    <div class="form-control">
                        <label class="label_field">Password</label>
                        <br >
                        <input class="input_field" type="password" id="password" placeholder="password"
                            title="Must contain 6 characters only"  value="9789@623bB" name="password">
                        <i id="togglePassword" class="fa-solid fa-eye"></i>
                    </div>

                    <div class="buttons">
                        <div>
                            <button type="submit">Create Your MFS Account
                            </button>
                        </div>

                        <div>
                            <span>already have an account?</span>
                            <a href="login">log in</a>	
                        </div>
                    </div>

                </form>

            </div>

        </div>

</body>
</html>