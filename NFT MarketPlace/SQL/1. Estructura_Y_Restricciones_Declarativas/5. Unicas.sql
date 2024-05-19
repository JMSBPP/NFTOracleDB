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
 