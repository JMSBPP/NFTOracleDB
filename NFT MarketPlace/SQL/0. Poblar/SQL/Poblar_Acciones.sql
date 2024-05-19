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
--===============[ACCIONESOK]===============--
--======================================--
-- [usuarios]
    -- NO HAY ACCIONES
-- [compradores]
DELETE FROM USUARIOS WHERE id = 1;

-- [paises]
    -- NO HAY ACCIONES
-- [artistas]
DELETE FROM USUARIOS WHERE id = 3;
DELETE FROM PAISES WHERE id = 'FRA';

-- [colecciones]
    -- SE BORRARON COLECCIONES ID 1 Y 4 (POR EL ANTERIOR)

-- [tags]
    -- NO HAY ACCIONES

-- [nfts]
    -- SE BORRARON LOS NFT DE ID 1,2,3, POR EL ANTERIOR
DELETE FROM TAGS WHERE ID = 4;

-- [coleccionesnft]
    -- SE BORRO LA 1 Y 4 LO QUE HACE QUE SE BORREN DE AHI TAMBIEN IGUAL QUE EL 1,2,3,4 POR LOS NFT
    
-- [subastas]
    -- NO QUEDA NINGUNA POR LO ANTERIOR

INSERT INTO usuarios VALUES(1, 'Nombre 1', 'correo1@lol.com', 'billetera1');
INSERT INTO usuarios VALUES(2, 'Nombre 2', 'correo2@lol.com', 'billetera2');
INSERT INTO usuarios VALUES(3, 'Nombre 3', 'correo3@lol.com', 'billetera3');
INSERT INTO usuarios VALUES(4, 'Nombre 4', 'correo4@lol.com', 'billetera3');
INSERT INTO usuarios VALUES(5, 'Nombre 5', 'correo5@lol.com', 'billetera5');
INSERT INTO compradores VALUES(1,SYSDATE);
INSERT INTO compradores VALUES(2,SYSDATE);
INSERT INTO paises VALUES('FRA', 'Francia');
INSERT INTO artistas VALUES(3,'Artista 1','COL');
INSERT INTO artistas VALUES(4,'Artista 2','GER');
INSERT INTO artistas VALUES(5,'Artista 3','FRA');
INSERT INTO colecciones VALUES(1, 'Colección 1', SYSDATE, 3, 1);
INSERT INTO colecciones VALUES(2, 'Colección 2', SYSDATE, 4, 2);
INSERT INTO colecciones VALUES(3, 'Colección 3', SYSDATE, 5, 3);
INSERT INTO colecciones VALUES(4, 'Colección 4', SYSDATE, 3, 4);
INSERT INTO colecciones VALUES(5, 'Colección 5', SYSDATE, 4, 5);
INSERT INTO tags VALUES(1, 'Tag 1', 'Descripción del tag 1');
INSERT INTO tags VALUES(2, 'Tag 2', 'Descripción del tag 2');
INSERT INTO tags VALUES(3, 'Tag 3', 'Descripción del tag 3');
INSERT INTO tags VALUES(4, 'Tag 4', 'Descripción del tag 4');
INSERT INTO tags VALUES(5, 'Tag 5', 'Descripción del tag 5');
INSERT INTO nfts VALUES(1, 'NFT 1', 'https://archivo1.jpg', 'JPEG', SYSDATE, 4, 'F', 'T', 1, 1, 3);
INSERT INTO nfts VALUES(2, 'NFT 2', 'https://archivo2.png', 'PNG',SYSDATE, 5, 'F', 'T', 2, 2, 3);
INSERT INTO nfts VALUES(3, 'NFT 3', 'https://archivo3.gif', 'GIFT',SYSDATE, 3, 'F', 'T', 3, 3, 3);
INSERT INTO nfts VALUES(4, 'NFT 4', 'https://archivo4.mp4', 'MP4',SYSDATE, 4, 'F', 'T', 4, 4, 4);
INSERT INTO nfts VALUES(5, 'NFT 5', 'https://archivo5.mp3', 'MP3',SYSDATE, 5, 'F', 'T', 5, 5, 5);
INSERT INTO coleccionesnft VALUES(1, 1);
INSERT INTO coleccionesnft VALUES(2, 2);
INSERT INTO coleccionesnft VALUES(3, 3);
INSERT INTO coleccionesnft VALUES(4, 4);
INSERT INTO coleccionesnft VALUES(5, 5);
INSERT INTO tokens VALUES(3, 'Token 3', 300.00);
INSERT INTO tokens VALUES(5, 'Token 5', 500.00);
INSERT INTO subastas VALUES(1, 100.00, 120.00, 'A', SYSDATE, SYSDATE+7, 1,3, 1, 2);
INSERT INTO subastas VALUES(2, 200.00, 250.00, 'A', SYSDATE, SYSDATE+7, 2,3, 2, 3);
INSERT INTO subastas VALUES(3, 300.00, 350.00, 'A', SYSDATE, SYSDATE+7, 3,3, 3, 4);
INSERT INTO subastas VALUES(4, 400.00, 450.00, 'A', SYSDATE, SYSDATE+7, 4,3, 4, 5);
INSERT INTO subastas VALUES(5, 500.00, 550.00, 'A', SYSDATE, SYSDATE+7, 5,3, 5, 1);
INSERT INTO contratosinteligentes VALUES(1, 120.00, SYSDATE, 'A', 1, 3, 2, 3);
INSERT INTO contratosinteligentes VALUES(2, 250.00, SYSDATE, 'A', 2, 3, 3, 4);
INSERT INTO contratosinteligentes VALUES(3, 350.00, SYSDATE, 'A', 3, 3, 4, 5);
INSERT INTO contratosinteligentes VALUES(4, 450.00, SYSDATE, 'A', 4, 3, 5, 1);
INSERT INTO contratosinteligentes VALUES(5, 550.00, SYSDATE, 'A', 5, 3, 1, 2);

DELETE FROM TOKENS WHERE ID = 5;


-- [tokens]
    -- 

-- [contratosinteligentes]
DELETE FROM TOKENS WHERE ID = 3;


--======================================--
--===============[ACCIONESNOOK]===============--
--======================================--
-- [usuarios]
    -- NO HAY
-- [compradores]
    -- NO HAY
-- [paises]
    -- NO HAY
-- [artistas]
    -- NO HAY
-- [colecciones]
    -- NO HAY
-- [tags]
    -- NO HAY
-- [nfts]
    -- NO HAY
-- [coleccionesnft]
    -- NO HAY
-- [subastas]
    -- NO HAY
-- [tokens]
    -- NO HAY
-- [contratosinteligentes]
    -- NO HAY
