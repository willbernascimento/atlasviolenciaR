#' Obtém informações sobre uma unidade de medida das séries da API por ID.
#'
#' `get_unit` obtém informações de identificação de uma unidade de medida das séries da API por ID.
#'
#' @return
#' `get_unit` retorna um data.frame com duas colunas:
#'
#'  id: o número identificador da unidade de medida das séries da API.
#'
#'  titulo: uma string com o nome da unidade de medida das séries da API.
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
#' data <- get_unit(unit_id=9)
#'
#' }
#'



get_unit <- function(unit_id){


  check_input_id(unit_id)
  unit_id <- as.integer(unit_id)


  BASE_URL <- 'https://www.ipea.gov.br/atlasviolencia/api/v1/'
  url  <- paste0(BASE_URL,'unidade','/', unit_id)
  req <- GET(url)

  check_requisition(req)


  data_text <-content(req,as="text")

  return(fromJSON(data_text) %>% as_tibble())
}

