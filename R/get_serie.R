#' Obtém informações de uma série através do ID da série.
#'
#' `get_serie` obtém informações de identificação de uma série específica através seu proprio ID. Para ter uma ma lista completa de todas as séries disponíveis e acessar seus IDs, você pode usar a função `get_themes` e encontrar todas as informações de séries por tema. Além disso, pode usar afunção `get_series` para buscar informações sobre uma série pelo ID de seu tema.
#'
#' @param serie_id Um número inteiro, indicando um ID único e válido de uma série disponibilizado na API.
#'
#' @return
#' `get_serie` retorna um data.frame com duas variáveis:
#'
#'  id: o número identificador da série (series_id).
#'
#'  titulo: uma string com o título da série.
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
#' \dontrun{
#'
#' data <- get_serie(serie_id=1)
#'
#' }
#'

get_serie <- function(serie_id){


  check_input_id(serie_id)
  serie_id <- as.integer(serie_id)


  BASE_URL <- 'https://www.ipea.gov.br/atlasviolencia/api/v1/'
  url  <- paste0(BASE_URL, 'serie/', serie_id)
  req <- GET(url)
  check_requisition(req)


  data_text <-content(req,as="text")

  return(fromJSON(data_text) %>% as_tibble())
}
