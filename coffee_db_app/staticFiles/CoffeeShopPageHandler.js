window.onload = () => {
    console.log(document.cookie);
    const formData = new FormData();
    var username = document.cookie
                    .split("; ")
                    .find((row) => row.startsWith("username="))
                    ?.split("=")[1];
    var password = document.cookie
                    .split("; ")
                    .find((row) => row.startsWith("password"))
                    ?.split("=")[1];
    formData.append("username", username);
    formData.append("password", password);
    
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/coffee_shop_page_api");
    xhr.send(formData);

    xhr.onreadystatechange = () => {
        if (xhr.readyState === 4){
            response = xhr.responseText;
            response = JSON.parse(response);
            console.log(response);


            const tableBody = document.getElementById('table-coffee-offerings'); // Select the table body element

            response['coffee_types_overview'].forEach((row) => {
              const tableRow = document.createElement('tr'); // Create a table row element
            
              row.forEach((cell, index) => {
                const tableCell = document.createElement('td'); // Create a table cell element

                if (index === 2) { 
                  const clickableCell = document.createElement('td'); // Create a new table cell for the clickable element
                  clickableCell.textContent = cell; // Set the text content of the clickable cell
                  
                  clickableCell.onclick = function() {
                    // Your onclick function logic goes here
                    console.log(row[0], row[1], row[2]);
                    const formDataTypes = new FormData();
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "/coffee_types_update_api");
                    formDataTypes.append("is_offered", row[2]);
                    formDataTypes.append("size", row[1]);
                    formDataTypes.append("coffee_type", row[0]);
                    formDataTypes.append("shop_id", username);
                    xhr.send(formDataTypes);
                    location.reload();
                    
                  };
                  
                  tableRow.appendChild(clickableCell);
                }
                else{
                  tableCell.textContent = cell;
                  tableRow.appendChild(tableCell);
                }
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

              tableCell = document.createElement('td');
              var link = document.createElement('a');

              // Set the href attribute
              link.href = 'ordering_details?parameter=' + row[0];

              // Set the link text
              var linkText = document.createTextNode('View details');
              link.appendChild(linkText);

              tableCell.appendChild(link);

              tableRow.appendChild(tableCell);
            
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