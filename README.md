# atlasviolenciaR: um cliente para a API do Atlas da Violência escrito em R

Este é um pacote do R que permite o consumo da API do [Atlas da Violência](https://www.ipea.gov.br/atlasviolencia/) na linguagem R.



## Como instalar

Você pode instalar a versão mais recente do pacote através do github.

```
if (!require("devtools")) install.packages("devtools")
devtools::install_github("willbernascimento/atlasviolenciaR")
```

## Como funciona e como usar

Todas as funções iniciadas com `get_*` fazem uma requisão para um *endpoint* específico e retorna um `data.frame` com os dados daquele *endpoint*. 

Os bancos de dados com as informações de fato são buscados com as funções `get_series_values` e `get_series_values_regions`. As demais funções são para buscar informações acerca das séries, principalmente, seus IDs e Títulos. Elas são necessárias para visualizar os IDs disponíveis.

Para baixar os dados da série *Taxa de óbitos em acidentes de transporte - Faixa etária de 15 - 29 anos* por UF precisamos passar o ID da série e a abrangência geográfica.


```
library(atlasviolenciaR)

get_series_values(serie_id=156,geographic_scope = 3)

```

Podemos obter a mesma série, apenas algumas regiões. Para isso, precisamos usar a função `get_series_values_regions` e passar o parâmetro `regions`.

```
get_series_values_regions(serie_id=156,geographic_scope = 2, regions=c(1,2)))

```

Com essa chamada, baixamos os dados para as regiões Norte e Nordeste. 


### Observações

 - É necessário que haja uma correspondência entre `geographic_scope` e os valores passados para `regions`. Cada valor de `geographic_scope` possui valores correspondentes específicos em `regions`. Esses valores são os códigos do IBGE no caso das Regiões, UFs e Municípios.

 - Existem séries que não possuem dados disponíveis. O resultado dessas chamadas será um `data.frame` vazio.
 

## Documentação

Para saber mais visite a [documentação](man/) das funções e os [artigos](vignettes/) disponíveis. Neles você pode encontrar mais informações sobre como usar o pacote e sobre os dados disponíveis.

Recomendamos que você inicie pelos [primeiros passos](vignettes/). Nele você pode encontrar informações sobre como usar o pacote e sobre como funciona a API do Atlas da Violência. 


## Autores

[Willber Nascimento](wwww.willbernascimento.com)


## Licença

Acesse o arquivo [LICENSE.md](LICENSE.md) no raiz do repositório.

