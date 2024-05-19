--======================================--
--===============[XTABLAS]===============--
DROP TABLE usuarios;
DROP TABLE compradores;
DROP TABLE paises;
DROP TABLE artistas;
DROP TABLE tags;
DROP TABLE nfts;
DROP TABLE calificacionesNFT;
DROP TABLE colecciones;
DROP TABLE coleccionesNFT;
DROP TABLE subastas;
DROP TABLE contratosInteligentes;


--======================================--
--===============[TABLAS]===============--

CREATE TABLE usuarios(
    id NUMBER(30) NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    correo VARCHAR(150) NOT NULL,
    billetera VARCHAR(300) NOT NULL,
    aggGanancia DECIMAL(10,2) DEFAULT 0.0
);

CREATE TABLE compradores(
    usuario NUMBER(30)  NOT NULL,
    ultimaConexion DATE NOT NULL
);

CREATE TABLE paises(
    id CHAR(3) NOT NULL,
    pais VARCHAR(150) NOT NULL
);

CREATE TABLE artistas(
    usuario NUMBER(30)  NOT NULL,
    nombreArtistico VARCHAR(150) NOT NULL,
    pais CHAR(3),
    aggComision DECIMAL(10,2) DEFAULT 0.0
);

CREATE TABLE tags(
    id NUMBER(30) NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    descripcion VARCHAR(300) NOT NULL,
    descripcionExtendida XMLTYPE
);

CREATE TABLE nfts(
    id NUMBER(30) NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    archivo VARCHAR(200) NOT NULL,
    formatoArchivo CHAR(4) NOT NULL,
    fechaPublicacion DATE NOT NULL,
    haSidoVendido CHAR(1) NOT NULL,
    enVenta CHAR(1) NOT NULL,
    tagId NUMBER(30) NOT NULL,
    usuario NUMBER(30) NOT NULL,
    artista NUMBER(30)  NOT NULL,
    vecesVendido INTEGER DEFAULT 0
);

CREATE TABLE calificacionesNFT(
    usuario NUMBER(30) NOT NULL,
    nft NUMBER(30) NOT NULL,
    calificacion FLOAT(1) NOT NULL
);

CREATE TABLE colecciones(
    id NUMBER(30) NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    fechaPublicacion DATE NOT NULL,
    usuario NUMBER(30) NOT NULL,
    artista NUMBER(30) NOT NULL,
    vecesVendido INTEGER DEFAULT 0
);

CREATE TABLE coleccionesNFT(
    coleccion NUMBER(30) NOT NULL,
    nft NUMBER(30) NOT NULL
);

CREATE TABLE subastas(
    id NUMBER(30) NOT NULL,
    precioInicial DECIMAL(12,10) NOT NULL,
    precioActual DECIMAL(12,10) NOT NULL,
    estado CHAR(2) NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFinal DATE NOT NULL,
    NFT NUMBER(30),
    coleccion NUMBER(30),
    subastador NUMBER(30) NOT NULL,
    comprador NUMBER(30)
);

CREATE TABLE contratosInteligentes(
    id NUMBER(30) NOT NULL,
    precioFinal DECIMAL(12,10) NOT NULL,
    fechaCompra DATE NOT NULL,
    estadoTransaccion CHAR(1) NOT NULL,
    subasta NUMBER(30) NOT NULL,
    subastador NUMBER(30) NOT NULL,
    comprador NUMBER(30) NOT NULL,
    billeteraSubastador VARCHAR(300) NOT NULL,
    billeteraComprador VARCHAR(300) NOT NULL
);
