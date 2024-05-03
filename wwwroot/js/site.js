/*var resultados = JSON.parse(data);
$(document).ready(function () {
    $.ajax({
        url: '/HomeController/ObtenerDatos',
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            console.log(data);
            data.forEach(function (nombre) {
                console.log(nombre);
            });
        },
        error: function () {
            console.log('Error al obtener los datos');
        }
    });
});*/




  /*----------------------------------------------------------------------*/
  function validarContraseña() {
    var pass1 = document.getElementById("pass1").value;
    var pass2 = document.getElementById("pass2").value;
    var pass3 = document.getElementById("pass3").value;
    var patron = /^(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}$/;
    let devolver= true

    if (pass1 != pass2){
        document.getElementById("password-error1").innerHTML = "Las contraseñas no coinciden.";
        document.getElementById("password-error1").classList.remove("d-none");
        devolver= false;
    } 
    else{
        document.getElementById("password-error1").classList.add("d-none");
    }
    if (!patron.test(pass1)){
        document.getElementById("password-error").innerHTML = "La contraseña debe contener al menos una letra en mayúscula, un carácter especial y tener al menos 8 caracteres de longitud.";
        document.getElementById("password-error").classList.remove("d-none");
        devolver= false;
    }
    else {
        document.getElementById("password-error").classList.add("d-none");
    }
    return devolver;
}