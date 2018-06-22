
function consultaReserva() {
    window.location.reload();
}

function comentario() {
    var request;

    var comment = document.ControleComentario.comment.value;
    var email = document.ControleComentario.email.value;

    var url = "comentario.jsp?comment=" + comment + "&email=" + email;

    if (window.XMLHttpRequest) {
        request = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        request = new ActiveXObject("Microsoft.XMLHTTP");
    }

    try {
        request.onreadystatechange = function () {
            if (request.readyState == 4) {
                var val = request.responseText;
                document.getElementById('mylocation').innerHTML = val;
            }
        }//end of function  
        request.open("GET", url, true);
        request.send();
    } catch (e) {
        alert("Unable to connect to server");
    }
}

function atualizaReserva(){
    
}



       