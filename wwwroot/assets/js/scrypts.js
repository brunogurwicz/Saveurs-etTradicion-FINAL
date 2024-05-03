$(document).ready(function() {

    toastr.options = {
        "closeButton": false,
        "debug": false,
        "progressBar": true,
        "preventDuplicates": false,
        "positionClass": "toast-top-right",
        "onclick": null,
        "showDuration": "400",
        "hideDuration": "1000",
        "timeOut": "20000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }

    var isFinishing = false;
    var waitInfo;
    var errorIngredient;
    var sussesIngredient;

    // Steps Form
    var wizard = $("#guardarReceta").steps({
        labels: {
            cancel: "Cancelar",
            current: "Paso actual:",
            pagination: "Paginación",
            finish: "Terminar",
            next: "Siguiente",
            previous: "Volver",
            loading: "Cargando ..."
        },
        bodyTag: "fieldset",
        onInit: function (event, currentIndex) {
            console.log('is ready');
            $('ul[aria-label=Paginación] li[aria-disabled="true"] a[href="#previous"]').remove();
        },
        onStepChanging: function(event, currentIndex, newIndex) {
            if (currentIndex > newIndex) {
                return true;
            }

            var form = $(this);
            if (currentIndex < newIndex) {
                $(".body:eq(" + newIndex + ") label.error", form).remove();
                $(".body:eq(" + newIndex + ") .error", form).removeClass("error");
            }
            form.validate().settings.ignore = ":disabled,:hidden";
            return form.valid();
        },
        onStepChanged: function(event, currentIndex, priorIndex) {
            $('ul[aria-label=Paginación] li[aria-disabled="false"] a[href="#previous"]').remove();
        },
        onFinishing: function(event, currentIndex) {
            var form = $(this);
            form.validate().settings.ignore = ":disabled";
            return form.valid();
        },
        onFinished: function(event, currentIndex) {
            console.log('submite');

            if (isFinishing) return;
            isFinishing = true;
            
            var waitInfo = toastr.warning('Aguarde, se estan procesando los datos...')

            event.preventDefault();
            var formData = new FormData($("#guardarReceta")[0]);

            // Send all data
            $.ajax({
                url: "/Home/GuardarReceta",
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                cache: false,
                dataType: 'json',

                success: function(resp) {

                    toastr.clear(waitInfo);

                    if (resp.error) {
                        // Error
                        var erroresList = '';
                        $.each(resp.error, function(key, mensaje) {
                            erroresList += '' + mensaje + ', ';
                        });
                        erroresList += '';
                        swal({
                                title: "Titulo de error",
                                text: erroresList,
                                type: "error"
                            },
                           
                            function() {
                                $('#guardarReceta').trigger("reset");
                                /*window.location = '{{URLCALBACK}}';*/
                            });
                    } else {
                        // SUCCESS
                        if (resp.message) {
                            // If you like send a message
                            swal({
                                    title: "Exito!",
                                    text: "Los datos fueron guardados con Éxito! " + resp.message,
                                    type: "success"
                                },
                                function() {
                                    $('#guardarReceta').trigger("reset");
                                    /*window.location = '{{URLCALBACK}}';*/
                                });
                        } else {
                            swal({
                                    title: "Exito!",
                                    text: "Los datos fueron guardados con Éxito!",
                                    type: "success"
                                },
                                function() {
                                    $('#guardarReceta').trigger("reset");
                                    /*window.location = '{{URLCALBACK}}';*/
                                });
                        }
                    }
                },
                error: function() {
                    // Fail message
                    swal("Titulo de error en servidor", "Detalle del error", "error");
                },
            });
        }
    }).validate({ // Validate Form
        errorPlacement: function(error, element) {
            element.after(error);
        },
        rules: {
           /* Titulo: "required",
            Descripcion: "required",
            Pasos: "required",
            CantidadPersonas: "required",
            Precio: "required",
            Tiempo: "required",
            Video: "required",
            Imagen: "required",*/
        },
        messages: {
            Titulo: "Tiene que ingresar un Titulo",
            Descripcion: "Tiene que ingresar una Descripción",
            Pasos: "Tiene que ingresar un Paso",
            CantidadPersonas: "Tiene que ingresar la Cantidad de Personas",
            Precio: "Tiene que ingresar un Precio",
            Tiempo: "Tiene que ingresar un Tiempo",
            Video: "Tiene que ingresar un Video",
            Imagen: "Tiene que ingresar una Imágen",
        },
    });



    // Auto Complete
    $("#NameIngrediente1 , #NameIngrediente2, #NameIngrediente3, #NameIngrediente4, #NameIngrediente5, #NameIngrediente6, #NameIngrediente7, #NameIngrediente8").autocomplete({
        delay: 700,
        source: function(request, response) {
            // Clear previous message
            toastr.clear(waitInfo);
          

            waitInfo = toastr.error('Para continuar aguarde a ver el listado de Ingredientes y seleccione uno.');

            $.ajax({
                url: "/Home/GetIngredientes", // ACA LA URL DEL SERVICIO QUE RETORNA EL JSON SON LOS DATOS
                type: 'POST',
                dataType: "json",
                data: {
                    Searching: request.term // ACÁ se pasa el valor de lo que se escribe
                },
                success: function(data) {

                    toastr.clear(waitInfo);

                    if (data.error) {
                        // Fail message
                        errorIngredient = toastr.error('No se encontraron Ingredientes.');

                    } else {
                        // Success 
                        console.log(data);
                        sussesIngredient = toastr.info('Para continuar selecciones un Ingrediente de la lista.');
                        var ingredient = $.map(data.suggestions, function (value) { return { value: value.nombre_Ingrediente, data: value.idIngrediente}; });
                        response(ingredient);

                    }
                }
            });
        },
        select: function(event, ui, IdIngrediente) {
            // Set IdIngrediente1
            console.log('You selected: ' + ui.item.value + ', ' + ui.item.data);
            // Set IdIngrediente1
            
            $("#"+this.getAttribute("name")).val(ui.item.data);
           //alert(this.getAttribute("name"));
           //$("#"+this.controlasociado)
            // Set String on Field
            this.value=ui.item.value;
            // Clear Message
            toastr.clear(sussesIngredient);
            return false;
        },
        focus: function(event, ui) {
            return false;
        },
       
    });
    

});
