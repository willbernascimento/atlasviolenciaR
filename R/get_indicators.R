#' Obtém informações sobre as unidades de medida de dados das séries da API.
#'
#' `get_indicators` obtém informações de identificação das unidades de medida dos dados das séries disponíveis na API.
#'
#' @return
#' `get_indicators` retorna um data.frame com duas colunas:
#'
#'  id: o número identificador da unidade de medida dos dados.
#'
#'  titulo: uma string com o nome da da unidade de medida dos dados.
#'
#'
#'
#' @import httr
#' @importFrom magrittr "%>%"
#' @importFrom tibble as_tibble
#' @importFrom jsonlite fromJSON
#' @export
#'
#' @examples
#'
#' \dontrun{
#'
#' data <- get_indicators()
#'
#' }
#'



get_indicators <- function(){

  BASE_URL <- 'https://www.ipea.gov.br/atlasviolencia/api/v1/'
  url  <- paste0(BASE_URL,'indicadores')
  req <- GET(url)

  check_requisition(req)


  data_text <-content(req,as="text")

  return(fromJSON(data_text) %>% as_tibble())
}






