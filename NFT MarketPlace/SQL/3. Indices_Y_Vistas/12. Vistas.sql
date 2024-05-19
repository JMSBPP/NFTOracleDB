--======================================--
--===============[XVistas]===============--
--======================================--
DROP VIEW VISTA_COMERCIAL_1;
DROP VIEW VISTA_COMERCIAL_2;
DROP VIEW VISTA_COMERCIAL_3;
DROP VIEW VISTA_COMERCIAL_4;
DROP VIEW VISTA_COMERCIAL_5;
DROP VIEW VISTA_COMERCIAL_6;
DROP VIEW VISTA_COMERCIAL_7;
DROP VIEW VISTA_COMERCIAL_8;
DROP VIEW VISTA_COMERCIAL_9;
DROP VIEW VISTA_COMERCIAL_10;
DROP VIEW VISTA_ARTISTA_1;
DROP VIEW VISTA_ARTISTA_2;
DROP VIEW VISTA_GENERAL_1;
DROP VIEW VISTA_GENERAL_2;
DROP VIEW VISTA_ADMIN_1;
DROP VIEW VISTA_ADMIN_2;
DROP VIEW VISTA_ADMIN_3;
DROP VIEW VISTA_ADMIN_4;
DROP VIEW VISTA_ADMIN_5;
DROP VIEW VISTA_GERENCIAL_1;
DROP VIEW VISTA_GERENCIAL_2;
DROP VIEW VISTA_GERENCIAL_3;
DROP VIEW VISTA_GERENCIAL_4;
DROP VIEW VISTA_GERENCIAL_5;
DROP VIEW VISTA_GERENCIAL_6;
DROP VIEW VISTA_GERENCIAL_7;
DROP VIEW VISTA_GERENCIAL_8;
DROP VIEW VISTA_GERENCIAL_9;
DROP VIEW VISTA_GERENCIAL_10;
--======================================--
--===============[Vistas]===============--
--======================================--

CREATE OR REPLACE VIEW VISTA_COMERCIAL_1 AS
-- Consultar el gasto total por comprador en el último mes y el número de logueos en el último mes
--AUTORIZADO A COMPRADORES/VENDEDORES
    SELECT 
        u.nombre, 
        comp.ultimaConexion, 
        SUM(ct.precioFinal) AS "TOTAL GASTADO POR COMPRADOR ULTIMO MES", 
        COUNT(comp.ultimaConexion) AS "NUMERO DE LOGUEOS EN EL ULTIMO MES"
    FROM 
        contratosInteligentes ct
    LEFT JOIN 
        usuarios u ON ct.billeteraComprador = u.billetera
    LEFT JOIN 
        compradores comp ON u.id = comp.usuario
    WHERE 
        ct.estadoTransaccion = 'A' 
        AND EXTRACT(MONTH FROM comp.ultimaConexion) = EXTRACT(MONTH FROM SYSDATE)
    GROUP BY 
        u.nombre, 
        comp.ultimaConexion 
    ORDER BY 
        SUM(ct.precioFinal) DESC;
/


CREATE OR REPLACE VIEW VISTA_COMERCIAL_2 AS 
-- Consultar el volumen de artistas
--Autorizado a compradores
    SELECT 
        a.nombreArtistico AS "Nombre Artístico",
        COUNT(DISTINCT n.id) AS "Conteo de NFTs en Venta",
        MAX(n.fechaPublicacion) AS "Última Fecha de Publicación",
        SUM(CASE WHEN n.haSidoVendido = 'S' THEN 1 ELSE 0 END) AS "Conteo de NFTs Vendidos",
        COUNT(DISTINCT c.id) AS "Conteo de Colecciones Vendidas",
        COUNT(DISTINCT ci.billeteraComprador) AS "Número de Compradores que le han Comprado",
        SUM(a.aggcomision) AS "Total Ganado en la Plataforma"
    FROM 
        artistas a
    LEFT JOIN 
        nfts n ON a.usuario = n.artista
    LEFT JOIN 
        contratosInteligentes ci ON n.id = ci.subasta
    LEFT JOIN 
        coleccionesNFT cn ON n.id = cn.nft
    LEFT JOIN 
        colecciones c ON cn.coleccion = c.id
    WHERE 
        ci.estadoTransaccion = 'A'
    GROUP BY 
        a.nombreArtistico
    ORDER BY 
        COUNT(DISTINCT ci.billeteraComprador) DESC;
/



CREATE OR REPLACE VIEW VISTA_COMERCIAL_3 AS 
-- Consultar subastas de nfts con mayores variacion de precios
--Autorizado a compradores
    SELECT 
        n.nombre AS "Nombre del NFT",
        a.nombreArtistico AS "Nombre del Artista",
        s.id AS "ID de la Subasta",
        s.precioInicial AS "Precio Inicial en la Subasta",
        ct.precioFinal AS "Precio Final en el Contrato Inteligente",
        ((ct.precioFinal - s.precioInicial) / s.precioInicial) AS "Variación de Precios"
    FROM 
        subastas s
    JOIN 
        nfts n ON s.NFT = n.id
    JOIN 
        artistas a ON n.artista = a.usuario
    JOIN 
        contratosInteligentes ct ON s.id = ct.subasta
    WHERE 
        ct.estadoTransaccion = 'A' AND s.estado = 'C' -- Estado de la subasta es 'C' (Cerrado)
    ORDER BY 
        "Nombre del NFT" DESC;
/



CREATE OR REPLACE VIEW VISTA_COMERCIAL_4 AS 
-- Consultar subastas de colecciones con mayores variacion de precios
--Autorizado a compradores
    SELECT 
        c.nombre AS "Nombre de la coleccion",
        a.nombreArtistico AS "Nombre del Artista",
        s.id AS "ID de la Subasta",
        s.precioInicial AS "Precio Inicial en la Subasta",
        ct.precioFinal AS "Precio Final en el Contrato Inteligente",
        ((ct.precioFinal - s.precioInicial) / s.precioInicial) AS "Variación de Precios"
    FROM 
        subastas s
    JOIN 
        colecciones c ON s.coleccion = c.id
    JOIN 
        artistas a ON c.artista = a.usuario
    JOIN 
        contratosInteligentes ct ON s.id = ct.subasta
    WHERE 
        ct.estadoTransaccion = 'A' AND s.estado = 'C' -- Estado de la subasta es 'C' (Cerrado)
    ORDER BY 
        "Nombre de la coleccion" DESC;
/

CREATE OR REPLACE VIEW VISTA_COMERCIAL_5 AS
-- Consultar subastas cerradas con pagos exitosos
--Autorizado a compradores
    SELECT COUNT(*) AS "SUBASTAS CERRADAS CON PAGOS EXITOSOS"
    FROM subastas s
    LEFT JOIN 
        contratosInteligentes ct ON(s.id=ct.subasta)
    WHERE s.estado = 'C'AND ct.estadoTransaccion='A';
/


CREATE OR REPLACE VIEW VISTA_COMERCIAL_6 AS
-- Consultar los tags más usados y con NFTS mejor calificados
-- Autorizado a compradores
    SELECT 
        t.nombre AS "NOMBRE CATEGORIA", 
        COUNT(DISTINCT n.id) AS "# DE NFTS", 
        AVG(cn.calificacion) AS "CALIFICACION DEL TAG"
    FROM 
        tags t
    JOIN 
        nfts n ON t.id = n.tagId
    JOIN
        calificacionesNFT cn ON n.id = cn.nft
    GROUP BY 
        t.nombre
    ORDER BY 
        "CALIFICACION DEL TAG" DESC;
/

CREATE OR REPLACE VIEW VISTA_COMERCIAL_7 AS 
-- Consultar colecciones en venta
-- Autorizado a compradores y artistas
    SELECT 
        col.nombre AS "NOMBRE COLECCION", 
        a.nombreArtistico AS "NOMBRE ARTISTICO", 
        col.FECHAPUBLICACION AS "FECHA DE PUBLICACION", 
        COUNT(DISTINCT coln.NFT) AS "# NFTS POR COLECCION"
    FROM 
        colecciones col
    LEFT JOIN 
        coleccionesNFT coln ON col.id = coln.coleccion
    LEFT JOIN
        artistas a ON a.usuario = col.artista
    GROUP BY 
        col.nombre, col.fechaPublicacion, a.nombreArtistico
    ORDER BY 
        col.FECHAPUBLICACION DESC;
/


CREATE OR REPLACE VIEW  VISTA_COMERCIAL_8 AS
    -- Consultar nfts en venta
    --Autorizado a compradores y artistas
    SELECT n.nombre AS "NOMBRE NFT", a.nombreArtistico AS "NOMBRE ARTISTA", n.fechaPublicacion AS "FECHA PUBLICACION"
    FROM nfts n
    LEFT JOIN 
        artistas a ON (n.artista=a.usuario)
    WHERE n.enVenta='T'
    ORDER BY n.fechaPublicacion DESC;
/



CREATE OR REPLACE VIEW VISTA_COMERCIAL_9 AS
    --Consultar en cuantas colecciones a la venta estan sus NFTS
    --Autorizado a compradores y artistas
        SELECT 
        nombre_artista,
        nfts_en_venta,
        nfts_vendidos,
        colecciones_vendidas,
        colecciones_en_venta,
        (nfts_vendidos + colecciones_vendidas) / (nfts_en_venta + colecciones_en_venta) AS conversion_rate
    FROM (
        SELECT 
            a.nombreArtistico AS nombre_artista,
            COUNT(DISTINCT CASE WHEN n.enVenta = 'S' THEN n.id END) AS nfts_en_venta,
            COUNT(DISTINCT CASE WHEN n.haSidoVendido = 'S' THEN n.id END) AS nfts_vendidos,
            COUNT(DISTINCT CASE WHEN c.vecesVendido != 0 THEN c.id END) AS colecciones_vendidas,
            COUNT(DISTINCT CASE WHEN c.vecesVendido = 0 THEN c.id END) AS colecciones_en_venta
        FROM 
            artistas a
        LEFT JOIN 
            nfts n ON a.usuario = n.artista
        LEFT JOIN 
            colecciones c ON a.usuario = c.artista
        LEFT JOIN 
            subastas s ON n.id = s.nft OR c.id = s.coleccion
        LEFT JOIN 
            contratosInteligentes ct ON ct.subasta = s.id
        GROUP BY 
            a.nombreArtistico
    ) t
    ORDER BY 
        nfts_en_venta + colecciones_en_venta DESC;
/
CREATE OR REPLACE VIEW VISTA_COMERCIAL_10 AS
-- Calificación de los NFT, por artista de menor a mayor
-- Autorizado a todos

    SELECT n.nombre AS "NOMBRE NFT", 
        SUM(cn.calificacion) AS "CALIFICACION ACUMULADA", 
        a.nombreArtistico AS "ARTISTA"
    FROM nfts n
    LEFT JOIN calificacionesNFT cn ON n.id = cn.nft
    JOIN artistas a ON a.usuario = n.artista
    GROUP BY n.nombre, a.nombreArtistico
    ORDER BY "CALIFICACION ACUMULADA" DESC;
/

    



CREATE OR REPLACE VIEW VISTA_ARTISTA_1 AS
    --Consultar cuanto va ganando por sus obras  
    --Autorizado a artistas
    SELECT *
    FROM artistas
    ORDER BY aggcomision DESC;
/


CREATE OR REPLACE VIEW VISTA_ARTISTA_2 AS
    --Consultar estado de subastas activas con sus trabajos
    --Autorizado a artistas
    SELECT 
        a.usuario AS id_artista,
        a.nombreArtistico,
        s.id AS id_subasta,
        s.precioActual,
        ROUND((s.precioActual - s.precioInicial) / s.precioInicial, 2) AS incremento_precio,
        ROUND(s.precioActual * 0.1, 2) AS comision_potencial
    FROM 
        subastas s
    LEFT JOIN 
        nfts n ON s.nft = n.id
    JOIN
        artistas a ON a.usuario = n.artista
    LEFT JOIN
        colecciones col ON col.id = s.coleccion
    WHERE 
        s.estado = 'A'
    ORDER BY            
        incremento_precio DESC;
/


CREATE OR REPLACE VIEW VISTA_GENERAL_1 AS
    --tags disponibles
    --Autorizado a todos
    SELECT *
    FROM tags;
/


CREATE OR REPLACE VIEW  VISTA_GENERAL_2 AS 
    --Consultar paises disponibles
    --Autorizado a artistas
    SELECT *
    FROM paises
/


CREATE OR REPLACE VIEW VISTA_ADMIN_1 AS

--Consultar el detalle de transacciones por billetera

--Autorizado a admin

    SELECT 

        u.billetera AS "BILLETERA COMERCIANTES", 

        CASE 

            WHEN u.billetera = ct.billeteraSubastador THEN 'COMPRADOR'

            WHEN u.billetera = ct.billeteraComprador THEN 'SUBASTADOR'

        END AS "ESTADO BILLETERA",

        COUNT(CASE WHEN ct.estadoTransaccion = 'R' THEN 1 END) AS "RECHAZADAS",

        COUNT(CASE WHEN ct.estadoTransaccion = 'A' THEN 1 END) AS "APROBADAS",

        COUNT(CASE WHEN ct.estadoTransaccion = 'P' THEN 1 END) AS "PENDIENTES"

    FROM 

        contratosInteligentes ct

    JOIN 

        usuarios u ON (u.billetera = ct.billeteraSubastador OR u.billetera = ct.billeteraComprador)

    GROUP BY 

        u.billetera, 

        CASE 

            WHEN u.billetera = ct.billeteraSubastador THEN 'COMPRADOR'

            WHEN u.billetera = ct.billeteraComprador THEN 'SUBASTADOR'

        END;
/


CREATE OR REPLACE VIEW VISTA_ADMIN_2 AS
    -- Consultar el número de artistas por país
    -- Autorizado a admin
    SELECT p.pais AS "PAIS", COUNT(DISTINCT a.usuario) AS "ARTISTAS"
    FROM paises p
    LEFT JOIN artistas a ON (a.pais = p.id)
    GROUP BY p.pais;
/


CREATE OR REPLACE VIEW VISTA_ADMIN_3 AS 
    --Consultar el detalle subastas
    --Autorizado a admin
    SELECT *
    FROM subastas;
/
    

CREATE OR REPLACE VIEW VISTA_ADMIN_4 AS 
    --Consultar el detalle de contratos inteligentes
    --Autorizado a admin
    SELECT *
    FROM contratosInteligentes;
/


CREATE OR REPLACE VIEW VISTA_ADMIN_5 AS
-- Consultar los formatos de archivos más usados
-- Autorizado a admin
    SELECT nfts.formatoArchivo AS "TIPO ARCHIVO",
        COUNT(*) AS "NUMERO DE ARCHIVOS"
    FROM nfts
    GROUP BY nfts.formatoArchivo;
/


CREATE OR REPLACE VIEW VISTA_GERENCIAL_1 AS
    --Consultar el numero de compradores que se han conectado el ultimo mes
    -- Autorizado a gerente
    SELECT COUNT(*) AS "NUMERO DE COMPRADORES CONECTADOS EL ULTIMO MES"
    FROM compradores
    WHERE ultimaConexion >= TRUNC(SYSDATE, 'MM') - INTERVAL '1' MONTH
    AND ultimaConexion < TRUNC(SYSDATE, 'MM');
/

CREATE OR REPLACE VIEW VISTA_GERENCIAL_2 AS 
    --Consultar el numero de NFTS por tag
    --Autorizado a gerente
    SELECT t.nombre  AS "NOMBRE TAG", COUNT(*) AS "# NFTS"
    FROM tags t
    LEFT JOIN   
        nfts n ON(n.tagId=t.id)
    GROUP BY
        t.nombre
    ORDER BY
        COUNT(*) DESC;
/


