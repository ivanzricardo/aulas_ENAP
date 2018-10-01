#### Coleta e Análise de dados secundários
library(tidyverse)
library(magrittr)



# Exercícios Aula 01 ----

# 1. Reescreva a expressão abaixo utilizando o %>%.

round(mean(divide_by(sum(1:10),3)),digits = 1)


# 2. Sem rodar, diga qual a saída do código abaixo. Consulte o help das funções caso precise.

2 %>% 
  add(2) %>% 
  c(6, NA) %>% 
  mean(na.rm = T) %>% 
  equals(5)




