let div_smallcontainer;
let div_images;
let img_product_image;
let hover_wishlist;
let div_names;
let h3_brand_name;
let h4_product_name;
let div_ratings;
let i_star;
let div_prices;
let span_product_price;
let span_original_price;
let del_original_price;
let span_product_offer;

const product = JSON.parse(localStorage.getItem("product_list"));
const params = new URLSearchParams(window.location.search);
const urlcategory = parseInt(params.get("category"));


console.log(urlcategory);

let filteredcategory = product;

console.log(filteredcategory);



if (!urlcategory) {
  const urlgender = parseInt(params.get("gender"));

    if (!urlgender && urlcategory == 0) {
      filteredProducts = product;
    }

    else{

  filteredProducts = product.filter((e) => e.gender === urlgender);

  console.log(filteredProducts);
    }



}




  if (urlcategory && urlcategory !== 0) {
    filteredProducts = product.filter(
      (product) => product.category === urlcategory
    );
  }


console.log(filteredProducts);

for (let i = 0; i < filteredProducts.length; i++) {
  // <div class="smallcontainer"></div>
  div_smallcontainer = document.createElement("div");
  div_smallcontainer.setAttribute("class", "smallcontainer");
  div_smallcontainer.setAttribute("data-id", filteredProducts[i].product_id);
  // div_smallcontainer.setAttribute("value", filteredProducts[i]["category"]);
  // console.log(div_smallcontainer);
  document.querySelector("div.products").append(div_smallcontainer);
  // console.log(div_smallcontainer);

  //  <div class= "images"> <div>
  div_images = document.createElement("div");
  div_images.setAttribute("class", "images");
  div_smallcontainer.append(div_images);

  // <img class="product_image" src="../../assets/images/homepage-images/mens fashion/men-jean-1.jpg" alt="mens jean" >
  img_product_image = document.createElement("img");
  img_product_image.setAttribute("class", "product_image");
  img_product_image.setAttribute("src", filteredProducts[i].image.source);
  img_product_image.setAttribute("alt", filteredProducts[i].name);
  div_images.append(img_product_image);

  hover_wishlist = document.createElement("div");
  hover_wishlist.setAttribute("class", "wishlist");
  hover_wishlist.setAttribute(
    "data-wish_product_id",
    filteredProducts[i].product_id
  );
  hover_wishlist.innerText = "Wishlist";
  div_images.append(hover_wishlist);

  // // <i class="wishlist" class="fa-solid fa-heart"></i>

  // i_wishlist = document.createElement("i");
  // i_wishlist.setAttribute("class", "wishlist fa-solid fa-heart");
  // div_images.append(i_wishlist);

  // // <div class="ratings"></div>

  // div_ratings = document.createElement("div");
  // div_ratings.setAttribute("class", "ratings");
  // div_images.append(div_ratings);

  // // <div class="ratings_count">4.4</div>
  // div_ratings_count = document.createElement("div");
  // div_ratings_count.setAttribute("class", "ratings_count");
  // div_ratings_count.innerText = filteredProducts[i].ratings;
  // div_ratings.append(div_ratings_count);

  // // <i class="star fa-solid fa-star"></i>
  // i_star = document.createElement("i");
  // i_star.setAttribute("class", "star fa-solid fa-star");
  // div_ratings.append(i_star);

  // // <p class="buyers_count">4.4</p>
  // div_buyers_count = document.createElement("div");
  // div_buyers_count.setAttribute("class", "buyers_count");
  // div_buyers_count.innerText = filteredProducts[i].buyers;
  // div_ratings.append(div_buyers_count);

  // <div class ="names"> <div>
  div_names = document.createElement("div");
  div_names.setAttribute("class", "names");
  div_smallcontainer.append(div_names);

  //  <h3 class="brand_name">DNMX</h3>

  h3_brand_name = document.createElement("h3");
  h3_brand_name.setAttribute("class", "brand_name");
  h3_brand_name.innerText = filteredProducts[i].brand;
  div_names.append(h3_brand_name);

  //  <h4 class="product_name">Mid-Rise Skinny Fit Jeans</h4>
  h4_product_name = document.createElement("h4");
  h4_product_name.setAttribute("class", "product_name");
  h4_product_name.innerText = filteredProducts[i].name;
  div_names.append(h4_product_name);

  // <div class= "prices"> </div>
  div_prices = document.createElement("div");
  div_prices.setAttribute("class", "prices");
  div_smallcontainer.append(div_prices);

  /// ///price - current calculation
  const { mrp } = filteredProducts[i].varients[0].price;
  const { value } = filteredProducts[i].varients[0].offer;
  const { type } = filteredProducts[i].varients[0].offer;
  let current;

  if (type === "%") {
    current = mrp - (mrp * value) / 100;
    current = Math.round(current);
  } else {
    current = mrp - value;
  }
  // console.log(current);

  // <span class="product_price">rs.799</span>
  span_product_price = document.createElement("span");
  span_product_price.setAttribute("class", "current_price");

  span_product_price.innerText = `${filteredProducts[i].varients[0].price.currency}.${current} `;
  div_prices.append(span_product_price);

  // <span class="original_price"><del>rs.999</del></span>
  span_original_price = document.createElement("span");
  span_original_price.setAttribute("class", "mrp_price");
  div_prices.append(span_original_price);

  del_original_price = document.createElement("del");
  del_original_price.innerText = `${filteredProducts[i].varients[0].price.currency}.${filteredProducts[i].varients[0].price.mrp}`;
  span_original_price.append(del_original_price);

  // <span class="product_offer">(30% off)</span>
  span_product_offer = document.createElement("span");
  span_product_offer.setAttribute("class", "product_offer");
  span_product_offer.innerText =
    " " +
    `(${filteredProducts[i].varients[0].offer.value}${filteredProducts[i].varients[0].offer.type} ` +
    "off" +
    ")";
  div_prices.append(span_product_offer);
}

const productlength = document.querySelector(".totalproduct");
console.log(productlength);
const w = filteredProducts.length;
console.log(w);
productlength.innerText = `${w} Items Found`;

// productlength.append

// // getting the image

const product_container = document.querySelectorAll(".smallcontainer");

// console.log(product_container);
product_container.forEach((event) => {
  event.addEventListener("click", () => {
    const product_uuid = event.dataset.id;
    location.href = `./product-details.html?product_id=${product_uuid}`;
  });
});


// wishlist feature

const div_wishlist = document.querySelectorAll(".wishlist");

// console.log(product_container);
div_wishlist.forEach((event) => {
  event.addEventListener("click", (e) => {
    e.stopPropagation();

    let getproduct_id = e.target.dataset.wish_product_id;
    console.log(getproduct_id);
          let get = e.target;
          console.log(get)

    const addtowishlist = JSON.parse(localStorage.getItem("wishlist")) || [];

    const exist = addtowishlist.some((e) => e.product_id === getproduct_id);

    let wishlist_id = crypto.randomUUID();

    if (unique_id === null || unique_id === undefined) {
      alert("please login to add your favorite products into wishlist");
      location.href = "/pages/homepage/login.html";
    } else if (exist) {
      alert("product aldready added to wishlist");

    }

    else{
      addtowishlist.push({
        wishlist_id,
        user_id: unique_id,
        product_id: getproduct_id,
        size: "",
      });

      localStorage.setItem("wishlist", JSON.stringify(addtowishlist));
      alert("Product added to wishlist");
    }
  });
});

// showing the  gender and catgeory in the heading

const localgender = JSON.parse(localStorage.getItem("gender_list"));
const localcategory = JSON.parse(localStorage.getItem("category_list"));

const findCategory = localcategory.find((e) => e.id === urlcategory);

if (findCategory) {
  document.querySelector(".heading_top_category").innerText =
    findCategory["category"];

  const findGender = localgender.find((e) => e.id == findCategory["gender"]);
  console.log(findGender);

  document.querySelector(".heading_top_gender").innerText =
    findGender["gender"] + "'s";
}

if (!findCategory && urlcategory !==0) {
  const urlgender = parseInt(params.get("gender"));

  let heading_top_gender = localgender.find((e) => e.id === urlgender);

  console.log(heading_top_gender);
  document.querySelector(".heading_top_gender").innerText =
    heading_top_gender["gender"];
  document.querySelector(".heading_top_category").innerText = "all products";
}

if (!findCategory && urlcategory == 0) {

  document.querySelector(".heading_top_category").innerText = "all products";
}

// function setActive(e) {
//     smallcontainer.forEach((img) => {
//         img.classList.remove('clicked');
//     });
//     e.target.classList.add('clicked');
// }

// function find_product(e) {
//     return e.gendercategory == urlgender;
// };

// let product_filter = product.find(find_product);
// console.log(product_filter);

// document.querySelector("#brand_name").innerText = product_data["brand"];
// document.querySelector("#product_name").innerText = product_data["name"];

// if wishlist is clicked
