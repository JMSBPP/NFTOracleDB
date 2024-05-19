
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

--===============[Tuplas]===============--
--======================================--

-- [usuarios]
 -- No tiene

-- [compradores]
 -- No tiene

-- [paises]
 -- No tiene

-- [artistas]
 -- No tiene

-- [tags]
 -- No tiene

-- [nfts]
 -- No tiene

-- [calificacionesNFT]
 -- No tiene

-- [colecciones]
 -- No tiene

-- [coleccionesNFT]
-- No tiene

-- [subastas]
ALTER TABLE subastas ADD CONSTRAINT CK_subastas_precioInicial_PrecioActual
    CHECK (precioActual>=precioInicial);

ALTER TABLE subastas ADD CONSTRAINT CK_subastas_fechaInicio_fechaFinal
    CHECK (fechaFinal >= fechaInicio);

ALTER TABLE subastas ADD CONSTRAINT CK_subastas_subastador_comprador
    CHECK (subastador != comprador);

ALTER TABLE subastas ADD CONSTRAINT CK_subastas_NFT_coleccion
    CHECK ((coleccion IS NOT NULL AND NFT IS NULL) OR (coleccion IS NULL AND NFT IS NOT NULL));

-- [contratosInteligentes]
ALTER TABLE contratosInteligentes ADD CONSTRAINT CK_contratosInteligentes_subastador_comprador
    CHECK (subastador != comprador);

ALTER TABLE contratosInteligentes ADD CONSTRAINT CK_contratosInteligentes_billeteraSubastador_billeteraComprador
    CHECK (billeteraComprador != billeteraSubastador);

--======================================--
--===============[XForaneas]===============--
ALTER TABLE artistas DROP CONSTRAINT FK_artistas_paises;

--======================================--
--===============[Acciones]===============--
--======================================--

-- [usuarios]
 -- No tiene

-- [compradores]
 -- No tiene

-- [paises]
 -- No tiene

-- [artistas]
ALTER TABLE artistas ADD CONSTRAINT FK_artistas_paises FOREIGN KEY (pais) 
    REFERENCES paises(id) ON DELETE SET NULL;

-- [tags]
 -- No tiene

-- [nfts]
 -- No tiene

-- [calificacionesNFT]
 -- No tiene

-- [colecciones]
 -- No tiene

-- [coleccionesNFT]
 -- No tiene

-- [subastas]
 -- No tiene

-- [contratosInteligentes]
 -- No tiene
 
--======================================--
--===============[SECUENCIAS]===============--
--======================================--

-- [usuarios]
CREATE SEQUENCE SEQ_usuarios
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;

-- [compradores]
 -- No tiene

-- [paises]
 -- No tiene

-- [artistas]
 -- No tiene

-- [tags]
CREATE SEQUENCE SEQ_tags
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;

-- [nfts y colecciones]
CREATE SEQUENCE SEQ_nftsColecciones
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;

-- [calificacionesNFT]
 -- No tiene

-- [coleccionesNFT]
 -- No tiene

-- [subastas]
CREATE SEQUENCE SEQ_subastas
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;

-- [contratosInteligentes]
CREATE SEQUENCE SEQ_contratosInteligentes
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;


--======================================--
--===============[DISPARADORES]===============--
--======================================--
-- [usuarios]
CREATE OR REPLACE TRIGGER TG_usuarios_BI
BEFORE INSERT ON usuarios
FOR EACH ROW
BEGIN
    :NEW.id := SEQ_usuarios.NEXTVAL;
    :NEW.aggGanancia := 0;
END;
/

CREATE OR REPLACE TRIGGER TG_usuarios_BU
BEFORE UPDATE ON usuarios
FOR EACH ROW
BEGIN
    :NEW.id := :OLD.id;
    :NEW.correo := :OLD.correo;

    IF :NEW.billetera IS NULL THEN
        :NEW.billetera := :OLD.billetera;
    END IF;
    :NEW.aggGanancia := 0;
END;
/

CREATE OR REPLACE TRIGGER TG_usuarios_BD
BEFORE DELETE ON usuarios
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20002,'IMPOSIBLE ELIMINAR REGISTROS EN ESTA TABLA');
END;
/

-- [compradores]
CREATE OR REPLACE TRIGGER TG_compradores_BI
BEFORE INSERT ON compradores
FOR EACH ROW
BEGIN
    :NEW.ultimaConexion := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER TG_compradores_BU
BEFORE UPDATE ON compradores
FOR EACH ROW
BEGIN
    :NEW.usuario := :OLD.usuario;
    :NEW.ultimaConexion := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER TG_compradores_BD
BEFORE DELETE ON compradores
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20002,'IMPOSIBLE ELIMINAR REGISTROS EN ESTA TABLA');
END;
/

-- [paises]
CREATE OR REPLACE TRIGGER TG_PAISES_BU
BEFORE UPDATE ON paises
FOR EACH ROW
BEGIN
    :NEW.id := :OLD.id;
END;
/

-- [artistas]
CREATE OR REPLACE TRIGGER TG_artistas_BI
BEFORE INSERT ON artistas
FOR EACH ROW
BEGIN
    IF(:NEW.pais IS NULL) THEN
        RAISE_APPLICATION_ERROR(-20003,'IMPOSIBLE PONER ESOS CAMPOS NULOS');
    END IF;

    :NEW.aggComision := 0;
END;
/

CREATE OR REPLACE TRIGGER TG_artistas_BU
BEFORE UPDATE ON artistas
FOR EACH ROW
BEGIN
    :NEW.usuario := :OLD.usuario;
    IF :NEW.pais IS NULL THEN
        :NEW.pais := :OLD.pais;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_artistas_BD
BEFORE DELETE ON artistas
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20002,'IMPOSIBLE ELIMINAR REGISTROS EN ESTA TABLA');
END;
/

-- [tags]
CREATE OR REPLACE TRIGGER TG_tags_BI
BEFORE INSERT ON tags
FOR EACH ROW
BEGIN
    :NEW.id := SEQ_tags.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER TG_tags_BU
BEFORE UPDATE ON tags
FOR EACH ROW
BEGIN
    :NEW.id := :OLD.id;
    :NEW.nombre := :OLD.nombre;
END;
/
  
CREATE OR REPLACE TRIGGER TG_tags_BD
BEFORE DELETE ON tags
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20002,'IMPOSIBLE ELIMINAR REGISTROS EN ESTA TABLA');   
END;
/

-- [nfts]
CREATE OR REPLACE TRIGGER TG_nfts_BI
BEFORE INSERT ON nfts
FOR EACH ROW
BEGIN
    :NEW.id := SEQ_nftsColecciones.NEXTVAL;
    :NEW.fechaPublicacion := SYSDATE;
    :NEW.haSidoVendido := 'F';

    IF :NEW.enVenta NOT IN ('T','F') OR :NEW.enVenta IS NULL THEN
        :NEW.enVenta := 'F';
    END IF;

    :NEW.usuario := :NEW.artista;
    :NEW.vecesVendido := 0;
END;
/

CREATE OR REPLACE TRIGGER TG_nfts_BU
BEFORE UPDATE ON nfts
FOR EACH ROW
DECLARE
    contadorNombre NUMBER;
BEGIN
    :NEW.id := :OLD.id;
    
    IF :NEW.nombre != :OLD.nombre AND :NEW.nombre IS NOT NULL THEN
        SELECT COUNT(nombre) INTO contadorNombre
        FROM nfts
        WHERE nombre = :NEW.nombre AND id != :NEW.id;
        
        IF contadorNombre  > 0 THEN
            RAISE_APPLICATION_ERROR(-20007,'El nombre ' || :NEW.nombre || ' ya está en uso.');
        END IF;
    ELSE
        :NEW.nombre := :OLD.nombre;
    END IF;

    :NEW.archivo := :OLD.archivo;
    :NEW.formatoArchivo := :OLD.formatoArchivo;
    :NEW.fechaPublicacion := :OLD.fechaPublicacion;

    IF :OLD.haSidoVendido = 'T' THEN
            :NEW.haSidoVendido := 'T';
        END IF;
    
    :NEW.artista := :OLD.artista;

    IF :NEW.vecesVendido = -9876 THEN
        :NEW.vecesVendido := :OLD.vecesVendido + 1;
    ELSE
        :NEW.vecesVendido := :OLD.vecesVendido;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_nfts_BD
BEFORE DELETE ON nfts
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20002,'IMPOSIBLE ELIMINAR REGISTROS EN ESTA TABLA');
END;
/

-- [calificacionesNFT]
CREATE OR REPLACE TRIGGER TG_calificacionesNFT_BI
BEFORE INSERT ON calificacionesNFT
FOR EACH ROW
DECLARE
    artistaNFT NUMBER(30);
BEGIN
    SELECT artista INTO artistaNFT
    FROM nfts
    WHERE id = :NEW.nft;

    IF artistaNFT = :NEW.usuario THEN
        RAISE_APPLICATION_ERROR(-20001, 'El artista no puede calificar su propio NFT.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_calificacionesNFT_BU
BEFORE UPDATE ON calificacionesNFT
FOR EACH ROW
BEGIN
    :NEW.usuario := :OLD.usuario;
    :NEW.nft := :OLD.nft;
    :NEW.calificacion := :OLD.calificacion;
END;
/

CREATE OR REPLACE TRIGGER TG_calificacionesNFT_BD
BEFORE UPDATE ON calificacionesNFT
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20002,'IMPOSIBLE ELIMINAR REGISTROS EN ESTA TABLA');
END;
/

-- [colecciones]
CREATE OR REPLACE TRIGGER TG_colecciones_BI
BEFORE INSERT ON colecciones
FOR EACH ROW
BEGIN
    :NEW.id := SEQ_nftsColecciones.NEXTVAL;
    :NEW.fechaPublicacion := SYSDATE;
    :NEW.usuario := :NEW.artista;
    :NEW.vecesVendido := 0;
END;
/

CREATE OR REPLACE TRIGGER TG_colecciones_BU
BEFORE UPDATE ON colecciones
FOR EACH ROW
DECLARE
    contadorNombre NUMBER;
BEGIN
    :NEW.id := :OLD.id;

    IF :NEW.nombre != :OLD.nombre AND :NEW.nombre IS NOT NULL THEN
        SELECT COUNT(nombre) INTO contadorNombre
        FROM colecciones
        WHERE nombre = :NEW.nombre AND id != :NEW.id;

        IF contadorNombre > 0 THEN
            RAISE_APPLICATION_ERROR(-20007,'El nombre ' || :NEW.nombre || ' ya está en uso.');
        END IF;

    ELSE
        :NEW.nombre := :OLD.nombre;
    END IF;

    :NEW.fechaPublicacion := :OLD.fechaPublicacion;
    :NEW.artista := :OLD.artista;
    
    IF :NEW.vecesVendido = -9876 THEN
        :NEW.vecesVendido := :OLD.vecesVendido + 1;
    ELSE
        :NEW.vecesVendido := :OLD.vecesVendido;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_colecciones_BD
BEFORE DELETE ON colecciones
FOR EACH ROW
DECLARE
BEGIN
    RAISE_APPLICATION_ERROR(-20002,'IMPOSIBLE ELIMINAR REGISTROS EN ESTA TABLA');
END;
/

-- [coleccionesNFT]
CREATE OR REPLACE TRIGGER TG_coleccionesnft_BI
BEFORE INSERT ON coleccionesnft
FOR EACH ROW
DECLARE
    artista1 INTEGER;
    artista2 INTEGER;
    CONTADOR INTEGER;
BEGIN
    SELECT DISTINCT artista INTO artista1
    FROM nfts
    WHERE id = :NEW.nft;

    SELECT DISTINCT artista INTO artista2
    FROM colecciones
    WHERE id = :NEW.coleccion;

    IF(artista1 != artista2 OR artista1 IS NULL OR artista2 IS NULL) THEN
        RAISE_APPLICATION_ERROR(-20005,'NO PERTENCEN AL MISMO ARTISTA, IMPOSIBLE ANEXAR');
    END IF;

    SELECT COUNT(*) INTO CONTADOR
    FROM coleccionesnft
    WHERE nft = :NEW.nft;

    IF CONTADOR >=1 THEN
        RAISE_APPLICATION_ERROR(-20006,'NFT EN OTRA COLECCION, SOLO SE PUEDE ESTAR EN 1 A LA VEZ');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_coleccionesnft_BU
BEFORE UPDATE ON coleccionesnft
FOR EACH ROW
BEGIN
    :NEW.coleccion := :OLD.coleccion;
    :NEW.nft := :OLD.nft;
END;
/

-- [subastas]
CREATE OR REPLACE TRIGGER TG_subastas_BI
BEFORE INSERT ON subastas
FOR EACH ROW
DECLARE
    propietario NUMBER(30);
    contador NUMBER;
BEGIN
    IF :NEW.NFT IS NULL AND :NEW.coleccion IS NULL THEN
        RAISE_APPLICATION_ERROR(-20010,'TIENE QUE PONER ALGO PARA SUBASTAR');
    END IF;
    
    IF :NEW.NFT IS NOT NULL THEN
        SELECT usuario INTO propietario
        FROM nfts
        WHERE id = :NEW.nft;
        
        SELECT COUNT(*) INTO contador
        FROM coleccionesNFT
        WHERE nft = :NEW.nft;
        :NEW.coleccion := null;
    ELSE
        SELECT usuario INTO propietario
        FROM colecciones
        WHERE id = :NEW.coleccion;

        contador := 0;
        :NEW.nft := null;
    END IF;

    IF propietario IS NULL THEN
        RAISE_APPLICATION_ERROR(-20012,'OBJETO NO EXISTENTE');
    ELSIF propietario != :NEW.subastador THEN
        RAISE_APPLICATION_ERROR(-20011,'NO SE PUEDE SUBASTAR OBJETO SI NO ES SU DUEÑO');
    END IF;

    IF contador > 0 THEN
        RAISE_APPLICATION_ERROR(-20008,'NO SE PUEDE VENDER UN NFT PERTENECIENTE A UNA COLECCION');
    END IF;

    :NEW.id := SEQ_subastas.NEXTVAL;
    :NEW.precioInicial := ABS(:NEW.precioInicial);
    :NEW.precioActual := :NEW.precioInicial;
    :NEW.estado := 'I';
    :NEW.fechaInicio := SYSDATE;
    :NEW.fechaFinal := SYSDATE + INTERVAL '7' DAY;
    :NEW.comprador := NULL;
END;
/

CREATE OR REPLACE TRIGGER TG_subastas_BU
BEFORE UPDATE ON subastas
FOR EACH ROW
BEGIN
    IF :OLD.estado = 'C' THEN
        RAISE_APPLICATION_ERROR(-20009,'NO SE PUEDE MODIFICAR YA CERRADO EL PROCESO');
    END IF;

    :NEW.id := :OLD.id;
    :NEW.precioInicial := :OLD.precioInicial;
    
    IF :NEW.precioActual <  :OLD.precioActual THEN
        RAISE_APPLICATION_ERROR(-20013, 'LA OFERTA NO PUEDE SER MENOR QUE LA ANTERIOR');
    END IF;
    
    :NEW.fechaInicio := :OLD.fechaInicio;
    :NEW.fechaFinal := :OLD.fechaFinal;

    :NEW.coleccion := :OLD.coleccion;
    :NEW.nft := :OLD.nft;
    :NEW.subastador := :OLD.subastador;

    IF :NEW.comprador = :OLD.subastador THEN
        RAISE_APPLICATION_ERROR(-20004, 'El subastador no puede hacer ofertas.');
    ELSIF :NEW.comprador IS NULL THEN
        RAISE_APPLICATION_ERROR(-20014, 'NO SE PUEDE MANTENER COMPRADOR EN NULL');
    END IF;

    IF :NEW.estado = 'C' OR (:OLD.estado = 'P' AND :OLD.fechaFinal >= SYSDATE - 1 ) THEN
        :NEW.estado := 'C';
        :NEW.fechaFinal := SYSDATE;
        INSERT INTO contratosInteligentes VALUES(9999,:NEW.precioActual,SYSDATE,'P',:OLD.id,:OLD.subastador,:NEW.comprador,null,null);
    ELSIF :OLD.fechaFinal > SYSDATE THEN
        :NEW.estado := 'P';
        :NEW.fechaFinal := SYSDATE;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_subastas_BD
BEFORE DELETE ON subastas
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20002,'IMPOSIBLE ELIMINAR REGISTROS EN ESTA TABLA');
END;
/

-- [contratosInteligentes]
CREATE OR REPLACE TRIGGER TG_contratosInteligentes_BI
BEFORE INSERT ON contratosInteligentes
FOR EACH ROW
DECLARE
    bSubastador VARCHAR(300);
    bComprador VARCHAR(300);
BEGIN
    :NEW.id := SEQ_contratosInteligentes.NEXTVAL;
    :NEW.precioFinal := ABS(:NEW.precioFinal);
    :NEW.fechaCompra := SYSDATE;
    :NEW.estadoTransaccion := 'P';

    SELECT billetera INTO bSubastador
    FROM usuarios
    WHERE id = :NEW.subastador;

    SELECT billetera INTO bComprador
    FROM usuarios
    WHERE id = :NEW.comprador;

    IF bSubastador = bComprador THEN
        RAISE_APPLICATION_ERROR(-20015,'NO PUEDE SE PUEDE PONER LA MISMA BILLETERA LA DE SUBASTADOR Y COMPRADOR');
    END IF;

    :NEW.billeteraSubastador := bSubastador;
    :NEW.billeteraComprador := bComprador;

END;
/

CREATE OR REPLACE TRIGGER TG_contratosInteligentes_BU
BEFORE UPDATE ON contratosInteligentes
FOR EACH ROW
BEGIN
    IF :OLD.estadoTransaccion = 'A' THEN
        RAISE_APPLICATION_ERROR(-20009,'NO SE PUEDE MODIFICAR YA CERRADO EL PROCESO');
    END IF;

    :NEW.id := :OLD.id;
    :NEW.precioFinal := :OLD.precioFinal ;
    :NEW.fechaCompra := :OLD.fechaCompra;

    IF :NEW.estadoTransaccion = 'A' THEN
        :NEW.fechaCompra := SYSDATE;
    END IF;

    :NEW.subasta := :OLD.subasta ;
    :NEW.subastador := :OLD.subastador ;
    :NEW.comprador := :OLD.comprador ;
    :NEW.billeteraSubastador := :OLD.billeteraSubastador ;
    :NEW.billeteraComprador := :OLD.billeteraComprador ;
END;
/

CREATE OR REPLACE TRIGGER TG_contratosInteligentes_BD
BEFORE DELETE ON contratosInteligentes
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20002,'IMPOSIBLE ELIMINAR REGISTROS EN ESTA TABLA');
END;
/
