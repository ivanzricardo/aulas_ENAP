### RESPOSTAS ###

# 1. Reescreva a expressão abaixo utilizando o %>%.

round(mean(divide_by(sum(1:10),3)),digits = 1)

# R1
1:10 %>% 
  sum %>% 
  divide_by(3) %>% 
  round(digits = 1)

# 2. Reescreva o código abaixo utilizando o %>%.

set.seed(137) # semente que gera números aleatórios para reproduzi

x <- rnorm(100)
x.pos <- x[x > 0]
media <- mean(x.pos)
saida <- round(media, 2)
saida

# R2
set.seed(137)

rnorm(100) %>% 
  extract(. > 0) %>% 
  mean %>%
  round(digits = 2)

# 3. Sem rodar, diga qual a saída do código abaixo. Consulte o help das funções caso precise.

2 %>% 
  add(2) %>% 
  c(6, NA) %>% 
  mean(na.rm = T) %>% 
  equals(5)

# R3
#Primeiro, somamos 2 com 2, gerando o valor 4.
#Então colocamos esse valor em um vetor com os valores 6 e NA.
#Em seguida, tiramos a média desse vetor, desconsiderando o NA, obtendo o valor 5.
#Por fim, testemos se o valor é igual a 5, obtendo o valor TRUE.
