% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_periodicity.R
\name{get_periodicity}
\alias{get_periodicity}
\title{Obtém informações sobre a periodicidade dos dados por ID.}
\usage{
get_periodicity(periodicity_id)
}
\arguments{
\item{periodicity_id}{Número inteiro com o ID de uma periodicidade específica.}
}
\value{
`get_periodicity` retorna um data.frame com duas colunas:

 id: o número identificador da periodicidade dos dados.

 titulo: uma string com o nome da periodicidade dos dados.
}
\description{
`get_periodicity` obtém informações sobre a periodicidade dos dados com base no ID da periodicidade. Use `get_periodicities` para uma lista com os IDs.
}
\examples{

\dontrun{

data <- get_periodicity(periodicity_id=1)

}

}
