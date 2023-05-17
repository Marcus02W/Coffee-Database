window.onload = () => {
    const formData = new FormData();
    var username = document.cookie
                    .split("; ")
                    .find((row) => row.startsWith("username="))
                    ?.split("=")[1];
    var password = document.cookie
                    .split("; ")
                    .find((row) => row.startsWith("password"))
                    ?.split("=")[1];
    console.log(username);
    console.log(document.cookie);
    formData.append("username", username);
    formData.append("password", password);

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/customer_page_api");
    xhr.send(formData);

    xhr.onreadystatechange = () => {
        if (xhr.readyState === 4){
            response = xhr.responseText;
            response = JSON.parse(response);
            console.log(response);

            const tableBody = document.getElementById('table-coffee-shops'); // Select the table body element

            // Helper function to create a star element
            function createStar(index, shop_id) {
              const star = document.createElement('span');
              star.classList.add('star');
              star.classList.add('gray');
              star.addEventListener('click', function() {
                const rating = index + 1;
                // Send the rating value to JavaScript
                // ... (add your code to send the rating value to JavaScript)
                console.log(rating, shop_id); // Output the rating value to the console

                const formDataRating = new FormData();
                formDataRating.append("rating_id",username+shop_id);
                formDataRating.append("customer_id", username);
                formDataRating.append("shop_id", shop_id);
                formDataRating.append("score", rating);
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "/rating_update_api");
                xhr.send(formDataRating);

                location.reload();
              });
              return star;
            }

            response['coffee_shops_overview'].forEach((row) => {
              const tableRow = document.createElement('tr');

              row.forEach((cell, index) => {
                const tableCell = document.createElement('td');

                if (index===0){
                  return;
                }
                  
                else if (index === 3) { // Check if it's the score cell
                  const starsContainer = document.createElement('div');
                  starsContainer.classList.add('stars-container');

                  // Determine the rating value (number of golden stars)
                  const rating = cell ? parseInt(cell) : 0;

                  // Create 5 stars, coloring the golden ones based on the rating
                  for (let i = 0; i < 5; i++) {
                    const star = createStar(i, row[0]);
                    if (i < rating) {
                      star.classList.remove('gray');
                      star.classList.add('golden');
                    }
                    starsContainer.appendChild(star);
                  }

                  tableCell.appendChild(starsContainer);
                } else {
                  tableCell.textContent = cell;
                }

                tableRow.appendChild(tableCell);
              });

              tableBody.appendChild(tableRow);
            });



            const tableBodyOrders = document.getElementById('table-recent-orders'); // Select the table body element

            response['recent_orders_overview'].forEach((row) => {
              const tableRow = document.createElement('tr'); // Create a table row element
            
              row.forEach((cell) => {
                const tableCell = document.createElement('td'); // Create a table cell element
                tableCell.textContent = cell;
                tableRow.appendChild(tableCell);
              });
            
              tableBodyOrders.appendChild(tableRow);
            });

            const tableBodyRatings = document.getElementById('table-ratings'); // Select the table body element

            response['ratings_overview'].forEach((row) => {
              const tableRow = document.createElement('tr'); // Create a table row element
            
              row.forEach((cell) => {
                const tableCell = document.createElement('td'); // Create a table cell element
                tableCell.textContent = cell;
                tableRow.appendChild(tableCell);
              });
            
              tableBodyRatings.appendChild(tableRow);
            });
            

        }
    }
}