--======================================--
--===============[XForaneas]===============--
ALTER TABLE artistas DROP CONSTRAINT FK_artistas_paises;

--======================================--
--===============[Acciones]===============--
--======================================--

-- [usuarios]
 -- No tiene

-- [compradores]
 -- No tiene

-- [paises]
 -- No tiene

-- [artistas]
ALTER TABLE artistas ADD CONSTRAINT FK_artistas_paises FOREIGN KEY (pais) 
    REFERENCES paises(id) ON DELETE SET NULL;

-- [tags]
 -- No tiene

-- [nfts]
 -- No tiene

-- [calificacionesNFT]
 -- No tiene

-- [colecciones]
 -- No tiene

-- [coleccionesNFT]
 -- No tiene

-- [subastas]
 -- No tiene

-- [contratosInteligentes]
 -- No tiene
 