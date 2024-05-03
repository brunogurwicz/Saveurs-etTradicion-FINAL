using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Dapper;
using Newtonsoft.Json;
namespace Integrador.Models;

public static class BD
{
     private static string ConnectionString { get; set; } = @"Server=.;DataBase=Saveurs;Trusted_Connection=True;";
    public static Usuario user;

    /*LOGIN + VERIFICACIONES*/
    public static Usuario Login(string pUsername, string pContraseña)
    {
        Usuario user = null;
        using(SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sp = "LoginUsuario";
            user= db.QueryFirstOrDefault<Usuario>(sp, new {pUsername = pUsername, pContraseña = pContraseña }, commandType: CommandType.StoredProcedure);
        }
        return user;
    }

    public static Usuario Login_VerificarContraseña(string pContraseña)
    {
       Usuario user = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "Login_VerificarContraseña";
            user= db.QueryFirstOrDefault<Usuario>(sp, new {Contraseña=pContraseña}, commandType: CommandType.StoredProcedure);
        }
        return user;
    }
    
     public static Usuario Registro_VerificarExistencia(string Username)
    {
       Usuario user = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "Registro_VerificarExistencia";
            user= db.QueryFirstOrDefault<Usuario>(sp, new {pUsername = Username }, commandType: CommandType.StoredProcedure);
        }
        return user;
    }
    
      public static void Registro(string Username, string Contraseña, string Mail)
    {
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "Registro";
            var parameters = new { pUsername = Username, pContraseña = Contraseña, pMail = Mail };
            db.Execute(sp, parameters, commandType: CommandType.StoredProcedure);
        }
    }

    public static string OlvideMiContraseña(string pMail)
    {
        string Contraseña_recuperada = " ";
        using(SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sp = "OlvideMiContraseña";
            Contraseña_recuperada= db.QueryFirstOrDefault<string>(sp, new { Mail=pMail }, commandType: CommandType.StoredProcedure);
        }
        return Contraseña_recuperada;
    }
    public static Usuario CargarInfoUsuario(int pIdUsuario)
    {
       Usuario user = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "CargarInfoUsuario";
            user= db.QueryFirstOrDefault<Usuario>(sp, new { IdUsuario=pIdUsuario}, commandType: CommandType.StoredProcedure);
        }
        return user;
    }
    /*............................................................................................................................................*/

    /*CARGA DE ELEMENTOS DEL INDEX*/
    public static List<Categoria> CargarCategoriaCard()
    {
       List<Categoria> card = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "CargarCategoriaCard";
            card= db.Query<Categoria>(sp, commandType: CommandType.StoredProcedure).ToList();
        }
        return card;
    }
    public static List<Receta> CargarRecetasCarrousel()
    {
       List<Receta> recetita = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "CargarRecetasCarrousel";
            recetita= db.Query<Receta>(sp,  commandType: CommandType.StoredProcedure).ToList();
        }
        return recetita;
    }
    
    public static Receta CargarReceta(int pIdReceta )
    {
       Receta recetita = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "CargarReceta";
            recetita= db.QueryFirstOrDefault<Receta>(sp, new {IdReceta=pIdReceta }, commandType: CommandType.StoredProcedure);
        }
        return recetita;
    }

    public static Receta Favoritos(int pIdReceta )
    {
       Receta recetita = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "Favoritos";
            recetita= db.QueryFirstOrDefault<Receta>(sp, new {IdReceta=pIdReceta }, commandType: CommandType.StoredProcedure);
        }
        return recetita;
    }
    /*BUSCADORES*/
    public static List<Receta> BuscarPorReceta(string Titulo )
    {
       List<Receta> buscador_receta = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "BuscarPorReceta";
            buscador_receta= db.Query<Receta>(sp, new { pTitulo = Titulo }, commandType: CommandType.StoredProcedure).ToList();
        }
        return buscador_receta;
    }
    public static  List<Ingrediente> BuscarPorIngrediente(string Nombre_Ingrediente )
    {
        List<Ingrediente> buscador_ingrediente = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "BuscarPorIngrediente";
            buscador_ingrediente= db.Query<Ingrediente>(sp, new { pNombre_Ingrediente = Nombre_Ingrediente }, commandType: CommandType.StoredProcedure).ToList();
        }
        return buscador_ingrediente;
    }

    /*CARGA DE RECETAS*/
    public static Categoria CargarCategoriaxId(int pIdCategoria )
    {
        Categoria obj = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "CargarCategoriaxId";
            obj= db.QueryFirstOrDefault<Categoria>(sp, new { IdCategoria=pIdCategoria }, commandType: CommandType.StoredProcedure);
        }
        return obj;
    }
   public static List<Receta>CargarRecetaxCategoria (int pIdCategoria)
    {
       List<Receta> list_receta = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "CargarRecetaxCategoria";
            list_receta= db.Query<Receta>(sp,new { IdCategoria=pIdCategoria }, commandType: CommandType.StoredProcedure).ToList();
        }
        return list_receta;
    }
   
    /*VIEW DE DETALLE DE LA RECETA*/
    public static List<Ingrediente> IngredientesModal(int pIdReceta)
    {   
        List<Ingrediente>list_ingredientesxreceta=null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "IngredientesModal";
            list_ingredientesxreceta= db.Query<Ingrediente>(sp,new { IdReceta=pIdReceta }, commandType: CommandType.StoredProcedure).ToList();
        }
        return list_ingredientesxreceta;
    }

    /*¿ES NECESARIA ESTA FUNCIÓN?*/
      public static List<string> CantidadesIngredientes(int pIdReceta)
    {   
        List<string>list_cantidadingredientes=null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "CantidadesIngredientes";
            list_cantidadingredientes= db.Query<string>(sp,new { IdReceta=pIdReceta }, commandType: CommandType.StoredProcedure).ToList();
        }
        return list_cantidadingredientes;
    }

    /*ACÁ EMPIEZO CON AJAX Y CONVIERTO A JSON LAS CADENAS*/
    public static List <Ingrediente> GetIngredientes(string pSearching)
    {   
        List<Ingrediente>list_nombresingredientes=null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "UnIngrediente";
            list_nombresingredientes = db.Query<Ingrediente>(sp,new { Searching=pSearching }, commandType: CommandType.StoredProcedure).ToList();
        }
        /*string jsonIngredientes = JsonConvert.SerializeObject(list_nombresingredientes);*/
        return list_nombresingredientes;
    }

    public static void AgregarReceta(Receta recetas)
    {   
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "AgregarReceta";
            var parameters = new { Imagen=recetas.Imagen,  
                                    Titulo=recetas.Titulo, 
                                    Descripcion=recetas.Descripcion, 
                                    Pasos=recetas.Pasos, 
                                    CantidadPersonas=recetas.CantidadPersonas, 
                                    Precio=recetas.Precio, 
                                    Tiempo=recetas.Tiempo, 
                                    Video=recetas.Video,
                                    
                                    IdCategoria=recetas.IdCategoria, 
                                    IdUsuario=recetas.IdUsuario};
            db.Execute(sp, parameters, commandType: CommandType.StoredProcedure);
        }
    }
    public static int ObtenerUltimaReceta()
    {   
        int ultidreceta=-1;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "ObtenerUltimaReceta";
            ultidreceta = db.QueryFirstOrDefault<int>(sp,commandType: CommandType.StoredProcedure);
        }
        return ultidreceta;
    }


    /*A CHEQUEAR*/
    public static void AgregarIngrediente(int IdReceta, int idIngrediente, string Cantidad)
    {   
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "AgregarIngrediente";
            var parameters = new {IdReceta, idIngrediente, Cantidad};
            db.Execute(sp, parameters, commandType: CommandType.StoredProcedure);
        }
    }

    public static void AgregarIngredienteAdmin(string Nombre_Ingrediente)
    {   
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "AgregarIngredienteAdmin";
            var parameters = new {Nombre_Ingrediente};
            db.Execute(sp, parameters, commandType: CommandType.StoredProcedure);

        }
    }
    public static void AgregarComentario(string TexCom, int IdReceta){
        string sql = "INSERT INTO Comentario values (@pcomentario, @pidreceta)";
        using(SqlConnection db = new SqlConnection(ConnectionString))
        {
            db.Execute(sql, new {pcomentario=TexCom, pidreceta=IdReceta});
        }
    }
    public static List<Comentario> TraerListaComentarios(int idreceta)
    {
        List<Comentario> devolver = new List<Comentario>();
        using(SqlConnection db = new SqlConnection(ConnectionString))
        {  
            string sql = "SELECT * from Comentario where IdReceta = @pidreceta";
            devolver = db.Query<Comentario>(sql, new {pidreceta=idreceta}).ToList();
        }
        return devolver;
    }
}