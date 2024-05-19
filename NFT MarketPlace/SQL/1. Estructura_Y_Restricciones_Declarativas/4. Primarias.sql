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
    