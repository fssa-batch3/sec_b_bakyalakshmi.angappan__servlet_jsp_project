const footer_origin = window.location.origin;
console.log(footer_origin)

const beforelogin = `
<div class="footer">

    <div class="footer_nav_contact">
        <div class="footer_nav">
            <div>
                <h3>shop</h3>
                <nav>
                    <ul>
                        <li><a href="${footer_origin}/pages/homepage/login.html">men</a></li>
                        <li><a href="${footer_origin}/pages/homepage/login.html">women</a>
                        </li>
                        <li><a href="${footer_origin}/pages/homepage/login.html">kids</a>
                        </li>
                    </ul>
                </nav>
            </div>


            <div>
                <h3>account</h3>
                <nav>
                    <ul>
                        <li><a href="${footer_origin}/pages/homepage/login.html">my orders</a></li>
                        <li><a href="${footer_origin}/pages/homepage/login.html">my bag</a></li>
                        <li><a href="${footer_origin}/pages/homepage/login.html">my account</a></li>
                    </ul>
                </nav>
            </div>

        </div>

        <div class="footer_contact">
            <div>
                <div class="contact_details">
                    <h3>contact</h3>
                    <i class="fa-solid fa-location-dot"></i>
                    Page Industries Ltd, Cessna Park, Umiya Bay, T-1, 7th Flr, ORR, Bengaluru - 560103,
                    Karnataka.
                </div>

                <div class="contact_details">
                    <i class="fa-solid fa-envelope"></i>
                    wecare@MFS.india.com
                </div>
            </div>


            <div class="contact_details">
                <i class="fa-solid fa-phone"></i>
                1800-572-1299(Toll Free) / 1860-425-3333 <br />
                <p>(Monday to Saturday, IST 10:00 AM to 7:00 PM)</p>

            </div>
        </div>
    </div>


    <div class="bottom_footer">
        <div>
            <h2>My Fashion Studio</h2>
        </div>

        <div class="socialmedia">
            <a href="#"><i class="fa-brands fa-square-facebook"></i></a>
            <a href="#"><i class="fa-brands fa-square-twitter"></i></a>
            <a href="#"><i class="fa-brands fa-youtube"></i></a>
            <a href="./pages/products/product-list.html"><i class="fa-brands fa-square-instagram"></i></a>
        </div>

        <div>
            2022 My fashion studio | All Rights Reserved
        </div>
    </div>
</div>
`;

const afterlogin = `
<div class="footer">

    <div class="footer_nav_contact">
        <div class="footer_nav">
            <div>
                <h3>shop</h3>
                <nav>
                    <ul>
                        <li><a href="${footer_origin}/pages/products/product-list.html?gender=1">men</a></li>
                        <li><a href="${footer_origin}/pages/products/product-list.html?gender=2">women</a>
                        </li>
                    </ul>
                </nav>
            </div>


            <div>
                <h3>account</h3>
                <nav>
                    <ul>
                        <li> <a href="${footer_origin}/pages/orders/order_list.html">my orders</a> </li>
                        <li> <a href="${footer_origin}/pages/orders/shopping_bag.html">my bag</a> </li>
                        <li> <a href="${footer_origin}/pages/homepage/account.html">my account</a> </li>
                    </ul>
                </nav>
            </div>

        </div>

        <div class="footer_contact">
            <div>
                <div class="contact_details">
                    <h3>contact</h3>
                    <i class="fa-solid fa-location-dot"></i>
                    Page Industries Ltd, Cessna Park, Umiya Bay, T-1, 7th Flr, ORR, Bengaluru - 560103,
                    Karnataka.
                </div>

                <div class="contact_details">
                    <i class="fa-solid fa-envelope"></i>
                    wecare@MFS.india.com
                </div>
            </div>


            <div class="contact_details">
                <i class="fa-solid fa-phone"></i>
                1800-572-1299(Toll Free) / 1860-425-3333 <br />
                <p>(Monday to Saturday, IST 10:00 AM to 7:00 PM)</p>

            </div>
        </div>
    </div>


    <div class="bottom_footer">
        <div>
            <h2>My Fashion Studio</h2>
        </div>

        <div class="socialmedia">
            <a href="#"><i class="fa-brands fa-square-facebook"></i></a>
            <a href="#"><i class="fa-brands fa-square-twitter"></i></a>
            <a href="#"><i class="fa-brands fa-youtube"></i></a>
            <a href="./pages/products/product-list.html"><i class="fa-brands fa-square-instagram"></i></a>
        </div>

        <div>
            2022 My fashion studio | All Rights Reserved
        </div>
    </div>
</div>
`;

// const uniqueid = JSON.parse(localStorage.getItem("unique_id"));
// if (uniqueid == 0 || uniqueid == undefined || uniqueid == "") {
//   document.querySelector("footer").insertAdjacentHTML("afterbegin", beforelogin);
// } else {
  document.querySelector("footer").insertAdjacentHTML("afterbegin", afterlogin);
// }
