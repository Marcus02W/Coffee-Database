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
        }
    }
}