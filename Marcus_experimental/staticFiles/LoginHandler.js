function login(){
    const formData = new FormData();
    var username = document.getElementById("uname").value;
    var password = document.getElementById("psw").value;
    formData.append("username", username);
    formData.append("password", password);

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/login_api");
    xhr.send(formData);

    xhr.onreadystatechange = () => {
        if (xhr.readyState === 4){
            response = xhr.responseText;
            console.log(response);
            if (response=="failed") {
                document.getElementById("response").innerHTML=="Login failed! Invalid username and/or password."
            } 

            else{
                document.getElementById("response").innerHTML=="Login successfull! Explore a world full of the finest coffee."
                
                //abspeichern von Login Info in Session Cookie noch einfügen
            } 
        }
    }

}