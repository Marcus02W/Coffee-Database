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
function sql_tabels(){
    
    const formData = new FormData();
    var drop_value = document.getElementById("drop").value;
    formData.append("drop", drop_value);

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/sql_abfrage_tabel");
    xhr.send(formData);

    xhr.onreadystatechange = () => {
        if (xhr.readyState === 4){
            response = xhr.responseText;
            console.log(response);
            if (response=="None") {
                document.getElementById("response").innerHTML="Fehler"
            } 

            else{
                document.getElementById("response").innerHTML = response
            } 
        }
    }

}

function sql_avg_rating(){
    const formData = new FormData();
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/sql_avg_rating");
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