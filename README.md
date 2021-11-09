
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
```

Análise não paramétrica (pois foram observados grande assimetria nos
valores das variáveis contínuas), então optou-se pela abordagem não
paramétrica para todo o grupo de variáveis estudadas.

``` r
da <- dados |> 
  dplyr::select(
    percent_gordura,
    idade,
    peso,
    vit_d,
    bmc_massa_mineral_ossea
  )
```

``` r
for(i in 1:length(da)){
  print(names(da[i]))
  y <- da[,i]
  print(agricolae::kruskal(y, dados$tem_tumor,
                     console = TRUE))
}
#> [1] "percent_gordura"
#> 
#> Study: y ~ dados$tem_tumor
#> Kruskal-Wallis test's
#> Ties or no Ties
#> 
#> Critical Value: 0.4583333
#> Degrees of freedom: 1
#> Pvalue Chisq  : 0.4984039 
#> 
#> dados$tem_tumor,  means of the ranks
#> 
#>          y  r
#> 1 13.00000 11
#> 2 11.08333 12
#> 
#> Post Hoc Analysis
#> 
#> t-Student: 2.079614
#> Alpha    : 0.05
#> Groups according to probability of treatment differences and alpha level.
#> 
#> Treatments with the same letter are not significantly different.
#> 
#>          y groups
#> 1 13.00000      a
#> 2 11.08333      a
#> $statistics
#>       Chisq Df   p.chisq
#>   0.4583333  1 0.4984039
#> 
#> $parameters
#>             test p.ajusted          name.t ntr alpha
#>   Kruskal-Wallis      none dados$tem_tumor   2  0.05
#> 
#> $means
#>          y     rank      std  r  Min  Max   Q25   Q50    Q75
#> 1 37.50545 13.00000 9.210273 11 22.6 57.9 32.43 37.86 40.250
#> 2 33.98000 11.08333 7.811558 12 22.8 47.7 25.70 35.55 39.025
#> 
#> $comparison
#> NULL
#> 
#> $groups
#>          y groups
#> 1 13.00000      a
#> 2 11.08333      a
#> 
#> attr(,"class")
#> [1] "group"
#> [1] "idade"
#> 
#> Study: y ~ dados$tem_tumor
#> Kruskal-Wallis test's
#> Ties or no Ties
#> 
#> Critical Value: 12.92765
#> Degrees of freedom: 1
#> Pvalue Chisq  : 0.0003237636 
#> 
#> dados$tem_tumor,  means of the ranks
#> 
#>           y  r
#> 1 17.272727 11
#> 2  7.166667 12
#> 
#> Post Hoc Analysis
#> 
#> t-Student: 2.079614
#> Alpha    : 0.05
#> Groups according to probability of treatment differences and alpha level.
#> 
#> Treatments with the same letter are not significantly different.
#> 
#>           y groups
#> 1 17.272727      a
#> 2  7.166667      b
#> $statistics
#>      Chisq Df      p.chisq
#>   12.92765  1 0.0003237636
#> 
#> $parameters
#>             test p.ajusted          name.t ntr alpha
#>   Kruskal-Wallis      none dados$tem_tumor   2  0.05
#> 
#> $means
#>          y      rank      std  r  Min Max    Q25 Q50  Q75
#> 1 9.492727 17.272727 2.341491 11 7.00  14 7.2100   9 11.0
#> 2 4.153333  7.166667 2.606957 12 0.92   9 2.2075   4  5.5
#> 
#> $comparison
#> NULL
#> 
#> $groups
#>           y groups
#> 1 17.272727      a
#> 2  7.166667      b
#> 
#> attr(,"class")
#> [1] "group"
#> [1] "peso"
#> 
#> Study: y ~ dados$tem_tumor
#> Kruskal-Wallis test's
#> Ties or no Ties
#> 
#> Critical Value: 0.5014425
#> Degrees of freedom: 1
#> Pvalue Chisq  : 0.478867 
#> 
#> dados$tem_tumor,  means of the ranks
#> 
#>          y  r
#> 1 10.95455 11
#> 2 12.95833 12
#> 
#> Post Hoc Analysis
#> 
#> t-Student: 2.079614
#> Alpha    : 0.05
#> Groups according to probability of treatment differences and alpha level.
#> 
#> Treatments with the same letter are not significantly different.
#> 
#>          y groups
#> 2 12.95833      a
#> 1 10.95455      a
#> $statistics
#>       Chisq Df  p.chisq
#>   0.5014425  1 0.478867
#> 
#> $parameters
#>             test p.ajusted          name.t ntr alpha
#>   Kruskal-Wallis      none dados$tem_tumor   2  0.05
#> 
#> $means
#>        y     rank      std  r Min  Max Q25  Q50    Q75
#> 1 13.000 10.95455 11.46124 11 4.3 40.0 6.2  7.6 14.800
#> 2 16.625 12.95833 11.38125 12 4.3 37.2 6.1 13.9 24.925
#> 
#> $comparison
#> NULL
#> 
#> $groups
#>          y groups
#> 2 12.95833      a
#> 1 10.95455      a
#> 
#> attr(,"class")
#> [1] "group"
#> [1] "vit_d"
#> 
#> Study: y ~ dados$tem_tumor
#> Kruskal-Wallis test's
#> Ties or no Ties
#> 
#> Critical Value: 5.469697
#> Degrees of freedom: 1
#> Pvalue Chisq  : 0.01934898 
#> 
#> dados$tem_tumor,  means of the ranks
#> 
#>           y  r
#> 1  8.545455 11
#> 2 15.166667 12
#> 
#> Post Hoc Analysis
#> 
#> t-Student: 2.079614
#> Alpha    : 0.05
#> Groups according to probability of treatment differences and alpha level.
#> 
#> Treatments with the same letter are not significantly different.
#> 
#>           y groups
#> 2 15.166667      a
#> 1  8.545455      b
#> $statistics
#>      Chisq Df    p.chisq
#>   5.469697  1 0.01934898
#> 
#> $parameters
#>             test p.ajusted          name.t ntr alpha
#>   Kruskal-Wallis      none dados$tem_tumor   2  0.05
#> 
#> $means
#>          y      rank      std  r  Min   Max    Q25   Q50  Q75
#> 1 37.64545  8.545455 18.47714 11  6.3  68.1 27.950 33.50 46.6
#> 2 65.35000 15.166667 25.76592 12 21.4 104.8 51.325 56.25 91.8
#> 
#> $comparison
#> NULL
#> 
#> $groups
#>           y groups
#> 2 15.166667      a
#> 1  8.545455      b
#> 
#> attr(,"class")
#> [1] "group"
#> [1] "bmc_massa_mineral_ossea"
#> 
#> Study: y ~ dados$tem_tumor
#> Kruskal-Wallis test's
#> Ties or no Ties
#> 
#> Critical Value: 3.409091
#> Degrees of freedom: 1
#> Pvalue Chisq  : 0.06483816 
#> 
#> dados$tem_tumor,  means of the ranks
#> 
#>           y  r
#> 1  9.272727 11
#> 2 14.500000 12
#> 
#> Post Hoc Analysis
#> 
#> t-Student: 2.079614
#> Alpha    : 0.05
#> Groups according to probability of treatment differences and alpha level.
#> 
#> Treatments with the same letter are not significantly different.
#> 
#>           y groups
#> 2 14.500000      a
#> 1  9.272727      a
#> $statistics
#>      Chisq Df    p.chisq
#>   3.409091  1 0.06483816
#> 
#> $parameters
#>             test p.ajusted          name.t ntr alpha
#>   Kruskal-Wallis      none dados$tem_tumor   2  0.05
#> 
#> $means
#>          y      rank      std  r      Min      Max      Q25      Q50      Q75
#> 1 405.3606  9.272727 281.0529 11 149.3333 1080.000 241.1667 328.3333  437.000
#> 2 673.9769 14.500000 341.8839 12 195.3333 1175.667 471.0833 612.5833 1008.917
#> 
#> $comparison
#> NULL
#> 
#> $groups
#>           y groups
#> 2 14.500000      a
#> 1  9.272727      a
#> 
#> attr(,"class")
#> [1] "group"
```
