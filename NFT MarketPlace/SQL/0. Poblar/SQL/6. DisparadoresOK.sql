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
--===============[DisparadoresOK]===============--

-- [usuarios]
INSERT INTO usuarios VALUES (null, 'Alice59', 'Alice59@hotmail.com', '5ad36e3b24a2c7d70546645a02fb2014ad8fa568e92395d5ae124b74e99e5951',null);
INSERT INTO usuarios VALUES (null, 'Rhonda83', 'Rhonda83@hotmail.com', '461550e4a7e8ddeb18a7b786442702b2925f6e8d5f1ef8750a123a7fda86689f',null);
INSERT INTO usuarios VALUES (null, 'Pedro12', 'Pedro12@hotmail.com', '1fd25bf5b47a036bc2e8b44f25493ab812ba0c543635d024a6704dcb0e9e9fad',null);
INSERT INTO usuarios VALUES (null, 'Yolonda50', 'Yolonda50@hotmail.com', '83e04d168cb372f4e780e9b4c35bed39d20e807ce8256f0c0e3f6a9b6e19a6c7',null);
INSERT INTO usuarios VALUES (null, 'Thomas84', 'Thomas84@outlook.com', '3e4464b085cf2269eebd8acef33ce60b3ba6e1c77dfef140fddbd2bad3e78628',null);
INSERT INTO usuarios VALUES (null, 'Michael65', 'Michael65@aol.com', 'ee8e814657e4132aa2024f57e9ac1bf012dcfca79dee0ff3ee30f31b5f4c42e5',null);
INSERT INTO usuarios VALUES (null, 'Fern56', 'Fern56@aol.com', '88c07f5bd07199f1ae5d9eafbf6ac503a56ea576719ea08a956bf1dcf6677404',null);
INSERT INTO usuarios VALUES (null, 'Lisa25', 'Lisa25@gmail.com', 'af29bd45eb015d4ee168beaaa012441ba094d1e06eff22982d9a2cc09820c162',null);
INSERT INTO usuarios VALUES (null, 'Roosevelt32', 'Roosevelt32@hotmail.com', '6470572ae2c074d117894520a0316982474cebbc7f88eee1258de854b3855275',null);
INSERT INTO usuarios VALUES (null, 'Christopher13', 'Christopher13@gmail.com', '34c2af3a8b8d26d9aa2ce2ce43e1e64c6ff4d09a86fa04c25ee1bfaab15236c7',null);

SELECT * FROM USUARIOS;
/
-- [compradores]
INSERT INTO compradores VALUES(1,null);
INSERT INTO compradores VALUES(2,null);
INSERT INTO compradores VALUES(3,null);
INSERT INTO compradores VALUES(4,null);
INSERT INTO compradores VALUES(5,null);

SELECT * FROM compradores;
/
-- [paises]
INSERT INTO paises VALUES ('COL', 'Colombia');
INSERT INTO paises VALUES('USA','Estados Unidos');
INSERT INTO paises VALUES('FRA','Francia');
INSERT INTO paises VALUES('CAN','Canada');
INSERT INTO paises VALUES('ITA','Italia');

SELECT * FROM paises;
/
-- [artistas]
INSERT INTO artistas VALUES(6,'ARTISTA 1','COL',0);
INSERT INTO artistas VALUES(7,'ARTISTA 2','COL',0);
INSERT INTO artistas VALUES(8,'ARTISTA 3','FRA',0);
INSERT INTO artistas VALUES(9,'ARTISTA 4','CAN',0);
INSERT INTO artistas VALUES(10,'ARTISTA 5','ITA',0);

SELECT * FROM artistas;
/
-- [tags]
INSERT INTO tags (id, nombre, descripcion, descripcionExtendida)
VALUES (
    1,
    'Musica',
    'tokens únicos que representan obras musicales, permitiendo la propiedad digital y la autenticidad en el mundo digital.',
    XMLTYPE('
        <descripcionExtendida>
            <descripcion>tokens únicos que representan obras musicales, permitiendo la propiedad digital y la autenticidad en el mundo digital.</descripcion>
            <ejemplosDeUso>
                <ejemplo>Utilizado para clasificar piezas musicales de Beethoven.</ejemplo>
                <ejemplo>Aplicado a álbumes de música pop moderna.</ejemplo>
            </ejemplosDeUso>
            <enlaces>
                <enlace formato="html">https://example.com/musica</enlace>
                <enlace formato="pdf">https://example.com/musica-detalles.pdf</enlace>
            </enlaces>
        </descripcionExtendida>'
    )
);

INSERT INTO tags (id, nombre, descripcion, descripcionExtendida)
VALUES (
    2, 
    'Videojuegos',
    'activos digitales únicos que otorgan propiedad y valor a elementos dentro de los juegos, como personajes o artículos.',
    XMLTYPE('
        <descripcionExtendida>
            <descripcion>activos digitales únicos que otorgan propiedad y valor a elementos dentro de los juegos, como personajes o artículos.</descripcion>
            <ejemplosDeUso>
                <ejemplo>Utilizado para representar skins de personajes en juegos de batalla.</ejemplo>
                <ejemplo>Aplicado a elementos coleccionables dentro de juegos de rol en línea.</ejemplo>
            </ejemplosDeUso>
            <enlaces>
                <enlace formato="html">https://example.com/videojuegos</enlace>
                <enlace formato="pdf">https://example.com/videojuegos-detalles.pdf</enlace>
            </enlaces>
        </descripcionExtendida>'
    )
);

INSERT INTO tags (id, nombre, descripcion, descripcionExtendida)
VALUES (
    3,
    'Fotografia',
    'imágenes digitales únicas aseguradas en blockchain, permitiendo la propiedad y autenticidad verificable.',
    XMLTYPE('
        <descripcionExtendida>
            <descripcion>imágenes digitales únicas aseguradas en blockchain, permitiendo la propiedad y autenticidad verificable.</descripcion>
            <ejemplosDeUso>
                <ejemplo>Utilizado para representar fotografías de alta resolución en línea.</ejemplo>
                <ejemplo>Aplicado a obras de arte fotográficas en galerías digitales.</ejemplo>
            </ejemplosDeUso>
            <enlaces>
                <enlace formato="html">https://example.com/fotografia</enlace>
                <enlace formato="pdf">https://example.com/fotografia-detalles.pdf</enlace>
            </enlaces>
        </descripcionExtendida>'
    )
);

INSERT INTO tags (id, nombre, descripcion, descripcionExtendida)
VALUES (
    4,
    'Arte',
    'obras digitales únicas que certifican la autenticidad y propiedad en el mundo digital mediante blockchain.',
    XMLTYPE('
        <descripcionExtendida>
            <descripcion>obras digitales únicas que certifican la autenticidad y propiedad en el mundo digital mediante blockchain.</descripcion>
            <ejemplosDeUso>
                <ejemplo>Utilizado para representar arte digital en subastas en línea.</ejemplo>
                <ejemplo>Aplicado a obras de artistas digitales emergentes en plataformas de arte.</ejemplo>
            </ejemplosDeUso>
            <enlaces>
                <enlace formato="html">https://example.com/arte</enlace>
                <enlace formato="pdf">https://example.com/arte-detalles.pdf</enlace>
            </enlaces>
        </descripcionExtendida>'
    )
);

INSERT INTO tags (id, nombre, descripcion, descripcionExtendida)
VALUES (
    5,
    'PFP',
    'Avatares digitales únicos que representan identidades en redes sociales, juegos y comunidades en línea.',
    XMLTYPE('
        <descripcionExtendida>
            <descripcion>Avatares digitales únicos que representan identidades en redes sociales, juegos y comunidades en línea.</descripcion>
            <ejemplosDeUso>
                <ejemplo>Utilizado para representar perfiles de usuario en plataformas de redes sociales.</ejemplo>
                <ejemplo>Aplicado a personajes personalizados en juegos multijugador en línea.</ejemplo>
            </ejemplosDeUso>
            <enlaces>
                <enlace formato="html">https://example.com/pfp</enlace>
                <enlace formato="pdf">https://example.com/pfp-detalles.pdf</enlace>
            </enlaces>
        </descripcionExtendida>'
    )
);

SELECT * FROM tags;
/
-- [nfts]
INSERT INTO nfts VALUES(null,'NFT 1','https://NFT#1.PNG','PNG',null,null,null,1,1,6,null);
INSERT INTO nfts VALUES(null,'NFT 2','https://NFT#2.JPEG','JPEG',null,null,null,2,2,6,null);
INSERT INTO nfts VALUES(null,'NFT 3','https://NFT#3.GIFT','GIFT',null,null,null,3,3,6,null);
INSERT INTO nfts VALUES(null,'NFT 4','https://NFT#4.MP4','MP4',null,null,null,4,4,6,null);
INSERT INTO nfts VALUES(null,'NFT 5','https://NFT#5.MP3','MP3',null,null,null,5,5,6,null);
INSERT INTO nfts VALUES(null,'NFT 6','https://NFT#6.PNG','PNG',null,null,null,1,6,7,null);
INSERT INTO nfts VALUES(null,'NFT 7','https://NFT#7.PNG','PNG',null,null,null,2,7,7,null);
INSERT INTO nfts VALUES(null,'NFT 8','https://NFT#8.PNG','PNG',null,null,null,3,8,8,null);
INSERT INTO nfts VALUES(null,'NFT 9','https://NFT#9.PNG','PNG',null,null,null,4,9,9,null);

SELECT * FROM nfts;
/
-- [calificacionesNFT]
INSERT INTO calificacionesNFT VALUES(1,2,3);
INSERT INTO calificacionesNFT VALUES(2,2,4);
INSERT INTO calificacionesNFT VALUES(3,3,5);
INSERT INTO calificacionesNFT VALUES(4,4,3);
INSERT INTO calificacionesNFT VALUES(5,5,4);

SELECT * FROM calificacionesNFT;
/
-- [colecciones]
INSERT INTO colecciones VALUES(null,'Coleccion #1',null,1,6,null);
INSERT INTO colecciones VALUES(null,'Coleccion #2',null,2,7,null);
INSERT INTO colecciones VALUES(null,'Coleccion #3',null,3,8,null);
INSERT INTO colecciones VALUES(null,'Coleccion #4',null,4,9,null);
INSERT INTO colecciones VALUES(null,'Coleccion #5',null,5,10,null);
INSERT INTO colecciones VALUES(null,'Coleccion #6',null,6,6,null);

SELECT * FROM colecciones;
/
-- [coleccionesNFT]
INSERT INTO coleccionesNFT VALUES(10,1);
INSERT INTO coleccionesNFT VALUES(10,2);
INSERT INTO coleccionesNFT VALUES(10,3);
INSERT INTO coleccionesNFT VALUES(11,6);
INSERT INTO coleccionesNFT VALUES(11,7);

SELECT * FROM coleccionesNFT;
/
-- [subastas]
INSERT INTO subastas VALUES(null,20,null,'Z',null,null,2,NULL,6,NULL);
INSERT INTO subastas VALUES(null,40,null,'Z',null,null,3,NULL,6,NULL);
INSERT INTO subastas VALUES(null,40,null,'Z',null,null,4,NULL,6,NULL);
INSERT INTO subastas VALUES(null,40,null,'Z',null,null,NULL,10,6,NULL);
INSERT INTO subastas VALUES(null,40,null,'Z',null,null,NULL,11,7,NULL);

SELECT * FROM subastas;
/
-- [contratosInteligentes]
UPDATE subastas SET comprador = 4, precioActual = 50, estado = 'C' WHERE id = 1;
UPDATE subastas SET comprador = 5, precioActual = 90, estado = 'C' WHERE id = 2;
SELECT * FROM subastas;

SELECT * FROM contratosInteligentes;
/