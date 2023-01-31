#' Obtém os dados de uma série por regiao geográfica buscando pelo ID da série
#'
#' `get_series_values_regions` obtém dados de uma série especifica dentro de uma região geográfica.
#'
#' @param serie_id Um número inteiro, indicando um ID único e válido de uma série disponibilizada na API. Uma lista com IDs únicos de cada série pode ser buscada atráves da função `get_series`.
#'
#' @param geographic_scope Um número inteiro que indica a abrangencia geográfica da série: `1` para País; `2` para Região; `3` para UF (Estado) e `4` para Município.
#'
#' @param regions Um número inteiro  ou um vetor de inteiros com o código do IBGE para a unidade geográfica sendo requisitada. Por exemplo, o código do IBGE para a região Nordeste é `2`.  Para municípios do Brasil é possível passar o código do IBGE para o município (3304557). É necessário que `geographic_scope` e `regions` estejam em consonância. Veja os exemplos para entendimento.
#'
#' Os códigos do IBGE para regiões, estados e municípios podem ser encontrados <https://www.ibge.gov.br/explica/codigos-dos-municipios.php>
#'
#'
#'
#'
#' @return
#' `get_series_values_regions` retorna um data.frame com quatro colunas:
#'
#'  cod: um númeo inteiro com o código do IBGE da Unidade Geográfica.
#'
#'  sigla: uma string com a abreviação do nome da Unidade Geográfica de acordo com o IBGE.
#'
#'  valor: uma coluna com o valor da série na Unidade Geográfica. Frequentemente será um valor númerico.
#'
#'  periodo: uma string com a informação acerca da data de referência para a série. Há três possibilidades de formato: YYYY-MM-DD, YYYY, YYYY-MM.
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
#' data <- get_series_values_regions(serie_id=165, geographic_scope=2, regions = 1)
#'
#' }
#'



get_series_values_regions <- function(serie_id, geographic_scope, regions){

  check_input_id(serie_id)
  check_input_id(geographic_scope)
  check_input_id(regions)

  serie_id <- as.integer(serie_id)
  geographic_scope <- as.integer(geographic_scope)
  regions <- as.integer(regions)



  BASE_URL <- 'https://www.ipea.gov.br/atlasviolencia/api/v1/'
  url  <- paste0(BASE_URL,'valores-series-por-regioes/',serie_id, '/',geographic_scope,'/', paste(regions, collapse = ','))
  req <- GET(url)

  check_requisition(req)


  data_text <-content(req,as="text")

  return(fromJSON(data_text) %>% as_tibble())
}


