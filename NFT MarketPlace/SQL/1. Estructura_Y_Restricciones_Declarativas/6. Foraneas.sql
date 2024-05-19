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
