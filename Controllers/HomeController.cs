using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Integrador.Models;
using Newtonsoft.Json;


namespace Integrador.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index(int IdUsuario,bool showAlert, bool showAlert_cuenta )
    {
        ViewBag.RecetasCarrusel = BD.CargarRecetasCarrousel();
        ViewBag.Card_principal = BD.CargarCategoriaCard();
        ViewBag.user_= BD.CargarInfoUsuario(IdUsuario);
        if (showAlert)
        {
            ViewBag.AlertMessage = "Usted no es Administrador";
        }
        if (showAlert_cuenta)
        {
            ViewBag.AlertMessage_Desinicio = "Desinicio de cuenta exitoso !";
        }
    return View();
    }


    public IActionResult AgregarIng()
    {
        return View();
    }
      
    public IActionResult Privacy()
    {
        return View();
    }
   
   public IActionResult RegistrarView()
    {
        return View();
    }
   


    
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }

    /*REGISTROS Y VERIFICACIONES DE LOGIN*/

    [HttpPost]
    public IActionResult Login(string Username , string Contraseña)
    {
        Usuario Usuario = Models.BD.Login(Username,Contraseña);
        if (Usuario == null )
        {
            ViewBag.MensajeError = "Usuario o Contraseña Incorrecto";
            return View("RegistrarView");
        }
        else
        {
            BD.user = Usuario;
            return RedirectToAction("Index");
        }
    }
    [HttpPost]
    public IActionResult RegistrarUsuario(Usuario user){
        Usuario userr = BD.Registro_VerificarExistencia(user.Username);
        if(userr == null){
           BD.Registro(user.Username, user.Contraseña, user.Mail);
            return View("Index");
        }
        else{
            ViewBag.MSJError= "El usuario ya existe!";
            return View("RegistrarView");
        }
    }
    public IActionResult OlvidarContraseña(string Mail)
    {
        string contraseña = BD.OlvideMiContraseña(Mail);
        if(contraseña == null || contraseña == "") {
            ViewBag.MensajeInexistente = "No existe el mail ingresado anteriormente";
            return View("OlvideContraseña");
        }
        else
        {
            ViewBag.ContraseñaRecordada = contraseña;
            return View("OlvideContraseña");
        }
    }

    /*CARGA DE ELEMENTOS DEL INDEX*/
    public IActionResult Card_principal(Categoria cate)
    {
        ViewBag.ListadoCards=BD.CargarCategoriaCard();
        return View("Index");
    }
    public IActionResult Carrousel_principal()
    {
        ViewBag.ListadoRecetasCarrousel=BD.CargarRecetasCarrousel();
        return View("Index");
    }
     

     /*BUSCADORES*/
    public IActionResult BuscarPorReceta(Receta recetita)
    {
        ViewBag._recetitas=BD.BuscarPorReceta(recetita.Titulo);
        return View("Buscador");
    }
    public IActionResult BuscarPorIngrediente(Ingrediente ingrediente_)
    {
        ViewBag.ingredientitos=BD.BuscarPorReceta(ingrediente_.Nombre_Ingrediente);
        return View("Buscador");
    }

    /*CARGA DE RECETAS*/
   
    public IActionResult CargarReceta(Receta recetita)
    {
        ViewBag.recetita_=BD.CargarReceta(recetita.IdReceta);
        return View("Receta");
    }

    public IActionResult Listado_Recetas(int IdCategoria, int IdReceta)
    {
        ViewBag.obj=BD.CargarCategoriaxId(IdCategoria);
        ViewBag.list_receta=BD.CargarRecetaxCategoria(IdCategoria);
        ViewBag.lista_ingredientes = MostrarIngredientesModal(IdReceta);
        return View("Listado_Recetas");
    } 


    /*VIEW DE DETALLE DE LA RECETA*/
     [HttpPost]
     public List <Ingrediente> MostrarIngredientesModal( int IdReceta){
        List <Ingrediente> list_ingredientesxreceta=BD.IngredientesModal(IdReceta);
        return list_ingredientesxreceta;
     }

     /*VER SI ES NECESARIA ESTA FUNCIÓN*/
     public IActionResult MostrarIngredientes(int IdReceta)
    {
        ViewBag.recetita=BD.CargarReceta(IdReceta);
        ViewBag.list_ingredientes=BD.IngredientesModal(IdReceta);
        ViewBag.list_cantidadingredientes=BD.CantidadesIngredientes(IdReceta);
        ViewBag.Id = IdReceta;
        ViewBag.ListComentarios = BD.TraerListaComentarios(IdReceta);
        return View();
    }

    public IActionResult Favoritos(int IdReceta)
    {
        ViewBag.recetita=BD.Favoritos(IdReceta);
        return View();
    }

     /*ACÁ EMPIEZO CON AJAX Y CONVIERTO A JSON LAS CADENAS*/
    

    public IActionResult AgregarReceta(int IdCategoria)
    {
        if (BD.user == null) 
        {
            return RedirectToAction("RegistrarView");
        }
        else
        {
            ViewBag.IdCategoria = IdCategoria;
            ViewBag.IdUsuario = BD.user.IdUsuario;
            Usuario usuario = BD.CargarInfoUsuario(BD.user.IdUsuario);
            return View("AgregarReceta");
        }   
    }
     
    [HttpPost]
    public IActionResult GuardarReceta(Receta recetas)
    {
        int id_ult_receta;        
        /*BD.AgregarReceta(recetas);
        return RedirectToAction("Listado_Recetas",new{IdCategoria=recetas.IdCategoria});*/
        try
        {
            BD.AgregarReceta(recetas);
            id_ult_receta= BD.ObtenerUltimaReceta();

            // Agrego los ingredientes a una lista
            Dictionary<int,string> ingredientes =new Dictionary<int, string>();
            if (recetas.IdIngrediente1 != 0) ingredientes.Add(recetas.IdIngrediente1, recetas.Cantidad1);
            if (recetas.IdIngrediente2 != 0) ingredientes.Add(recetas.IdIngrediente2, recetas.Cantidad2);
            if (recetas.IdIngrediente3 != 0) ingredientes.Add(recetas.IdIngrediente3, recetas.Cantidad3);
           // if (recetas.IdIngrediente4 != null) ingredientes.Add(recetas.IdIngrediente4, recetas.Cantidad4);

            foreach(int clave in ingredientes.Keys)
            {
                BD.AgregarIngrediente(id_ult_receta,clave,ingredientes[clave]);
            }
            return Json(new { success = true, IdCategoria = recetas.IdCategoria });
        }
        catch (Exception ex)
        {
            return Json(new { error = ex.Message });
        }
    }

    

    [HttpPost]
    public IActionResult GetIngredientes(string Searching)
    {
        List<Ingrediente> jsonIngredientes = BD.GetIngredientes(Searching);
        
        if (jsonIngredientes == null )
        {
        return Json(new { error = true, message = "No se pudieron obtener ingredientes", data = 'a' });
        }
        else
        {
            return Json(new { query = "Unit", suggestions = jsonIngredientes});
        }
    }

    public IActionResult AgarrarUsuario(int IdUsuario)
    {
        ViewBag.user_= BD.CargarInfoUsuario(IdUsuario);
        ViewBag.IdUsuario = BD.user.IdUsuario;
         return View("AgregarReceta");
    }


    public IActionResult AgregarIngredienteAdmin()
    {
          if (BD.user == null){
             return RedirectToAction("RegistrarView");
        }
         else if (BD.user.IdUsuario != 1) 
        {
            return RedirectToAction("Index", new { showAlert = true });
        }
        
        else
        {
            ViewBag.IdUsuario = BD.user.IdUsuario;
            
            return View("AgregarIngredientesAdmin");
    }
    }

    public IActionResult EstadoCuenta(){
        if (BD.user == null){
             return RedirectToAction("RegistrarView");
        }
        else  
        {
            BD.user = null;
            return RedirectToAction("Index", new { showAlert_cuenta = true });
        }
    }

 [HttpPost]
public IActionResult GuardarIngredienteAdmin(string Nombre_Ingrediente)
    {
        BD.AgregarIngredienteAdmin(Nombre_Ingrediente);
        return RedirectToAction("Index");
    }
    [HttpPost]
    public IActionResult AgregarComentario(string comentario, int idreceta){
        BD.AgregarComentario(comentario,idreceta);
        return RedirectToAction("MostrarIngredientes", new {IdReceta = idreceta});
    }
}
    
        
    
 