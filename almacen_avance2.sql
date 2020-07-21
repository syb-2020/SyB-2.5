create database almacen_avance2;
use almacen_avance2;


create table Rol(
	id_rol int identity(1,1) primary key ,
	nombre varchar(50) not null unique
);

create table Usuario(
	id_usuario int identity(1,1) primary key ,
	email varchar(100) not null unique,
	clave varchar(500) not null,
	nombre varchar(100) not null,
	apellido varchar(100) not null,
	direccion varchar (100) not null,
	numero_telefonico varchar (100) not null,
	id_rol int not null,
	foreign key(id_rol) references Rol(id_rol)
);

create table Cliente(
	numero_cliente int identity (1,1) primary key,
	descripcion varchar (100) not null
);
create table Tipo_pago(
	id_tipo_pago int identity (1,1) primary key,
	descripcion varchar (100),
);
create table Pago(
	id_pago int identity (1,1) primary key ,
	numero_cliente int not null,
	fecha datetime Default Getdate(),
	id_tipo_pago int not null,
	foreign key (numero_cliente) references Cliente(numero_cliente),
	foreign key (id_tipo_pago) references Tipo_pago(id_tipo_pago)
	
);

create table Venta(
	id_venta int identity (1,1) primary key,
	fecha datetime Default Getdate(),
	numero_cliente int not null,
	id_usuario int not null,
	id_pago int not null,
	foreign key(numero_cliente) references Cliente(numero_cliente),
	foreign key(id_usuario) references Usuario(id_usuario),
	foreign key(id_pago) references Pago(id_pago)
);

create table Producto(
	id_producto varchar (300) not null primary key ,
	nombre varchar (100) not null unique,
	precio int not null,
	stock int not null
);
create table Almacen(
	id_almacen int identity(1,1) primary key ,
	nombre varchar (100) not null unique,
	email varchar (100) not null unique,
	telefono int not null unique,
);
create table Detalle_venta(
	id_detalle int identity (1,1) primary key,
	precio_venta int not null, 
	id_producto varchar (300) not null,
	id_venta int not null,
	id_tipo_pago int not null,
	numero_cliente int not null,
	foreign key(id_producto) references Producto(id_producto),
	foreign key(id_venta) references Venta(id_venta),
	foreign key (id_tipo_pago) references Tipo_pago(id_tipo_pago),
	foreign key (numero_cliente) references Cliente(numero_cliente)
);


create table Camaras(
	id_camara int identity (1,1) primary key,
	nombre varchar (100) not null unique,
	id_usuario int not null,
	id_rol int not null,
	foreign key (id_usuario) references Usuario (id_usuario),
	foreign key (id_rol) references Rol(id_rol)
);

create table Reportes(
	id_reporte int identity (1,1) primary key,
	fecha datetime Default Getdate(),
	descripción varchar(8000),
	id_usuario int not null,
	id_venta int not null,
	id_almacen int not null,
	foreign key (id_usuario) references Usuario(id_usuario),
	foreign key (id_venta) references Venta(id_venta),
	foreign key (id_almacen) references Almacen(id_almacen)
);

insert Rol(nombre) values ('Administrador');
insert Rol(nombre) values ('Trabajador');

insert Usuario (email,clave,nombre,apellido,direccion,numero_telefonico,id_rol) values ('guille@gmail.cl','1234','Guillermo','Fuentes','23 norte 5 oriente D','990034265',1);
insert Usuario (email,clave,nombre,apellido,direccion,numero_telefonico,id_rol) values ('mario@gmail.cl','1234','Mario','Garrido','Longavi','990880926',2);

insert Tipo_pago (descripcion) values ('Efectivo');
insert Tipo_pago (descripcion) values ('Credito');
insert Tipo_pago (descripcion) values ('Debito');

insert Almacen (nombre,email,telefono) values('Juanita','Juanita@gmail.cl',988665522);



