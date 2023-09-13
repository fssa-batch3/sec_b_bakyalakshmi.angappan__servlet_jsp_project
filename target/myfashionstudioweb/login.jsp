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
    </head>

    <body>
    
        <div class="container">
            <img src="" alt="">
            <div class="container-form">
                <div class="x-mark">
                    <a href="../../index.html">
                        <i class="fa-solid fa-xmark"></i>
                    </a>
                </div>
                <form>

                    <h2> login </h2>

                    <div>
                        <label class="label_field">Email Address</label>
                        <br >
                        <input class="input_field" type="email" id="email" required="true"
                            pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" placeholder="Eg.helloMarion@gmail.com" value="marion007@gmail.com">
                    </div>

                    <div>
                        <label class="label_field">password</label>
                        <input class="input_field" id="password" type="password" required="true" maxlength="6" placeholder="Password" value="978985">
                    </div>

                    <div>
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