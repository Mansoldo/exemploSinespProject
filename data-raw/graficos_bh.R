library(dplyr)
library(ggplot2)

# Import of file
dados_sinesp <- readr::read_rds("data/dados_sinesp.rds")


#Obtendo a fonte
source("R/graficos.R")

# Visualization
gerar_grafico_serie(
  tab = dados_sinesp,
  municipio_nome = "Recife"
)

# Saving as image
ggsave("docs/serie_vitimas_bh.png")



