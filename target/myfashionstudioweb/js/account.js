//get value from local storage
const user_list = JSON.parse(localStorage.getItem("user_list"));
const uuid = JSON.parse(localStorage.getItem("unique_id"));


function profile_data(e) {
  return e.email === uuid;
}

// find the user
const user_data = user_list.find(profile_data);

// filling the user details


document.getElementById("fullname").innerText = user_data.full_name;
document.getElementById("email").innerText = user_data.email;
document.getElementById("mobile_number").innerText = user_data.mobile_number;

document.getElementById("gender").innerText = user_data.gender;
document.getElementById("dateofbirth").innerText = user_data.dob;
document.getElementById("hintname").innerText = user_data.hintname;

// unused function to delete the user permanently from the local

function del() {
  const user_list = JSON.parse(localStorage.getItem("user_list"));
  const uuid = JSON.parse(localStorage.getItem("unique_id"));

  function profile_data(e) {
    return e.email == uuid;
  }

  const user_data = user_list.find(profile_data);

  const indexOfUser = user_list.indexOf(user_data);
  user_list.splice(indexOfUser, 1);

  localStorage.setItem("user_list", JSON.stringify(user_list));
  localStorage.setItem("unique_id", "");

  location.href = "./account.html";
}

// function to logout the user

function logOut() {
const logout = document.getElementById("logout");
  logout.onclick = "logOut(e)";

  localStorage.removeItem("unique_id");

  location.href = "../../index.html";
}


// function to open popup

let add_btn = document.querySelector(".add")
// let opendiv = document.querySelector(".popup")

add_btn.addEventListener("click",addaddresspage)
function addaddresspage(){
    window.location.href = "/pages/orders/add_address.html"
}

// // function to close popup

// let closediv = document.querySelector(".x-mark")
// closediv.addEventListener("click",closepopup)

// function closepopup(){
//   opendiv.classList.remove('open_popup')
// }


// reading the address from  the localstorage.


let localaddress = JSON.parse(localStorage.getItem("address_list"))
console.log(localaddress)

// finding the user from the address_list
let findUserAddress = localaddress.find(e=>e.email_id === uuid)
console.log(findUserAddress)

if(findUserAddress["address"].length == 3){
  add_btn.style.display = "none" 
}

if(findUserAddress){
let foundAddress = findUserAddress["address"];

for(i=0;i < foundAddress.length;i++){

  let address_template =`
  
  <div class="address_details">
  <span class="status ${foundAddress[i]["status"]}" >default</span>
  <div class="address_title">${foundAddress[i]["title"]}</div>

  <div class="address">
      ${foundAddress[i]["streetaddress"]},
      <br>
      ${foundAddress[i]["landmark"]},
      <br>
      ${foundAddress[i]["city"]} - ${foundAddress[i]["pincode"]},
      <br>
      ${foundAddress[i]["state"]}.
  </div>

  <div class="mobilenumber">
      mobile number :  ${foundAddress[i]["mobile_number"]}
  </div>

  <div class="buttons">
      <div class="edit_address" data-address_id =  ${foundAddress[i]["address_id"]}>
          EDIT
      </div>
      <div class="remove_address" data-address_id =  ${foundAddress[i]["address_id"]}>
          REMOVE
      </div>

  </div>
</div>
  `
  document.querySelector(".createdAddress").insertAdjacentHTML("afterbegin",address_template)
}

// filling the details in the edit address form

let edit_btn = document.querySelectorAll(".edit_address")
edit_btn.forEach(edit=>
  edit.addEventListener("click",function(_e){
    let clickedEditbtn = this.dataset.address_id

    window.location.href=`/pages/orders/edit_address.html?edit_address=${clickedEditbtn}`
    
  })
)

}


  // remove address from localstorage

  let remove_btn = document.querySelectorAll(".remove_address")
  remove_btn.forEach(remove=>
  remove.addEventListener("click",function(){
    
    let clickedRemoveBtn = this.dataset.address_id
    console.log(clickedRemoveBtn)

    let getAddress = findUserAddress["address"].find(e=>e.address_id == clickedRemoveBtn)
    console.log(getAddress)

    let indexOfaddress = findUserAddress["address"].indexOf(getAddress)
    console.log(indexOfaddress)

    findUserAddress["address"].splice(indexOfaddress,1)

    localStorage.setItem("address_list",JSON.stringify(localaddress))

    location.reload();
  }
  )
)


// function onclicking the profileedit button

document.querySelector(".profile-editButton").addEventListener("click",function(){

window.location.href = "/pages/homepage/edit profile.html"
}
)









