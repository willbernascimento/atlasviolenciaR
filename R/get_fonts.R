#' Obtém informações sobre as fontes de dados das séries da API.
#'
#' `get_fonts` obtém informações de identificação das fontes dos dados das séries disponíveis na API.
#'
#' @return
#' `get_fonts` retorna um data.frame com duas colunas:
#'
#'  id: o número identificador da fonte de dados.
#'
#'  titulo: uma string com o nome da fonte de dados.
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
#' data <- get_fonts()
#'
#' }
#'



get_fonts <- function(){

  BASE_URL <- 'https://www.ipea.gov.br/atlasviolencia/api/v1/'
  url  <- paste0(BASE_URL,'fontes')
  req <- GET(url)

  check_requisition(req)


  data_text <-content(req,as="text")

  return(fromJSON(data_text) %>% as_tibble())

}






