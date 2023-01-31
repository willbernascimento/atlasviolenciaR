#' Obtém informações sobre a periodicidade dos dados por ID.
#'
#' `get_periodicity` obtém informações sobre a periodicidade dos dados com base no ID da periodicidade. Use `get_periodicities` para uma lista com os IDs.
#'
#' @param periodicity_id Número inteiro com o ID de uma periodicidade específica.
#'
#' @return
#' `get_periodicity` retorna um data.frame com duas colunas:
#'
#'  id: o número identificador da periodicidade dos dados.
#'
#'  titulo: uma string com o nome da periodicidade dos dados.
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
#' data <- get_periodicity(periodicity_id=1)
#'
#' }
#'



get_periodicity <- function(periodicity_id){

  check_input_id(periodicity_id)
  periodicity_id <- as.integer(periodicity_id)


  BASE_URL <- 'https://www.ipea.gov.br/atlasviolencia/api/v1/'
  url  <- paste0(BASE_URL,'periodicidade', '/', periodicity_id)
  req <- GET(url)
  check_requisition(req)


  data_text <-content(req,as="text")

  return(fromJSON(data_text) %>% as_tibble())
}






