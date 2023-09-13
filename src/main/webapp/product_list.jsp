<%@page import="in.fssa.myfashionstudioapp.model.Price"%>
<%@page import="in.fssa.myfashionstudioapp.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product-list</title>

<link rel="stylesheet" href="product_list.css">
</head>
<body>

    <!-- Include the header.jsp file here -->
    <jsp:include page="header.jsp" />

    <%
    List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");
    %>

    <main>
        <div class="heading_top">
            <h3 class="heading_top_gender"></h3>
            <h1 class="heading_top_category">all products</h1>
            <small class="totalproduct"><%= productList.size() %> Items Found</small>
        </div>

        <div class="products">
            <%
            for (ProductDTO product : productList) {
            %>
            <a href="product?product_id=<%= product.getId() %>" style="width: 286px">
                <div class="smallcontainer" >
                    <div class="images">
						<img class="product_image" src="<%= product.getImage() %>" alt="<%= product.getName() %>" style="width: 253px; height: 316px;">
                    </div>
                    <div class="names">
                        <h4 class="product_name"><%= product.getName() %></h4>
                    </div>

                    <%
                    List<Price> priceList = product.getPriceList();
                    for (Price price : priceList) {
                    %>
                    <div class="prices">
                        <span class="size">size : <%= price.getSize().getValue() %></span> <span class="current_price">RS.<%= price.getPrice() %></span>
                    </div>
                    <%
                    } // end priceList loop
                    %>
                </div>
            </a>
            <%
            } // end productList loop
            %>
        </div>
    </main>

    <div class="line"></div>
</body>
</html>
