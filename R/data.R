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


#'   \item{formacion}{clasificación de la vegetación según sea graminosa o leñosa}
#'   \item{alturaCoberturaFormacion}{Cerrado, Muy Denso, Denso, Abierto, Muy Abierto, Ralo}
#' }
#' @source <https://recursosnaturales.lapampa.edu.ar/index2.html>
"formacion"


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
#'
#' @format :
#' \describe{
#'   \item{idDepartamento}{Identificador unico del departamento}
#'   \item{nombreDepartamento}{Nombre del departamento}
#'   \item{geomTDepartamento}{polignos}
#' }
"departamentos"
