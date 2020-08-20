## code to prepare `dados_sinesp` dataset goes here

##Path of file
caminho <- "data-raw/indicadoressegurancapublicamunicmar20.xlsx"

## Reading the sheet and adding to a new variable
abas <- readxl::excel_sheets(caminho)

## Organize all the sheets
dados_sinesp <- purrr::map(
  abas,
  ~readxl::read_excel(
    caminho,
    sheet = .x,
    col_types = c("text", "text", "text", "date", "numeric")
    )
)

## Generate a only base
dados_sinesp <- dplyr::bind_rows(dados_sinesp)

## Cleaning all the title
## install.packages("janitor") Installing the janitor package
dados_sinesp <- janitor::clean_names(dados_sinesp)

## Creating a new rds file
readr::write_rds(dados_sinesp, "data/dados_sinesp.rds")



