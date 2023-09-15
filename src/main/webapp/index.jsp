<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="./assets/css/header.css">
        <link rel="stylesheet" href="./assets/css/style.css">


        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link
            href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
            integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
            crossorigin="anonymous" referrerpolicy="no-referrer">
        
        <link rel="stylesheet" href="./assets/css/bootstrap css/bootstrap.css">
        
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/myorder.css">
        <title>My Fashion Studio</title>
        <link rel="icon" href="/assets/images/homepage-images/mobile logo.png" sizes="96×96" type = "image/png">


    </head>

    <body>
    
		<jsp:include page="header.jsp" />

        <!-- main content -->
        <div class="container-fluid">

            <section class="banner1">
                <div class="bannerone">
                    <div class="banner1sub">
                        <div>
                            <h1>WARDROBE CLASSICS</h1>
                            <P>from the quintesstial White tee to blue jean basics & more</P>
                        </div>

                        <div>
                            <img class="firstimg" src="./assets/images/homepage-images/banners/banner1-img.png" alt="">
                        </div>
                    </div>
                </div>
            </section>

            <section>
                <div class="categories">
                    <h1>categories</h1>
                    <div class="categories_list column-gap-5">


                        <!-- <div>
                            <a href="./pages/products/product_list-mens-shirts.html">
                                <img src="./assets/images/categories_images/men-shirt.jpg" alt="">
                                <h4>shirts</h4>
                            </a>
                        </div>

                        <div>
                            <a href="./pages/products/product_list_womens-jeans.html">
                                <img src="./assets/images/categories_images/women-jeans.jpg" alt="">
                                <h4>jeans</h4>
                            </a>
                        </div>

                        <div>
                            <a href="./pages/products/product_list-womens-tops.html">
                                <img src="./assets/images/categories_images/women-tops.webp" alt="">
                                <h4>tops</h4>
                            </a>
                        </div>

                        <div>
                            <a href="./pages/products/product_list-mens-trousers.html">
                                <img src="./assets/images/categories_images/trousers.jpg" alt="">
                                <h4>trousers</h4>
                            </a>
                        </div>

                        <div>
                            <a href="./pages/products/product_list_womens-t-shirts.html">
                                <img src="./assets/images/categories_images/women-tshirt.jpg" alt="">
                                <h4>t-shirts</h4>
                            </a>
                        </div>

                        <div>
                            <a href="./pages/products/product_list_womens-palazzos.html">
                                <img src="./assets/images/categories_images/pallazoes.jpg" alt="">
                                <h4>pallazoes</h4>
                            </a>
                        </div> -->

                    </div>
                </div>
            </section>

            <section>
                <div class="deals">
                    <h1>unmissable deals</h1>
                    <div class="deals_list coloumn-gap-4">
                        
                    </div>
                </div>
            </section>

            <section>
                <div class="delivery">
                    <i class="fas fa-shipping-fast"></i>
                    <span>free delivery on every order</span>
                </div>
            </section>

            <!-- fashion -->

            <section class=" fashion">
                <h1 class="heading">men's fashion</h1>

                <div class="container-fluid fashion_list">

                    <div class="banner">
                        <div class="container-fluid bannersub">
                            <div>

                                <a href="">
                                    <img class="image" src="./assets/images/homepage-images/banners/mens-banner.jpg" alt="">
                                </a>
                            </div>

                            <div>
                                <h1>fashion for him</h1>

                                <h1>
                                    min <span> 40% </span> off
                                </h1>   

                                <h2>your one stop shop for a stylish wardrobe </h2>

                                    <button class="gender_btn" data-gender=1>shop
                                        now</button>
                            </div>

                        </div>
                    </div>

                    <div class="fashion_categories men column-gap-4">

                     </div>
        </section>

<section class=" fashion">

    <h1 class="heading">women's fashion</h1>

    <div class="container-fluid fashion_list">

        <div class="banner">
            <div class="container-fluid bannersub">
                <div>
                    <a href="">
                        <img class="image" src="./assets/images/homepage-images/banners/womens-banner2.jpg" alt="">
                    </a>
                </div>

                <div>
                    <h1>fashion for her</h1>
                    <h1>
                        min <span> 60% </span>off
                    </h1>
                    <h2>fresh styles for your fresh wardrobe</h2>

                    <button class="gender_btn" data-gender=2>shop
                        now</button>
                </div>

            </div>
        </div>

        <div class="fashion_categories women column-gap-4">

        </div>
</section>

                                        </div>

                                        <!-- features -->

                                        <section class="features">

                                            <div class="features">
                                                <div>
                                                    <i class="fa-solid fa-circle-check"></i>
                                                    <h2>assured quality</h2>
                                                </div>

                                                <div>
                                                    <i class="fa-solid fa-hand-holding-heart"></i>
                                                    <h2>100% handpicked</h2>
                                                </div>

                                                <div>
                                                    <i class="fas fa-shipping-fast"></i>
                                                    <h2>superfast delivery</h2>
                                                </div>
                                            </div>
                                        </section>



                                        <footer>

                                        </footer>

                        
                                        <script src="./js/vendor/bootstrap.bundle.js"></script>
            
                      
                 <script>
					  // Function to handle the dropdown item selection
					  function handleDropdownSelection(value) {
					    // Construct the URL based on the selected value
					    var selectedCategory = encodeURIComponent(value); // Ensure value is properly encoded
					    
					   console.log(selectedCategory);
		
					    var redirectURL = '<%= request.getContextPath()%>/products?category=' + selectedCategory;
					
					    // Redirect to the constructed URL
					    window.location.href = redirectURL;
					  }
					
					  // Add an event listener for each dropdown item
					  document.querySelectorAll('.dropdown-item').forEach(function(item) {
					    item.addEventListener('click', function() {
					      var selectedValue = item.getAttribute('value');
					      handleDropdownSelection(selectedValue);
					    });
					  });
				</script>
                        

</body>



</html>