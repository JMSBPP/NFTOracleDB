--======================================--
--===============[XIndices]===============--
--======================================--
DROP INDEX contratosInteligentes_estadoTransaccion;
DROP INDEX subastas_estado;
DROP INDEX NFTS_fechaPublicacion;
DROP INDEX colecciones_fechaPublicacion;
DROP INDEX subastas_colecciones;
DROP INDEX subastas_nfts;
DROP INDEX subastas_subastador;
DROP INDEX subastas_comprador;
DROP INDEX subastas_subastador_comprador;
DROP INDEX contratosInteligentes_billetera_subastador;
DROP INDEX contratosInteligentes_billetera_comprador;
DROP INDEX contratosInteligentes_billetera_subastador_billetera_comprador;

--======================================--
--===============[Indices]===============--
--======================================--

--- Se crean indices en funcion de los where de las vistas para mejorar la eficiencia de
--busqueda de las consultas acda vez que sean llamadas

--Un indice sobre el estado de las transacciones
CREATE INDEX contratosInteligentes_estadoTransaccion ON contratosInteligentes(estadoTransaccion);
--Un indice sobre el estado de las subastas

CREATE INDEX subastas_estado ON subastas(estado);

-- Un indice en la fecha de publicacion de nfts

CREATE INDEX NFTS_fechaPublicacion ON nfts(fechaPublicacion);

--Un indice en la fecha de publicaion de las colecciones
CREATE INDEX colecciones_fechaPublicacion ON colecciones(fechaPublicacion);

--Un indice en las colecciones de las subastas

CREATE INDEX subastas_colecciones ON subastas(coleccion);
--Un indice en los nfts de las subastas

CREATE INDEX subastas_nfts ON subastas(NFT);

-- Un indice en usuario1 de subastas
CREATE INDEX subastas_subastador ON subastas(subastador);

--Un indice en usuario2 de subastas
CREATE INDEX subastas_comprador ON subastas(comprador);
--Un multiindice en usuario1, usuario2 de subastas

CREATE INDEX subastas_subastador_comprador ON subastas(subastador,comprador);
--Un indice en billetera1 de contratosInteligentes
CREATE INDEX contratosInteligentes_billetera_subastador ON contratosInteligentes(billeteraSubastador);

--Un indice en billetera2 de contratosInteligentes
CREATE INDEX contratosInteligentes_billetera_comprador ON contratosInteligentes(billeteraComprador);
-- Un multi-indice en billetere1, billetera2 de contratosInteligentes 
CREATE INDEX contratosInteligentes_billetera_subastador_billetera_comprador ON contratosInteligentes(billeteraSubastador,billeteraComprador);