CREATE SCHEMA IF NOT EXISTS bd_almacenes;
USE bd_almacenes;

CREATE TABLE almacen(
	nro INT AUTO_INCREMENT,
    nombre VARCHAR(50),
    responsable VARCHAR(50),
    CONSTRAINT pkAlmacen PRIMARY KEY (nro));
 
CREATE TABLE articulo(
	cod_art INT,
    descripcion VARCHAR(50),
	precio DECIMAL (10, 2),
    CONSTRAINT pkArticulo PRIMARY KEY (cod_art));
    
CREATE TABLE material(
	cod_mat INT AUTO_INCREMENT,
    descripcion VARCHAR(50),
    CONSTRAINT pkMaterial PRIMARY KEY (cod_mat));
    
CREATE TABLE ciudad(
	cod_ciu INT AUTO_INCREMENT,
    descripcion VARCHAR(50),
    CONSTRAINT pkCiudad PRIMARY KEY (cod_ciu));
    
CREATE TABLE proveedor(
	cod_prov INT AUTO_INCREMENT,
    nombre VARCHAR(50),
    domicilio VARCHAR(50),
    cod_ciu INT,
    fecha_alta DATE,
    CONSTRAINT pkProveedor PRIMARY KEY (cod_prov),
    CONSTRAINT fkCiudad FOREIGN KEY (cod_ciu) REFERENCES ciudad (cod_ciu));
    
CREATE TABLE contiene(
	nro INT,
    cod_art INT,
    CONSTRAINT pkContiene PRIMARY KEY (nro,cod_art),
    CONSTRAINT fkAlmacen FOREIGN KEY (nro) REFERENCES almacen (nro),
    CONSTRAINT fkArticulo FOREIGN KEY (cod_art) REFERENCES articulo (cod_art));
    
CREATE TABLE compuesto_por(
	cod_art INT,
    cod_mat INT,
    CONSTRAINT pkCompuesto_por PRIMARY KEY (cod_art, cod_mat),
    CONSTRAINT fkCompuestoPor_articulo FOREIGN KEY (cod_art) REFERENCES articulo (cod_art),
    CONSTRAINT fkCompuestoPor_material FOREIGN KEY (cod_mat) REFERENCES material (cod_mat));
    
CREATE TABLE provisto_por (
	cod_mat INT,
    cod_prov INT,
    CONSTRAINT pkProvisto_por PRIMARY KEY (cod_mat, cod_prov),
    CONSTRAINT fkProvistoPor_material FOREIGN KEY (cod_mat) REFERENCES material (cod_mat),
    CONSTRAINT fkProvistoPor_proveedor FOREIGN KEY (cod_prov) REFERENCES proveedor (cod_prov));
    
    
    