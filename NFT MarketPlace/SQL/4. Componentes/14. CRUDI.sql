
--==============[XCRUD]==============----
-- Gerente
DROP PACKAGE PK_COMPRADORES;

-- Usuarios
DROP PACKAGE PK_USUARIOS;

-- Artistas
DROP PACKAGE PK_ARTISTAS;

-- NFTs
DROP PACKAGE PK_NFTS;

-- Colecciones
DROP PACKAGE PK_COLECCIONES;

-- Subastas
DROP PACKAGE PK_SUBASTAS;


---=========[USUARIOS]====---
CREATE OR REPLACE PACKAGE BODY PK_USUARIOS AS
    -- Implementación de la función CrearUsuario
    -- CrearUsuario() Insertar nombre y correo
    PROCEDURE CrearUsuario(nombre_usuario IN usuarios.nombre%TYPE, correo_usuario IN usuarios.correo%TYPE) AS
    BEGIN
        -- Insertar el nuevo usuario en la tabla de usuarios
        INSERT INTO usuarios (nombre, correo) VALUES (nombre_usuario, correo_usuario);
        
        -- Confirmar la inserción
        DBMS_OUTPUT.PUT_LINE('Usuario creado exitosamente.');
        
        -- Confirmar la transacción
        COMMIT;
    END CrearUsuario;
    
    -- Actualizacion de billetera
    PROCEDURE ActualizarBilletera(id_usuario IN usuarios.id%TYPE, nueva_billetera IN usuarios.billetera%TYPE) AS 
    BEGIN
        UPDATE usuarios
        SET billetera = nueva_billetera
        WHERE id = id_usuario;
        
        -- Confirmar la transacción
        COMMIT;
    END ActualizarBilletera;

END PK_USUARIOS;
/


--============[ARTISTAS]===========--
CREATE OR REPLACE PACKAGE BODY PK_ARTISTAS AS
    -- Implementación de la función AgregarArtista
    PROCEDURE AgregarArtista(nombre_artistico IN artistas.nombreArtistico%TYPE, pais_residencia IN paises.pais%TYPE) AS
        id_pais paises.id%TYPE; -- Declaración de la variable para almacenar el ID del país
    BEGIN
        -- Verificar si el país ingresado existe en la tabla de países
        SELECT id INTO id_pais FROM paises WHERE pais = pais_residencia;
        
        -- Si el país no existe, mostrar un mensaje de error y salir del procedimiento
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('El país ingresado no está en la tabla de países.');
                RETURN;
        
        -- Insertar el nuevo artista en la tabla de artistas
        INSERT INTO artistas (nombreArtistico, pais) VALUES (nombre_artistico, id_pais);
        
        -- Confirmar la inserción
        DBMS_OUTPUT.PUT_LINE('Artista agregado exitosamente.');
        
        -- Confirmar la transacción
        COMMIT;
    END AgregarArtista;

    -- Implementacion de la funcion de actualizar artista
    PROCEDURE ActualizarPerfilArtista(id_artista IN artistas.usuario%TYPE, nombre_nuevo IN artistas.nombreArtistico%TYPE, nuevo_pais IN paises.pais%TYPE) AS 
    BEGIN
        UPDATE artistas
        SET nombreArtistico = nombre_nuevo, pais = nuevo_pais
        WHERE usuario = id_artista;
        
        -- Confirmar la transacción
        COMMIT;
    END ActualizarPerfilArtista;
END PK_ARTISTAS;
/



--===========[COMPRADORES]==========---
CREATE OR REPLACE PACKAGE BODY PK_COMPRADORES AS
BEGIN
    FOR compra IN CR_COMPRADORES LOOP
        DBMS_OUTPUT.PUT_LINE('Usuario: ' || compra.usuario || ', Conexiones: ' || compra.num_conexiones);
    END LOOP;
END PK_COMPRADORES;
/


--=================[NFTS]=============--
CREATE OR REPLACE PACKAGE BODY PK_NFTS AS

    PROCEDURE InsertarNFT(id_artista IN nfts.artista%TYPE, nombre_nft IN nfts.nombre%TYPE, venta IN nfts.enVenta%TYPE, archivo_ IN nfts.archivo%TYPE, formato IN nfts.formatoArchivo%TYPE, nombre_tag IN tags.nombre%TYPE) AS
        id_tag tags.id%TYPE;
    BEGIN
        SELECT id INTO id_tag
        FROM tags
        WHERE nombre = nombre_tag
        AND ROWNUM = 1;

        INSERT INTO nfts(nombre, archivo, formatoArchivo, enVenta, tagId, artista) 
        VALUES (nombre_nft, archivo_, formato, venta, id_tag, id_artista);
        
        -- Confirmar la transacción
        COMMIT;
    END InsertarNFT;

    PROCEDURE ActualizarNombreNFT(id_artista IN nfts.artista%TYPE, nuevo_nombre IN nfts.nombre%TYPE, viejo_nombre IN nfts.nombre%TYPE) AS
        id_nft nfts.id%TYPE;
        dueno_nft nfts.usuario%TYPE;
    BEGIN
        SELECT id INTO id_nft
        FROM nfts
        WHERE nombre = viejo_nombre
        AND ROWNUM = 1;

        SELECT usuario INTO dueno_nft
        FROM nfts
        WHERE id = id_nft;

        IF id_artista = dueno_nft THEN
            UPDATE nfts
            SET nombre = nuevo_nombre
            WHERE artista = id_artista AND id = id_nft;
        ELSE
            RAISE_APPLICATION_ERROR(-20015, 'Solo el artista puede cambiar el nombre');
        END IF;
        
        -- Confirmar la transacción
        COMMIT;
    END ActualizarNombreNFT;

    PROCEDURE CalificarNFT(id_usuario IN nfts.usuario%TYPE, calificacion_deseada IN calificacionesNFT.calificacion%TYPE, nft_nombre IN nfts.nombre%TYPE) AS
        id_nft nfts.id%TYPE;
        id_artista nfts.artista%TYPE;
    BEGIN
        SELECT id INTO id_nft
        FROM nfts
        WHERE nombre = nft_nombre
        AND ROWNUM = 1;

        SELECT artista INTO id_artista
        FROM nfts
        WHERE id = id_nft;

        IF id_usuario != id_artista THEN
            INSERT INTO calificacionesNFT VALUES (id_usuario, id_nft, calificacion_deseada);
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'El artista no puede calificar su propio NFT');
        END IF;
        
        -- Confirmar la transacción
        COMMIT;
    END CalificarNFT;

    PROCEDURE cambiarTAG(id_usuario IN nfts.usuario%TYPE, nombre_tag IN tags.nombre%TYPE) AS
        id_tag tags.id%TYPE;
    BEGIN
        SELECT id INTO id_tag
        FROM tags
        WHERE nombre = nombre_tag
        AND ROWNUM = 1;

        UPDATE nfts
        SET tagId = id_tag
        WHERE usuario = id_usuario;
        
        -- Confirmar la transacción
        COMMIT;
    END cambiarTAG;

    PROCEDURE PonerVentaNFT(id_usuario IN nfts.usuario%TYPE, id_nft IN nfts.id%TYPE) AS
    BEGIN
        UPDATE nfts
        SET enVenta = 'T'
        WHERE id = id_nft AND usuario = id_usuario;
        
        -- Confirmar la transacción
        COMMIT;
    END PonerVentaNFT;

END PK_NFTS;
/

--================[COLECCIONES]===========--



CREATE OR REPLACE PACKAGE BODY PK_COLECCIONES AS

    PROCEDURE AgregarColeccion(id_artista IN colecciones.artista%TYPE, nombre_coleccion IN colecciones.nombre%TYPE) AS
    BEGIN
        INSERT INTO colecciones(nombre, artista) VALUES (nombre_coleccion, id_artista);
        COMMIT; -- Confirmar la transacción
    END AgregarColeccion;

    PROCEDURE ActualizarNombreColeccion(id_artista IN colecciones.artista%TYPE, viejo_nombre IN colecciones.nombre%TYPE, nuevo_nombre IN colecciones.nombre%TYPE) AS
        id_coleccion colecciones.id%TYPE;
    BEGIN
        SELECT id INTO id_coleccion
        FROM colecciones
        WHERE nombre = viejo_nombre;
        
        UPDATE colecciones
        SET nombre = nuevo_nombre
        WHERE id = id_coleccion AND artista = id_artista;
        
        COMMIT; -- Confirmar la transacción
    END ActualizarNombreColeccion;

END PK_COLECCIONES;
/


--==================[SUBASTAS]================----

CREATE OR REPLACE PACKAGE BODY PK_SUBASTAS AS
    PROCEDURE AbrirSubasta(id_subastador IN subastas.subastador%type, 
    precio_inicial IN subastas.precioInicial%type,
    id_nft IN subastas.NFT%type, id_coleccion IN subastas.coleccion%type) AS
        id_nft_ subastas.NFT%TYPE;
        id_coleccion_ subastas.coleccion%TYPE;
    BEGIN
        SELECT id INTO id_nft_
        FROM nfts
        WHERE enVenta = 'T' AND id = id_nft;

        SELECT id INTO id_coleccion_
        FROM colecciones
        WHERE id=id_coleccion;

        IF id_nft_ IS NULL THEN
            INSERT INTO subastas(precioInicial,coleccion, subastador) VALUES (precio_inicial,id_coleccion,id_subastador);
        ELSIF id_coleccion_ IS NULL THEN
            INSERT INTO subastas(precioInicial, NFT, subastador) VALUES(precio_inicial, id_nft,id_subastador);
        END IF;
        
        COMMIT; -- Añadir COMMIT
    END AbrirSubasta;

    PROCEDURE  PararSubasta(id_subastador IN subastas.subastador%type, 
    id_coleccion IN subastas.coleccion%type,
    id_nft IN subastas.NFT%type) AS
    BEGIN
        UPDATE subastas
        SET estado = 'S'
        WHERE subastador = id_subastador AND (coleccion = id_coleccion OR NFT= id_nft);
        
        COMMIT; -- Añadir COMMIT
    END PararSubasta;

    PROCEDURE CerrarSubasta(id_subastador IN subastas.subastador%type,
    id_coleccion IN subastas.coleccion%type,
    id_nft IN subastas.NFT%type) AS
    BEGIN
        UPDATE subastas
        SET estado = 'P'
        WHERE subastador = id_subastador AND (coleccion = id_coleccion OR NFT= id_nft);
        
        COMMIT; -- Añadir COMMIT
    END CerrarSubasta;
    
    PROCEDURE OfrecerPrecio(id_comprador IN subastas.comprador%type,
    precio subastas.precioActual%type, id_coleccion IN subastas.coleccion%type,
    id_nft IN subastas.NFT%type) AS
    BEGIN
        UPDATE subastas
        SET precioActual = precio
        WHERE comprador = id_comprador AND (coleccion = id_coleccion OR NFT= id_nft);
        
        COMMIT; -- Añadir COMMIT
    END OfrecerPrecio;
END PK_SUBASTAS;
/
