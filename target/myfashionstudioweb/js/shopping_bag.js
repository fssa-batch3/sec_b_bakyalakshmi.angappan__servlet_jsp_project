
const user_list = JSON.parse(localStorage.getItem("user_list"));

const uuid = JSON.parse(localStorage.getItem("unique_id"));

function profile_data(e) {
  return e.email === uuid;
}

const user_data = user_list.find(profile_data);


// change address js
// get address from localstroage

let localaddress = JSON.parse(localStorage.getItem("address_list"))

let foundUser = localaddress.find(e=>e.email_id === uuid)
console.log(foundUser)

// showing the address from localstorage in the bag


if(foundUser["address"].length==0){
// find address which is default or first
let foundUserAddress = foundUser["address"].find(e=>e.status === "default") || foundUser["address"][0];

const before_address = `

        <div class="address">
            <div>
                <p>Deliver to: ${user_data.full_name} </p>
            </div>

            <div class="addaddress">
              <button >add address</button>
            </div>
        </div>
`;

document.querySelector(".container").insertAdjacentHTML("afterbegin", before_address);


document.querySelector(".addaddress").addEventListener("click",addaddress)

function addaddress(){
  window.location.href = "/pages/orders/add_address.html"
}
}

if (foundUser["address"].length === 3) {
  document.querySelector(".add").style.display = "none";
}

if (foundUser["address"] != 0) {
  let foundUserAddress =
    foundUser["address"].find((e) => e.status === "default") ||
    foundUser["address"][0];

  const after_address = `

        <div class="address">
            <div>
                <p>Deliver to: ${user_data.full_name} </p>
                <div class="filladdress"   data-address_id="${foundUserAddress.address_id}" >
                   ${foundUserAddress.streetaddress} ,
                   ${foundUserAddress.landmark} ,
                   ${foundUserAddress.city} - ${foundUserAddress.pincode}.
                </div>
            </div>

            <div class="changeaddress">
              <button>change address</button>
            </div>
        </div>
`;

  document
    .querySelector(".container")
    .insertAdjacentHTML("afterbegin", after_address);
}

// showing all local address in change address form

for (i = 0; i < foundUser["address"].length; i++) {
  let alllocaladdress = `

                  <div class="localaddress d-flex">
              
                          <div>
                              <input type="radio" name="alladdress" id="address${i}"  data-address_id=${foundUser["address"][i]["address_id"]}>
                          </div>
              
                          <label for="address${i}">
                              <b>${foundUser["address"][i]["title"]}</b> <br>
                              ${foundUser["address"][i]["streetaddress"]}
                              ${foundUser["address"][i]["landmark"]}<br>
                              ${foundUser["address"][i]["city"]} - ${foundUser["address"][i]["pincode"]}
                          </label>
              
                      </div>
        `;

  document
    .querySelector(".alllocaladdress")
    .insertAdjacentHTML("afterbegin", alllocaladdress);
}

// if any chnages in the change address page change the address in the bag

let radioinput = document.querySelectorAll(
  ".inputchangeaddress input[type=radio]"
);

radioinput.forEach((get) => get.addEventListener("change", getaddress));

// function when any changes in the changeadress page
function getaddress() {
  let clickedaddress = parseInt(this.dataset.address_id);
  console.log(clickedaddress);

  let addressfind = foundUser["address"].find(
    (e) => e.address_id === clickedaddress
  );
  console.log(addressfind);

  document.querySelector(".filladdress").innerHTML = `  
                  ${addressfind.streetaddress} ,${addressfind.landmark} ,${addressfind.city} - ${addressfind.pincode}.`;

  closepopup();
}

document
  .querySelector(".inputchangeaddress .add")
  .addEventListener("click", addaddresspage);
function addaddresspage() {
  window.location.href = "/pages/orders/add_address.html";
}

const localproducts = JSON.parse(localStorage.getItem("product_list"));

const localbag = JSON.parse(localStorage.getItem("bag")) || [];
console.log(localbag);

let localunique_id = "";
let localsize = "";
let filtereduser_bag = [];

if (localbag !== null || localbag !== undefined) {
  localunique_id = JSON.parse(localStorage.getItem("unique_id"));
  localsize = JSON.parse(localStorage.getItem("size_list"));

  filtereduser_bag = localbag.filter((e) => e.user_id === localunique_id);
  console.log(filtereduser_bag);
}

console.log(localunique_id);
console.log(filtereduser_bag);

// let inputquantity = document.querySelector("#quantity").value

const pr = document.querySelector(".container");
if (filtereduser_bag.length === 0) {
  const createp = document.createElement("div");
  createp.setAttribute("class", "message");
  console.log(createp);
  createp.innerText = "Your bag is empty!";
  pr.append(createp);

  const div_btn = document.createElement("div");
  div_btn.setAttribute("class", "continueshop");

  const button = document.createElement("button");
  button.setAttribute("class", "continue_btn btn btn-dark rounded-0");
  button.innerText = "Add products from Wishlist";

  div_btn.append(button);
  pr.append(div_btn);

  document.querySelector(".continue_btn").addEventListener("click", () => {
    window.location.href = "/pages/orders/wishlist.html";
  });
}

let find_size_price = "";
const current_price = "";
let sum = 0;



let template_bag = "";

let availability = "";
let output = true;

for (let i = 0; i < filtereduser_bag.length; i++) {
  // finding product from local storage
  const find_product = localproducts.find(
    (e) => e.product_id === filtereduser_bag[i].product_id
  );

  console.log(find_product);

  // finding size from localsize

  let find_size = localsize.find((e) => e.id === filtereduser_bag[i].size);
  console.log(find_size);

  // find size from find_product
  find_size_price = find_product.varients.find(
    (e) => e.size == filtereduser_bag[i].size
  );
  console.log(find_size_price);

  // get price from find_product
  const size_price = find_size_price.price.current;
  console.log(size_price);

  const size_quantity = filtereduser_bag[i].quantity;
  console.log(size_quantity);

  const current_price = size_price * size_quantity;
  console.log(current_price);

  sum += current_price;

  // for (let i = 0; i < filtereduser_bag.length; i++) {
  let filtereduser_bagproduct = filtereduser_bag[i]["product_id"];
  console.log(filtereduser_bagproduct);

  // get size id from filtered bag
  let findsize = filtereduser_bag[i]["size"];

  console.log(findsize);

  let findquantity = filtereduser_bag[i]["quantity"];

  console.log(findquantity);

  // get price is the goal
  let findproduct = localproducts.find(
    (e) => e.product_id === filtereduser_bagproduct
  );

  let findproductprice = findproduct["varients"].find(
    (e) => e.size == findsize
  );

  console.log(findproductprice);

  if (findproductprice.quantity < findquantity) {
    availability = `out of stock only ${findproductprice.quantity} left`;
    output = false;
  }

  if (findproductprice.quantity >= findquantity == 4) {
    availability = `only ${findproductprice.quantity} left `;
  }

  // if (findproductprice.quantity >= 4) {
  //   availability = `only ${findproductprice.quantity} left `;
  // }

  template_bag += ` 

<div class="order_details"> 

<div class="x-mark"  data-id="${localbag[i].bag_id}">
        <i class="fa-solid fa-xmark"></i>
</div>

<div class="product_thumbnail">
        <img src= "${find_product.image.source}" alt="${
    find_product.image.alt
  }">
</div>

<div class="product_list">

    <div class="product_details">
        <h4 class="brand_name">${find_product.brand}</h4>
        <p class="product_name">${find_product.name}</p>
    </div>

    <div>
        <label><b>Size:</b></label>
        <span class="span_size">${find_size.value}</span>

        <label><b>Qty:</b></label>
        <select class="quantity" value="${
          filtereduser_bag[i]["quantity"]
        }" data-bag_id =${localbag[i].bag_id} required>
            <option selected disabled hidden> ${
              filtereduser_bag[i]["quantity"]
            } </option>
            <option value="1" class="opt">1</option>
            <option value="2" >2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
        </select>
    </div>

    <div>
        <span class="product_price">${`${find_size_price.price.currency}.${current_price}`}</span> 
        <span class="original_price"><del>${`${find_size_price.price.currency}.${find_size_price.price.mrp}`}</del></span>
        <span class="product_offer"> (${
          find_size_price.offer.value
        } % off)</span>
    </div>

    <div> 
        delivery in <span class="date">2 days</span>
    </div>

    <span class="availalert" data-alert_id = "${
      localbag[i].bag_id
    }" >${availability}</span>

    <div class="buttons">
        <div>
                 <button class="movetobag" data-bag_id=${
                   localbag[i].bag_id
                 }>move to wishlist</button>
        </div>
    </div>

</div>
</div>
`;

  console.log(filtereduser_bag[i].quantity);
}

// qty display
// <span>${localbag[i]["quantity"]}</span>
document
  .querySelector(".order_list")
  .insertAdjacentHTML("afterbegin", template_bag);

const inputquantity = document.querySelectorAll(".quantity");

inputquantity.forEach((qty) =>
  qty.addEventListener("change", function (e) {
    e.preventDefault();

    const id = this.dataset.bag_id;
    console.log(id);

    const foundbag_quantity = localbag.find((e) => e.bag_id === id);
    console.log(foundbag_quantity);

    console.log(foundbag_quantity);
    foundbag_quantity.quantity = parseInt(e.target.value);

    localStorage.setItem("bag", JSON.stringify(localbag));

    window.location.reload();
  })
);

localStorage.setItem("bag", JSON.stringify(localbag));

const order = `
<div class="details">
            <h3>bag total</h3>
                <table>
                    <caption> </caption>
                    <tbody>
                        <tr>
                            <th></th>
                        </tr>
                    
                   
                    <tr class="table_row">
                        <td>sub-total</td>
                        <td>Rs.${sum}</td>
                    </tr>

                    <tr>
                        <td>total amount</td>
                        <td>Rs.${sum}</td>
                    </tr>

                </tbody>
                </table>
                
                <div class="placeorder">
                        <small>cash on delivery only<small>
                        <button type="submit">place order</button>
                </div> 
            </div>      `;

document
  .querySelector(".side_container")
  .insertAdjacentHTML("afterbegin", order);

const remove = document.querySelectorAll(".x-mark");
remove.forEach((del) =>
  del.addEventListener("click", function () {
    const bag_uuid = this.dataset.id;
    console.log(bag_uuid);

    const find_bag = localbag.find((e) => e.bag_id === bag_uuid);
    console.log(find_bag);

    const indexofbagprod = localbag.indexOf(find_bag);
    console.log(indexofbagprod);

    localbag.splice(indexofbagprod, 1);

    localStorage.setItem("bag", JSON.stringify(localbag));
    window.location.reload();
  })
);

const localwishlist = JSON.parse(localStorage.getItem("wishlist")) || [];
const movetowishlist = document.querySelectorAll(".movetobag");
movetowishlist.forEach((move) =>
  move.addEventListener("click", function () {
    const clicked_bag_id = this.dataset.bag_id;

    const wishlist_id = crypto.randomUUID();

    // clicked bag

    const find_bag_prod = localbag.find((e) => e.bag_id === clicked_bag_id);

    // find there is product or not
    const find_wishlist_prod = localwishlist.find(
      (e) => e.product_id == find_bag_prod.product_id
    );

    console.log(find_wishlist_prod);

    if (!find_wishlist_prod) {
      localwishlist.push({
        wishlist_id,
        user_id: find_bag_prod.user_id,
        product_id: find_bag_prod.product_id,
        size: find_bag_prod.size,
        quantity: 1,
      });

      const indexofbag = localbag.indexOf(find_bag_prod);
      localbag.splice(indexofbag, 1);

      alert("Item added to wishlist");

      location.reload();

      localStorage.setItem("bag", JSON.stringify(localbag));
      localStorage.setItem("wishlist", JSON.stringify(localwishlist));
    }
    //  window.location.reload();

    if (find_wishlist_prod) {
      if (
        confirm("Product aldready exist in wishlist do you want to remove ?")
      ) {
        let confirm_bag_id = find_bag_prod;
        console.log(confirm_bag_id);

        const indexofbagprod = localbag.indexOf(confirm_bag_id);
        console.log(indexofbagprod);

        localbag.splice(indexofbagprod, 1);

        // console.log(localbag)

        let get = localStorage.setItem("bag", JSON.stringify(localbag));
        // console.log(get)

        location.reload();
      }
    }

    // ////////////////////
  })
);

// function when add address is clicked

// let addaddressbtn = document.querySelector(".addaddress")
// addaddressbtn.addEventListener("click",function(){
//   window.location.href = "/pages/orders/add_address.html"
// })

// function when change address is clicked

// popup for changeaddress

if (foundUser["address"].length !== 0) {
  let changeaddressbtn = document.querySelector(".changeaddress");
  console.log(changeaddressbtn);

  changeaddressbtn.addEventListener("click", openpopup);

  let inputcontainer = document.querySelector(".inputcontainer");

  function openpopup() {
    inputcontainer.classList.add("openpopup");
  }

  let changeaddressclosebtn = document.querySelector(".changeaddressx-mark");
  changeaddressclosebtn.addEventListener("click", closepopup);
  function closepopup() {
    inputcontainer.classList.remove("openpopup");
  }
}

document.querySelector(".placeorder").addEventListener("click", place);

function place() {
  let localOrder = JSON.parse(localStorage.getItem("order")) || [];
  console.log(localOrder);

  let address_id = document.querySelector(".filladdress").innerText;

  let inp_quantity = document.querySelectorAll(".quantity");

  console.log(address_id);

  let order_uuid = crypto.randomUUID();

  console.log(filtereduser_bag.length);

  if (filtereduser_bag.length !== 0 && address_id !== 0 && output == true) {
    let getdate = new Date();

    localOrder.push({
      order_id: order_uuid,
      order_status: "On the way",
      ordered_time: getdate,
      address: address_id,
      user_id: localunique_id,
      bag_price: sum,
    });

    localStorage.setItem("order", JSON.stringify(localOrder));

    let localOrders = JSON.parse(localStorage.getItem("order")) || [];

    let localOrderedItems =
      JSON.parse(localStorage.getItem("ordered_items")) || [];

    console.log(localOrderedItems);

    console.log(filtereduser_bag);

    for (let i = 0; i < filtereduser_bag.length; i++) {
      // get product id from filtered bag
      let filtereduser_bagproduct = filtereduser_bag[i]["product_id"];
      console.log(filtereduser_bagproduct);

      // get size id from filtered bag
      let findsize = filtereduser_bag[i]["size"];

      let findquantity = filtereduser_bag[i]["quantity"];

      // get price is the goal
      let findproduct = localproducts.find(
        (e) => e.product_id === filtereduser_bagproduct
      );

      let findproductprice = findproduct["varients"].find(
        (e) => e.size === findsize
      );

      findproductprice.quantity = parseInt(
        findproductprice.quantity - findquantity
      );

      localStorage.setItem("product_list", JSON.stringify(localproducts));

      // found the ordered product price
      let order_product_price = findproductprice.price.current;

      let ordered_item_id = crypto.randomUUID();

      console.log((filtereduser_bag[i].item_id = ordered_item_id));

      // pushing price in ordered_item
      filtereduser_bag[i].item_id = ordered_item_id;
      filtereduser_bag[i].order_id = order_uuid;
      filtereduser_bag[i].price = order_product_price;
    }

    localOrderedItems.push(...filtereduser_bag);

    localStorage.setItem("ordered_items", JSON.stringify(localOrderedItems));

    window.location.href = "/pages/orders/order_list.html";

    let filternotuserbag = localbag.filter((e) => e.user_id !== localunique_id);
    console.log(filternotuserbag);
    localStorage.setItem("bag", JSON.stringify(filternotuserbag));
  }

  if (filtereduser_bag.length == 0) {
    alert(`There is no products in the bag 
kindly, add the products to bag to place order`);
  }
}







if(filtereduser_bag.length !== 0){

  
  let getwishlist = `      

                <div class="wishlist">
                
                    Add more from wishlist <i class="fa-solid fa-chevron-up fa-rotate-90"></i>
                
                </div>
                `

     document.querySelector(".order_list").insertAdjacentHTML("afterend",getwishlist);

  document.querySelector(".wishlist").addEventListener("click",function(){



  window.location.href = "/pages/orders/wishlist.html"
})
}








