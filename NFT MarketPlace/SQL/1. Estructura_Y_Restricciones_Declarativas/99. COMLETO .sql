
--======================================--
--===============[XForaneas]===============--
ALTER TABLE compradores DROP CONSTRAINT FK_compradores_usuarios;
ALTER TABLE artistas DROP CONSTRAINT FK_artistas_usuarios;
ALTER TABLE artistas DROP CONSTRAINT FK_artistas_paises;
ALTER TABLE nfts DROP CONSTRAINT FK_nfts_tags;
ALTER TABLE nfts DROP CONSTRAINT FK_nfts_usuarios;
ALTER TABLE nfts DROP CONSTRAINT FK_nfts_artistas;
ALTER TABLE calificacionesNFT DROP CONSTRAINT FK_calificacionesNFT_usuarios;
ALTER TABLE calificacionesNFT DROP CONSTRAINT FK_calificacionesNFT_nfts;
ALTER TABLE colecciones DROP CONSTRAINT FK_colecciones_usuarios;
ALTER TABLE colecciones DROP CONSTRAINT FK_colecciones_artistas;
ALTER TABLE coleccionesnft DROP CONSTRAINT FK_coleccionesnft_colecciones;
ALTER TABLE coleccionesnft DROP CONSTRAINT FK_coleccionesnft_nfts;
ALTER TABLE subastas DROP CONSTRAINT FK_subastas_usuarios1;
ALTER TABLE subastas DROP CONSTRAINT FK_subastas_usuarios2;
ALTER TABLE contratosinteligentes DROP CONSTRAINT FK_contratosinteligentes_subastas;
ALTER TABLE contratosinteligentes DROP CONSTRAINT FK_contratosinteligentes_usuarios1;
ALTER TABLE contratosinteligentes DROP CONSTRAINT FK_contratosinteligentes_usuarios2;

--======================================--
--===============[XTablas]===============--
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


--======================================--
--===============[Atributos]===============--
 
-- [usuarios]
ALTER TABLE usuarios ADD CONSTRAINT CK_usuarios_id 
    CHECK(id>0);

ALTER TABLE usuarios ADD CONSTRAINT CK_usuarios_correo 
    CHECK(correo LIKE '%@%' AND correo LIKE '%.%');

ALTER TABLE usuarios ADD CONSTRAINT CK_usuarios_ganacia
    CHECK(aggGanancia >= 0);

-- [compradores]
 -- No tiene

-- [paises]
 -- No tiene

-- [artistas]
ALTER TABLE artistas ADD CONSTRAINT CK_artistas_comision
    CHECK(aggComision >= 0);

-- [tags]
ALTER TABLE tags ADD CONSTRAINT CK_tags_id 
    CHECK(id>0);

-- [nfts]
ALTER TABLE nfts ADD CONSTRAINT CK_nfts_id 
    CHECK(id>0);

ALTER TABLE nfts ADD CONSTRAINT CK_nfts_url 
    CHECK(archivo LIKE 'https://%' AND archivo LIKE '%.%');

ALTER TABLE nfts ADD CONSTRAINT CK_nfts_formatoArchivo 
    CHECK(formatoArchivo IN ('JPEG','PNG','GIFT','MP4','MP3','DIFF'));

ALTER TABLE nfts ADD CONSTRAINT CK_nfts_haSidoVendido 
    CHECK(haSidoVendido IN ('T','F'));

ALTER TABLE nfts ADD CONSTRAINT CK_nfts_enVenta 
    CHECK(enVenta IN ('T','F'));

ALTER TABLE nfts ADD CONSTRAINT CK_nfs_vecesVendido
    CHECK(vecesVendido >= 0);

-- [calificacionesNFT]
ALTER TABLE calificacionesNFT ADD CONSTRAINT CK_calificacionesnfts_calificacion 
    CHECK(calificacion >=0 AND calificacion <=5);

-- [colecciones]
ALTER TABLE colecciones ADD CONSTRAINT CK_colecciones_id 
    CHECK(id>0);

ALTER table colecciones ADD CONSTRAINT CK_colecciones_veces_vendido
    CHECK(vecesVendido >= 0);

-- [coleccionesNFT]
 -- No tiene

-- [subastas]
ALTER TABLE subastas ADD CONSTRAINT CK_subastas_id 
    CHECK(id>0);

ALTER TABLE subastas ADD CONSTRAINT CK_subastas_precioInicial 
    CHECK(precioInicial >=0);

ALTER TABLE subastas ADD CONSTRAINT CK_subastas_precioActual
    CHECK(precioActual >=0);

ALTER TABLE subastas ADD CONSTRAINT CK_subastas_estado 
    CHECK(estado IN ('I','S','A','P','C'));

-- [contratosInteligentes]
ALTER TABLE contratosInteligentes ADD CONSTRAINT CK_contratosInteligentes_id 
    CHECK(id>0);

ALTER TABLE contratosInteligentes ADD CONSTRAINT CK_contratosInteligentes_precioFinal 
    CHECK(precioFinal>=0);

ALTER TABLE contratosInteligentes ADD CONSTRAINT CK_contratosInteligentes_estadoTransaccion 
    CHECK(estadoTransaccion IN ('P','A','R'));


--======================================--
--===============[Primarias]===============--
 
-- [usuarios]
ALTER TABLE usuarios ADD CONSTRAINT PK_usuarios
    PRIMARY KEY (id);

-- [compradores]
ALTER TABLE compradores ADD CONSTRAINT PK_compradores 
    PRIMARY KEY (usuario);

-- [paises]
ALTER TABLE paises ADD CONSTRAINT PK_paises 
    PRIMARY KEY (id);

-- [artistas]
ALTER TABLE artistas ADD CONSTRAINT PK_artistas 
    PRIMARY KEY (usuario);

-- [tags]
ALTER TABLE tags ADD CONSTRAINT PK_tags 
    PRIMARY KEY (id);

-- [nfts]
ALTER TABLE nfts ADD CONSTRAINT PK_nfts 
    PRIMARY KEY (id);

-- [calificacionesNFT]
ALTER TABLE calificacionesNFT ADD CONSTRAINT PK_calificacionesNFT
    PRIMARY KEY (usuario, nft);

-- [colecciones]
ALTER TABLE colecciones ADD CONSTRAINT PK_colecciones 
    PRIMARY KEY (id);

-- [coleccionesNFT]
ALTER TABLE coleccionesnft ADD CONSTRAINT PK_coleccionesnft 
    PRIMARY KEY (coleccion,nft);

-- [subastas]
ALTER TABLE subastas ADD CONSTRAINT PK_subastas 
    PRIMARY KEY (id);

-- [contratosInteligentes]
ALTER TABLE contratosinteligentes ADD CONSTRAINT PK_contratosinteligentes 
    PRIMARY KEY (id);
    
--======================================--
--===============[Unicas]===============--
 
-- [usuarios]
ALTER TABLE usuarios ADD CONSTRAINT UK_usuarios_correo 
    UNIQUE(correo);
    
ALTER TABLE usuarios ADD CONSTRAINT UK_usuarios_billetera 
    UNIQUE(billetera);

-- [compradores]
 -- No tiene

-- [paises]
ALTER TABLE paises ADD CONSTRAINT UK_paises_pais 
    UNIQUE(pais);

-- [artistas]
ALTER TABLE artistas ADD CONSTRAINT UK_artistas_nombreArtistico 
    UNIQUE(nombreArtistico);

-- [tags]
ALTER TABLE tags ADD CONSTRAINT UK_tags_nombre 
    UNIQUE(nombre);

-- [nfts]
ALTER TABLE nfts ADD CONSTRAINT UK_nfts_nombre 
    UNIQUE(nombre);

ALTER TABLE nfts ADD CONSTRAINT UK_nfts_archivo 
    UNIQUE(archivo);

-- [calificacionesNFT]
 -- No tiene

-- [colecciones]
ALTER TABLE colecciones ADD CONSTRAINT UK_colecciones_nombre 
    UNIQUE(nombre);

-- [coleccionesNFT]
 -- No tiene

-- [subastas]
 -- No tiene

-- [contratosInteligentes]
 -- No tiene
 
--======================================--
--===============[Foraneas]===============--
 
-- [usuarios]
 -- No tiene

-- [compradores]
ALTER TABLE compradores ADD CONSTRAINT FK_compradores_usuarios FOREIGN KEY (usuario) 
    REFERENCES usuarios(id);

-- [paises]
 -- No tiene

-- [artistas]
ALTER TABLE artistas ADD CONSTRAINT FK_artistas_usuarios FOREIGN KEY (usuario) 
    REFERENCES usuarios(id);

ALTER TABLE artistas ADD CONSTRAINT FK_artistas_paises FOREIGN KEY (pais) 
    REFERENCES paises(id);

-- [tags]
 -- No tiene

-- [nfts]
ALTER TABLE nfts ADD CONSTRAINT FK_nfts_tags FOREIGN KEY (tagId) 
    REFERENCES tags(id);

ALTER TABLE nfts ADD CONSTRAINT FK_nfts_usuarios FOREIGN KEY (usuario) 
    REFERENCES usuarios(id);

ALTER TABLE nfts ADD CONSTRAINT FK_nfts_artistas FOREIGN KEY (artista) 
    REFERENCES artistas(usuario);

-- [calificacionesNFT]
ALTER TABLE calificacionesNFT ADD CONSTRAINT FK_calificacionesNFT_usuarios FOREIGN KEY (usuario) 
    REFERENCES usuarios(id);

ALTER TABLE calificacionesNFT ADD CONSTRAINT FK_calificacionesNFT_nfts FOREIGN KEY (nft)
    REFERENCES nfts(id);

-- [colecciones]
ALTER TABLE colecciones ADD CONSTRAINT FK_colecciones_usuarios FOREIGN KEY (usuario) 
    REFERENCES usuarios(id);

ALTER TABLE colecciones ADD CONSTRAINT FK_colecciones_artistas FOREIGN KEY (artista) 
    REFERENCES artistas(usuario);

-- [coleccionesNFT]
ALTER TABLE coleccionesnft ADD CONSTRAINT FK_coleccionesnft_colecciones FOREIGN KEY (coleccion) 
    REFERENCES colecciones(id);

ALTER TABLE coleccionesnft ADD CONSTRAINT FK_coleccionesnft_nfts FOREIGN KEY (nft) 
    REFERENCES nfts(id);

-- [subastas]
ALTER TABLE subastas ADD CONSTRAINT FK_subastas_usuarios1 FOREIGN KEY (subastador) 
    REFERENCES usuarios(id);

ALTER TABLE subastas ADD CONSTRAINT FK_subastas_usuarios2 FOREIGN KEY (comprador) 
    REFERENCES usuarios(id);

-- [contratosInteligentes]
ALTER TABLE contratosinteligentes ADD CONSTRAINT FK_contratosinteligentes_subastas FOREIGN KEY (subasta) 
    REFERENCES subastas(id);

ALTER TABLE contratosinteligentes ADD CONSTRAINT FK_contratosinteligentes_usuarios1 FOREIGN KEY (subastador)
    REFERENCES usuarios(id);

ALTER TABLE contratosinteligentes ADD CONSTRAINT FK_contratosinteligentes_usuarios2 FOREIGN KEY (comprador)
    REFERENCES usuarios(id);

