# Exercícios aula 05
lista.de.pacotes = c("tidyverse","lubridate","janitor","readxl","stringr","repmis","janitor") # escreva a lista de pacotes
novos.pacotes <- lista.de.pacotes[!(lista.de.pacotes %in%
                                      installed.packages()[,"Package"])]
if(length(novos.pacotes) > 0) {install.packages(novos.pacotes)}
lapply(lista.de.pacotes, require, character.only=T)
rm(lista.de.pacotes,novos.pacotes)
gc()



# inner join
inner_decisoes <- decisoes %>% 
  filter(data_registro == "18/01/2018", !is.na(id_decisao)) %>% 
  select(id_decisao, n_processo)  %>%
  inner_join(
    processos %>% 
      dplyr::select(n_processo,partes))


# Right join
right_decisoes <- decisoes %>% 
  filter(data_registro == "18/01/2018", !is.na(id_decisao)) %>% 
  select(id_decisao, n_processo) %>% 
  right_join(processos %>% dplyr::select(n_processo,partes))


decisoes_selecao <- 

processos_selecao <- 

right_decisoes <- decisoes %>% 
  filter(data_registro == "18/01/2018", !is.na(id_decisao)) %>% 
  select(id_decisao, n_processo) %>%
  right_join(processos %>%  
               dplyr::select(n_processo,partes))

# Crie um objeto contendo informações sobre os tamanhos das bancadas dos ----
# partidos (arquivo `bancadas.rds`), suas respectivas coligações 
# eleitorais para 2018 (arquivo `coligacoes.xlsx`) e o 
# grau de concordância com a agenda do Gov 
# Temer (arquivo `governismo_temer.xlsx`). 
setwd("C:/Users/Aluno/Desktop/git/aulas_ENAP/CADS2018/Exercícios/dados")

#lendo arquivo bancadas
bancadas <- read_rds("bancadas.rds") 

coligacoes <- read_xlsx("coligacoes.xlsx")

governismo <- read_xlsx("governismo_temer.xlsx")


bancadas_coligacoes_governismo <- bancadas %>%
  left_join(coligacoes) %>%
  left_join(governismo)



# Bônus: use `group_by` e `summarise` para identificar qual candidato tem a ----
# coligação com menor média de concordância e qual candidato 
# tem a maior proporção total de assentos.