# atlasviolenciaR: uma cliente para a API do Atlas da Violência escrito em R

Este é um pacote do R que permite o consumo da API do [Atlas da Violência](https://www.ipea.gov.br/atlasviolencia/) na linguagem R.

# Como instalar



# Como funciona e como usar

Todas as funçções iniciadas com `get_*` fazem uma requisão para um endpoint específico e retorna um `data.frame` com os dados daquele endpoint. 

Os bancos de dados com as informações de fato são buscados com as funções `get_series_values` e `get_series_values_regions`. As demais funções são para buscar informações acerca das séries, principalmente, seus IDs e Títulos.


Para baixar os dados da série *Taxa de óbitos em acidentes de transporte - Faixa etária de 15 - 29 anos* por UF precisamos passar o ID da série e a abrangência geográfica.


```
get_series_values(serie_id=56,geographic_scope = 3)

```

Podemos obter a mesma série, mas para apenas algumas regiões. Para isso, precisamos usar a função `get_series_values_regions` e passar o parâmetro `regions`.

```
get_series_values_regions(serie_id=165,geographic_scope = 2, regions=c(1,2)))

```

Com essa chamada, baixamos os dados para as regiões Norte e Nordeste. 


### OBS:

 - É necessário que haja uma correspondência entre `geographic_scope` e os valores passados para `regions`. Cada valor de `geographic_scope` possui valores correspondentes específicos em `regions`. Esses valores são os códigos do IBGE no caso das Regições, UFs e Municípios.

 - Existem séries que não possuem dados disponíveis. O resultado dessas chamadas será um `data.frame` vazio.
 

Para saber mais visite a [documentação]() e os [artigos]() disponíveis.




