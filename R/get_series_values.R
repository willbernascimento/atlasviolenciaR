#' Obtém os dados de uma série buscando pelo seu ID
#'
#' @description `get_series_values` obtém dados de uma série especificada pelo seu ID. Uma lista com IDs únicos de cada série pode ser buscada atráves da função `get_series`.
#'
#' @param serie_id Um número inteiro, indicando um ID único e válido de uma série disponibilizada na API.
#'
#' @param geographic_scope Um número inteiro que indica a abrangencia geográfica da série: `1` para País; `2` para Região; `3` para UF (Estado) e `4` para Município.
#'
#' @return
#' `get_series_values` retorna um data.frame com quatro colunas:
#'
#'  cod: um númeo inteiro com o código do IBGE da Unidade Geográfica da informação.
#'
#'  sigla: uma string com a abreviação do nome da Unidade Geográfica de acordo com o IBGE.
#'
#'  valor: uma coluna com o valor da série na Unidade Geográfica. Frequentemente será um valor númerico.
#'
#'  periodo: uma string com a informação acerca da data de referência para a série. Há três possibilidades de formato: YYYY-MM-DD, YYYY, YYYY-MM.
#'
#'
#'
#' @import httr
#' @importFrom magrittr "%>%"
#' @importFrom tibble as_tibble
#' @importFrom jsonlite fromJSON
#' @export
#'
#'
#' @examples
#' \dontrun{
#'
#' data <- get_series_values(serie_id=165, geographic_scope=3)
#'
#' }
#'


get_series_values <- function(serie_id, geographic_scope){

  check_input_id(serie_id)
  check_input_id(geographic_scope)
  serie_id <- as.integer(serie_id)
  geographic_scope <- as.integer(geographic_scope)



  BASE_URL <- 'https://www.ipea.gov.br/atlasviolencia/api/v1/'
  url  <- paste0(BASE_URL,'valores-series/',serie_id, '/',geographic_scope )
  req <- GET(url)

  check_requisition(req)


  data_text <-content(req,as="text")

  return(fromJSON(data_text) %>% as_tibble())
}

