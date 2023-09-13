<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
/* Reset some default styles */
body {
  margin: 0;
  padding: 0;
}

/* Style the navbar */
.navbar {
  background-color: #ffffff; /* Background color of the navbar */
  color: #000000; /* Font color (black) */
  padding: 10px 0;
  padding-left:20px;
  padding-right:20px;
  position: sticky;
  top: 0px;
  z-index: 1;
  background-color: #fff;
  box-shadow: 0 3px 6px 0 rgb(0 0 0 / 20%);
}

.container {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

/* Style the logo */
.logo img {
    height: 70px;
  max-width: 250px; /* Set the maximum width of the logo */
}

/* Style the navigation links */
.nav-links {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
}

.nav-links li {
  margin-right: 30px; /* Add spacing between links */
}

.nav-links a {
  text-decoration: none;
  color: #000000; /* Font color (black) */
  font-weight: bold;
}

/* Style the navbar icons */
.nav-icons a {
  text-decoration: none;
  color: #000000; /* Font color (black) */
  margin-left: 20px; /* Add spacing between icons */
}

</style>

<link rel="icon"
	href="../assets/img/illustration/v-removebg-preview.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
<meta charset="ISO-8859-1">
</head>
<body>
    <nav class="navbar">
        <div class="container">
            <a class="logo" href="#">
                <img src="http://127.0.0.1:5501/assets/images/homepage-images/logo.png" alt="my fashion studio logo">
            </a>
            <ul class="nav-links">
                <li><a href="#">Men</a></li>
                <li><a href="#">Women</a></li>
                <li><a href="">All</a></li>
            </ul>
            <div class="nav-icons">
                <a href="#" class="profile-icon"><i class="fa-solid fa-user"></i></a>
                <a href="#" class="orders-icon"><i class="fa-solid fa-bag-shopping"></i></a>
            </div>
        </div>
    </nav>
</body>
</html>