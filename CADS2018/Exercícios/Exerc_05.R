# Exercícios aula 05
#Nome: Ivan Ricardo Zimmermann
lista.de.pacotes = c("tidyverse","lubridate","janitor","readxl","stringr","repmis") # escreva a lista de pacotes
novos.pacotes <- lista.de.pacotes[!(lista.de.pacotes %in%
                                      installed.packages()[,"Package"])]
if(length(novos.pacotes) > 0) {install.packages(novos.pacotes)}
lapply(lista.de.pacotes, require, character.only=T)
rm(lista.de.pacotes,novos.pacotes)
gc()



# Carregue o arquivo `decisoes.rds` em um objeto chamado `decisoes`. ----


decisoes <- read_rds("C:/Users/aluno.ENAP/Desktop/decisoes.rds")
decisoes <- read_rds("~/git/aulas_ENAP/CADS2018/Exercícios/dados/decisoes.rds/decisoes.rds")


# Qual quantidade mensal de decisões por juiz?

juiz_mes <- decisoes %>% 
  mutate(mes = month(dmy(data_decisao))) %>%
  filter(!is.na(mes)) %>%
  group_by(juiz,mes) %>%
  summarise(qntde_processos=n()) %>%
  spread(mes,qntde_processos,fill = 0)

# Qual quantidade de processos porassunto?

decisoes %>% 
  select(n_processo, classe_assunto) %>% 
  separate(classe_assunto, c('classe', 'assunto'), sep = ' / ', 
           extra = 'merge', fill = 'right') %>% 
  count(assunto, sort = TRUE)

#Abri um projet aninhado (nested)
processos_nested <- readRDS("~/Exercicios_ENAP/CADS2018/Exercícios/dados/processos_nested.rds")

#Desaninhar o processos por partes

processos_partes <- processos_nested %>%
  select(n_processo, partes) %>%
  unnest(partes)

# Crie um objeto contendo informações sobre os tamanhos das bancadas dos ----


# partidos (arquivo `bancadas.rds`), suas respectivas coligações 
# eleitorais para 2018 (arquivo `coligacoes.xlsx`) e o 
# grau de concordância com a agenda do Gov 
# Temer (arquivo `governismo_temer.xlsx`). 

# Bônus: use `group_by` e `summarise` para identificar qual candidato tem a ----
# coligação com menor média de concordância e qual candidato 
# tem a maior proporção total de assentos.