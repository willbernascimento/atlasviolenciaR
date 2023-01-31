#' Obtém informações de um tema através do ID do tema.
#'
#' `get_theme` obtém informações de identificação de um tema disponível na API atráves de seu próprio ID. Você pode usar a função `get_themes` para buscar todos os temas e IDs disponíveis.
#'
#' @param theme_id Um número inteiro, indicando um ID único e válido de um tema disponibilizado na API.
#'
#' @return
#' `get_theme` retorna um data.frame com quatro colunas:
#'
#'  id: o número identificador do tema (theme_id).
#'
#'  titulo: uma string com o título do tema.
#'
#'  imagem: o nome da imagem do tema para uso das páginas web do Atlas da Violência.
#'
#'  tipo: um identificador do tipo. NOTA: esta coluna está completamente preenchida com zeros (0). Pode ser alguma nova característica da API para futuros desenvolvimentos.
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
#' data <- get_themes()
#'
#' }
#'



get_theme <- function(theme_id){


  check_input_id(theme_id)
  theme_id <- as.integer(theme_id)


  BASE_URL <- 'https://www.ipea.gov.br/atlasviolencia/api/v1/'
  url  <- paste0(BASE_URL,'tema/', theme_id)
  req <- GET(url)

  check_requisition(req)


  data_text <-content(req,as="text")
  return(fromJSON(data_text) %>% as_tibble())
}

