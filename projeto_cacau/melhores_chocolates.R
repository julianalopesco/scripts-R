#instalando e lendo pacotes de limpeza
install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")
install.packages("ggplot2")


library(tidyverse)
library(skimr)
library(janitor)
library(dplyr)
library(tibble)
library(ggplot2)


#importando os dados
flavors_df <- read_csv("flavors_of_cacao.csv")

#visualizando o nome das colunas
colnames(flavors_df)

#alterando o nome de uma das colunas
flavors_df <- flavors_df %>%
  rename(Maker = Company...Maker.if.known.)

#criando tibble com as infos mais relevantes
trimmed_flavors_df <- flavors_df %>%
  select(Rating, Cocoa.Percent, Bean.Type)

View(trimmed_flavors_df)

#Classificação média
mean_rating <- trimmed_flavors_df %>%
  summarize(mean_rating = mean(Rating))

mean_rating$mean_rating


#Calcular desvio de padrão da variável Rating 
desvio_padrao_rating <- sd(trimmed_flavors_df$Rating)

# Exibir o resultado
desvio_padrao_rating

#Dataframe para visualizar os melhores chocolates, que sejam amargos e com rating alto
best_trimmed_flavors_df <- trimmed_flavors_df %>%
  filter(Cocoa.Percent >= '75%' & Rating >= 3.9)
View(best_trimmed_flavors_df)

#criando as visualizações
ggplot(data = best_trimmed_flavors_df) +
  geom_bar(mapping = aes(x = Rating))

#revelando os locais com as barras mais bem avaliadas
ggplot(data = best_trimmed_flavors_df) + 
  geom_bar(mapping = aes(x = Company.Location, alpha = Rating))

#criando facetas de contorno da variável cocoa.percent 
ggplot(data = best_trimmed_flavors_df) + 
  geom_bar(mapping = aes(x = Cocoa.Percent)) +
  facet_wrap(~Cocoa.Percent)

#criando um gráfico de disperção e salvando
ggplot(data = trimmed_flavors_df) + 
  geom_point(mapping = aes(x = Cocoa.Percent, y = Rating)) +
  labs(title = "Best Chocolates") +
  ggsave("chocolate.png")
