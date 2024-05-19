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
--===============[PoblarOK]===============--

-- [usuarios]
INSERT INTO usuarios VALUES (1, 'Alice59', 'Alice59@hotmail.com', '5ad36e3b24a2c7d70546645a02fb2014ad8fa568e92395d5ae124b74e99e5951',0.0);
INSERT INTO usuarios VALUES (2, 'Rhonda83', 'Rhonda83@hotmail.com', '461550e4a7e8ddeb18a7b786442702b2925f6e8d5f1ef8750a123a7fda86689f',0.0);
INSERT INTO usuarios VALUES (3, 'Pedro12', 'Pedro12@hotmail.com', '1fd25bf5b47a036bc2e8b44f25493ab812ba0c543635d024a6704dcb0e9e9fad',0.0);
INSERT INTO usuarios VALUES (4, 'Yolonda50', 'Yolonda50@hotmail.com', '83e04d168cb372f4e780e9b4c35bed39d20e807ce8256f0c0e3f6a9b6e19a6c7',0.0);
INSERT INTO usuarios VALUES (5, 'Thomas84', 'Thomas84@outlook.com', '3e4464b085cf2269eebd8acef33ce60b3ba6e1c77dfef140fddbd2bad3e78628',0.0);
INSERT INTO usuarios VALUES (6, 'Michael65', 'Michael65@aol.com', 'ee8e814657e4132aa2024f57e9ac1bf012dcfca79dee0ff3ee30f31b5f4c42e5',0.0);
INSERT INTO usuarios VALUES (7, 'Fern56', 'Fern56@aol.com', '88c07f5bd07199f1ae5d9eafbf6ac503a56ea576719ea08a956bf1dcf6677404',0.0);
INSERT INTO usuarios VALUES (8, 'Lisa25', 'Lisa25@gmail.com', 'af29bd45eb015d4ee168beaaa012441ba094d1e06eff22982d9a2cc09820c162',0.0);
INSERT INTO usuarios VALUES (9, 'Roosevelt32', 'Roosevelt32@hotmail.com', '6470572ae2c074d117894520a0316982474cebbc7f88eee1258de854b3855275',0.0);
INSERT INTO usuarios VALUES (10, 'Christopher13', 'Christopher13@gmail.com', '34c2af3a8b8d26d9aa2ce2ce43e1e64c6ff4d09a86fa04c25ee1bfaab15236c7',0.0);
INSERT INTO usuarios VALUES (13, 'Velma19', 'Velma19@gmail.com', '0305f953afd1388258a7df5050960de7977aa213ef3e6b58637961a265b32117',0.0);

-- [compradores]
INSERT INTO compradores VALUES(1,SYSDATE);
INSERT INTO compradores VALUES(2,SYSDATE);
INSERT INTO compradores VALUES(3,SYSDATE);
INSERT INTO compradores VALUES(4,SYSDATE);
INSERT INTO compradores VALUES(5,SYSDATE);

-- [paises]
INSERT INTO paises VALUES ('COL', 'Colombia');
INSERT INTO paises VALUES('USA','Estados Unidos');
INSERT INTO paises VALUES('FRA','Francia');
INSERT INTO paises VALUES('CAN','Canada');
INSERT INTO paises VALUES('ITA','Italia');

-- [artistas]
INSERT INTO artistas VALUES(6,'ARTISTA 1',NULL,0);
INSERT INTO artistas VALUES(7,'ARTISTA 2','COL',0);
INSERT INTO artistas VALUES(8,'ARTISTA 3','FRA',0);
INSERT INTO artistas VALUES(9,'ARTISTA 4','CAN',0);
INSERT INTO artistas VALUES(10,'ARTISTA 5','ITA',0);

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


-- [nfts]
INSERT INTO nfts VALUES(1,'NFT 1','https://NFT#1.PNG','PNG',SYSDATE,'F','F',1,1,6,0);
INSERT INTO nfts VALUES(2,'NFT 2','https://NFT#2.JPEG','JPEG',SYSDATE,'F','F',2,2,6,0);
INSERT INTO nfts VALUES(3,'NFT 3','https://NFT#3.GIFT','GIFT',SYSDATE,'F','F',3,3,6,0);
INSERT INTO nfts VALUES(4,'NFT 4','https://NFT#4.MP4','MP4',SYSDATE,'F','F',4,4,6,0);
INSERT INTO nfts VALUES(5,'NFT 5','https://NFT#5.MP3','MP3',SYSDATE,'F','F',5,5,6,0);
INSERT INTO nfts VALUES(6,'NFT 6','https://NFT#6.PNG','PNG',SYSDATE,'F','F',1,6,7,0);
INSERT INTO nfts VALUES(7,'NFT 7','https://NFT#7.PNG','PNG',SYSDATE,'F','F',2,7,7,0);
INSERT INTO nfts VALUES(8,'NFT 8','https://NFT#8.PNG','PNG',SYSDATE,'F','F',3,8,8,0);
INSERT INTO nfts VALUES(9,'NFT 9','https://NFT#9.PNG','PNG',SYSDATE,'F','F',4,9,9,0);

-- [calificacionesNFT]
INSERT INTO calificacionesNFT VALUES(1,1,3);
INSERT INTO calificacionesNFT VALUES(2,2,4);
INSERT INTO calificacionesNFT VALUES(3,3,5);
INSERT INTO calificacionesNFT VALUES(4,4,3);
INSERT INTO calificacionesNFT VALUES(5,5,4);

-- [colecciones]
INSERT INTO colecciones VALUES(1,'Coleccion #1',SYSDATE,1,6,0);
INSERT INTO colecciones VALUES(2,'Coleccion #2',SYSDATE,2,7,0);
INSERT INTO colecciones VALUES(3,'Coleccion #3',SYSDATE,3,8,0);
INSERT INTO colecciones VALUES(4,'Coleccion #4',SYSDATE,4,9,0);
INSERT INTO colecciones VALUES(5,'Coleccion #5',SYSDATE,5,10,0);
INSERT INTO colecciones VALUES(6,'Coleccion #6',SYSDATE,6,6,0);

-- [coleccionesNFT]
INSERT INTO coleccionesNFT VALUES(1,1);
INSERT INTO coleccionesNFT VALUES(1,2);
INSERT INTO coleccionesNFT VALUES(1,3);
INSERT INTO coleccionesNFT VALUES(2,6);
INSERT INTO coleccionesNFT VALUES(2,7);

-- [subastas]
INSERT INTO subastas VALUES(1,20,20,'I',SYSDATE,SYSDATE+1,4,NULL,1,2);
INSERT INTO subastas VALUES(2,40,40,'I',SYSDATE,SYSDATE+1,5,NULL,3,4);
INSERT INTO subastas VALUES(3,40,40,'I',SYSDATE,SYSDATE+1,8,NULL,5,6);
INSERT INTO subastas VALUES(4,40,40,'I',SYSDATE,SYSDATE+1,NULL,1,7,8);
INSERT INTO subastas VALUES(5,40,40,'I',SYSDATE,SYSDATE+1,NULL,2,9,10);

-- [contratosInteligentes]
INSERT INTO contratosInteligentes VALUES(1,20,SYSDATE,'P',1,1,2,'5ad36e3b24a2c7d70546645a02fb2014ad8fa568e92395d5ae124b74e99e5951','88c07f5bd07199f1ae5d9eafbf6ac503a56ea576719ea08a956bf1dcf6677404');
INSERT INTO contratosInteligentes VALUES(2,40,SYSDATE,'P',2,3,4,'5ad36e3b24a2c7d70546645a02fb2014ad8fa568e92395d5ae124b74e99e5951','88c07f5bd07199f1ae5d9eafbf6ac503a56ea576719ea08a956bf1dcf6677404');
INSERT INTO contratosInteligentes VALUES(3,40,SYSDATE,'P',3,5,6,'5ad36e3b24a2c7d70546645a02fb2014ad8fa568e92395d5ae124b74e99e5951','88c07f5bd07199f1ae5d9eafbf6ac503a56ea576719ea08a956bf1dcf6677404');
INSERT INTO contratosInteligentes VALUES(4,40,SYSDATE,'P',4,7,8,'5ad36e3b24a2c7d70546645a02fb2014ad8fa568e92395d5ae124b74e99e5951','88c07f5bd07199f1ae5d9eafbf6ac503a56ea576719ea08a956bf1dcf6677404');
INSERT INTO contratosInteligentes VALUES(5,40,SYSDATE,'P',5,9,10,'5ad36e3b24a2c7d70546645a02fb2014ad8fa568e92395d5ae124b74e99e5951','88c07f5bd07199f1ae5d9eafbf6ac503a56ea576719ea08a956bf1dcf6677404');