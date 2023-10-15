const user_list = JSON.parse(localStorage.getItem("user_list"));
const uuid = JSON.parse(localStorage.getItem("unique_id"));


function profile_data(e) {
  return e.email === uuid;
}

// find the user
const user_data = user_list.find(profile_data);

let inputEmail = document.getElementById("email");
let inputMobileNumber = document.getElementById("mobilenumber");
inputEmail.value = user_data.email;
inputMobileNumber.value = user_data.mobile_number;

const localaddress = JSON.parse(localStorage.getItem("address_list")) || []

let foundUserAddress = localaddress.find(e=>e.email_id === inputEmail.value)
console.log(foundUserAddress)


const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
const clickedEditbtn = urlParams.get("edit_address")

console.log(clickedEditbtn)

    let getAddress = foundUserAddress["address"].find(e=>e.address_id == clickedEditbtn)
  
    document.getElementById("title").value = getAddress["title"];
    document.getElementById("mobilenumber").value = getAddress["mobile_number"];
    document.getElementById("staddress").value = getAddress["streetaddress"];
    document.getElementById("landmark").value = getAddress["landmark"];
    document.getElementById("city").value = getAddress["city"];
    document.getElementById("pincode").value =  getAddress["pincode"];
    document.getElementById("state").value = getAddress["state"];
    document.getElementById("country").value = getAddress["country"];



    document.querySelector(".save_btn").addEventListener("click",EditedsaveAddress)

    function EditedsaveAddress(){
      getAddress["title"] =  document.getElementById("title").value ;
      getAddress["mobile_number"]  = document.getElementById("mobilenumber").value ;
      getAddress["streetaddress"] = document.getElementById("staddress").value;
      getAddress["landmark"] = document.getElementById("landmark").value;
      getAddress["city"] = document.getElementById("city").value = document.getElementById("city").value;
      getAddress["pincode"] = document.getElementById("pincode").value ;
      getAddress["state"] = document.getElementById("state").value;
      getAddress["country"] = document.getElementById("country").value;


      // findUserAddress["address"][0]["status"]  = "default"


      if(foundUserAddress){
      for(let i=0;i<foundUserAddress["address"].length;i++){

        if(foundUserAddress["address"][i]["status"] == "default"){
          foundUserAddress["address"][i]["status"]  = "non-default"
        }
      }
      }



      
        let default_status = ""
        if(document.querySelector (`#checkdefault:checked`)){
          default_status = "default"
        }
        if(!document.querySelector (`#checkdefault:checked`)){
          default_status = "non-default"
        }

        getAddress["status"] = default_status;


      localStorage.setItem("address_list",JSON.stringify(localaddress))

      location.reload();

      window.history.back();
    }
