#Aula 6

#Carregue os pacotes  
lista.de.pacotes = c("tidyverse","lubridate","janitor","readxl","stringr","repmis","survey","srvyr") # escreva a lista de pacotes
novos.pacotes <- lista.de.pacotes[!(lista.de.pacotes %in%
                                      installed.packages()[,"Package"])]
if(length(novos.pacotes) > 0) {install.packages(novos.pacotes)}
lapply(lista.de.pacotes, require, character.only=T)
rm(lista.de.pacotes,novos.pacotes)
gc()

decisoes <- readRDS("~/aulas_ENAP/CADS2018/Exercícios/dados/decisoes.rds")

knitr::include_graphics("CADS2018/Slides/imgs/join-venn.png")

#criar uma tabela apenas com o número do processo
processos <- decisoes %>% 
  select(id_decisao, n_processo)

processos_classe <- decisoes %>% 
   select(n_processo, classe_assunto)

#Relacionar a tabela de processos com o id_decisao
#Inner join
inner_decisoes <- processos_classe %>% 
  inner_join(processos, "n_processo")
str(inner_decisoes)

#Right join
right_decisoes <- processos_classe %>% 
  right_join(processos, "n_processo")
str(right_decisoes)

#Full join
full_decisoes <- processos_classe %>% 
  full_join(processos, "n_processo")
str(full_decisoes)

#Rodar o código direto
inner_direto <- decisoes %>% 
  filter(data_registro == "18/01/2018", !is.na(id_decisao)) %>% 
  select(id_decisao, n_processo) %>% 
  inner_join(processos, "n_processo")


#fazer o join das tabelas de partidos
join_geral <- bancadas %>%
  left_join(coligacoes, "party") %>%
  left_join(governismo_temer, "party")

#Unificar as colunas preidente e partido
bancadas_2 <- join_geral %>% 
  unite(part_pre, president, partypresid, sep="-", remove=F)

#Usando o group by
governismo_coligacao <-  join_geral %>% 
  mutate(prop=prop.table(size)) %>% 
  group_by(president, partypresid) %>% 
  summarise(prop_total=sum(prop, na.rm =T), apoio = mean(governismo, na.rm = T))

