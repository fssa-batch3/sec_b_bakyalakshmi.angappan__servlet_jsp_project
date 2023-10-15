let localorder = JSON.parse(localStorage.getItem("order")) || [];
let localordereditems = JSON.parse(localStorage.getItem("ordered_items"));
let localproducts = JSON.parse(localStorage.getItem("product_list"));
let localsize = JSON.parse(localStorage.getItem("size_list"));
let uuid = JSON.parse(localStorage.getItem("unique_id"));
console.log(uuid);

console.log(localorder);



let filteruserorder = (localorder.filter(e=>e.user_id == uuid));

console.log(filteruserorder);

if(filteruserorder == 0 || filteruserorder == undefined ){

    // console.log("sajnbaj");

    let noorders = `
    <div>
        No orders placed
    </div>

    `

    // document.querySelector(".continue_btn").addEventListener("click", () => {
    // window.location.href = "/pages/orders/wishlist.html";
    // });

    document.querySelector(".fullcontainer").insertAdjacentHTML("afterbegin",noorders);
}

else{

    console.log("sabdsh")

for(let i=0;i<filteruserorder.length;i++){

    console.log(filteruserorder);
    console.log(localordereditems);

console.log(filteruserorder[i]["order_id"]);

let filterordereditems = localordereditems.filter(e=>e.order_id == filteruserorder[i]["order_id"]);

console.log(filterordereditems[0]["product_id"])

    for(let j=0;j<1;j++){
    let findproduct ;
    let findsize ;

    console.log(localproducts);

    findproduct = localproducts.find(e=>e.product_id == filterordereditems[j]["product_id"] );
    console.log(findproduct);

     findsize = localsize.find(e=>e.id == filterordereditems[j]["size"]);
    console.log(findsize);

    // let parseddate = new Date(Date.parse(filteruserorder[i].ordered_time));

    // console.log(parseddate);


    // let findtime = new Date(parseddate);
    // console.log(findtime);


    const dateString = filteruserorder[i].ordered_time;
    console.log(dateString);

const parsedDate = new Date(Date.parse(dateString));
console.log(parsedDate)

console.log(parsedDate); // Output: Fri May 21 2004 00:00:00 GMT+0530 (India Standard Time)

const findTime = new Date(parsedDate);
console.log(findTime); // Output: Fri May 21 2004 00:00:00 GMT+0530 (India Standard Time)


const afterDate = findTime.getDate() + 2;
const afterDay = findTime.getDay();
const afterMonth = findTime.getMonth();


//name of the day and month using an array of names
const daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
const monthsOfYear = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

const dayName = daysOfWeek[afterDay]; // Returns the name of the day of the week
const monthName = monthsOfYear[afterMonth]; 

console.log(dayName);

console.log(monthName);


    // let afterdate = findtime.setDate(findtime.getDate() + 2);
    // console.log(afterdate);


    // let date = findtime.getDate();
    // console.log(date);
    
    // let day =  findtime.getDay()
    // console.log(day);

    // let month = findtime.getMonth();
    // console.log(month);


let orderproducts = `
<div class="fluid-container">

                <div class="product_delivery">

                    <div class="check">
                        <i class="fa-solid fa-spinner"></i>
                    </div>

                    <div class="delivery_date">
                        <h3>${filteruserorder[i].order_status}  </h3>
                        <p>Delivery by ${dayName}, ${afterDate} ${monthName} </p>
                    </div>

                                    <div class="orderpicture">

                                        <div class="smallglimpse"> 
                                       
                                        </div>

                                                                        <span class="spanproduct"> + ${filterordereditems.length - 1} Items <span></div>
                                     
                                    </div>

                <div class="order_list" data-order_id=${filteruserorder[i].order_id}  data-order_item_id = ${filterordereditems[j]["item_id"]}>
                    <div class="product_thumbnail">
                            <img class="product_image" src="${findproduct.image.source}" alt="${findproduct.name}">
                    </div>

                    <div class="product_details">
                        <h4 class="brand_name">${findproduct.brand}</h4>
                        <p class="product_name">${findproduct.name}</p>
                        <p class="product_size">size: ${findsize.value}</p>


                    
                    </div>
                    


                <div class="arrowmark">
                    <i class="fa-solid fa-chevron-right"></i>
                </div>




                </div>
            </div>
`


    document.querySelector(".fullcontainer").insertAdjacentHTML("afterbegin",orderproducts);    

    }

console.log(filterordereditems.length);
    
    if(filterordereditems.length == 1 ){
        document.querySelector(".spanproduct").style.display = "none";
    }

    
else{

for(let i=1;i<filterordereditems.length;i++){

    let filterproduct = localproducts.find(e=>e.product_id == filterordereditems[i]["product_id"]);
    console.log(filterproduct);
        
    let showimage =  `
     <img class="img${i}" src="${filterproduct["image"]["source"]}" alt="">
    `

    document.querySelector(".smallglimpse").insertAdjacentHTML("afterbegin",showimage);

}
    }


}
};

const allorderlist = document.querySelectorAll(".order_list");
console.log(allorderlist)

allorderlist.forEach(move=>
    move.addEventListener("click",movetodetails)
    )

    function movetodetails(){
        let getorderid = this.dataset.order_id
        let getitemid = this.dataset.order_item_id

        window.location.href = `/pages/orders/order-details.html?order_id=${getorderid}&item_id=${getitemid}`
    }



    



