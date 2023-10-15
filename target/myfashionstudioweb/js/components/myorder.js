const order_origin = window.location.origin
console.log(order_origin);

const order_before_login = `
        <a href="${order_origin}/pages/homepage/login.html">
            <div class="myorders">
                <i class="fa-solid fa-box-open"></i>
            </div>
        </a>
`

const order_after_login = `
        <a href="${order_origin}/pages/orders/order_list.html">
            <div class="myorders">
                <i class="fa-solid fa-box-open"></i>
            </div>
        </a>
`

const order_unique_id = JSON.parse(localStorage.getItem("unique_id"));

if (order_unique_id == 0 || order_unique_id == undefined || order_unique_id == "") {

  document.body.insertAdjacentHTML("afterbegin",order_before_login);

}

else {
  document.body.insertAdjacentHTML("afterbegin", order_after_login);
}


