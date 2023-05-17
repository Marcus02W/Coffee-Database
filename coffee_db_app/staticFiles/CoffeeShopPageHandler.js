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
            //response = JSON.parse(response);
            console.log(response);


            const tableBody = document.getElementById('table-coffee-offerings'); // Select the table body element

            response['coffee_types_overview'].forEach((row) => {
              const tableRow = document.createElement('tr'); // Create a table row element
            
              row.forEach((cell) => {
                const tableCell = document.createElement('td'); // Create a table cell element
                tableCell.textContent = cell;
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