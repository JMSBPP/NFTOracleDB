--                  bd1000103093

--======================================--
--===============[]===============--
--======================================--

-- [usuarios] 
-- [compradores]
-- [paises]
-- [artistas]
-- [tags]
-- [nfts]
-- [calificacionesNFT]
-- [colecciones]
-- [coleccionesNFT]
-- [subastas]
-- [contratosInteligentes]


-- ACA ESTA TODO LO RELACIONADO A BORRAR COSAS PARA PODER LIMPIAR LOS NOMBRES Y COSAS QUE VAYAMOS A USAR EN LA CREACION Y USO DE LA BASE

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
--===============[XPoblar]===============--
TRUNCATE TABLE usuarios CASCADE;
TRUNCATE TABLE compradores CASCADE;
TRUNCATE TABLE paises CASCADE;
TRUNCATE TABLE artistas CASCADE;
TRUNCATE TABLE tags CASCADE;
TRUNCATE TABLE nfts CASCADE;
TRUNCATE TABLE calificacionesNFT CASCADE;
TRUNCATE TABLE colecciones CASCADE;
TRUNCATE TABLE coleccionesNFT CASCADE;
TRUNCATE TABLE subastas CASCADE;
TRUNCATE TABLE contratosInteligentes CASCADE;

--======================================--
--===============[XDisparadores]===============--
DROP TRIGGER TG_usuarios_BI;
DROP TRIGGER TG_usuarios_BU;
DROP TRIGGER TG_usuarios_BD;
DROP TRIGGER TG_compradores_BI;
DROP TRIGGER TG_compradores_BU;
DROP TRIGGER TG_compradores_BD;
DROP TRIGGER TG_PAISES_BU;
DROP TRIGGER TG_artistas_BI;
DROP TRIGGER TG_artistas_BU;
DROP TRIGGER TG_artistas_BD;
DROP TRIGGER TG_tags_BI;
DROP TRIGGER TG_tags_BU;
DROP TRIGGER TG_tags_BD;
DROP TRIGGER TG_nfts_BI;
DROP TRIGGER TG_nfts_BU;
DROP TRIGGER TG_nfts_BD;
DROP TRIGGER TG_calificacionesNFT_BI;
DROP TRIGGER TG_calificacionesNFT_BU;
DROP TRIGGER TG_calificacionesNFT_BD;
DROP TRIGGER TG_colecciones_BI;
DROP TRIGGER TG_colecciones_BU;
DROP TRIGGER TG_colecciones_BD;
DROP TRIGGER TG_coleccionesnft_BI;
DROP TRIGGER TG_coleccionesnft_BU;
DROP TRIGGER TG_subastas_BI;
DROP TRIGGER TG_subastas_BU;
DROP TRIGGER TG_subastas_BD;
DROP TRIGGER TG_contratosInteligentes_BI;
DROP TRIGGER TG_contratosInteligentes_BU;
DROP TRIGGER TG_contratosInteligentes_BD;

--======================================--
--===============[XSecuencias]===============--
DROP SEQUENCE SEQ_usuarios;
DROP SEQUENCE SEQ_tags;
DROP SEQUENCE SEQ_nftsColecciones;
DROP SEQUENCE SEQ_subastas;
DROP SEQUENCE SEQ_contratosInteligentes;

--======================================--
--===============[XIndicesVistas]===============--
DROP VIEW VISTA_COMERCIAL_1;
DROP VIEW VISTA_COMERCIAL_2;
DROP VIEW VISTA_COMERCIAL_3;
DROP VIEW VISTA_COMERCIAL_4;
DROP VIEW VISTA_COMERCIAL_5;
DROP VIEW VISTA_COMERCIAL_6;
DROP VIEW VISTA_COMERCIAL_7;
DROP VIEW VISTA_COMERCIAL_8;
DROP VIEW VISTA_COMERCIAL_9;
DROP VIEW VISTA_COMERCIAL_10;
DROP VIEW VISTA_ARTISTA_1;
DROP VIEW VISTA_ARTISTA_2;
DROP VIEW VISTA_GENERAL_1;
DROP VIEW VISTA_GENERAL_2;
DROP VIEW VISTA_ADMIN_1;
DROP VIEW VISTA_ADMIN_2;
DROP VIEW VISTA_ADMIN_3;
DROP VIEW VISTA_ADMIN_4;
DROP VIEW VISTA_ADMIN_5;
DROP VIEW VISTA_GERENCIAL_1;
DROP VIEW VISTA_GERENCIAL_2;
DROP VIEW VISTA_GERENCIAL_3;
DROP VIEW VISTA_GERENCIAL_4;
DROP VIEW VISTA_GERENCIAL_5;
DROP VIEW VISTA_GERENCIAL_6;
DROP VIEW VISTA_GERENCIAL_7;
DROP VIEW VISTA_GERENCIAL_8;
DROP VIEW VISTA_GERENCIAL_9;
DROP VIEW VISTA_GERENCIAL_10;

--======================================--
--===============[XCRUD]===============--

DROP PACKAGE PK_COMPRADORES;
DROP PACKAGE PK_USUARIOS;
DROP PACKAGE PK_ARTISTAS;
DROP PACKAGE PK_NFTS;
DROP PACKAGE PK_COLECCIONES;
DROP PACKAGE PK_SUBASTAS;

--======================================--
--===============[XSeguridad]===============--


