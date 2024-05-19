#######################################LIBRERIAS##############################

import hashlib
import names
import random
from datetime import datetime, timedelta
import pycountry
import re
import math
from faker import Faker
import sys
import numpy as np
import pandas as pd


#######################SEMILLA#################################################
random.seed(41)

####################################FUNCIONES############################################

def generate_hash(data):
    ''''
    Genera hash de mensajes para las billeteras
    '''
    hash_object = hashlib.sha256(data.encode())
    return hash_object.hexdigest()

def titulos_aleatorios(numero):
    '''
    Dado un numero retronna lista de la magnitud del parametro, con titulos no 
    repetidos
    '''
    nombres, i = [],0 
    while True:
        nombre = Faker().catch_phrase().split()[0]
        if nombre not in nombres:
            nombres.append(nombre)
            i +=1
        if i >= numero:
            break
    return nombres

def fechas(fecha_inicio, tamano):
    '''
    Generates a list of dates incrementing by day
    '''
    return [(datetime.strptime(fecha_inicio, '%Y-%m-%d') + timedelta(days=i)).strftime('%Y-%m-%d') for i in range(tamano)]


############################################################DEFINCION DE DATOS#############################################


#USUARIOS
print('--Ingrese Numero de usuarios:')
numero_de_registros = int(input())
numero_de_registros = numero_de_registros +1
user_name = [names.get_full_name().split()[0] + str(random.randint(10, 99)) for _ in range(1, numero_de_registros)]
correos = [name + random.choice(['@aol.com','@gmail.com','@hotmail.com','@outlook.com']) for name in user_name]

usuarios = {'id': [i for i in range(1, numero_de_registros)], 
            'billetera': [generate_hash(f'billetera{i}') for i in range(1, numero_de_registros)], 
            'nombre': user_name, 
            'correo': correos,
            'agg_ganancia': np.zeros(numero_de_registros-1)}


#COMPRADORES

compradores = {'usuario':random.sample(usuarios['id'],int(math.floor(numero_de_registros/2))),
               'ultimaConexion':[(datetime.strptime(datetime.now().strftime('%Y-%m-%d %H:%M:%S'), '%Y-%m-%d %H:%M:%S')+ timedelta(seconds=i)).strftime('%Y-%m-%d %H:%M:%S') for i in range(int(math.floor(numero_de_registros/2)))] }

#PAISES

paises = {
    'id': [country.alpha_2 for country in pycountry.countries],
    'pais': [re.sub("'","",country.name) for country in pycountry.countries]
}

# ARTISTAS


artistas = {'usuario': random.sample(usuarios['id'],int(math.floor(numero_de_registros/2))),
            'pais':random.choices(paises['id'],k=int(math.floor(numero_de_registros/2))),
            'nombreArtistico':[names.get_full_name().split()[0] + str(random.randint(1,200)) for _ in range(int(math.floor(numero_de_registros/2)))],
            'aggcomision': np.zeros(int(math.floor(numero_de_registros/2)))}

#COLECCIONES
#El artista puede ser el mismo que tiene la coleccion
#El nombre es unico
# print('--Ingrese Numero de colecciones(Deben haber menos colecciones que la mitad de usuarios)')

# num_colecciones = int(input())

# print('--Ingrese Inicio de fecha de publicacion de colecciones en formatio YYYY-MM-DD')
# fecha_publicacion = '2020-02-03'


# colecciones = {
#     'id': [i for i in range(1,num_colecciones+1)],
#     'nombre': titulos_aleatorios(num_colecciones),
#     'fechaPublicacion': fechas(fecha_publicacion, num_colecciones),
#     'artista': random.sample(artistas['usuario'], num_colecciones),
#     'usuario': random.sample(usuarios['id'], num_colecciones),
#     'veces_vendido': np.zeros(num_colecciones, dtype=int)
# }



#TAGS

tags = {'id':[i for i in range(1,6)],
        'nombre': ['Musica', 'Videojuegos','Fotografia','Arte','PFP'],
        'descripcion':['tokens únicos que representan obras musicales, permitiendo la propiedad digital y la autenticidad en el mundo digital.',
                       'activos digitales únicos que otorgan propiedad y valor a elementos dentro de los juegos, como personajes o artículos.',
                       'imágenes digitales únicas aseguradas en blockchain, permitiendo la propiedad y autenticidad verificable.',
                       'obras digitales únicas que certifican la autenticidad y propiedad en el mundo digital mediante blockchain.',
                       'Avatares digitales únicos que representan identidades en redes sociales, juegos y comunidades en línea.']}

#NFTS


# print('--Inserte el numero de NFTS')
# numero_nfts = int(input())+1
# if numero_nfts < num_colecciones:
#     raise ValueError('Deben haber mas nfts que colecciones')

# nfts = {
#     'id': [i for i in range(num_colecciones,numero_nfts+num_colecciones+1)],
#     'nombre': titulos_aleatorios(numero_nfts),
#     'archivo': [f"https://{titulos_aleatorios(numero_nfts)[i]}.{random.choice(['es','com','uk','co','mx','gov'])}" for i in range(numero_nfts)],
#     'formatoArchivo': random.choice(['JPEG', 'PNG', 'GIFT', 'MP4', 'MP3', 'DIFF']),
#     'fechaPublicacion': fechas(fecha_publicacion, numero_nfts),
#     'calificacion': [random.randint(1, 5) for i in range(numero_nfts)],
#     'haSidoVendido': [random.choice(['T', 'F']) for i in range(numero_nfts)],
#     'enVenta': [random.choice(['T', 'F']) for i in range(numero_nfts)],
#     'tagId': [random.choice(tags['id']) for i in range(numero_nfts)],
#     'usuario': [random.choice(usuarios['id']) for i in range(numero_nfts)],
#     'artista': [random.choice(artistas['usuario']) for i in range(numero_nfts)],
#     'veces_vendidos': np.zeros(numero_nfts, dtype = int)
# }


# #ColeccionesNFT

# nft = random.sample(nfts['id'], num_colecciones)

# coleccionesNFT = {'coleccion': [random.choice(colecciones['id']) for i in range(1,num_colecciones)],
#                   'nft': [random.choice(nft) for i in range(1,num_colecciones)]}


# #Subastas

# NFT = pd.Series(nfts['enVenta']).where(pd.Series(nfts['enVenta'])=='T').dropna()

# #Se pueden vender unicamnete los NFT que se ponen en venta por el usuario
# num_subastas = random.randint(2, len(NFT))

# fechainicio = fechas(max(pd.to_datetime(colecciones['fechaPublicacion'], format='%Y-%m-%d')).strftime('%Y-%m-%d'),num_subastas-1)

# fechas_inicio = pd.to_datetime(fechainicio, format='%Y-%m-%d')
# fecha_final = [(fecha_inicio + timedelta(days=1)).strftime('%Y-%m-%d') for fecha_inicio in fechas_inicio]


# usuario1 = [random.choice(usuarios['id']) for _ in range(1,num_subastas)]
# usuario2,i = [],0

# while True:
#     usuario = random.choice(usuarios['id'])
#     if usuario not in usuario1:
#         usuario2.append(usuario)
#         i+=1
#     if i>=num_subastas-1:
#         break
# nfts_subasta = int(math.floor(num_subastas))
# subastas = {
#     'id': [i for i in range(1, num_subastas)],
#     'precioinicial': [random.lognormvariate(0.0000005, 1) for _ in range(1, num_subastas)],
#     'precioActual': [random.lognormvariate(0.000005, 1) for _ in range(1, num_subastas)],
#     'estado': [random.choice(['I', 'S', 'A', 'P', 'C']) for _ in range(1, num_subastas)],
#     'fechainicio': fechainicio,
#     'fechaFinal': fecha_final,
#     'NFT': random.sample(nfts['id'], num_subastas - 1),
#     'coleccion': ['NULL' for _ in range(1, num_subastas)],
#     'usuario1': usuario1,
#     'usuario2': usuario2
# }

#CONTRATOS INTELIGENTES

#TODA LA DATA DE CONTRATOS INTELIGENTES ES INGRESADA AUTOMATICAMENTE POR DISPARADORES
#####################################################################################PRINTS#############################################################


print('----[PoblarOK]------')
print('--[USUARIOS]----')
for i in range(len(user_name)):
    print(f"INSERT INTO usuarios VALUES ({usuarios['id'][i]}, '{usuarios['nombre'][i]}', '{usuarios['correo'][i]}', '{usuarios['billetera'][i]}',{usuarios['agg_ganancia'][i]});")

print('--[COMPRADORES]-----')

for i in range(int(math.floor(numero_de_registros/2))):
    print(f"INSERT INTO compradores VALUES ({compradores['usuario'][i]}, TO_DATE('{compradores['ultimaConexion'][i]}', 'YYYY-MM-DD HH24:MI:SS'));")

print('--[PAISES]-----')

for i in range(len(paises['id'])):
    print(f"INSERT INTO paises VALUES ('{paises['id'][i]}', '{paises['pais'][i]}');")

print('--[ARTISTAS]---')
for i in range(len(artistas['usuario'])):
    print(f"INSERT INTO artistas VALUES ({artistas['usuario'][i]}, '{artistas['nombreArtistico'][i]}', '{artistas['pais'][i]}',{artistas['aggcomision'][i]});")

# print('--[COLECCIONES]----')
# for i in range(1,num_colecciones):
#     print(f"INSERT INTO colecciones VALUES ({colecciones['id'][i]}, '{colecciones['nombre'][i]}', TO_DATE('{colecciones['fechaPublicacion'][i]}', 'YYYY-MM-DD'), {colecciones['artista'][i]}, {colecciones['usuario'][i]},{colecciones['veces_vendido'][i]});")

print('--=====[Tags]======--')
for i in range(len(tags['id'])):
   print(f"INSERT INTO tags VALUES ({tags['id'][i]}, '{tags['nombre'][i]}', '{tags['descripcion'][i]}');")

# print('----=====[NFTS]======')

# for i in range(numero_nfts):
#    print(f"INSERT INTO nfts VALUES({nfts['id'][i]}, '{nfts['nombre'][i]}', '{nfts['archivo'][i]}', '{nfts['formatoArchivo']}',TO_DATE('{nfts['fechaPublicacion'][i]}', 'YYYY-MM-DD') ,{nfts['calificacion'][i]}, '{nfts['haSidoVendido'][i]}', '{nfts['enVenta'][i]}', {nfts['tagId'][i]}, {nfts['usuario'][i]}, {nfts['artista'][i]}, {nfts['veces_vendidos'][i]});")

# print('----=====[ColeccionesNFT]======')
# for i in range(1,len(coleccionesNFT['coleccion'])):
#     print(f"INSERT INTO coleccionesNFT VALUES({coleccionesNFT['coleccion'][i]},{coleccionesNFT['nft'][i]});")

# print('--=====[SUBASTAS]======--')

# for i in range(len(subastas['id'])):
#     print(f"INSERT INTO subastas VALUES({subastas['id'][i]}, {subastas['precioinicial'][i]}, {subastas['precioActual'][i]}, '{subastas['estado'][i]}', TO_DATE('{subastas['fechainicio'][i]}', 'YYYY-MM-DD'), TO_DATE('{subastas['fechaFinal'][i]}', 'YYYY-MM-DD'), {subastas['NFT'][i]}, {'NULL' if subastas['coleccion'][i] == 'NULL' else subastas['coleccion'][i]}, {subastas['usuario1'][i]}, {subastas['usuario2'][i]});")

# print('---=======[CONTRATOS INTELIGENTES]========--')


