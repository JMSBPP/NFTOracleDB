


--GERENTE


-- Ciclo 2
---NFTS


--Consultar el numero de NFTS en el sistema
--Autorizado a gerente


-- El numero de NFT's vendidos al mes, 
--ingresa un mes y devuelve el numerod de nfts vendidos en ese mes


--Consultar el numero de Colecciones en el sistema
--Autorizado a gerente

-- CG El numero de Colecciones vendidas al mes
-- ingresa un mes y devuelve el numerod de colecciones vendidos en ese mes

--Consultar el tiempo promedio en el que se finaliza una subasta por mes

--Ingresa mes o dia y clacula el tiempo promedio que duraron las subastas abiertas


--consultar comision ganada el ultimo mes
--Ingresa ID de gerente y revisa su saldo
--Autorizado a gerente

--Consultar cuantos contratos se pagan por dias
--Autorizado a gerente

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

--============[USUARIOS]=============--

CREATE OR REPLACE PACKAGE PK_USUARIOS AS
    
    PROCEDURE CrearUsuario(nombre_usuario IN usuarios.nombre%type, correo_usuario IN usuarios.correo%type);
    PROCEDURE ActualizarBilletera(id_usuario IN usuarios.id%type, nueva_billetera IN usuarios.billetera%type);
END PK_USUARIOS;
/




--===================[ARTISTAS]============--

CREATE OR REPLACE PACKAGE PK_ARTISTAS AS
    -- Declaración de la función AgregarArtista
    PROCEDURE AgregarArtista(nombre_artistico IN artistas.nombreArtistico%type, pais_residencia IN paises.pais%type);
    PROCEDURE ActualizarPerfilArtista(id_artista IN artistas.usuario%type,nombre_nuevo IN artistas.nombreArtistico%type, nuevo_pais IN paises.pais%type);
END PK_ARTISTAS;
/


-- CICLO 1 
--- COMPRADORES

--ESPECIFICACION DEL PAQUETE
-- Consultar el numero de conexxiones agrupadas por comprador
--Cursor unicamente autorizado a gerente

--=================[COMPRADORES]=========--
CREATE OR REPLACE PACKAGE PK_COMPRADORES AS
    CURSOR CR_COMPRADORES IS
        SELECT usuario, COUNT(*) AS num_conexiones
        FROM compradores
        GROUP BY usuario;
END PK_COMPRADORES;
/


--- CICLO 2

--===============[NFTS]==========--

CREATE OR REPLACE PACKAGE PK_NFTS AS
    --INSERT
    PROCEDURE InsertarNFT(id_artista IN nfts.artista%TYPE, nombre_nft IN nfts.nombre%TYPE, venta IN nfts.enVenta%TYPE, archivo_ IN nfts.archivo%TYPE, formato IN nfts.formatoArchivo%TYPE, nombre_tag IN tags.nombre%TYPE); --Permite al artista subir su NFT
    --UPDATE
    PROCEDURE ActualizarNombreNFT(id_artista IN nfts.artista%TYPE, nuevo_nombre IN nfts.nombre%TYPE, viejo_nombre IN nfts.nombre%TYPE); --Autorizado a Artista, siempre y cuando sea dueno
    PROCEDURE CalificarNFT(id_usuario IN nfts.usuario%TYPE, calificacion_deseada IN calificacionesNFT.calificacion%TYPE, nft_nombre IN nfts.nombre%TYPE); --Autorizado a compradores no duenos del NFT
    PROCEDURE cambiarTAG(id_usuario IN nfts.usuario%TYPE, nombre_tag IN tags.nombre%TYPE); --Permite cambiar un tag a los nfts, unicamente autorizado al dueno del nft
    PROCEDURE PonerVentaNFT(id_usuario IN nfts.usuario%TYPE, id_nft IN nfts.id%TYPE); --Permite al dueno poner en venta el NFT
END PK_NFTS;
/

--=============[COLECCIONES]===============---
-- ESPECIFICACION PAQUETE
CREATE OR REPLACE PACKAGE PK_COLECCIONES AS
    --INSERT
    PROCEDURE AgregarColeccion(id_artista IN colecciones.artista%TYPE, nombre_coleccion IN colecciones.nombre%TYPE); -- Artista Agrega Coleccion de NFTS
    --UPDATE
    PROCEDURE ActualizarNombreColeccion(id_artista IN colecciones.artista%TYPE, viejo_nombre IN colecciones.nombre%TYPE, nuevo_nombre IN colecciones.nombre%TYPE); -- Artista cambia nombre de la coleccion mientras sea dueño
END PK_COLECCIONES;
/


--CICLO 3
--===============[SUBASTAS]===========----

--ESPECIFICACION DE PAQUETES
CREATE OR REPLACE PACKAGE PK_SUBASTAS AS
    --CONSULTA (Puedes incluir la declaración de una consulta aquí si es necesario)

    --CURSOR para obtener información de las subastas
    CURSOR c_subastas IS
        SELECT precioActual, precioActual * 0.1 AS comision_artista, precioActual * 0.003 AS gas_fee
        FROM subastas WHERE estado = 'P';

    --INSERT
    PROCEDURE AbrirSubasta(id_subastador IN subastas.subastador%TYPE, precio_inicial IN subastas.precioInicial%TYPE, id_nft IN subastas.NFT%TYPE, id_coleccion IN subastas.coleccion%TYPE); -- Se ingresa subasta por parte del subastador
    
    --UPDATE
    PROCEDURE PararSubasta(id_subastador IN subastas.subastador%TYPE, id_coleccion IN subastas.coleccion%TYPE, id_nft IN subastas.NFT%TYPE); -- Si la subasta está iniciada o activa, el subastador decide pararla y no ha llegado a la fecha final de la subasta (Función únicamente autorizada a los subastadores)
    
    PROCEDURE CerrarSubasta(id_subastador IN subastas.subastador%TYPE, id_coleccion IN subastas.coleccion%TYPE, id_nft IN subastas.NFT%TYPE); -- Si la subasta está en pausa y está activa, la subasta entra en proceso de cierre. Al entrar en proceso de cierre 'P' automáticamente se manda a contrato inteligente. Si solo está iniciada (no hay precios ofrecidos), el estado pasa a cierre. Si está activa (tiene precios), puede ponerla en proceso de cierre que automáticamente envía el precio mayor a contrato inteligente
    
    PROCEDURE OfrecerPrecio(id_comprador IN subastas.comprador%TYPE, precio IN subastas.precioActual%TYPE, id_coleccion IN subastas.coleccion%TYPE, id_nft IN subastas.NFT%TYPE); -- Se verifica que no sea subastador y solo puede actualizar el precioActual (Función autorizada únicamente a compradores). Al actualizar el precio actual, se actualiza comprador a id de comprador que ofreció precio automáticamente

END PK_SUBASTAS;
/








