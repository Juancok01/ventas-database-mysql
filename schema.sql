
-- Creación tabla productos
create table productos (
	producto_id int auto_increment primary key,
	nombre varchar (100) not null,
	categoria enum('Tecnología', 'Muebles', 'Acccesorios', 'Oficina') not null,
	precio decimal(10, 2) not null check (precio > 0),
	costo decimal(10,2) not null check (costo >= 0),
	stock int not null default 0 check (stock >= 0),
	fecha_creacion date not null,
	activo boolean default true,
	constraint chk_precio_mayor_costo check (precio > costo) 
)engine=innodb;

-- Creación Tabla vendedores 
create table vendedores (
	vendedor_id int auto_increment primary key,
	nombre varchar(100) not null,
	email varchar(100) not null unique,
	telefono varchar(20),
	fecha_contratacion date not null,
	comision decimal(5,2) not null check (comision between 0 and 15),
	activo boolean default true,
	index idx_nombre (nombre)
) engine=innodb;

-- Creación Tabla ventas
create table ventas (
	venta_id int auto_increment primary key,
	fecha_venta datetime not null,
	producto_id int not null,
	vendedor_id int not null,
	cantidad int not null check (cantidad > 0),
	precio_unitario decimal(10,2) not null check(precio_unitario > 0),
	total decimal(10,2) generated always as (cantidad + precio_unitario) stored,
	foreign key (producto_id) references productos(producto_id),
	foreign key ( vendedor_id) references vendedores(vendedor_id),
	index idx_fecha_venta (fecha_venta)
) engine=innodb;


-- Creación Tabla Historial de precios 
create table historico_precios(
	historico_id int auto_increment primary key,
	producto_id int not null,
	precio_anterior decimal(10,2) not null,
	precio_nuevo decimal(10,2) not null,
	fecha_cambio datetime default current_timestamp,
	foreign key (producto_id) references productos(producto_id)
) engine=innodb;