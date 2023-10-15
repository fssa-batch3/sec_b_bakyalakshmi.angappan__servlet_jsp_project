const localproducts = JSON.parse(localStorage.getItem("product_list"));

const localwishlist = JSON.parse(localStorage.getItem("wishlist"));
console.log(localwishlist);

// const uuid = JSON.parse(localStorage.getItem('unique_id'));

// let inputquantity = document.querySelector("#quantity").value

// if (filtereduser_wishlist.length == undefined || filtereduser_wishlist.length == null) {
//     let createp = document.createElement("p");
//     console.log(createp)
//     createp.innerText = "there is no products in the bag";
//     document.querySelector(".products").append(createp);
// }

let localunique_id = "";
let localsize = "";
let filtereduser_wishlist = [];

if (localwishlist != null || localwishlist != undefined) {
  localunique_id = JSON.parse(localStorage.getItem("unique_id"));
  localsize = JSON.parse(localStorage.getItem("size_list"));

  filtereduser_wishlist = localwishlist.filter(
    (e) => e.user_id == localunique_id
  );
  console.log(filtereduser_wishlist);
}

console.log(localunique_id);
console.log(filtereduser_wishlist);

const pr = document.querySelector(".products");
if (filtereduser_wishlist.length == 0) {
  const createp = document.createElement("div");
  createp.setAttribute("class", "message");
  console.log(createp);
  createp.innerText = "Your wishlist is empty!";
  pr.append(createp);
}

for (i = 0; i < filtereduser_wishlist.length; i++) {
  // finding product from local storage
  const find_product = localproducts.find(
    (e) => e.product_id == filtereduser_wishlist[i].product_id
  );
  console.log(find_product);

  const wishlist = `

<div class="smallcontainer" data-product_id = ${find_product.product_id}>

<img class="product_image" src="${find_product.image.source}" alt="${
    find_product.name
  }" />

<div class="x-mark" data-id="${localwishlist[i].wishlist_id}">
        <i id="remove" class="fa-solid fa-xmark"></i>
</div>

<h3 class="brand_name">${find_product.brand}</h3>
<h4 class="product_name">${find_product.name}</h4>

<span class="product_price">${`${find_product.varients[0].price.currency}.${find_product.varients[0].price.current}`}</span>
<span class="original_price"><del>${`${find_product.varients[0].price.currency}.${find_product.varients[0].price.mrp}`}</del></span>
<span class="product_offer">(${
    find_product.varients[0].offer.value + find_product.varients[0].offer.type
  }  Off)</span>

<div>
        <button class="movetobag" data-wishlist_id=${
          localwishlist[i].wishlist_id
        }>move to bag</button>
</div>

</div>

`;
  document
    .querySelector(".products")
    .insertAdjacentHTML("afterbegin", wishlist);
}

const remove = document.querySelectorAll(".x-mark");
remove.forEach((del) =>
  del.addEventListener("click", function (e) {
    e.stopPropagation();
    const wishlist_uuid = this.dataset.id;

    const find_wishlist = localwishlist.find(
      (e) => e.wishlist_id == wishlist_uuid
    );

    const indexofwishprod = localwishlist.indexOf(find_wishlist);
    console.log(indexofwishprod);

    localwishlist.splice(indexofwishprod, 1);

    localStorage.setItem("wishlist", JSON.stringify(localwishlist));

    location.reload();
  })
);

// show the total products in wishlist
const productlength = document.querySelector(".totalproducts");
const w = filtereduser_wishlist.length;
productlength.innerText = `${w} Items`;
//

const localbag = JSON.parse(localStorage.getItem("bag")) || [];

const movetobag_btn = document.querySelectorAll(".movetobag");
movetobag_btn.forEach((tobag) =>
  tobag.addEventListener("click", function (e) {
    e.stopPropagation();
    // product_id of a particular product
    const cick_wishlist_id = this.dataset.wishlist_id;
    console.log(cick_wishlist_id);

    const find_wishlist_product = localwishlist.find(
      (e) => e.wishlist_id === cick_wishlist_id
    );
    // check whether  there is size or not

    console.log(find_wishlist_product);

    // // before selecting the size

    const emptySize = find_wishlist_product["size"] == "";

    if (emptySize) {
      // function to open popup
      function openpopup() {
        document.querySelector(".selectSize").classList.add("openpopup");
      }
      openpopup();

      document
        .querySelector(".selectsizex-mark")
        .addEventListener("click", closepopup);
      // function to close popup
      function closepopup() {
        document.querySelector(".selectSize").classList.remove("openpopup");
      }

      // get local size
      const localsize = JSON.parse(localStorage.getItem("size_list"));

      console.log(localsize);

      // function to find product 

      // localproducts
      const localProduct = JSON.parse(localStorage.getItem("product_list"));

      function find_product(e) {
        return e.product_id === find_wishlist_product["product_id"];
      }

      const productdata = localProduct.find(find_product);
      console.log(productdata);    

      const div_size = document.querySelector(".alllocalsize")
      const productsize = productdata.varients;
      const noOfItems = productsize.length;



      div_size.innerHTML =""
      for (j = 0; j < noOfItems; j++) {
        
        let foundsize;
        for (k = 0; k < localsize.length; k++) {
          foundsize = localsize.find((e) => e.id == productsize[j].size);
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
      
      for(let i=0 ;i<noOfItems;i++){
        if(productsize[i]["quantity"] <= 0){
          document.querySelector(`#productsize${i}`).disabled = true ;
        }
      }

      const inputsize = document.querySelectorAll(".productsize");
      inputsize.forEach((size) =>
        size.addEventListener("click", (e) => {

          // get the selected size value
          click_size_value = e.target.value;
         

          document.querySelector(".done").addEventListener("click",storesize)

          function storesize(){
          find_wishlist_product["size"] = click_size_value;

          localStorage.setItem("wishlist",JSON.stringify(localwishlist));
          
                
  
      const bag_id = crypto.randomUUID();

      const find_bag_product = localbag.find(
        (e) => e.product_id == find_wishlist_product.product_id
      );

      // console.log(find_wishlist_product);

      if (find_bag_product) {
        
        if(confirm("Product aldready exist in bag do you want to remove ?")){

            let confirm_wishlist_id = find_wishlist_product.wishlist_id;
            console.log(confirm_wishlist_id);
            console.log("ajkbsahjdbhjabdh");
            
        const indexofwishprod = localwishlist.indexOf(confirm_wishlist_id);
        console.log(indexofwishprod);

        localwishlist.splice(indexofwishprod, 1);

        localStorage.setItem("wishlist", JSON.stringify(localwishlist));

        
        location.reload();
        };
      }

      if (!find_bag_product) {
        localbag.push({
          bag_id,
          user_id: find_wishlist_product.user_id,
          product_id: find_wishlist_product.product_id,
          size: parseInt(find_wishlist_product.size),
          quantity: 1,
        });


        // remove from wishlist when moved to bag

        const indexofwishprod = localwishlist.indexOf(find_wishlist_product);
        console.log(indexofwishprod);

        localwishlist.splice(indexofwishprod, 1);

        alert("Item added to bag");

        location.reload();
      }

      localStorage.setItem("wishlist", JSON.stringify(localwishlist));
      localStorage.setItem("bag", JSON.stringify(localbag));  
          
          }

        })


      );
 
    }


    // after selecting the size

    if (!emptySize) {
  
      const bag_id = crypto.randomUUID();

      const find_bag_product = localbag.find(
        (e) => e.product_id == find_wishlist_product.product_id
      );

      console.log(find_wishlist_product.wishlist_id);

      if (find_bag_product) {
                if(confirm("Product aldready exist in bag do you want to remove ?")){
            let confirm_wishlist_id = find_wishlist_product.wishlist_id;
            console.log(confirm_wishlist_id)
            
        const indexofwishprod = localwishlist.indexOf(find_wishlist_product);
        console.log(indexofwishprod);

        localwishlist.splice(indexofwishprod, 1);

        localStorage.setItem("wishlist", JSON.stringify(localwishlist));

        location.reload();

        };
      }

      if (!find_bag_product) {
        localbag.push({
          bag_id,
          user_id: find_wishlist_product.user_id,
          product_id: find_wishlist_product.product_id,
          size: parseInt(find_wishlist_product.size),
          quantity: 1,
        });

        const indexofwishprod = localwishlist.indexOf(find_wishlist_product);
        console.log(indexofwishprod);

        localwishlist.splice(indexofwishprod, 1);

        alert("Item added to bag");

        location.reload();
      }

      localStorage.setItem("wishlist", JSON.stringify(localwishlist));
      localStorage.setItem("bag", JSON.stringify(localbag));
      }
    
  })
);

// function to redirect to the product detail

const product_container = document.querySelectorAll(".smallcontainer");

// console.log(product_container);
product_container.forEach((event) => {
  event.addEventListener("click", () => {
    const product_uuid = event.dataset.product_id;
    console.log(product_uuid);
    location.href = `/pages/products/product-details.html?product_id=${product_uuid}`;
  });
});

document.querySelector(".rem_all").addEventListener("click",removeWishlist)

function removeWishlist(){

  if(confirm("Are you sureyou want to remove all items from wishlist")){

  let wishlist = JSON.parse(localStorage.getItem("wishlist"));

  let unique_id = JSON.parse(localStorage.getItem("unique_id"));

const filterwishlist = wishlist.filter(e=>e.user_id !== unique_id);

localStorage.setItem("wishlist",JSON.stringify(filterwishlist));

window.location.reload();
  }

}

// select size
