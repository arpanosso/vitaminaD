
<!-- README.md is generated from README.Rmd. Please edit that file -->

## Entrada dos dados

``` r
library(readxl)
dados <- read_excel("data-raw/vitaminaD.xls")
#> New names:
#> * Animal -> Animal...1
#> * Animal -> Animal...2
dados <- dados |>
  janitor::clean_names()
View(dados)
```

Análise não paramétrica (pois foram observados grande assimetria nos
valores das variáveis contínuas), então optou-se pela abordagem não
paramétrica para todo o grupo de variáveis estudadas.

``` r
agricolae::kruskal(dados$idade, dados$tem_tumor,
                   console = TRUE)
#> 
#> Study: dados$idade ~ dados$tem_tumor
#> Kruskal-Wallis test's
#> Ties or no Ties
#> 
#> Critical Value: 12.92765
#> Degrees of freedom: 1
#> Pvalue Chisq  : 0.0003237636 
#> 
#> dados$tem_tumor,  means of the ranks
#> 
#>   dados.idade  r
#> 1   17.272727 11
#> 2    7.166667 12
#> 
#> Post Hoc Analysis
#> 
#> t-Student: 2.079614
#> Alpha    : 0.05
#> Groups according to probability of treatment differences and alpha level.
#> 
#> Treatments with the same letter are not significantly different.
#> 
#>   dados$idade groups
#> 1   17.272727      a
#> 2    7.166667      b
tapply(dados$idade, dados$tem_tumor, mean)
#>        1        2 
#> 9.492727 4.153333
```
