// back button is clicked

window.addEventListener("pageshow", function (event) {
  var historyTraversal =
    event.persisted ||
    (typeof window.performance != "undefined" &&
      window.performance.navigation.type === 2);
  if (historyTraversal) {
    // Handle page restore.
    window.location.reload();
  }
});

const product = JSON.parse(localStorage.getItem("product_list"));
const localseller = JSON.parse(localStorage.getItem("seller_list"));

// searching values in url params
const params = new URLSearchParams(window.location.search);

const urlproduct_id = params.get("product_id");

function find_product(e) {
  return e.product_id === urlproduct_id;
}

const productdata = product.find(find_product);

const getseller = productdata.seller_id;
console.log(getseller);
const findseller = localseller.find((e) => e.email == getseller);

const sellername = findseller.corporate_name;

const corporateaddress = findseller.address;

/// /////////leftside////////////

// console.log(product);

let div_leftside;
let div_product_image;
let img_product_image;
let div_rightside;
let div_names;
let h3_brand_name;
let h4_product_name;
let div_prices;
let div_current_price;
let div_product_offer;
let del_actual;
let b_offer;
let div_product_tax;
let div_color;
let p_select_size;
let div_inputsize;

// <div class="leftside"></div>
div_leftside = document.createElement("div");
div_leftside.setAttribute("class", "leftside");
document.querySelector("div.content").append(div_leftside);


div_product_image = document.createElement("div");
div_product_image.setAttribute("class", "product_image");
div_leftside.append(div_product_image);

// <img src="../../assets/images/homepage-images/mens fashion/men-jean-1.jpg" alt=""></img>

img_product_image = document.createElement("img");
img_product_image.setAttribute("id", "product_image");
img_product_image.setAttribute("src", productdata.image.source);
img_product_image.setAttribute("alt", productdata.image.alt);
div_product_image.append(img_product_image);

// console.log(img_product_image);

// <p class="modelsize">Our model wears a size 32</p>
// p_modelsize = document.createElement("p");
// p_modelsize.setAttribute("id", "modelsize");
// p_modelsize.innerText = `Our model wears a size` + " " + 32;
// div_product_image.append(p_modelsize);

/// /////////rightside//////////////

// <div class="rightside"></div>
div_rightside = document.createElement("div");
div_rightside.setAttribute("class", "rightside");
document.querySelector("div.content").append(div_rightside);

// <div class="names"></div>
div_names = document.createElement("div");
div_names.setAttribute("class", "names");
div_rightside.append(div_names);

// <h3 class="brand_name">DNMX</h3>
h3_brand_name = document.createElement("h3");
h3_brand_name.setAttribute("id", "brand_name");
h3_brand_name.innerText = productdata.brand;
div_names.append(h3_brand_name);

// <h4 class="product_name">Mid-Rise Skinny Fit Jeans</h4>

h4_product_name = document.createElement("h5");
h4_product_name.setAttribute("id", "product_name");
h4_product_name.innerText = productdata.name;
div_names.append(h4_product_name);

// <div class="prices"></div>

div_prices = document.createElement("div");
div_prices.setAttribute("class", "prices");
div_rightside.append(div_prices);

// <div class="current_price">rs.799</div>;
div_current_price = document.createElement("div");
div_current_price.setAttribute("class", "current_price");
div_current_price.innerText = `${productdata.varients[0].price.currency}.${productdata.varients[0].price.current}`;
div_prices.append(div_current_price);

// <div class="product_offer">MRP<del>rs.999</del><b>(20%OFF)</b></div>

div_product_offer = document.createElement("div");
div_product_offer.setAttribute("class", "product_offer");
div_prices.append(div_product_offer);

del_actual = document.createElement("del");
del_actual.innerText = `MRP ${productdata.varients[0].price.currency}.${productdata.varients[0].price.mrp}`;
div_product_offer.append(del_actual);

// `(${product["price"]["offer"]["value"]} ${product["price"]["offer"]["type"]} off)`
b_offer = document.createElement("b");
b_offer.innerText = `(${
  productdata.varients[0].offer.value + productdata.varients[0].offer.type
}OFF)`;
div_product_offer.append(b_offer);

// <div class="product_tax"></div>
// div_product_tax = document.createElement("div");
// div_product_tax.setAttribute("class", "product_tax");
// div_product_tax.innerText = "Price inclusive of all taxes";
// div_prices.append(div_product_tax);

// <div class="color"></div>
div_color = document.createElement("div");
div_color.setAttribute("class", "color");
div_color.innerText = `color : ${productdata.color}`;
div_rightside.append(div_color);

// <div class="choosecolor"></div>
// div_choosecolor = document.createElement("div");
// div_choosecolor.setAttribute("class", "choosecolor");
// div_color.append(div_choosecolor);
p_select_size = document.createElement("p");
p_select_size.setAttribute("class", "headingsize");
p_select_size.innerText = "Select size";
div_rightside.append(p_select_size);

div_sizechart = document.createElement("p");
div_sizechart.setAttribute("class", "sizechart");
div_sizechart.innerText = "sizechart"
div_rightside.append(div_sizechart);

// <div class="size"></div>
div_size = document.createElement("div");
div_size.setAttribute("class", "size");
div_rightside.append(div_size);



div_alert = document.createElement("p");
div_alert.setAttribute("class", "sizealert");
div_rightside.append(div_alert);

/* <p>select size</p> */

// ------------- single size

// let find_size = size.find(e => e.id == productdata["size"]);

// div_size = document.createElement("div");
// div_size.setAttribute("class", "size");
// div_size.innerText = "size: "+find_size["value"];
// div_rightside.append(div_size);



// -------------------------- multiple size

const localsize = JSON.parse(localStorage.getItem("size_list"));
const productsize = productdata.varients;
const noOfItems = productsize.length;

for (j = 0; j < noOfItems; j++) {


  // finding from local storage
  let foundsize;
  for (k = 0; k < localsize.length; k++) {
    foundsize = localsize.find((e) => e.id === productsize[j].size);
  }

  let input_size_no = document.createElement("input");
  input_size_no.setAttribute("class", "size_no productsize");
  input_size_no.setAttribute("id", `productsize${j}`);
  input_size_no.setAttribute("type", "radio");
  input_size_no.setAttribute("name", "rad");

  input_size_no.setAttribute("value", foundsize.id);
  div_size.append(input_size_no);

  let label_size_no = document.createElement("label");
  label_size_no.setAttribute("for", `productsize${j}`);
  // label_size_no.setAttribute("class", "productsize")
  label_size_no.innerText = foundsize.value;
  div_size.append(label_size_no);

}

for (let i = 0; i < noOfItems; i++) {
  if (productsize[i]["quantity"] <= 0) {
    document.querySelector(`#productsize${i}`).disabled = true;
  }
}




// console.log(filter_avial_size)

// div_qty = document.createElement("div");
// div_qty.setAttribute("class", "divlbl");
// div_rightside.append(div_qty);

// div_seller = document.createElement("span");
// div_seller.innerText = "seller : "
// div_rightside.append(div_seller)

// span_seller = document.createElement("span");
// span_seller.innerText = sellername;
// div_seller.append(span_seller)

// <div class="buttons"></div>
div_buttons = document.createElement("div");
div_buttons.setAttribute("class", "buttons");
div_rightside.append(div_buttons);

// <div class="addtobag"></div>

// <button>ADD TO BAG</button>
button_bag = document.createElement("button");
button_bag.setAttribute("class", "addtobag");
button_bag.setAttribute("id", "bag");
button_bag.innerText = "ADD TO BAG";
div_buttons.append(button_bag);

console.log(button_bag);

// <button> wishlist </button>
button_wishlist = document.createElement("button");
button_wishlist.setAttribute("class", "wishlist");
button_wishlist.setAttribute("id", "wishlist");
button_wishlist.innerText = "wishlist";
div_buttons.append(button_wishlist);

// <div class="product"></div>
div_product = document.createElement("div");
div_product.setAttribute("class", "product_details");
div_rightside.append(div_product);


let details_accordian =""

if(productdata.category == 3 || productdata.category == 4){

details_accordian = `
<h5> product information </h5>

<div class="accordion">  <h6> Product details </h6> </div>
<div class="panel">


    <div class="chlidpanel">

      <div class="firstchlidpanel">
      
        <div class="components">
            <p class="attribute-key">Pattern</p>
            <p class="attribute-value">${productdata.pattern}</p>
        </div>

        <div class="components">
            <p class="attribute-key">Fit</p>
            <p class="attribute-value">${productdata.fit}</p>
        </div>

        <div class="components">
            <p class="attribute-key">Material</p>
            <p class="attribute-value">${productdata.material}</p>
        </div>

        <div class="components">
            <p class="attribute-key">Length</p>
            <p class="attribute-value">${productdata.length}</p>
        </div>

      </div>

      <div class="Secondchlidpanel">

        <div class="components">
            <p class="attribute-key">Rise Type</p>
            <p class="attribute-value">${productdata.rise}</p>
        </div>

        <div class="components">
            <p class="attribute-key">Closure Type</p>
            <p class="attribute-value">${productdata.closure}</p>
        </div>

        <div class="components">
            <p class="attribute-key">Occasion</p>
            <p class="attribute-value">${productdata.occasion}</p>
        </div> 
        
        <div class="components">
            <p class="attribute-key">Care</p>
            <p class="attribute-value">${productdata.care}</p>
        </div>

      </div>

  </div>

  </div>

</div>

<div class="accordion"> <h6> Product Description</h6> </div>
<div class="panel">
  <p>${productdata.details}</p>
</div>

<div class="accordion"><h6> Seller details </h6> </div>
<div class="panel">
  <p>seller : ${sellername}</p>
  <p>Address : ${corporateaddress}</p>
</div>`;
}

else{

details_accordian = ` 
<h5> product information </h5>

<div class="accordion">  <h6> Product details </h6> </div>
<div class="panel">


    <div class="chlidpanel">

      <div class="firstchlidpanel">
      
        <div class="components">
            <p class="attribute-key">Pattern</p>
            <p class="attribute-value">${productdata.pattern}</p>
        </div>

        <div class="components">
            <p class="attribute-key">Fit</p>
            <p class="attribute-value">${productdata.fit}</p>
        </div>

        <div class="components">
            <p class="attribute-key">Material</p>
            <p class="attribute-value">${productdata.material}</p>
        </div>

        <div class="components">
            <p class="attribute-key">Length</p>
            <p class="attribute-value">${productdata.length}</p>
        </div>

      </div>

      <div class="Secondchlidpanel">

        <div class="components">
            <p class="attribute-key">Neckline Type</p>
            <p class="attribute-value">${productdata.neckline}</p>
        </div>

        <div class="components">
            <p class="attribute-key">Sleeve Type</p>
            <p class="attribute-value">${productdata.sleeve}</p>
        </div>

        <div class="components">
            <p class="attribute-key">Occasion</p>
            <p class="attribute-value">${productdata.occasion}</p>
        </div> 
        
        <div class="components">
            <p class="attribute-key">Care</p>
            <p class="attribute-value">${productdata.care}</p>
        </div>

      </div>

  </div>

  </div>

</div>

<div class="accordion"> <h6> Product Description</h6> </div>
<div class="panel">
  <p>${productdata.details}</p>
</div>

<div class="accordion"><h6> Seller details </h6> </div>
<div class="panel">
  <p>seller : ${sellername}</p>
  <p>Address : ${corporateaddress}</p>
</div>`;
}


document
  .querySelector(".product_details")
  .insertAdjacentHTML("afterbegin", details_accordian);

const inputsize = document.querySelectorAll(".productsize");
let foundprice = "";
let click_size_value = "";
inputsize.forEach((size) =>
  size.addEventListener("click", (e) => {
    click_size_value = parseInt(e.target.value);
    console.log(click_size_value);

    foundprice = productdata.varients.find((e) => e.size === click_size_value);

    console.log(foundprice);

    if(foundprice.quantity !== 0){

      document.querySelector(".addtobag").innerText = "Add to bag"
      document.querySelector(".addtobag").disabled = false;
      document.querySelector(".sizealert").innerText = ""
    }

    if(foundprice.quantity <= 0){
      document.querySelector(".addtobag").disabled = true;
      document.querySelector(".addtobag").innerText = "out of stock";
      document.querySelector(".sizealert").innerText = ""
    }

    if(foundprice.quantity < 5 && !(foundprice.quantity <= 0)){
      document.querySelector(".sizealert").innerHTML = `only ${foundprice.quantity } left`
    }



    console.log(foundprice);

    const { currency } = foundprice.price;
    const { mrp } = foundprice.price;
    const { value } = foundprice.offer;
    const { type } = foundprice.offer;
    let current;

    if (type === "%") {
      current = mrp - (mrp * value) / 100;
      current = Math.round(current);
    } else {
      current = mrp - value;
    }

    document.querySelector(
      ".current_price"
    ).innerText = `${currency}.${current}`;
    document.querySelector(".product_offer del").innerText =
      "MRP" + ` ${currency}.${mrp}`;
    document.querySelector(".product_offer b").innerText =
      `(${value}${type}OFF` + ")";

    foundprice.price.current = current;
    console.log(foundprice);

    localStorage.setItem("product_list", JSON.stringify(product));
  })
);

//  add to bag
const addtobag = JSON.parse(localStorage.getItem("bag")) || [];

const bagexist = addtobag.some(
  (e) => e.product_id === urlproduct_id && e.size === click_size_value
);

console.log(bagexist);

console.log(button_bag.innerText);

if (bagexist) {
  button_bag.innerText = "GO TO BAG";
}

if (!bagexist) {
  button_bag.addEventListener("click", bag);

  function bag() {
    const bag_id = crypto.randomUUID();
    const unique_id = JSON.parse(localStorage.getItem("unique_id"));
    const params = new URLSearchParams(window.location.search);

    const urlproduct_id = params.get("product_id");
    // let input_quantity = document.querySelector(".inputquantity").value;

    // console.log(input_quantity)

    const addtobag = JSON.parse(localStorage.getItem("bag")) || [];

    const exist = addtobag.some(
      (e) => e.product_id === urlproduct_id && e.size === click_size_value
    );

    if (unique_id === null || unique_id === undefined) {
      alert("please login to add products into bag");
      window.location.href = "/pages/homepage/login.html";
    } 


    if (unique_id !== null  && !click_size_value) {
      alert("please select a size to add the product to bag");
    }

    
    if (unique_id !== null && exist) {
      alert("product aldready added to bag");
    }

    if (unique_id !== null && click_size_value && !exist) {
      addtobag.push({
        bag_id,
        user_id: unique_id,
        product_id: urlproduct_id,
        size: parseInt(click_size_value),
        quantity: 1,
      });

      alert("product added to bag");

      localStorage.setItem("bag", JSON.stringify(addtobag));
      location.href = "/pages/orders/shopping_bag.html";
    }
  }
}

// add to wishlist
const addtowishlist = JSON.parse(localStorage.getItem("wishlist")) || [];
const wishexist = addtowishlist.some((e) => e.product_id === urlproduct_id);

if (wishexist) {
  button_wishlist.innerText = "wishlisted";
}

button_wishlist.addEventListener("click", wishlist);

function wishlist() {
  const wishlist_id = crypto.randomUUID();
  const unique_id = JSON.parse(localStorage.getItem("unique_id"));
  const params = new URLSearchParams(window.location.search);

  const urlproduct_id = params.get("product_id");
  // let input_quantity = document.querySelector(".inputquantity").value;

  // console.log(input_quantity)

  const addtowishlist = JSON.parse(localStorage.getItem("wishlist")) || [];

  const wishexist = addtowishlist.some((e) => e.product_id === urlproduct_id);

  if (unique_id == null || unique_id == undefined) {
    alert("please login to add your favorite products into wishlist");
    location.href = "/pages/homepage/login.html";
  } else if (wishexist) {
    alert("product aldready added to wishlist");
  }

  console.log(document.querySelector(".current_price").innerText);

  if (unique_id !== null || (unique_id !== undefined && !wishexist)) {
    addtowishlist.push({
      wishlist_id,
      user_id: unique_id,
      product_id: urlproduct_id,
      size: click_size_value,
    });

    alert("product added to wishlist");

    localStorage.setItem("wishlist", JSON.stringify(addtowishlist));

    location.href = "/pages/orders/wishlist.html";
    window.location.reload();
  }
}

// products details - to show on click

// const h_details = document.querySelector(".headingdetails");

// h_details.addEventListener("click", createdetails);
// // h3_Product.innerHtml = ""

// function createdetails() {
//   const details = document.querySelector("#details");
//   console.log(details);

//   if (details.style.display === "none") {
//     details.style.display = "block";
//   } else {
//     details.style.display = "none";
//   }
// }


var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function () {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}


console.log(productdata.category);

let sizechart = ""





if (productdata.category !==3  || productdata.category !== 4) {

  sizechart = `
<div class="sizecontainer">


<div class = "inputsizecontainer">


<h5 class="headingsizechart"> Size chart  <i class="fa-solid fa-xmark sizeclose"></i> </h5>

<table id="fit-sizechartv2-0-table-0" class="a-bordered a-size-base">
        <tbody>
            <tr>
                <th>Size</th>
                <th>Chest (in)</th>
                <th>Waist (in)</th>
                <th>Sleeve Length (in)</th>
                <th>Shoulder (in)</th>
                <th>Length (in)</th>
            </tr>
            <tr>
                <td>xs</td>
                <td class="a-nowrap">19</td>
                <td class="a-nowrap">18.5</td>
                <td class="a-nowrap">24.5</td>
                <td class="a-nowrap">17.5</td>
                <td class="a-nowrap">26</td>
            </tr>
            <tr>
                <td>s</td>
                <td class="a-nowrap">20</td>
                <td class="a-nowrap">19.5</td>
                <td class="a-nowrap">25</td>
                <td class="a-nowrap">18.5</td>
                <td class="a-nowrap">27</td>
            </tr>
            <tr>
                <td>m</td>
                <td class="a-nowrap">21</td>
                <td class="a-nowrap">20.5</td>
                <td class="a-nowrap">25.5</td>
                <td class="a-nowrap">19.3</td>
                <td class="a-nowrap">28</td>
            </tr>
            <tr>
                <td>l</td>
                <td class="a-nowrap">22</td>
                <td class="a-nowrap">21.5</td>
                <td class="a-nowrap">25.5</td>
                <td class="a-nowrap">20</td>
                <td class="a-nowrap">29</td>
            </tr>
            <tr>
                <td>xl</td>
                <td class="a-nowrap">23</td>
                <td class="a-nowrap">22.5</td>
                <td class="a-nowrap">25.5</td>
                <td class="a-nowrap">21</td>
                <td class="a-nowrap">30</td>
            </tr>
            <tr>
                <td>2xl</td>
                <td class="a-nowrap">24</td>
                <td class="a-nowrap">23.5</td>
                <td class="a-nowrap">26</td>
                <td class="a-nowrap">21.5</td>
                <td class="a-nowrap">30.5</td>
            </tr>
        </tbody>
    </table>

    </div>

    </div>
`;
}



if (productdata.category == 3 || productdata.category == 4) {
  sizechart = `

  
  <div class="sizecontainer">


<div class = "inputsizecontainer">


<h5 class="headingsizechart"> Size chart  <i class="fa-solid fa-xmark sizeclose"></i> </h5>
    <table id="fit-sizechartv2-0-table-0" class="a-bordered a-size-base">
        <tbody>
            <tr>
                <th>Brand Size</th>
                <th>Waist (in)</th>
                <th>Inseam (in)</th>
                <th>Rise (in)</th>
            </tr>
            <tr>
                <td>28</td>
              
                <td class="a-nowrap">29<span>&nbsp;- </span>30</td>
                <td class="a-nowrap">32</td>
                <td class="a-nowrap">9.2</td>
            </tr>
            <tr>
                <td>30</td>
              
                <td class="a-nowrap">31<span>&nbsp;- </span>32</td>
                <td class="a-nowrap">32</td>
                <td class="a-nowrap">9.5</td>
            </tr>
            <tr>
                <td>32</td>
              
                <td class="a-nowrap">33<span>&nbsp;- </span>34</td>
                <td class="a-nowrap">32</td>
                <td class="a-nowrap">10</td>
            </tr>
            <tr>
                <td>34</td>
              
                <td class="a-nowrap">35<span>&nbsp;- </span>36</td>
                <td class="a-nowrap">32</td>
                <td class="a-nowrap">10.5</td>
            </tr>
            <tr>
                <td>36</td>
              
                <td class="a-nowrap">37<span>&nbsp;- </span>38</td>
                <td class="a-nowrap">32</td>
                <td class="a-nowrap">11</td>
            </tr>
            <tr>
                <td>38</td>
              
                <td class="a-nowrap">39<span>&nbsp;- </span>40</td>
                <td class="a-nowrap">32</td>
                <td class="a-nowrap">11.8</td>
            </tr>
            <tr>
                <td>40</td>
              
                <td class="a-nowrap">41<span>&nbsp;- </span>42</td>
                <td class="a-nowrap">32</td>
                <td class="a-nowrap">12.2</td>
            </tr>
        </tbody>
    </table>

    
    </div>

    </div>

`;
} 


document.querySelector(".content").insertAdjacentHTML("afterbegin",sizechart )

document.querySelector(".sizechart").addEventListener("click",givesizechart);

function givesizechart(){


  document.querySelector(".sizecontainer").classList.add("openpopup")

}


let sizeclosebtn = document.querySelector(".sizeclose")
sizeclosebtn.addEventListener("click",closepopup)
function closepopup(){
document.querySelector(".sizecontainer").classList.remove("openpopup")
}

