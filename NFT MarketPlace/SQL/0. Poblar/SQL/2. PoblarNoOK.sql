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
--===============[PoblarNoOK]===============--

-- [usuarios]
INSERT INTO usuarios VALUES (36, 'Helen88', 'Helen88@hotmail.com', '3470bbb341396fa2140a78520be7895bf08f4af3dbd8ca99ebcc3bf463be29d9',-1);
INSERT INTO usuarios VALUES (37, NULL, NULL, NULL,NULL);
INSERT INTO usuarios VALUES (-38, 'Marie98', 'Marie98@gmail.com', '2483fdf505181c17bf9bedb9534b96059059a66608e16bef365a120a455fe04f',0.0);
INSERT INTO usuarios VALUES (39, 'Robert66', 'Robert66hotmail.com', '0042b4095a7e2f0d2d92fce6e8a7ae248d92c83574554a0dc4464081c061c52d',0.0);
INSERT INTO usuarios VALUES (40, 'Dennis47', 'Dennis47@gmailcom', 'af75099ebcdc561e9aba0ce8df8fa13db32aa1c5a03dd4f5579e71c037b1e588',0.0);

-- [compradores]
INSERT INTO compradores VALUES(35,SYSDATE);
INSERT INTO compradores VALUES(9,NULL);

-- [paises]
INSERT INTO paises VALUES('abcd','colombia');
INSERT INTO paises VALUES('CL','Colombia');

-- [artistas]
INSERT INTO artistas VALUES(13,'ARTISTA 1',NULL, 0);
INSERT INTO artistas VALUES(25,'ARTISTA 24',NULL,-1);
INSERT INTO artistas VALUES(13,'ARTISTA 24','LOL',0);

-- [tags]
INSERT INTO tags VALUES(-1,'TAG PR','ESTE ES EL TAG DE PRUEBA',XMLTYPE('
<descripcionExtendida>
    <ejemplosDeUso>
        <ejemplo>Ejemplo de uso del tag.</ejemplo>
    </ejemplosDeUso>
    <enlaces>
        <enlace>https://www.ejemplo.com</enlace>
        <enlace formato="pdf">https://www.ejemplo2.com</enlace>
    </enlaces>
')); --Tambiel le meti el xml mal estructurado, pero, como no se "puede" verificar el dtd, pues entra

INSERT INTO tags VALUES(15,'Musica','ESTO NO ENTRA', XMLTYPE('
<descripcionExtendida>
    <descripcion>Descripción detallada del tag.</descripcion>
    <ejemplosDeUso>
        <ejemplo>Ejemplo de uso del tag.</ejemplo>
    </ejemplosDeUso>
    <enlace formato="imagen">https://www.ejemplo.com</enlace>
    <enlaces>
        <enlace>https://www.ejemplo2.com</enlace>
    </enlaces>
</descripcionExtendida>
'));

-- [nfts]
INSERT INTO nfts VALUES(15,'NFT 1','https://NFT#1.PNG','PNG',SYSDATE,'F','F',1,1,6,0);
INSERT INTO nfts VALUES(15,'NFT 15','https://NFT#1.PNG','PNG',SYSDATE,'F','F',1,1,6,0);
INSERT INTO nfts VALUES(15,'NFT 15','https://NFT#15.PNG','PNGA',SYSDATE,'F','F',1,1,6,0);
INSERT INTO nfts VALUES(15,'NFT 15','https://NFT#15.PNG','PNG',SYSDATE,'y','F',1,1,6,0);
INSERT INTO nfts VALUES(15,'NFT 15','https://NFT#15.PNG','PNG',SYSDATE,'F','Y',1,1,6,0);
INSERT INTO nfts VALUES(15,'NFT 15','https://NFT#15.PNG','PNG',SYSDATE,'F','F',1,1,6,-1);
INSERT INTO nfts VALUES(15,'NFT 15','https://NFT#15.PNG','PNG',SYSDATE,'F','F',1,45,6,0);
INSERT INTO nfts VALUES(15,'NFT 15','https://NFT#15.PNG','PNG',SYSDATE,'F','F',1,1,25,0);

-- [calificacionesNFT]
INSERT INTO calificacionesNFT VALUES(6,1,-1);
INSERT INTO calificacionesNFT VALUES(6,1,8);

-- [colecciones]
INSERT INTO colecciones VALUES(-1,'Coleccion #1',SYSDATE,1,6,0);
INSERT INTO colecciones VALUES(1,'Coleccion #1',SYSDATE,1,6,-1);
INSERT INTO colecciones VALUES(18,'Coleccion #1',SYSDATE,1,6,0);
INSERT INTO colecciones VALUES(18,'Coleccion #18',SYSDATE,56,6,0);
INSERT INTO colecciones VALUES(18,'Coleccion #18',SYSDATE,1,69,0);
INSERT INTO colecciones VALUES(18,'Coleccion #18',null,1,6,0);

-- [coleccionesNFT]
INSERT INTO coleccionesNFT VALUES(9,1);
INSERT INTO coleccionesNFT VALUES(1,100);

-- [subastas]
INSERT INTO subastas VALUES(-6,20,20,'I',SYSDATE,SYSDATE+1,4,NULL,1,2);
INSERT INTO subastas VALUES(6,-20,20,'I',SYSDATE,SYSDATE+1,4,NULL,1,2);
INSERT INTO subastas VALUES(6,20,-20,'I',SYSDATE,SYSDATE+1,4,NULL,1,2);
INSERT INTO subastas VALUES(6,20,20,'z',SYSDATE,SYSDATE+1,4,NULL,1,2);
INSERT INTO subastas VALUES(6,20,20,'I',SYSDATE,SYSDATE+1,4,NULL,19,2);
INSERT INTO subastas VALUES(6,20,20,'I',SYSDATE,SYSDATE+1,4,NULL,19,26);

-- [contratosInteligentes]
INSERT INTO contratosInteligentes VALUES(-9,40,SYSDATE,'P',5,9,10,'5ad36e3b24a2c7d70546645a02fb2014ad8fa568e92395d5ae124b74e99e5951','88c07f5bd07199f1ae5d9eafbf6ac503a56ea576719ea08a956bf1dcf6677404');
INSERT INTO contratosInteligentes VALUES(9,-40,SYSDATE,'P',5,9,10,'5ad36e3b24a2c7d70546645a02fb2014ad8fa568e92395d5ae124b74e99e5951','88c07f5bd07199f1ae5d9eafbf6ac503a56ea576719ea08a956bf1dcf6677404');
INSERT INTO contratosInteligentes VALUES(9,40,SYSDATE,'C',5,9,10,'5ad36e3b24a2c7d70546645a02fb2014ad8fa568e92395d5ae124b74e99e5951','88c07f5bd07199f1ae5d9eafbf6ac503a56ea576719ea08a956bf1dcf6677404');
INSERT INTO contratosInteligentes VALUES(9,40,SYSDATE,'P',77,9,10,'5ad36e3b24a2c7d70546645a02fb2014ad8fa568e92395d5ae124b74e99e5951','88c07f5bd07199f1ae5d9eafbf6ac503a56ea576719ea08a956bf1dcf6677404');
INSERT INTO contratosInteligentes VALUES(9,40,SYSDATE,'P',5,99,10,'5ad36e3b24a2c7d70546645a02fb2014ad8fa568e92395d5ae124b74e99e5951','88c07f5bd07199f1ae5d9eafbf6ac503a56ea576719ea08a956bf1dcf6677404');
INSERT INTO contratosInteligentes VALUES(9,40,SYSDATE,'P',5,9,109,'5ad36e3b24a2c7d70546645a02fb2014ad8fa568e92395d5ae124b74e99e5951','88c07f5bd07199f1ae5d9eafbf6ac503a56ea576719ea08a956bf1dcf6677404');
