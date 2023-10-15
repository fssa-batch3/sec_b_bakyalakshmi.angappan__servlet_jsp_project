const user_list = JSON.parse(localStorage.getItem("user_list"));
const uuid = JSON.parse(localStorage.getItem("unique_id"));


function profile_data(e) {
  return e.email === uuid;
}

// find the user
const user_data = user_list.find(profile_data);

// filling the required details in the add address input field

// showing email address
let inputEmail = document.getElementById("email");
let inputMobileNumber = document.getElementById("mobilenumber");
inputEmail.value = user_data.email;
inputMobileNumber.value = user_data.mobile_number;

document.querySelector(".save_btn").addEventListener("click",saveAddress)

// creating address in the localstorage

function saveAddress(){

  let inputEmail = document.getElementById("email").value;
  let inputTitle = document.getElementById("title").value;
  let inputMobileNumber = document.getElementById("mobilenumber").value;
  let inputStreetValue = document.getElementById("staddress").value;
  let inputLandmark = document.getElementById("landmark").value;
  let inputCity = document.getElementById("city").value;
  let inputPincode = document.getElementById("pincode").value;
  let inputState = document.getElementById("state").value;
  let inputCountry = document.getElementById("country").value;

  let localaddress = JSON.parse(localStorage.getItem("address_list")) || []

  let foundUserAddress = localaddress.find(e=>e.email_id === inputEmail)
  console.log(foundUserAddress)


      if(foundUserAddress){
      for(let i=0;i<foundUserAddress["address"].length;i++){

        if(foundUserAddress["address"][i]["status"] === "default"){
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


  if(foundUserAddress){
    foundUserAddress["address"].push({
      "address_id":  parseInt(foundUserAddress["address"].length+1), 
      "title": inputTitle,            
      "streetaddress":inputStreetValue,
      "landmark": inputLandmark,
      "city":inputCity,
      "pincode":inputPincode,
      "state":inputState,
      "country": inputCountry,
      "mobile_number" : inputMobileNumber,
      "status": default_status
    })
  }

  let push_address = []

  if(!foundUserAddress){

    push_address.push({
      "address_id": parseInt(push_address.length +1),
      "title":inputTitle,
      "streetaddress":inputStreetValue,
      "landmark": inputLandmark,
      "city":inputCity,
      "pincode":inputPincode,
      "state":inputState,
      "country": inputCountry,
      "mobile_number" : inputMobileNumber,
      "status": default_status,
    })

    localaddress.push(
      {
          "email_id": inputEmail,
          "address": push_address
      }
    )

  }

  localStorage.setItem("address_list",JSON.stringify(localaddress));
} 


    document.querySelector(".save_btn").addEventListener("click",back)

    function back(){
        window.history.back();
    }