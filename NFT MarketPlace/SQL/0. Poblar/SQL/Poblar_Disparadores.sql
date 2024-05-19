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
--===============[DISPARADORESOK]===============--
--======================================--
-- [usuarios]
INSERT INTO usuarios VALUES(99, 'Nombre 1', 'correo1@lol.com', 'billetera1');
INSERT INTO usuarios VALUES(99, 'Nombre 2', 'correo2@lol.com', 'billetera2');
INSERT INTO usuarios VALUES(99, 'Nombre 3', 'correo3@lol.com', 'billetera3');
INSERT INTO usuarios VALUES(99, 'Nombre 4', 'correo4@lol.com', 'billetera3');
INSERT INTO usuarios VALUES(99, 'Nombre 5', 'correo5@lol.com', 'billetera5');

-- [compradores]
INSERT INTO compradores VALUES(1,null);
INSERT INTO compradores VALUES(2,null);

-- [paises] (ESTE NO TIENE PERO COMO LIMPIO TODO, TOCA VOLVER A PONERLO)
INSERT INTO paises VALUES('USA','Estados Unidos');
INSERT INTO paises VALUES('FRA', 'Francia');
INSERT INTO paises VALUES('CAN', 'Canadá');
INSERT INTO paises VALUES('COL', 'Colombia');
INSERT INTO paises VALUES('GER', 'Alemania');

-- [artistas]
INSERT INTO artistas VALUES(3,'Artista 1','COL');
INSERT INTO artistas VALUES(4,'Artista 2','GER');
INSERT INTO artistas VALUES(5,'Artista 3','FRA');


-- [colecciones]
INSERT INTO colecciones VALUES(99, 'Colección 1', null, 3, 1);
INSERT INTO colecciones VALUES(99, 'Colección 2', null, 3, 2);
INSERT INTO colecciones VALUES(99, 'Colección 3', null, 3, 3);
INSERT INTO colecciones VALUES(99, 'Colección 4', null, 4, 4);
INSERT INTO colecciones VALUES(99, 'Colección 5', null, 5, 5);

-- [tags]
INSERT INTO tags VALUES(99, 'Tag 1', 'Descripción del tag 1');
INSERT INTO tags VALUES(99, 'Tag 2', 'Descripción del tag 2');
INSERT INTO tags VALUES(99, 'Tag 3', 'Descripción del tag 3');
INSERT INTO tags VALUES(99, 'Tag 4', 'Descripción del tag 4');
INSERT INTO tags VALUES(99, 'Tag 5', 'Descripción del tag 5');

-- [nfts]
INSERT INTO nfts VALUES(99, 'NFT 1', 'https://archivo1.jpg', 'JPEG', null, null, null, 'D', 1, 1, 3);
INSERT INTO nfts VALUES(99, 'NFT 2', 'https://archivo2.png', 'PNG',null, null, null, 'C', 2, 2,3);
INSERT INTO nfts VALUES(99, 'NFT 3', 'https://archivo3.gif', 'GIFT',null, null, null, 'B', 3, 3, 3);
INSERT INTO nfts VALUES(99, 'NFT 4', 'https://archivo4.mp4', 'MP4',null, null, null, 'A', 4, 4, 4);
INSERT INTO nfts VALUES(99, 'NFT 5', 'https://archivo5.mp3', 'MP3',null, null, null, 'T', 5, 5, 5);

-- [coleccionesnft]
INSERT INTO coleccionesnft VALUES(1,6);
INSERT INTO coleccionesnft VALUES(1,7);
INSERT INTO coleccionesnft VALUES(4,9);

--[subastas]
INSERT INTO subastas VALUES(99, 100.00, 120.00, 'F', NULL, NULL, 1, 2, 1, 2);
INSERT INTO subastas VALUES(99, 200.00, 250.00, 'D', NULL, NULL, 2, null, 2, 3);
INSERT INTO subastas VALUES(99, 300.00, 350.00, 'E', NULL, NULL, 3, null, 3, 4);
INSERT INTO subastas VALUES(99, 400.00, 450.00, 'H', NULL, NULL, 8, null, 4, 5);
INSERT INTO subastas VALUES(99, 500.00, 550.00, 'H', NULL, NULL, 10, null, 5, 1);

-- [tokens]
INSERT INTO tokens VALUES(99, 'Token 1', 100.00);
INSERT INTO tokens VALUES(99, 'Token 2', 200.00);
INSERT INTO tokens VALUES(99, 'Token 3', 300.00);
INSERT INTO tokens VALUES(99, 'Token 4', 400.00);
INSERT INTO tokens VALUES(99, 'Token 5', 500.00);

-- [contratosinteligentes]
INSERT INTO contratosinteligentes VALUES(99, 120.00, null, 'A', 1, NULL, 2, 3);
INSERT INTO contratosinteligentes VALUES(99, 250.00, null, 'B', 2, NULL, 3, 4);
INSERT INTO contratosinteligentes VALUES(99, 350.00, null, 'C', 3, NULL, 4, 5);
INSERT INTO contratosinteligentes VALUES(99, 450.00, null, 'D', 4, NULL, 5, 1);
INSERT INTO contratosinteligentes VALUES(99, 550.00, null, 'E', 5, NULL, 1, 2);

--Esto tambien crea un contrato, cerrar una subasta
UPDATE SUBASTAS 
SET estado = 'A'
WHERE id = 1;

UPDATE SUBASTAS
SET estado = 'C'
WHERE id = 1;


--======================================--
--===============[DISPARADORESNOOK]===============--
--======================================--
-- [usuarios]
    --NO TENGO ALGO QUE ME IMPIDA CREAR ESTO

-- [compradores]
    --NO TENGO ALGO QUE ME IMPIDA CREAR ESTO

-- [paises]
    --NO TENGO ALGO QUE ME IMPIDA CREAR ESTO

-- [artistas]
    --NO TENGO ALGO QUE ME IMPIDA CREAR ESTO

-- [colecciones]
    --NO TENGO ALGO QUE ME IMPIDA CREAR ESTO

-- [tags]
    --NO TENGO ALGO QUE ME IMPIDA CREAR ESTO

-- [nfts]
    --NO TENGO ALGO QUE ME IMPIDA CREAR ESTO

-- [coleccionesnft]
INSERT INTO coleccionesnft VALUES(1,9);

-- [subastas]
INSERT INTO subastas VALUES(99, 100.00, 120.00, 'F', NULL, NULL, 100, 2, 1, 2);
INSERT INTO subastas VALUES(99, 100.00, 120.00, 'F', NULL, NULL, 6, 2, 1, 2);
INSERT INTO subastas VALUES(99, 100.00, 120.00, 'F', NULL, NULL, 1, 2, 1, 1);

-- [tokens]
    --NO TENGO ALGO QUE ME IMPIDA CREAR ESTO

-- [contratosinteligentes]
INSERT INTO contratosinteligentes VALUES(99, 120.00, null, 'A', 1, NULL, 3, 3);
