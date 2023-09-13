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

#menSubMenu {
    display: none;
    position: absolute;
    background-color: #fff;
    border: 1px solid #ccc;
    padding: 10px;
    list-style: none;
    margin-top: 5px;
}

#womenSubMenu {
    display: none;
    position: absolute;
    background-color: #fff;
    border: 1px solid #ccc;
    padding: 10px;
    list-style: none;
    margin-top: 5px;
}

/* Style the submenu list items */
#menSubMenu li {
    margin: 5px 0;
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
            <a class="logo" href="<%= request.getContextPath() %>">
                <img src="https://iili.io/J9aNeat.png" alt="my fashion studio logo">
            </a>
            <ul class="nav-links">
            <li><a href="#" id="menLink">Men</a>
                                
            <ul class="sub-menu" id="menSubMenu">
                    <li><a href="?category=1">T-Shirts</a></li>
                    <li><a href="?category=2">Shirts</a></li>
                    <li><a href="?category=3">Jeans</a></li>
                    <li><a href="?category=4">Trousers</a></li>
                </ul>
            </li>
            
            
            <li><a href="#" id="womenLink">Women</a>
            
                <ul class="sub-menu" id="womenSubMenu">
                    <li><a href="?category=5">T-Shirts</a></li>
                    <li><a href="?category=6">Shirts</a></li>
                    <li><a href="?category=7">Jeans</a></li>
                    <li><a href="?category=8">Skirts</a></li>
                </ul>
            
            </li>

				<li><a href="products">All</a></li>

        </ul>
            <div class="nav-icons">
                <a href="#" class="profile-icon"><i class="fa-solid fa-user"></i></a>
                <a href="#" class="orders-icon"><i class="fa-solid fa-bag-shopping"></i></a>
            </div>

        </div>
    </nav>
    
    <script>
    const menLink = document.getElementById("menLink");
    const menSubMenu = document.getElementById("menSubMenu");

    menLink.addEventListener("click", function (e) {
        e.preventDefault(); // Prevent the default link behavior
        menSubMenu.style.display = menSubMenu.style.display === "block" ? "none" : "block";
    });
    
    const womenLink = document.getElementById("womenLink");
    const womenSubMenu = document.getElementById("womenSubMenu");

    womenLink.addEventListener("click", function (e) {
        e.preventDefault(); // Prevent the default link behavior
        womenSubMenu.style.display = womenSubMenu.style.display === "block" ? "none" : "block";
    });
    </script>
    


</body>
</html>