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
--===============[AccionesOK]===============--

-- [usuarios]
INSERT INTO usuarios VALUES (1, 'Alice59', 'Alice59@hotmail.com', '5ad36e3b24a2c7d70546645a02fb2014ad8fa568e92395d5ae124b74e99e5951',0.0);

-- [paises]
INSERT INTO paises VALUES ('COL', 'Colombia');


-- [artistas]
INSERT INTO artistas VALUES(1,'ARTISTA 1','COL',0);

DELETE FROM paises
WHERE id = 'COL';

SELECT *
FROM ARTISTAS;


-- [tags]
 -- No es necesario

-- [nfts]
 -- No es necesario

-- [calificacionesNFT]
 -- No es necesario

-- [colecciones]
 -- No es necesario

-- [coleccionesNFT]
 -- No es necesario

-- [subastas]
 -- No es necesario

-- [contratosInteligentes]
 -- No es necesario
