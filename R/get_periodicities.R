#' Obtém informações sobre a periodicidade dos dados.
#'
#' `get_periodicities` Obtém informações sobre a periodicidade dos dados disponíveis na API.
#'
#' @return
#' `get_periodicities` retorna um data.frame com duas colunas:
#'
#'  id: o número identificador da periodicidade das séries da API.
#'
#'  titulo: uma string com o nome da periodicidade das séries da API.
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
#' data <- get_periodicities()
#'
#' }
#'



get_periodicities <- function(){

  BASE_URL <- 'https://www.ipea.gov.br/atlasviolencia/api/v1/'
  url  <- paste0(BASE_URL,'periodicidades')
  req <- GET(url)

  check_requisition(req)


  data_text <-content(req,as="text")

  return(fromJSON(data_text) %>% as_tibble())
}

