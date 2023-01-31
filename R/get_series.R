#' Obtém informações de uma série através do ID de tema
#'
#' `get_series` obtém informações de identificação de uma série específica através do ID seu tema. Uma lista completa dos IDs de temas pode ser encontrada atráves da função `get_themes`.
#'
#' @param theme_id Um número inteiro, indicando um ID único e válido de um tema disponibilizado na API.
#'
#' @return
#' `get_series` retorna um data.frame com duas variáveis:
#'
#'  id: o número identificador da série (series_id).
#'
#'  titulo: uma string com o título da série.
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
#' data <- get_series(theme_id=1)
#'
#' }
#'

get_series <- function(theme_id){

  check_input_id(theme_id)
  theme_id <- as.integer(theme_id)

  BASE_URL <- 'https://www.ipea.gov.br/atlasviolencia/api/v1/'
  url  <- paste0(BASE_URL, 'series/', theme_id)
  req <- GET(url)

  check_requisition(req)


  data_text <-content(req,as="text")
  return(fromJSON(data_text) %>% as_tibble())
}
