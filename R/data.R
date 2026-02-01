#' Inventario de la flora presente en los censos
#'
#' Los datos corresponden a más de 300 censos de vegetación
#' realizados durante 1975 a 1979, utilizados para la caracterización
#' de los recursos naturales de la Provincia de La Pampa.
#'
#' @format ## `inventario_flora`
#' Conjunto de datos con 7699 filas y 11 columnas:
#' \describe{
#'   \item{idInventario}{Identificador único}
#'   \item{descripcionCobertura}{valore +, -1, 1, 1 - 2, 2, 2 - 3, 3, 3 - 4, 4}
#'   \item{porcentajeCobertura}{valores 2.50, 5.00, 7.50, 12.50, 17.50, 25.00, 37.50, 50.00, 62.50}
#'   \item{estrato}{cada uno de los niveles en que pueden ordenarse las especies de una comunidad en el plano vertical.}
#'   \item{nombreCientificoEspecie}{nombre cientifico de la especie relevada en el censo}
#'   \item{especie}{unidad básica de la clasificación biológica. Conjunto de organismos (poblaciones) naturales capaces de entrecruzarse y de producir descendencia fértil.}
#'   \item{tipoBiologico}{tipo biologico de la especia, valores C, Cactacea, Enredadera, F, G, H, P}
#'   \item{preferencia}{preferencia de la especie, valores Intermedia, No preferida, Preferida}
#'   \item{estacionalidad}{estacionalidad de la especie, valores Invernal, Primavero-estival}
#'   \item{grupoFuncional}{grupo funcional de la especie, valores Herbácea, Leñosa}
#'   \item{ciclo}{ciclo de la especie, valores Anual, Perenne}
#' }
#' @source <https://recursosnaturales.lapampa.edu.ar/index2.html>
"inventario_flora"

#' Informacion sobre los censos
#'
#' Los datos corresponden a más de 300 censos de vegetación
#' realizados durante 1975 a 1979, utilizados para la caracterización
#' de los recursos naturales de la Provincia de La Pampa.
#'
#' @format ## `inventario_vegetal`
#' Conjunto de datos con 351 filas y 10 columnas:
#' \describe{
#'   \item{idInventario}{Identificador único}
#'   \item{censo}{Numero de la planilla en papel correspondiente al censo}
#'   \item{comunidad}{nivel de organización natural que incluye todas las poblaciones de especies diferentes de un área dada y en un tiempo dado, las interacciones entre ellas y con el ambiente}
#'   \item{lugarInventario}{descripcion del lugar donde se realizo el censo}
#'   \item{relieveInventario}{conjunto de irregularidades que presenta la superficie terrestre}
#'   \item{sueloInventario}{}
#'   \item{fechaInventario}{fecha en que se realizo el censo}
#'   \item{idDepartamento}{identificador unico del departamento de La Pampa}
#'   \item{tipoComunidad}{}
#'   \item{observador}{profesionales que realizaron el censo a campo}
#' }
#' @source <https://recursosnaturales.lapampa.edu.ar/index2.html>
"inventario_vegetal"

#' Informacion sobre la formacion relevada en los censos.
#'
#' Los datos corresponden a más de 300 censos de vegetación
#' realizados durante 1975 a 1979, utilizados para la caracterización
#' de los recursos naturales de la Provincia de La Pampa.
#'
#' @format ## `formacion`
#' Conjunto de datos con 907 filas y 3 columnas:
#' \describe{
#'   \item{idInventario}{Identificador único}
#'   \item{formacion}{clasificación de la vegetación según sea graminosa o leñosa}
#'   \item{alturaCoberturaFormacion}{Cerrado, Muy Denso, Denso, Abierto, Muy Abierto, Ralo}
#' }
#' @source <https://recursosnaturales.lapampa.edu.ar/index2.html>
"formacion"

#' Informacion sobre la fisonomia relevada en los censos.
#'
#' Los datos corresponden a más de 300 censos de vegetación
#' realizados durante 1975 a 1979, utilizados para la caracterización
#' de los recursos naturales de la Provincia de La Pampa.
#'
#' @format ## `fisonomia`
#' Conjunto de datos con 338 filas y 4 columnas:
#' \describe{
#'   \item{idInventario}{Identificador único}
#'   \item{fisonomia}{aspecto y rasgos (fisonómicos) y físicos visualmente evidenciables de las comunidades vegetales}
#'   \item{alturaCoberturaFisonomia}{Cerrado, Muy Denso, Denso, Abierto, Muy Abierto, Ralo}
#'   \item{Observacion}{Notas sobre el censo}
#' }
#' @source <https://recursosnaturales.lapampa.edu.ar/index2.html>
"fisonomia"


#' Departamentos de La Pampa
#'
#' Divisiones politicas departamentales de La Pampa en formato geografico de poligonos.
#'
#' @format ## `departamentos`
#' Un conjunto de datos con 22 filas y 3 variables:
#' \describe{
#'   \item{idDepartamento}{Identificador unico del departamento}
#'   \item{nombreDepartamento}{Nombre del departamento}
#'   \item{geomTDepartamento}{poligonos}
#' }
"departamentos"

#' Localizacion geografica de los censos
#'
#' Latitud y longitud con la ubicacion geografica de los censos de campo.
#'
#' @format ## `localizacion_censos`
#' Un conjunto de datos con 423 filas y 2 variables:
#' \describe{
#'   \item{censo}{Identificado unico del censo}
#'   \item{geometry}{localizacion de los censos en formato de puntos}
#' }
"localizacion_censos"

#' Aeropuertos de La Pampa
#'
#' Datos geográficos de aeropuertos en la Provincia de La Pampa.
#'
#' @format ## `aeropuertos_la_pampa`
#' Un conjunto de datos geográfico con 2 filas y 5 variables:
#' \describe{
#'   \item{ID}{Identificador del aeropuerto}
#'   \item{Nombre}{Nombre del aeropuerto}
#'   \item{Telefono}{Número de teléfono de contacto}
#'   \item{Direccion}{Dirección del aeropuerto}
#'   \item{geometry}{Geometría de tipo punto con la ubicación del aeropuerto}
#' }
#' @source Roberto, Zinda; Martínez Uncal, María Celeste. Bases para el Ordenamiento Territorial. 
#' Publicación Técnica N° 87. ISSN 0325-2132. Mayo 2012. Ediciones INTA.
#' Descargado de GeoINTA con licencia CC-BY.
"aeropuertos_la_pampa"

#' Cuencas hídricas de La Pampa
#'
#' Datos geográficos de las cuencas hídricas de la Provincia de La Pampa.
#'
#' @format ## `cuencas_hidricas_la_pampa`
#' Un conjunto de datos geográfico con 6 filas y 6 variables:
#' \describe{
#'   \item{FID_cuenca}{Identificador de la cuenca}
#'   \item{NOMBRE}{Nombre de la cuenca hídrica}
#'   \item{PROVINCIA}{Provincia}
#'   \item{SISTEMA}{Sistema hídrico al que pertenece}
#'   \item{SUPERFICIE}{Superficie de la cuenca}
#'   \item{geometry}{Geometría de tipo polígono con el área de la cuenca}
#' }
#' @source Roberto, Zinda; Martínez Uncal, María Celeste. Bases para el Ordenamiento Territorial. 
#' Publicación Técnica N° 87. ISSN 0325-2132. Mayo 2012. Ediciones INTA.
#' Descargado de GeoINTA con licencia CC-BY.
"cuencas_hidricas_la_pampa"

#' Cursos de agua de La Pampa
#'
#' Datos geográficos de los cursos de agua en la Provincia de La Pampa.
#'
#' @format ## `cursos_de_agua_la_pampa`
#' Un conjunto de datos geográfico con 1099 filas y 5 variables:
#' \describe{
#'   \item{TIPO}{Tipo de curso de agua}
#'   \item{NOMBRE}{Nombre del curso de agua}
#'   \item{REGIMEN}{Régimen hídrico}
#'   \item{Longitud}{Longitud del curso}
#'   \item{geometry}{Geometría de tipo línea con el trazado del curso de agua}
#' }
#' @source Roberto, Zinda; Martínez Uncal, María Celeste. Bases para el Ordenamiento Territorial. 
#' Publicación Técnica N° 87. ISSN 0325-2132. Mayo 2012. Ediciones INTA.
#' Descargado de GeoINTA con licencia CC-BY.
"cursos_de_agua_la_pampa"

#' Ejidos municipales de La Pampa
#'
#' Datos geográficos de los ejidos municipales de la Provincia de La Pampa con información 
#' agropecuaria y ganadera.
#'
#' @format ## `ejidos_municipales_la_pampa`
#' Un conjunto de datos geográfico con 79 filas y 46 variables:
#' \describe{
#'   \item{Microregio}{Microrregión}
#'   \item{Ejido}{Nombre del ejido municipal}
#'   \item{Num_Ejido}{Número del ejido}
#'   \item{Superficie}{Superficie del ejido}
#'   \item{VERD_INV}{Verdeos de invierno (ha)}
#'   \item{PASTURAS}{Pasturas (ha)}
#'   \item{MONTE}{Monte (ha)}
#'   \item{CAMPONAT}{Campo natural (ha)}
#'   \item{AGRICULT}{Agricultura (ha)}
#'   \item{RASTROJO}{Rastrojos (ha)}
#'   \item{TRIGO_HA}{Trigo - hectáreas}
#'   \item{TRIGO_QQ}{Trigo - quintales}
#'   \item{MAIZ_HA}{Maíz - hectáreas}
#'   \item{MAIZ_QQ}{Maíz - quintales}
#'   \item{GIRAS_HA}{Girasol - hectáreas}
#'   \item{GIRAS_QQ}{Girasol - quintales}
#'   \item{SOJA_HA}{Soja - hectáreas}
#'   \item{SOJA_QQ}{Soja - quintales}
#'   \item{BOVINO}{Total bovinos}
#'   \item{VACAS}{Vacas}
#'   \item{VAQUILLO}{Vaquillonas}
#'   \item{TERNEROS}{Terneros}
#'   \item{TERNERAS}{Terneras}
#'   \item{NOVILLIT}{Novillitos}
#'   \item{NOVILLOS}{Novillos}
#'   \item{TORITOS}{Toritos}
#'   \item{TOROS}{Toros}
#'   \item{OVINOS}{Total ovinos}
#'   \item{OVEJAS}{Ovejas}
#'   \item{CORDEROS}{Corderos}
#'   \item{CORDERAS}{Corderas}
#'   \item{BORREGOS}{Borregos}
#'   \item{BORREGAS}{Borregas}
#'   \item{CAPONES}{Capones}
#'   \item{CARNEROS}{Carneros}
#'   \item{PORCINOS}{Total porcinos}
#'   \item{CERDAS}{Cerdas}
#'   \item{LECHONES}{Lechones}
#'   \item{CACHORRO}{Cachorros}
#'   \item{CAPONESP}{Capones porcinos}
#'   \item{PADRILLO}{Padrillos}
#'   \item{CAPRINOS}{Total caprinos}
#'   \item{MADRES}{Madres}
#'   \item{CHIVITOS}{Chivitos}
#'   \item{CASTRONE}{Castrones}
#'   \item{Ind_Especi}{Índice de especialización}
#'   \item{geometry}{Geometría de tipo polígono con el área del ejido}
#' }
#' @source Roberto, Zinda; Martínez Uncal, María Celeste. Bases para el Ordenamiento Territorial. 
#' Publicación Técnica N° 87. ISSN 0325-2132. Mayo 2012. Ediciones INTA.
#' Descargado de GeoINTA con licencia CC-BY.
"ejidos_municipales_la_pampa"

#' Espejos de agua de La Pampa
#'
#' Datos geográficos de los espejos de agua en la Provincia de La Pampa.
#'
#' @format ## `espejos_de_agua_la_pampa_v2`
#' Un conjunto de datos geográfico con 1086 filas y 5 variables:
#' \describe{
#'   \item{TIPO}{Tipo de espejo de agua}
#'   \item{NOMBRE}{Nombre del espejo de agua}
#'   \item{REGIMEN}{Régimen hídrico}
#'   \item{Superficie}{Superficie del espejo de agua}
#'   \item{geometry}{Geometría de tipo polígono con el área del espejo de agua}
#' }
#' @source Roberto, Zinda; Martínez Uncal, María Celeste. Bases para el Ordenamiento Territorial. 
#' Publicación Técnica N° 87. ISSN 0325-2132. Mayo 2012. Ediciones INTA.
#' Descargado de GeoINTA con licencia CC-BY.
"espejos_de_agua_la_pampa_v2"

#' Ferrocarriles de La Pampa
#'
#' Datos geográficos de las líneas ferroviarias en la Provincia de La Pampa.
#'
#' @format ## `ferrocarriles_la_pampa`
#' Un conjunto de datos geográfico con 41 filas y 6 variables:
#' \describe{
#'   \item{NOMBRE}{Nombre de la línea ferroviaria}
#'   \item{TROCHA}{Tipo de trocha}
#'   \item{HOJA}{Hoja cartográfica}
#'   \item{Estado}{Estado de la línea}
#'   \item{Tipo}{Tipo de línea}
#'   \item{geometry}{Geometría de tipo línea con el trazado del ferrocarril}
#' }
#' @source Roberto, Zinda; Martínez Uncal, María Celeste. Bases para el Ordenamiento Territorial. 
#' Publicación Técnica N° 87. ISSN 0325-2132. Mayo 2012. Ediciones INTA.
#' Descargado de GeoINTA con licencia CC-BY.
"ferrocarriles_la_pampa"

#' Fisonomía de la vegetación 2008 de La Pampa
#'
#' Datos geográficos de la fisonomía de la vegetación en la Provincia de La Pampa según 
#' clasificación LCCS (Land Cover Classification System) del año 2008.
#'
#' @format ## `fisonomia_2008_la_pampa_v2`
#' Un conjunto de datos geográfico con 1276 filas y 4 variables:
#' \describe{
#'   \item{LCCS_COD3}{Código LCCS de clasificación de cobertura del suelo}
#'   \item{categoria}{Categoría de fisonomía}
#'   \item{Superficie}{Superficie del área}
#'   \item{geometry}{Geometría de tipo polígono}
#' }
#' @source Roberto, Zinda; Martínez Uncal, María Celeste. Bases para el Ordenamiento Territorial. 
#' Publicación Técnica N° 87. ISSN 0325-2132. Mayo 2012. Ediciones INTA.
#' Descargado de GeoINTA con licencia CC-BY.
"fisonomia_2008_la_pampa_v2"

#' Microregiones de La Pampa
#'
#' Datos geográficos de las microregiones de la Provincia de La Pampa con información 
#' agropecuaria y ganadera.
#'
#' @format ## `microregion_la_pampa`
#' Un conjunto de datos geográfico con 10 filas y 43 variables:
#' \describe{
#'   \item{Microregio}{Nombre de la microrregión}
#'   \item{Superficie}{Superficie de la microrregión}
#'   \item{VERD_INV}{Verdeos de invierno (ha)}
#'   \item{PASTURAS}{Pasturas (ha)}
#'   \item{MONTE}{Monte (ha)}
#'   \item{CAMPONAT}{Campo natural (ha)}
#'   \item{AGRICULT}{Agricultura (ha)}
#'   \item{RASTROJO}{Rastrojos (ha)}
#'   \item{TRIGO_HA}{Trigo - hectáreas}
#'   \item{TRIGO_QQ}{Trigo - quintales}
#'   \item{MAIZ_HA}{Maíz - hectáreas}
#'   \item{MAIZ_QQ}{Maíz - quintales}
#'   \item{GIRAS_HA}{Girasol - hectáreas}
#'   \item{GIRAS_QQ}{Girasol - quintales}
#'   \item{SOJA_HA}{Soja - hectáreas}
#'   \item{SOJA_QQ}{Soja - quintales}
#'   \item{BOVINO}{Total bovinos}
#'   \item{VACAS}{Vacas}
#'   \item{VAQUILLO}{Vaquillonas}
#'   \item{TERNEROS}{Terneros}
#'   \item{TERNERAS}{Terneras}
#'   \item{NOVILLIT}{Novillitos}
#'   \item{NOVILLOS}{Novillos}
#'   \item{TORITOS}{Toritos}
#'   \item{TOROS}{Toros}
#'   \item{OVINOS}{Total ovinos}
#'   \item{OVEJAS}{Ovejas}
#'   \item{CORDEROS}{Corderos}
#'   \item{CORDERAS}{Corderas}
#'   \item{BORREGOS}{Borregos}
#'   \item{BORREGAS}{Borregas}
#'   \item{CAPONES}{Capones}
#'   \item{CARNEROS}{Carneros}
#'   \item{PORCINOS}{Total porcinos}
#'   \item{CERDAS}{Cerdas}
#'   \item{LECHONES}{Lechones}
#'   \item{CACHORRO}{Cachorros}
#'   \item{CAPONESP}{Capones porcinos}
#'   \item{PADRILLO}{Padrillos}
#'   \item{CAPRINOS}{Total caprinos}
#'   \item{MADRES}{Madres}
#'   \item{CHIVITOS}{Chivitos}
#'   \item{CASTRONE}{Castrones}
#'   \item{geometry}{Geometría de tipo polígono con el área de la microrregión}
#' }
#' @source Roberto, Zinda; Martínez Uncal, María Celeste. Bases para el Ordenamiento Territorial. 
#' Publicación Técnica N° 87. ISSN 0325-2132. Mayo 2012. Ediciones INTA.
#' Descargado de GeoINTA con licencia CC-BY.
"microregion_la_pampa"

#' Regiones geomorfológicas de La Pampa
#'
#' Datos geográficos de las regiones geomorfológicas de la Provincia de La Pampa.
#'
#' @format ## `regiones_geomorfologicas_la_pampa_v2`
#' Un conjunto de datos geográfico con 18 filas y 9 variables:
#' \describe{
#'   \item{ID}{Identificador de la región}
#'   \item{SUBREGION}{Nombre de la subregión geomorfológica}
#'   \item{Superficie}{Superficie de la región}
#'   \item{ALTIMETRIA}{Características altimétricas}
#'   \item{RELIEVE}{Tipo de relieve}
#'   \item{LITOLOGIA}{Características litológicas}
#'   \item{DRENAJE}{Características del drenaje}
#'   \item{SECTORIZ}{Sectorización}
#'   \item{geometry}{Geometría de tipo polígono con el área de la región}
#' }
#' @source Roberto, Zinda; Martínez Uncal, María Celeste. Bases para el Ordenamiento Territorial. 
#' Publicación Técnica N° 87. ISSN 0325-2132. Mayo 2012. Ediciones INTA.
#' Descargado de GeoINTA con licencia CC-BY.
"regiones_geomorfologicas_la_pampa_v2"

#' Regiones hídricas de La Pampa
#'
#' Datos geográficos de las regiones hídricas de la Provincia de La Pampa.
#'
#' @format ## `regiones_hidricas_la_pampa`
#' Un conjunto de datos geográfico con 13 filas y 4 variables:
#' \describe{
#'   \item{NOMBRE}{Nombre de la región hídrica}
#'   \item{CODIGO}{Código de la región}
#'   \item{Superficie}{Superficie de la región}
#'   \item{geometry}{Geometría de tipo polígono con el área de la región}
#' }
#' @source Roberto, Zinda; Martínez Uncal, María Celeste. Bases para el Ordenamiento Territorial. 
#' Publicación Técnica N° 87. ISSN 0325-2132. Mayo 2012. Ediciones INTA.
#' Descargado de GeoINTA con licencia CC-BY.
"regiones_hidricas_la_pampa"

#' Suelos de La Pampa
#'
#' Datos geográficos de los suelos de la Provincia de La Pampa con clasificación taxonómica.
#'
#' @format ## `suelos_la_pampa`
#' Un conjunto de datos geográfico con 261 filas y 30 variables:
#' \describe{
#'   \item{ID_CARTO}{Identificador cartográfico}
#'   \item{Cod_RRNN}{Código de recursos naturales}
#'   \item{Cod_Atlas}{Código del atlas}
#'   \item{Superficie}{Superficie del área}
#'   \item{PROVINCIA}{Provincia}
#'   \item{SIMB_TAXO}{Símbolo taxonómico}
#'   \item{SIMB_ORD}{Símbolo del orden}
#'   \item{TIPO_UC}{Tipo de unidad cartográfica}
#'   \item{PAISAJE}{Tipo de paisaje}
#'   \item{REGION_IP}{Región del índice de productividad}
#'   \item{ZONA_IP}{Zona del índice de productividad}
#'   \item{IP_CARTO}{Índice de productividad cartográfico}
#'   \item{USDA_CAR}{Clasificación USDA cartográfica}
#'   \item{SUB_USDA}{Sub-clasificación USDA}
#'   \item{LIM1_CAR}{Limitación 1 cartográfica}
#'   \item{LIM2_CAR}{Limitación 2 cartográfica}
#'   \item{LIM3_CAR}{Limitación 3 cartográfica}
#'   \item{NRO_COMP}{Número de componente}
#'   \item{PAISAJE2}{Paisaje secundario}
#'   \item{TAXON_1}{Taxón 1}
#'   \item{FAMILIA_1}{Familia 1}
#'   \item{FASE_1}{Fase 1}
#'   \item{TAXON_2}{Taxón 2}
#'   \item{FAMILIA_2}{Familia 2}
#'   \item{FASE_2}{Fase 2}
#'   \item{TAXON_3}{Taxón 3}
#'   \item{FAMILIA_3}{Familia 3}
#'   \item{FASE_3}{Fase 3}
#'   \item{Orden}{Orden del suelo}
#'   \item{geometry}{Geometría de tipo polígono con el área}
#' }
#' @source Roberto, Zinda; Martínez Uncal, María Celeste. Bases para el Ordenamiento Territorial. 
#' Publicación Técnica N° 87. ISSN 0325-2132. Mayo 2012. Ediciones INTA.
#' Descargado de GeoINTA con licencia CC-BY.
"suelos_la_pampa"

#' Vegetación de recursos naturales de La Pampa
#'
#' Datos geográficos de la vegetación de la Provincia de La Pampa.
#'
#' @format ## `vegetacion_rn_la_pampa_v2`
#' Un conjunto de datos geográfico con 336 filas y 5 variables:
#' \describe{
#'   \item{VEGETACION}{Tipo de vegetación}
#'   \item{Superficie}{Superficie del área}
#'   \item{FISONOMIAS}{Fisonomías presentes}
#'   \item{CARACTERIS}{Características de la vegetación}
#'   \item{geometry}{Geometría de tipo polígono con el área}
#' }
#' @source Roberto, Zinda; Martínez Uncal, María Celeste. Bases para el Ordenamiento Territorial. 
#' Publicación Técnica N° 87. ISSN 0325-2132. Mayo 2012. Ediciones INTA.
#' Descargado de GeoINTA con licencia CC-BY.
"vegetacion_rn_la_pampa_v2"

utils::globalVariables(c(
  "inventario_vegetal",
  "inventario_flora",
  "nombreCientificoEspecie",
  "especie",
  "estrato",
  "porcentajeCobertura",
  "estacionalidad",
  "idInventario",
  "n"
))
