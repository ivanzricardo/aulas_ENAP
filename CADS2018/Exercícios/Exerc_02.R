#### Coleta e Análise de dados secundários
library(tidyverse)
library(magrittr)
library(lubridate)
library(stringr)

######################
# Exercícios Aula 02 #
######################

# 1.Carregue os dados rds ----




# 2.Observe os dados ----




# 3.selecione as colunas que acabam com "cisao". ----




# 4.tire as colunas de texto = 'txt_decisao' e classe/assunto = 'classe_assunto'. ----
### Dica: veja os exemplos de `?select` em `Drop variables ...`




# 5.filtre apenas casos em que `id_decisao` não é `NA` ----




# 6.filtre todas as decisões de 2018. ----
### Dica: função `lubridate::year()`




# 7.Crie uma coluna binária `drogas` que vale `TRUE` se no texto da decisão algo é falado de drogas e `FALSE` caso contrário. ----
### Dica: `str_detect`
### Obs.: Considere tanto a palavra 'droga' como seus sinônimos, 
### ou algum exemplo de droga e retire os casos em que `txt_decisao` é vazio



# 8.Quem são os cinco relatores mais prolixos? ----
### Dica: use `str_length()`
### Lembre-se da função `head()`