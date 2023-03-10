% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_fonts.R
\name{get_fonts}
\alias{get_fonts}
\title{Obtém informações sobre as fontes de dados das séries da API.}
\usage{
get_fonts()
}
\value{
`get_fonts` retorna um data.frame com duas colunas:

 id: o número identificador da fonte de dados.

 titulo: uma string com o nome da fonte de dados.
}
\description{
`get_fonts` obtém informações de identificação das fontes dos dados das séries disponíveis na API.
}
\examples{

\dontrun{

data <- get_fonts()

}

}
