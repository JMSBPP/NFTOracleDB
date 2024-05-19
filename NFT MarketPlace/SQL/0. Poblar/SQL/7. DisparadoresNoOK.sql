--======================================--
--===============[DisparadoresNoOK]===============--

-- [usuarios]
INSERT INTO usuarios VALUES (NULL, 'Carl55', 'Carl55@aol.com', '1a7b843d63c6ea65e15881d90619f4238ad8dcbcfddf326c7ee31b16c3fa7b36',100);
INSERT INTO usuarios VALUES (-9, 'Manuel49', 'Manuel49@aol.com', 'e17599a9310ec4d7dfaa7f7a0fee3b3067409b6af56022621f2ecefe0dc3779c',-30);
INSERT INTO usuarios VALUES (-1000, 'Helen88', 'Helen88@hotmail.com', '3470bbb341396fa2140a78520be7895bf08f4af3dbd8ca99ebcc3bf463be29d9',NULL);

SELECT * FROM USUARIOS;

-- [compradores]
INSERT INTO COMPRADORES VALUES (11,null);

SELECT * FROM COMPRADORES;

-- [paises]
 --No tiene

-- [artistas]
INSERT INTO artistas VALUES(12,'ARTISTA PRUEBA 1','COL',-12212);
INSERT INTO artistas VALUES(13,'ARTISTA PRUEBA 3',NULL,0);

SELECT * from artistas;

-- [tags]
INSERT INTO tags VALUES (null, 'EPAA', 'dasdadasdadsadasdsadad hola profe esto es un easter egg',XMLTYPE('
<descripcionExtendida>
    <descripcion>Descripción detallada del tag.</descripcion>
    <ejemplosDeUso>
        <ejemplo>Ejemplo de uso del tag.</ejemplo>
    </ejemplosDeUso>
    <enlaces>
        <enlace formato="pdf">https://www.ejemplo.com/ejemplo.pdf</enlace>
        <enlace formato="imagen">https://www.ejemplo.com/imagen.png</enlace>
    </enlaces>
</descripcionExtendida>
'));

select * from tags;

-- [nfts]
INSERT INTO nfts VALUES(null,'NFT 13 prueba','https://NFT#13.PNG','PNG',null,null,null,1,6,7,null);

select * from NFTS;

-- [calificacionesNFT]
INSERT INTO CALIFICACIONESNFT VALUES(7,16,4);

SELECT * FROM CALIFICACIONESNFT;

-- [colecciones]
INSERT INTO colecciones VALUES(null,'Coleccion #13 PRUEBA',null,1,6,null);

SELECT * FROM COLECCIONES;

-- [coleccionesNFT]
INSERT INTO COLECCIONESNFT VALUES(10,9);
INSERT INTO COLECCIONESNFT VALUES(15,5);

SELECT * FROM COLECCIONESNFT;

-- [subastas]
INSERT INTO subastas VALUES(null,20,null,'Z',null,null,NULL,NULL,6,NULL);
INSERT INTO subastas VALUES(null,40,null,'Z',null,null,3,NULL,11,NULL);
INSERT INTO subastas VALUES(null,40,null,'Z',null,null,1,NULL,6,NULL);

SELECT * FROM SUBASTAS;

-- [contratosInteligentes]
INSERT INTO CONTRATOSINTELIGENTES VALUES(99,90,NULL,'Z',3,6,6,1,2);

SELECT * FROM CONTRATOSINTELIGENTES;
