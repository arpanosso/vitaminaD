library(readxl)
dados <- read_excel("data-raw/vitaminaD.xls")
dados <- dados |>
  janitor::clean_names()
View(dados)

# Análise não paramétrica (pois foram observados grande assimetria nos valores
# das variáveis contínuas), então optou-se pela abordagem não paramétrica para
# todo o grupo de variáveis estudadas.

agricolae::kruskal(dados$idade, dados$tem_tumor,
                   console = TRUE)
tapply(dados$idade, dados$tem_tumor, mean)

