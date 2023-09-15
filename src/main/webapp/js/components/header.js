const root = window.location.origin;
console.log(root);

const before_login = `   

  <header id="desktop-header">
<nav class="navbar navbar-expand-lg">

    <div class="container-fluid d-flex justify-content-evenly">

        <a class="mx-1 navbar-brand" href="${root}/index.html">
            <img src="${root}/assets/images/homepage-images/logo.png" alt="my fashion studio logo" />
        </a>

        <div class="me-5 collapse navbar-collapse" id="navbarSupportedContent">


        <ul class="navbar-nav mb-1 mb-lg-0 mx-auto">

                <li class="nav-item dropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"
                    value=1>
                    men
                    <ul class="dropdown-menu " id="cate_men">
                
                    </ul>
                </li>

            </ul>

            <ul class="navbar-nav mb-1 mb-lg-0 mx-auto">

                <li class="nav-item dropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"
                    value=2>

                    WOMEN

                    <ul class="dropdown-menu" id="cate_women">
                

                    </ul>
                </li>

            </ul>

            <ul class="all_section navbar-nav mb-1 mb-lg-0 mx-auto">

                <li class="nav-item dropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"
                    value=3>

                    ALL
                </li>

            </ul>

        </div>

        
        
        <form class="searchbar" role="search">
            <input class="form-control me-8 " type="search" placeholder="search for products,brands and more"
                aria-label="Search">

              
        </form>

        <button class="btn btn-dark seller_btn mx-3"><i class="fa-regular fa-user"></i> SELLER </button>

        <div class="mx-1 icons">
        <a href="${root}/pages/homepage/login.html">
            <div id="profile">
                <div><i class="fa-solid fa-user"></i></div>
                <div id="account">login/signup</div>
            </div>
        </a>   

            <a href="${root}/pages/homepage/login.html">
                <div><i class="fa-solid fa-heart"></i></div>
                <div>wishlist</div>
            </a>

            <a href="${root}/pages/homepage/login.html">
                <div><i class="fa-solid fa-bag-shopping"></i></div>
                <div>bag</div>
            </a>
        </div>

    </div>
</nav>
</header>
`;

const after_login = `    <header id="desktop-header">
<nav class="navbar navbar-expand-lg">

    <div class="container-fluid d-flex justify-content-evenly">

        <a class="mx-1 navbar-brand" href="${root}/index.html">
            <img src="${root}/assets/images/homepage-images/logo.png" alt="my fashion studio logo" />
        </a>

        <div class="me-5 collapse navbar-collapse" id="navbarSupportedContent">


        <ul class="navbar-nav mb-1 mb-lg-0 mx-auto">

                <li class="nav-item dropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"
                    value=1>
                    men
                    <ul class="dropdown-menu " id="cate_men">
                
                    </ul>
                </li>

            </ul>

            <ul class="navbar-nav mb-1 mb-lg-0 mx-auto">

                <li class="nav-item dropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"
                    value=2>

                    WOMEN

                    <ul class="dropdown-menu" id="cate_women">
                

                    </ul>
                </li>

            </ul>

            <ul class=" all_section navbar-nav mb-1 mb-lg-0 mx-auto">

                <li class="nav-item dropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"
                    value="">

                    ALL
                </li>

            </ul>

        </div>

        


        
        <form class="searchbar" role="search">
            <input class="form-control me-10 " type="search" placeholder="search for products,brands and more"
                aria-label="Search">

              
        </form>
        
        <button class="btn btn-dark seller_btn mx-3"><i class="fa-regular fa-user"></i> SELLER </button> 


        <div class="mx-1 icons">



        <a href="${root}/pages/homepage/account.html">
            <div id="profile">
                <div><i class="fa-solid fa-user"></i></div>
                <div id="account">profile</div>
            </div>
        </a>   

            <a href="${root}/pages/orders/wishlist.html">
                <div><i class="fa-solid fa-heart"></i></div>
                <div>wishlist</div>
            </a>

            <a href="${root}/pages/orders/shopping_bag.html">
                <div><i class="fa-solid fa-bag-shopping"></i></div>
                <div>bag</div>
            </a>
        </div>

    </div>
</nav>
</header>
`;



const unique_id = JSON.parse(localStorage.getItem("unique_id"));

console.log(unique_id);

if (unique_id == 0 || unique_id == undefined || unique_id == "") {
  // console.log(user_account)
  document.body.insertAdjacentHTML("afterbegin", before_login);
  const user_profile = document.getElementById("profile");
  user_profile.addEventListener("click", (e) => {
    location.href = "./pages/homepage/login.html";
  });
} else {
  document.body.insertAdjacentHTML("afterbegin", after_login);
  //     location.href = "./pages/homepage/account.html"
  const user_profile = document.getElementById("profile");
  user_profile.addEventListener("click", (e) => {
    location.href = "./pages/homepage/account.html";
  });
}

const seller_id = localStorage.getItem("seller_id");
const seller_btn = document.querySelector(".seller_btn");
seller_btn.addEventListener("click", sell);

function sell() {
  if (seller_id == 0 || seller_id == undefined) {
    location.href = `${root}/pages/seller/seller-login.html`;
  } else {
    location.href = `${root}/pages/seller/seller-account.html`;
  }
}

const dropdown_menu = document.querySelectorAll("ul li.dropdown");
console.log(dropdown_menu);

dropdown_menu.forEach((menu) => {
  menu.addEventListener("click", show);

  function show() {
    const inputvalue = this.value;
    // console.log(inputvalue);

    const localcategory =
      JSON.parse(localStorage.getItem("category_list")) || [];

    const filteredcategory = localcategory.filter(
      (e) => e.gender == inputvalue && e.status == true
    );

    console.log(filteredcategory);

    if (inputvalue == 1) {
      const category_ul = document.querySelector("#cate_men");
      category_ul.innerHTML = `<li class="dropdown-item clickedgender"  data-gender_id=${inputvalue}>all</li>`;


      for (i = 0; i < filteredcategory.length; i++) {
        const dropdown_item_li = document.createElement("li");
        dropdown_item_li.setAttribute("class", "dropdown-item");
        dropdown_item_li.setAttribute("value", filteredcategory[i].id);
        dropdown_item_li.innerHTML = filteredcategory[i].category;
        // dropdown_item_li.setAttribute("href", "/pages/products/product-list.html?category=" + filteredcategory[i]["id"])
        category_ul.append(dropdown_item_li);
      }
    }

    if (inputvalue == 2) {
      const category_ul = document.querySelector("#cate_women");
       category_ul.innerHTML = `<li class="dropdown-item clickedgender" class="clickedgender" data-gender_id=${inputvalue}>all</li>`;

      for (i = 0; i < filteredcategory.length; i++) {
        const dropdown_item_li = document.createElement("li");
        dropdown_item_li.setAttribute("class", "dropdown-item");
        dropdown_item_li.setAttribute("value", filteredcategory[i].id);
        dropdown_item_li.innerHTML = filteredcategory[i].category;
        category_ul.append(dropdown_item_li);
      }
    }

    if (inputvalue == 3) {
      const category_ul = document.querySelector("#cate_kids");
       category_ul.innerHTML = `<li class="dropdown-item clickedgender" class="clickedgender" data-gender_id=${inputvalue}>all</li>`;

      for (i = 0; i < filteredcategory.length; i++) {
        const dropdown_item_li = document.createElement("li");
        dropdown_item_li.setAttribute("class", "dropdown-item");
        dropdown_item_li.setAttribute("value", filteredcategory[i].id);
        dropdown_item_li.innerHTML = filteredcategory[i].category;
        category_ul.append(dropdown_item_li);
      }
    }
  }
});


const ul_dropdown_menu = document.querySelectorAll(".dropdown-menu");

console.log(ul_dropdown_menu);
ul_dropdown_menu.forEach((event) => {
  event.addEventListener("click", (e) => {

    const inputvalue = e.target.value;

    // let sessionbreadcrumbs = JSON.parse(sessionStorage.getItem("breadcrumbs")) || []
    // sessionbreadcrumbs.push({
    //   "name": inputvalue
    // })
    // sessionStorage.setItem("breadcrumbs",JSON.stringify(sessionbreadcrumbs))


      if(inputvalue == 0){

        let getValue = document.querySelectorAll(".dropdown-item.clickedgender");
        
        getValue.forEach(function(e){
          let gValue = e.dataset.gender_id;
    //           sessionbreadcrumbs.push({
    //   "name": gvalue
    // })
           location.href = `/pages/products/product-list.html?gender=${gValue}`;
        })
      }

    if(inputvalue!==0){
      location.href = `/pages/products/product-list.html?category=${inputvalue}`;
    }
   
  });
});




const all = document.querySelectorAll(".all_section");

all.forEach((event) => {
  event.addEventListener("click", (e) => {
    const inputvalue = e.target.value;
    location.href = `/pages/products/product-list.html?category=0`;
  });
});
