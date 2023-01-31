#' Obtém informações de uma série através do ID da série.
#'
#' `get_themes` obtém informações de identificação das séries disponíveis na API por tipo de tema.
#'
#' @return
#' `get_themes` retorna um data.frame com seis colunas:
#'
#'  id: o número identificador do tema (theme_id).
#'
#'  titulo: uma string com o título do tema.
#'
#'  tema_id: um identificador do tema. NOTA: esta coluna está completamente preenchida com zeros (0). Pode ser alguma nova característica da API para futuros desenvolvimentos.
#'
#'  imagem: o nome da imagem do tema para uso das páginas web do Atlas da Violência.
#'
#'  tipo: um identificador do tipo. NOTA: esta coluna está completamente preenchida com zeros (0). Pode ser alguma nova característica da API para futuros desenvolvimentos.
#'
#'  subTemas: indica os subtemas, quando houver. NOTA: esta coluna está completamente preenchida com zeros (0). Pode ser alguma nova característica da API para futuros desenvolvimentos.
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
#' data <- get_themes()
#'
#' }
#'



get_themes <- function(){


  BASE_URL <- 'https://www.ipea.gov.br/atlasviolencia/api/v1/'
  url  <- paste0(BASE_URL,'temas')
  req <- GET(url)
  check_requisition(req)


  data_text <-content(req,as="text")

  return(fromJSON(data_text) %>% as_tibble())
}

