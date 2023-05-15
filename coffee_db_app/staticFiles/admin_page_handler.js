function sql_querry(){
    
    const formData = new FormData();
    var querry = document.getElementById("querry").value;
    formData.append("querry", querry);

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/sql_abfrage");
    xhr.send(formData);

    xhr.onreadystatechange = () => {
        if (xhr.readyState === 4){
            response = xhr.responseText;
            console.log(response);
            if (response=="failed") {
                document.getElementById("response").innerHTML="Falsche Eingabe! :("
            } 

            else{
                document.getElementById("response").innerHTML = response
            } 
        }
    }

}