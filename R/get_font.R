#' Obtém informações sobre uma fonte de dados das séries da API.
#'
#' `get_font` obtém informações de identificação de uma fonte dos dados das séries disponíveis na API.
#'
#' @param font_id Um número inteiro que representa um ID válido de umas das fontes de dados da API.
#'
#' @return
#' `get_font` retorna um data.frame com duas colunas:
#'
#'  id: o número identificador da fonte de dados.
#'
#'  titulo: uma string com o nome da fonte de dados.
#'
#'
#'
#' @import httr utils
#' @importFrom magrittr "%>%"
#' @importFrom tibble as_tibble
#' @importFrom jsonlite fromJSON
#' @export
#'
#' @examples
#'
#' \dontrun{
#'
#' data <- get_fonts(font_id = 5)
#'
#' }
#'



get_font <- function(font_id){

  check_input_id(font_id)
  font_id <- as.integer(font_id)


  BASE_URL <- 'https://www.ipea.gov.br/atlasviolencia/api/v1/'
  url  <- paste0(BASE_URL,'fonte','/', font_id)
  req <- GET(url)

  check_requisition(req)

  data_text  <- content(req, as="text")

  return(fromJSON(data_text) %>% as_tibble())
}
