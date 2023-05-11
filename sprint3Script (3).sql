
/*creación de tablas*/
/*PROVEEDOR*/

create table proveedor (
idp int primary key not null auto_increment,
nombre_rl varchar(45),
nombre_c varchar(45),
categoria_prod varchar(40)
);

INSERT INTO proveedor (nombre_rl, nombre_c, categoria_prod)
VALUES
    ('Juan Perez', 'ACME Inc.', 'Electronica'),
    ('Maria Garcia', 'XYZ Corp.', 'Electronica'),
    ('Pedro Rodriguez', '123 Industries', 'Electronica'),
    ('Ana Martinez', 'ABC Company', 'Linea_Blanca'),
    ('Luis Ramirez', 'DEF Corporation', 'Electronica');
    
    /*CONTACTO DE PROVEEDOR*/

create table contacto(
idc int primary key not null auto_increment,
idp int not null,
telefono1 int,
telefono2 int,
secre_n varchar(45),
email varchar(45),
foreign key (idp) references proveedor(idp));

INSERT INTO contacto (idp, telefono1, telefono2, secre_n, email) VALUES (2, 5551234, 1254787, "elias manrriquez", "el.man@example.com");
INSERT INTO contacto (idp, telefono1, telefono2, secre_n, email) VALUES (3, 6665678, 3216548, "Maria Sanchez", "maria.sanchez@example.com");
INSERT INTO contacto (idp, telefono1, telefono2, secre_n, email) VALUES (4, 9876543, 12345678, "Pedro Gonzalez", "pedro.gonzalez@example.com");
INSERT INTO contacto (idp, telefono1, telefono2, secre_n, email) VALUES (5, 1111111, 2222222, "Luisa Gomez", "luisa.gomez@example.com");
INSERT INTO contacto (idp, telefono1,telefono2, secre_n, email) VALUES (1, 5551234,1254787, "Juan Perez", "juan.perez@example.com");


/*PRODUCTOS*/

CREATE TABLE productos
(idproductos int not null auto_increment primary key,
nombre_p varchar(50),
categoria varchar(50),
precio int not null,
color varchar(10),
stock int not null, 
idp int not null,
foreign key (idp) references proveedor(idp));

INSERT INTO productos(idproductos, nombre_p, categoria, precio, color, stock, idp)  
VALUES (1,'Teclado Gamer','Electronica', 15000,'Negro', 60,  2), 
       (2, 'Pantalla Curva','Electronica', 280000,'Negro', 45, 1), 
       (3, 'Audifonos Gamer onEar','Electronica', 45000, 'GrisNegro', 80, 3), 
       (4, 'Joystick','Electronica',35000, 'Burdeo',65, 5), 
       (5, 'Refrigerador LG','Linea blanca',35000, 'Negro', 9, 4);
       
INSERT INTO productos(idproductos, nombre_p, categoria, precio, color, stock, idp)
VALUES (6, 'GameStation','Electronica','150000','Negro', 24, 5), 
       (7, 'TV 43 pulgadas','Electronica', '280000','Negro', 55, 1), 
       (8, 'Video juego Shooter','Electronica', '45000', 'Azul', 40, 3), 
       (9, 'Lentes VR','Electronica','48000', 'Blanco', 35, 2), 
       (10, 'Lavadora LG','Linea blanca','250000','Blanco', 12, 4);


/*CLIENTE*/

create table cliente (idcliente int not null primary key,
nombre varchar (45),
apellido varchar (45),
direccion varchar (45));

insert into cliente values (1, 'Pedro', 'Zamora', 'losjazmines3456'),
(2, 'Francisco', 'Perez', 'Caleuche987'),
(3, 'Mario', 'Urzua', 'Chillan888'),
(4, 'Domingo', 'Martinez', 'AvProvidencia1009'),
(5, 'Maria', 'Hatt', 'Fidias1176'),
(6, 'Gonzalo', 'Perez', 'Manzano778'),
(7, 'Alfonso', 'Ramirez', 'Vidalia889'),
(8, 'Jorge', 'Noles', 'Amaranto975');


/*COMPRAS*/
/*es necesario indexar la columna 'categoria' en la tabla productos para crear esta tabla*/

CREATE INDEX idx_categoria ON productos(categoria);

 
 create table compras(
idcompra int primary key not null auto_increment,
idproductos int not null,
cantidad_prod int not null,
idcliente int not null,
foreign key (idcliente) references cliente(idcliente),
foreign key (idproductos) references productos(idproductos));

insert into compras values (1, 3, 2, 3);
insert into compras values (default, 5, 1, 1);
insert into compras values (default, 6, 1, 4);
insert into compras values (default, 7, 1, 2);
insert into compras values (default, 3, 3, 1);
insert into compras values (default, 5, 2, 5);
insert into compras values (default, 7, 4, 2);
insert into compras values (default, 2, 1, 1);
insert into compras values (default, 9, 1, 4);
insert into compras values (default, 3, 2, 2);

/*CONEXION*/
/*esta tabla crea la conexion de muchos productos a muchos proveedores*/

CREATE TABLE conexion (Idcon int not null primary key,
 idproductos int not null,
 idp int not null,
 foreign key (idp) references proveedor(idp),
 foreign key (idproductos) references productos(idp));
 

/*Cuál es la categoría de productos que más se repite.*/
SELECT categoria, COUNT(*) as cantidad
FROM productos
GROUP BY categoria
ORDER BY cantidad DESC
LIMIT 1;

/*Cuáles son los productos con mayor stock*/
SELECT stock, MIN(nombre_p) as nombre_p, COUNT(*) as cantidad 
FROM productos 
GROUP BY stock 
ORDER BY cantidad DESC 
LIMIT 1;

/*Qué color de producto es más común en nuestra tienda.*/
SELECT color, COUNT(*) as cantidad 
FROM productos 
GROUP BY color 
ORDER BY cantidad DESC 
LIMIT 1;

/*Cual o cuales son los proveedores con menor stock de productos.*/
SELECT idp, sum(stock) AS stock, COUNT(*) AS cantidad
FROM productos
GROUP BY idp
ORDER BY stock asc
LIMIT 1;

set auto_commit = 0;

/*Cambien la categoría de productos más popular por ‘Electrónica y computación’.*/
update productos 
set categoria = 'Electrónica y Computación' 
where categoria = 'Electronica';










 
 
 

