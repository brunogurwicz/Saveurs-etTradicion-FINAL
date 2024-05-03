CREATE TABLE Comida_Card(
IdComida INT PRIMARY KEY,
IdCategoria INT,
IdReceta INT,
NombreComida varchar(150),
Imagen varchar(300),
Video varchar (300),
Titulo varchar(100)
);

CREATE TABLE Categoria(
IdCategoria INT PRIMARY KEY,
NombreCategoria varchar (200),
Descripcion varchar(500),
Imagen varchar(150)
);

CREATE TABLE Ingrediente(
IdIngrediente	int primary key,
Nombre_Ingrediente varchar(150),
Cantidad INT,
IdReceta INT
);

CREATE TABLE Receta(
IdReceta INT PRIMARY KEY,
Descripcion varchar (500),
Imagen varchar(200),
Titulo varchar (150),
IdUsuario INT,
Pasos varchar(400)
);

CREATE TABLE Usuario(
IdUsuario INT PRIMARY KEY,
Mail varchar(200),
Contraseña varchar(200),
Username varchar(50)
);

CREATE TABLE Receta_Carrousel(
IdRecetaCarrousel INT PRIMARY KEY,
DeescripcionRecetaCarrousel varchar (300),
Tiempo INT,
Precio INT,
CantidadPersonas INT,
IdCategoria INT
);




