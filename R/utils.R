
#' Checa o tipo do input de id
#' @param x um ID específico de cada uma das funções `get_`
#'
#'
#'

check_input_id <- function(x) {

  for (i in x){

  if(is.character(i)){
    stop(sprintf('Erro: você deveria inserir um número inteiro, não um %s', class(i)))
  } else if ((i < 0) | (i %% 1 > 0)){
    stop('Erro: você deveria inserir um número inteiro positivo. Veja a lista de IDs disponíveis.')
  }

}
}



#' Checa o codigo da requisicao
#' @param response Um objeto com o retorno (resposta) de uma chamada `httr:GET`
#'
#'



check_requisition <- function(response){

  req_code <- status_code(response)

  if(req_code >= 300 & req_code < 400){
        stop(sprintf('Um erro ocorreu ao buscar essa URL. O código de erro foi %s', req_code))
      } else if(req_code >= 400 & req_code < 500){
        stop(sprintf('Um erro ocorreu ao buscar essa URL. O código de erro foi Error: %s. Este é um erro do nosso lado (cliente). Procure por issues em: https://github.com/willbernascimento/atlasviolenciaR/issues', req_code))
      } else if(req_code >= 500 & req_code < 600){
        stop(sprintf('Um erro ocorreu ao buscar essa URL. O código de erro foi Error: %s. Este é um erro no lado do servior. Procure por issues em: https://github.com/willbernascimento/atlasviolenciaR ou no próprio site da APi.', req_code))
      }
  check_content_type(response)

}

#' Checa o tipo de conteúdo da resposta da requisição
#' @param response Um objeto com o retorno (resposta) de uma chamada `httr:GET`
#'
#'


check_content_type <- function(response){
  if(httr::http_type(response) != 'application/json'){
    stop(sprintf('Resposta diferente do esperado: obtemos "%s" ao contrário. É possível que você tenha passado um ID que não seja válido. Vefique a lista de IDs válidos com as funções `get_` ou procure ajuda em https://github.com/willbernascimento/atlasviolenciaR/issues.', httr::http_type(response)))
  }
}
