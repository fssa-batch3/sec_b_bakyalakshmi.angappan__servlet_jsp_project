const localorder = JSON.parse(localStorage.getItem("order"));
const localordereditems = JSON.parse(localStorage.getItem("ordered_items"));
const localproducts = JSON.parse(localStorage.getItem("product_list"));
const localuser = JSON.parse(localStorage.getItem("user_list"));
const localsize = JSON.parse(localStorage.getItem("size_list"));
const localseller = JSON.parse(localStorage.getItem("seller_list"));
const localaddress = JSON.parse(localStorage.getItem("address_list"));
const localuuid = JSON.parse(localStorage.getItem("unique_id"));

// get url param

const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);

const urlorder = urlParams.get("order_id");

const urlitem = urlParams.get("item_id");

const findorder = localorder.find((e) => e.order_id == urlorder);

console.log(findorder);

// find product first product

console.log(urlitem);

const ordereditems = localordereditems.filter((e) => e.order_id == urlorder);
console.log(ordereditems);

const findfirstorder = localordereditems.find((e) => e.item_id == urlitem);
console.log(findfirstorder);

// get product id
const findfirstproduct = findfirstorder["product_id"];

// get product details
const findproductdetail = localproducts.find(
  (e) => e.product_id == findfirstproduct
);
console.log(findproductdetail);

// get size id
const findproductsize = findfirstorder["size"];
console.log(findproductsize);

console.log(localsize);

// find size from local

const findsizedetail = localsize.find((e) => e.id == findproductsize);
console.log(findsizedetail);

// size to show
const sizevalue = findsizedetail.value;

// find quantity

const findproductqty = findfirstorder["quantity"];

const username = localuser.find((e) => e.email == localuuid);
console.log(username);

const findproductprice = findfirstorder["price"];

const totalprice = findproductprice * findproductqty;

const productseller = findproductdetail["seller_id"];

const findseller = localseller.find((e) => e.email == productseller);
console.log(findseller);
const sellername = findseller.corporate_name;

// address to show as delivery

// find address id
const findaddress = findorder["address"];
console.log(findaddress);

let foundUser = localaddress.find((e) => e.email_id === localuuid);
console.log(foundUser);

const findaddressdetail = foundUser["address"].find(
  (e) => e.address_id == findaddress
);
console.log(findaddressdetail);

// delivery time

const dateString = findorder.ordered_time;
console.log(dateString);

const parsedDate = new Date(Date.parse(dateString));
console.log(parsedDate);

console.log(parsedDate); // Output: Fri May 21 2004 00:00:00 GMT+0530 (India Standard Time)

const findTime = new Date(parsedDate);
console.log(findTime); // Output: Fri May 21 2004 00:00:00 GMT+0530 (India Standard Time)

const afterDate = findTime.getDate() + 2;
const afterDay = findTime.getDay();
const afterMonth = findTime.getMonth();

//name of the day and month using an array of names
const daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
const monthsOfYear = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec",
];

const dayName = daysOfWeek[afterDay]; // Returns the name of the day of the week
const monthName = monthsOfYear[afterMonth];

console.log(dayName);

console.log(monthName);

// if (ordereditems.length == 1) {
//   let order_details_template_for_one = `            

// <div class="product_details_container">
//                 <div class="product_details">
//                 <div>
//                 <img width="130px" src=${findproductdetail.image.source} alt="">
//                 </div>

//                 <div class="names">
//                     <p class="brand_name">${findproductdetail.brand}</p>
//                     <p class="product_name">${findproductdetail.name}</p>
//                     <p class="size"> <span>size: ${sizevalue} <span>  <span>qty : ${findproductqty}<span></p>
//                 </div>
//                 </div>
//             </div>

//             <div class="delivery_status">
//                 <div class="status">
//                     <p>${findorder.order_status}</p>
//                     <p>Delivery by ${dayName}, ${afterDate} ${monthName}</p>
//                 </div>
//             </div>


//             <div class="delivery_address">
//                     <h5>Delivery Address</h5>

//                     <div class="address">
//                         <div>
//                             <p>${username.full_name}</p>
//                         </div>

//                         <div class="filladdress">
//                     ${findaddressdetail.streetaddress} ,
//                     ${findaddressdetail.landmark} ,
//                     ${findaddressdetail.city} - ${findaddressdetail.pincode}.
//                         </div>
//                     </div>
//             </div>

//         <div>
//             <div class="Total_order_price">
//                 <h5>Total order price</h5>

//                 <div class="total_price">
//                     Rs.${totalprice} 
//                 </div>

//             </div>
//         </div>

//             <div class="seller_details">
//                 seller: ${sellername}
//             </div>

//             <div class="order_id">
//                 ORDER ID #${urlorder}
//             </div>
//             </div>
// `;

//   document
//     .querySelector(".container")
//     .insertAdjacentHTML("afterbegin", order_details_template_for_one);
// }

// if (ordereditems.length > 1) {
  let order_details_template_for_one = `            

<div class="product_details_container">
                <div class="product_details">
                <div>
                <img width="130px" src=${findproductdetail.image.source} alt="">
                </div>

                <div class="names">
                    <p class="brand_name">${findproductdetail.brand}</p>
                    <p class="product_name">${findproductdetail.name}</p>
                    <p class="size"> <span>size: ${sizevalue} <span>  <span>qty : ${findproductqty}<span></p>
                </div>
                </div>
            </div>

            <div class="delivery_status">
                <div class="status">
                    <p>${findorder.order_status}</p>
                    <p>Delivery by ${dayName}, ${afterDate} ${monthName}</p>
                </div>
            </div>

        <div>
            <div class="Total_item_price">
                <h5>Total Item price</h5>

                <div class="total_price">
                    Rs.${totalprice} 
                </div>
            </div>
        </div>


            <div class="delivery_address">
                    <h5>Delivery Address</h5>

                    <div class="address">
                        <div>
                            <p>${username.full_name}</p>
                        </div>

                        <div class="filladdress">
                                ${findorder.address}
                        </div>
                    </div>
            </div>



            <div class="othercontainer">
                <div class="otherorders">
                    <h5>Other items in this order</h5>
                </div>
            </div>

        <div>
            <div class="Total_order_price">
                <h5>Total order price</h5>

                <div class="total_price">
                    Rs.${findorder["bag_price"]} 
                </div>
            </div>
        </div>

            <div class="seller_details">
                Seller: ${sellername}
            </div>

            <div class="order_id">
                ORDER ID #${urlorder}
            </div>

            </div>
`;

  document
    .querySelector(".container")
    .insertAdjacentHTML("afterbegin", order_details_template_for_one);
// }


let otheritems = ordereditems.filter(e=>e.item_id  !== urlitem);
console.log(otheritems);

// let price =  
for(i=0;i<otheritems.length;i++){

    let findproduct = localproducts.find(e=>e.product_id == otheritems[i]["product_id"]);
    console.log(findproduct);

    const other_findproductsize = otheritems[i]["size"];
    console.log(other_findproductsize);

    console.log(localsize);

    // find size from local

    const other_findsizedetail = localsize.find((e) => e.id == other_findproductsize);
    console.log(findsizedetail);

    // size to show
    const other_sizevalue = other_findsizedetail.value;

        const template_other_order = `

                <div class="order_list" data-order_id=${findorder.order_id}
                    data-order_item_id=${otheritems[i]["item_id"]}>
                    <div class="product_thumbnail">
                        <img class="product_image"  width="100px" src=${findproduct.image.source} alt=${findproduct.name} >
                    </div>

                    <div class="details">
                        <p class="itembrand_name">${findproduct.brand}</p>
                        <p class="itemproduct_name">${findproduct.name}</p>
                        <p class="itemproduct_size">size: ${other_sizevalue}</p>
                    </div>


                    <div class="arrowmark">
                        <i class="fa-solid fa-chevron-right"></i>
                    </div>

                </div>
            `

document.querySelector(".othercontainer").insertAdjacentHTML("beforeend",template_other_order)
}

if(otheritems.length == 0){
    document.querySelector(".othercontainer").style.display = "none"
    document.querySelector(".Total_item_price").style.display = "none"
}


const allorderlist = document.querySelectorAll(".order_list");
console.log(allorderlist)

allorderlist.forEach(move=>
    move.addEventListener("click",movetodetails)
    )

    function movetodetails(){
        let getorderid = this.dataset.order_id;
        let getitemid = this.dataset.order_item_id;

        console.log(getitemid);

        window.location.href = `/pages/orders/order-details.html?order_id=${getorderid}&item_id=${getitemid}`

    }
    
