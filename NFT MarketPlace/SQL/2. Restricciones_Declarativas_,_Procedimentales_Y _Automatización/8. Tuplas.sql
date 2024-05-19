--===============[Tuplas]===============--
--======================================--

-- [usuarios]
 -- No tiene

-- [compradores]
 -- No tiene

-- [paises]
 -- No tiene

-- [artistas]
 -- No tiene

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
ALTER TABLE subastas ADD CONSTRAINT CK_subastas_precioInicial_PrecioActual
    CHECK (precioActual>=precioInicial);

ALTER TABLE subastas ADD CONSTRAINT CK_subastas_fechaInicio_fechaFinal
    CHECK (fechaFinal >= fechaInicio);

ALTER TABLE subastas ADD CONSTRAINT CK_subastas_subastador_comprador
    CHECK (subastador != comprador);

ALTER TABLE subastas ADD CONSTRAINT CK_subastas_NFT_coleccion
    CHECK ((coleccion IS NOT NULL AND NFT IS NULL) OR (coleccion IS NULL AND NFT IS NOT NULL));

-- [contratosInteligentes]
ALTER TABLE contratosInteligentes ADD CONSTRAINT CK_contratosInteligentes_subastador_comprador
    CHECK (subastador != comprador);

ALTER TABLE contratosInteligentes ADD CONSTRAINT CK_contratosInteligentes_billeteraSubastador_billeteraComprador
    CHECK (billeteraComprador != billeteraSubastador);
