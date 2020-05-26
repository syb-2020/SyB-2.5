# Sistema de Ventas Integrada WEB responsivo
Sistema de gestión de ventas, productos y usuarios, basado en el lenguaje de programación C# (C Sharp), Entity Framework (EF) y AdminLTE.

# Archivo
Los archivos dentro de este sistema son los siguientes:

La arquitectura del proyecto está basada en el Modelo Vista-Controlador "MVC". Además de contar con el tema AdminLTE Version 2.0 el cual ya viene prefijo con sus versiones modificadas de Font Awesome 5.2.0 y Boostrap 4.

Dentro del proyecto encontrara las siguientes carpetas: 

    1.	Content: Carpeta contenedora de componentes de Bootstrap.
    2.	Img: Carpeta contenedora de las imágenes utilizadas en el proyecto
    3.	Model: Carpeta contenedora sobre la Base de datos, utilizando Entity Framework (EF) apuntando a una base de datos existente.
    4.	Scripts: Carpeta contenedora de códigos JavaScript usados para darle interactividad y funcionalidad al sistema.
    5.	Views: Carpeta contenedora dentro con las plantillas Máster del administrador y trabajador, con sus correspondientes vistas y/o módulos, y sus controladores.
    6.	Bower_components: Carpeta contenedora de componentes propios del tema AdminLTE en su versión 2.0.
    7.	Dist: Carpeta contenedora de componentes propios del tema AdminLTE en su versión 2.0.
    8.	Fonts: Carpeta contenedora de las fuentes utilizadas en el sistema.
    9.	Plugins: Carpeta contenedora de componentes propios del tema AdminLTE en su versión 2.0.

    
    
# Base de Datos
Las reglas, diagramaciones y funciones de la base de datos se mostrarán dentro de la carpeta Models.  Sin embargo, falta la agregación sobre datos, más específicos los productos que aún no han sido facilitados.


# Recomendación
Tener instalada la herramienta Microsoft Visual Studio 2012 o versiones posteriores.
Tener instalada y configurada la herramienta Microsoft SQL Server Management Studio 2012 o versiones posteriores.


# Instalación
  1.	Clonar u descarga el repositorio.
  
  2.	Instalar todas las herramientas necesarias como dicta en las recomendaciones.
  
  3.	Descargar archivo de la base de datos.
  
  4.	Ejecutar archivo de las base de datos con la herramienta Microsoft SQL Server Management Studio, crear y usar la base de datos, 
  cargar las tablas e insertar los datos correspondientes para su posterior uso con el sistema.
  
  5.	Una vez creada dicha base de datos, inicializaremos el repositorio descargado u clonado con la herramienta Microsoft Visual 
  Studio, nos dirigiremos dentro de la carpeta Models, una vez desglosado esta carpeta veremos un archivo dentro llamado “Model1.edmx”, 
  procederemos a borrar este archivo, para así reemplazar la base de datos con la que ya hemos creado anteriormente. para esto 
  procedemos a los siguientes pasos una vez eliminado el archivo:
  
   5.1.	Primero nos dirigimos al Archivo llamado Web.Config que se encuentra en la carpeta raíz, una vez dentro buscaremos la 
    siguiente cadena y la eliminaremos:   
    
        <add name="almacen_avance2Entities1" 
        connectionString="metadata=res://*/Models.Model1.csdl|res://*/
        Models.Model1.ssdl|res://*/Models.Model1.msl;provider=System.Data.SqlClien
        t;provider connection string=&quot;data source=BYTE\SQLEXPRESS;initial catalog=almacen_avance2;integrated 
        security=True;MultipleActiveResultSets=True;App=EntityFramework&quot;" providerName="System.Data.EntityClient" />

  5.2.	Una vez eliminado el archivo Model1.edmx y la cadena del archivo Web.Config mencionada anteriormente, podremos agregar la Base de datos ya creada.
  
  5.3.Daremos Clic derecho a la carpeta Models.
  
  5.4.	Seleccionamos Agregar.
  
  5.5.	Seleccionaremos Nuevo elemento.
  
  5.6.	Se desplegará un menú con varias opciones, nos dirigiremos a Datos.
  
  5.7.	Seleccionamos ADO.NET Entity Data Model, nombramos este archivo Model1, igual que el anterior, le daremos agregar, nos redirige 
  a un cuadro para poder configurar con el asistente de Entity Data model.
  
  5.8.	Seleccionamos EF Designer desde base de datos.
  Seleccionamos Nueva conexión, nos redirige a un cuadro de conexión (para esto debemos tener la base de datos creada, y la herramienta 
  Microsoft SQL Server Management Studio con el motor de base de datos conectado).
  
  5.9.	Daremos a Nombre del servidor, para que busque el motor de base de datos y pueda conectarse a través de la autenticación que 
  usted haya configurado. Una vez cargado el Nombre del servidor de su motor de base de datos.
  
  5.10.	Seleccionamos el nombre la base de datos o también nos permite escribir el nombre de la base de datos alojada en el motor de 
  datos (en este caso almacen_avance2).
  
  Luego nos mostrara la cadena de conexión, verificamos que la casilla configuración de conexión en Web.Config este seleccionada, y el 
  nombre de esta sea “almacen_avance2Entities1”, daremos siguiente y siguiente. 
  Nos despliega a elegir los objetos y configuración de la base de datos, seleccionamos la casilla Tablas, desplegamos esta casilla, 
  veremos una casilla llamada dbo la cual también debe estar seleccionada, desplegamos esta casilla y nos mostrara todas las tablas a 
  utilizar en el sistema, las cuales todas deben estar seleccionadas. Verificamos que este seleccionada: la casillas incluir columnas de 
  clave externa en el modelo, y la casilla importar procedimientos almacenados y funciones seleccionadas en Entity Model. También 
  verificamos el nombre de espacio sea “almacen_avance2Model”. Luego realizado y verificado todo lo anterior, daremos a Finalizar.
  Iniciará la carga del modelo de datos y generará la cadena de conexión borrada anterior mente de dentro del archivo Web.Config.
  En casos de aparecer un cuadro daremos a X en la parte superior derecha, lo que significa cerrar sin aceptar o declinar a la petición 
  que nos da.
  

  6.	Una vez realizado todo lo anterior, procederemos a ejecutar el proyecto, ejecutando el archivo Default.aspx en la carpeta Raíz del proyecto. Nos cargará el inicio de sesión en el cual podrá ingresar con los datos Insertados y creados en la base de datos, en este caso existen dos usuarios posibles a iniciar, Administrador y Trabajador con sus respectivos módulos desarrollados y posteriormente a desarrollarse.
    
    Usuario Administrador
    Usuario: guille1@gmail.cl		Contraseña: 1234

    Usuario Trabajador
    Usuario: mario@gmail.cl		Contraseña: 1234

# Referencias
Las referencias en las que me baso para la realización del proyecto son las siguientes:
 Funcionamiento del Modelo Vista-Controlador.
 Herramienta Microsoft Visual Studio.
 Herramienta Microsoft SQL Server Management Studio.
 AdminLTE Control Panel Template.
 Bootstrap 4.0.
 PDO Tutorial.
