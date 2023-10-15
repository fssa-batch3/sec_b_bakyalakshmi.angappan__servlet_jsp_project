<%@page import="in.fssa.myfashionstudioapp.model.Address"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- link for the google fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<!-- link for the font awesome icons -->
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
	
<!-- link for the bootstrap css -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap css/bootstrap.css">
<!-- link for the common css -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/header.css">
<!-- -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/add_address.css">
<!-- script for sweet alert -->
<script src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js
"></script>
<link href="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css
" rel="stylesheet">


<title>add address</title>
</head>
<body>

<% String source = (String) request.getParameter("source"); %>

<% Address  addressId = (Address)request.getAttribute("address"); %>

            <div class="container popup">
                <div class="container-form">
                    <div class="x-mark">
                        <i class="fa-solid fa-xmark"></i>
                    </div>
                    <form action="<%= request.getContextPath() %>/address/create?source=<%= source %>"  method = "post">
            
                        <h2>add your delivery address</h2>
                       
            
                        <div>
                            <label class="label_field" for="title" >Address Title</label>
                            <br>
                            <input class="input_field" type="text" name="title" id="title" placeholder="Eg.Home,work,etc" value="Work" required>
                        </div>
            
                        <div>
                            <label class="label_field" for="pincode" >steet address</label>
                            <br>
                            <input class="input_field" type="text" name="address" id="staddress" placeholder="Eg.3 stripes street" value="No 40, MGR Salai Kandanchavadi, Perungudi" required />
                        </div>
            
                        <div>
                            <label class="label_field" for="landmark" >Landmark</label>
                            <br>
                            <input class="input_field" type="text" name="landmark" id="landmark"placeholder="Eg.Company,building,etc" value="building" required>
                        </div>
            
                        <div class="city_pincode">
                            <div class="coloumn">
                                <label class="label_field" for="city">city</label>
                                <input class="input_field" type="text" name="city" id="city" value=" Chennai" required>
                            </div>
            
                            <div class="coloumn">
                                <label class="label_field" for="pincode">pincode</label>
                                <input class="input_field" type="text" name="pincode" id="pincode" value="600096" pattern="^([^0][0-9]){6}*$"  maxlength="6" title="pincode must be valid cannot deliver to this pincode" required>
                            </div>
                        </div>
            
                        <div>
                            <label class="label_field" for="state">state</label>
                            <br>
                            <input class="input_field" type="text" name="state" id="state" value="Tamilnadu" required>
                        </div>
            
                        <div>
                            <label class="label_field" for="country">country</label>
                            <br>
                            <input class="input_field" value="India" type="text" name="country" id="country" required readonly>
                        </div>
                        
                          
                    <button class="save_btn" type="submit">save</button>
                  
            
            <!-- 
                        <div>
                            <input type="checkbox" id="checkdefault">
                            <label for="checkdefault">Make this default</label>
                        </div> -->
            
                    </form>
            
                    <!-- <div> -->
                
                    <!-- </div> -->
            
                </div>
            
            </div>

</body>
</html>