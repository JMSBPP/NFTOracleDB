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
--===============[TuplasOK]===============--

-- [usuarios]
INSERT INTO usuarios VALUES (1, 'Alice59', 'Alice59@hotmail.com', '5ad36e3b24a2c7d70546645a02fb2014ad8fa568e92395d5ae124b74e99e5951',0.0);
INSERT INTO usuarios VALUES (2, 'Rhonda83', 'Rhonda83@hotmail.com', '461550e4a7e8ddeb18a7b786442702b2925f6e8d5f1ef8750a123a7fda86689f',0.0);

-- [compradores]
INSERT INTO compradores VALUES(1,SYSDATE);


-- [paises]
INSERT INTO paises VALUES ('COL', 'Colombia');


-- [artistas]
INSERT INTO artistas VALUES(2,'ARTISTA 1','COL',0);


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

-- [nfts]
INSERT INTO nfts VALUES(1,'NFT 1','https://NFT#1.PNG','PNG',SYSDATE,'F','F',1,1,2,0);
INSERT INTO nfts VALUES(2,'NFT 2','https://NFT#2.PNG','PNG',SYSDATE,'F','F',1,1,2,0);

-- [calificacionesNFT]
 -- No es necesario

-- [colecciones]
INSERT INTO colecciones VALUES(1,'Coleccion #1',SYSDATE,1,2,0);

-- [coleccionesNFT]
INSERT INTO coleccionesNFT VALUES(1,2);

-- [subastas]
INSERT INTO subastas VALUES(1,20,20,'I',SYSDATE,SYSDATE+1,1,NULL,1,2);
INSERT INTO subastas VALUES(2,20,30,'I',SYSDATE,SYSDATE+1,1,NULL,1,2);
INSERT INTO subastas VALUES(3,20,20,'I',SYSDATE,SYSDATE+1,1,NULL,1,2);
INSERT INTO subastas VALUES(4,20,20,'I',SYSDATE,SYSDATE+1,NULL,1,1,2);

-- [contratosInteligentes]
INSERT INTO contratosInteligentes VALUES(1,20,SYSDATE,'P',1,1,2,'5ad36e3b24a2c7d70546645a02fb2014ad8fa568e92395d5ae124b74e99e5951','88c07f5bd07199f1ae5d9eafbf6ac503a56ea576719ea08a956bf1dcf6677404');
INSERT INTO contratosInteligentes VALUES(2,20,SYSDATE,'P',1,1,2,'5ad36e3b24a2c7d70546645a02fb2014ad8fa568e92395d5ae124b74e99e5951','88c07f5bd07199f1ae5d9eafbf6ac503a56ea576719ea08a956bf1dcf6677404');
