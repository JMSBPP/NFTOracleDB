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

