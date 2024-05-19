
--Consulta 1: Queremos ver los artistas que tenemos disponibles y los paises a los que pertenecen
SELECT a.nombreArtistico, p.pais
FROM ARTISTAS a
JOIN PAISES p
ON a.PAIS = p.ID;

--Consulta 2: Queremos ver los tags disponibles (Excluyendo el XML)
SELECT id, nombre, descripcion
FROM tags;

--Consulta 3: Queremos ver los NFT's y los tags a los que pertenecen
SELECT n.id, n.nombre, n.formatoArchivo, n.fechaPublicacion, n.enVenta,t.nombre AS "Tag"
FROM NFTS n
JOIN tags t
ON n.TAGID = t.ID;