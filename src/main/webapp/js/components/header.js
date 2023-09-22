   function redirectToServlet(productId) {
   
        window.location.href ="product?product_id="+ productId;
    }


					  // Function to handle the dropdown item selection
					  function handleDropdownSelection(value) {
					    // Construct the URL based on the selected value
					    var selectedCategory = encodeURIComponent(value); // Ensure value is properly encoded
				
					    var redirectURL = "<%=request.getContextPath()%>/products?category='+ selectedCategory;

			// Redirect to the constructed URL
			window.location.href = redirectURL;
		}

		// Add an event listener for each dropdown item
		document.querySelectorAll('.dropdown-item').forEach(function(item) {
			item.addEventListener('click', function() {
				var selectedValue = item.getAttribute('value');
				handleDropdownSelection(selectedValue);
			});
		});