--======================================--
--===============[XPOBLAR]===============--
--======================================--
TRUNCATE TABLE usuarios CASCADE;
TRUNCATE TABLE compradores CASCADE;
TRUNCATE TABLE artistas CASCADE;
TRUNCATE TABLE paises CASCADE;
TRUNCATE TABLE colecciones CASCADE;
TRUNCATE TABLE nfts CASCADE;
TRUNCATE TABLE tags CASCADE;
TRUNCATE TABLE coleccionesNFT CASCADE;
TRUNCATE TABLE subastas CASCADE;
TRUNCATE TABLE contratosInteligentes CASCADE;
TRUNCATE TABLE tokens CASCADE;

--======================================--
--===============[TUPLASOK]===============--
--======================================--
-- [usuarios]
    -- NO HAY RESTRICIONES
-- [compradores]
    -- NO HAY RESTRICIONES
-- [paises]
    -- NO HAY RESTRICIONES
-- [artistas]
    -- NO HAY RESTRICIONES
-- [colecciones]
    -- NO HAY RESTRICIONES
-- [tags]
    -- NO HAY RESTRICIONES
-- [nfts]
    -- NO HAY RESTRICIONES
-- [coleccionesnft]
    -- NO HAY RESTRICIONES
-- [subastas]
INSERT INTO subastas VALUES(7, 100.00, 120.00, 'A', SYSDATE, SYSDATE+7, 1,null, 1, 2);
INSERT INTO subastas VALUES(8, 200.00, 201.00, 'A', SYSDATE, SYSDATE+7, 2,null, 2, 3);

-- [tokens]
    -- NO HAY RESTRICIONES

-- [contratosinteligentes]
INSERT INTO contratosinteligentes VALUES(10, 220.00, SYSDATE, 'P', 1, NULL, 2, 3);
INSERT INTO contratosinteligentes VALUES(11, 320.00, SYSDATE, 'P', 1, NULL, 2, 3);

--======================================--
--===============[TUPLASNOOK]===============--
--======================================--
-- [usuarios]
    -- NO HAY RESTRICIONES
-- [compradores]
    -- NO HAY RESTRICIONES
-- [paises]
    -- NO HAY RESTRICIONES
-- [artistas]
    -- NO HAY RESTRICIONES
-- [colecciones]
    -- NO HAY RESTRICIONES
-- [tags]
    -- NO HAY RESTRICIONES
-- [nfts]
    -- NO HAY RESTRICIONES
-- [coleccionesnft]
    -- NO HAY RESTRICIONES
-- [subastas]
INSERT INTO subastas VALUES(15, 100.00, 120.00, 'A', SYSDATE, SYSDATE+7, 1,null, 1, 1);
INSERT INTO subastas VALUES(16, 200.00, 100.00, 'A', SYSDATE, SYSDATE+7, 2,null, 2, 3);
INSERT INTO subastas VALUES(17, 200.00, 300.00, 'A', SYSDATE, SYSDATE-7, 2,null, 2, 3);
-- [tokens]
    -- NO HAY RESTRICIONES
-- [contratosinteligentes]
INSERT INTO contratosinteligentes VALUES(13, 320.00, SYSDATE, 'P', 1, NULL, 2, 2);
