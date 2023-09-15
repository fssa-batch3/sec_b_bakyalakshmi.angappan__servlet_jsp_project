<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="login.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
            integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
            crossorigin="anonymous" referrerpolicy="no-referrer">
        <title>login</title>
        
        <style>
        *{
    margin:0;
    padding:0;
    box-sizing: border-box;
}

.container{
    font-family: 'Jost', sans-serif;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    box-shadow: 6px #000;
}

img{
    width:200px;
    position:absolute;
    bottom:80%;
}

.container-form{
    position:relative;
    font-family: 'Jost', sans-serif;
    width:23%;
    height:52%;
    padding:2%;
    background-color: white;
    border:2px solid #eee;
    border-radius: 5px;
    text-transform: capitalize;
}

div.x-mark i{
    color:#555;
    float:right;
    font-size:25px;
    position: absolute;
    top:3%;
    right:4%;
}
.container-form h2{
    font-weight: 500;
    padding-top: 2%;
    padding-bottom:6%;  
    text-transform: capitalize;
    font-size: 30px;
}

.container-form .label_field{
    font-family: 'Jost', sans-serif;
    font-size: 20px;
    font-weight: 400;
    padding-bottom:2%;
}

.container-form .input_field{
    padding:2%;
}

a.forgotpassword{
    color: #000;
    font-family: 'Jost', sans-serif;
    text-transform: capitalize;
    text-decoration: none;
    margin-left: 4rem;
}
.container-form .input_field{
    font-family: 'Jost', sans-serif;
    width:100%;
    height:30px;
    border:1px solid #5a5a5a;
    margin-top: 1%;
}
    
.container_form div{
    padding-bottom: 3%;
}

.container-form  button{
    font-family: 'Jost', sans-serif;
    margin-top: 15%;
    font-size: 20px;
    width:100%;
    background-color:#000;
    color:#fff;
    padding:2%;
    border:none;
    border:1px solid #000;
    border-radius: 5px;
    letter-spacing: 2px;
}

.container-form div:last-child{
    font-family: 'Jost', sans-serif;
    width:100%;
    padding-top: 1em;
}

.container-form div:last-child span{
    font-size: 18px;
    margin-right: 4px;
}

.container-form div:last-child a{ 
    text-decoration: none;
    font-size: 14px;
    font-weight: 600;
    color: #000;
}

#error_msg{
        color: red; 
       font-size:15px;
}

@media(max-width:360px){
    .container-form{
        width:80%;
    }
}

        
        </style>
    </head>

    <body>
    	
        <div class="container">
            <img src="https://iili.io/J9aNeat.png" alt="">
            <div class="container-form">

                <form action="user/login" method="get">

                    <h2> login </h2>

                    <div>
                        <label class="label_field">Email Address</label>
                        <br >
                        <input class="input_field" type="email" id="email" required name="email"
                            pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" placeholder="Eg.helloMarion@gmail.com" value="marion90@gmail.com">
                    </div>

                    <div>
                        <label class="label_field">password</label>
                        <input class="input_field" id="password" type="password" required placeholder="Password" value="9789@623bB" name="password">
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
                        <button type="submit">Login</button>
                    </div>

                    <div>
                        <span>New to MFS?</span>
                        <a href="signup">create new account</a>
                    </div>

                </form>

            </div>
        </div>

        <script src="/js/storage.js"></script>

    </body>

</html>