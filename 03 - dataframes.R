library(tidyverse)
#carrega a biblioteca
data(diamonds)
#carrega os dados de diamantes, nativo de R
View(diamonds)
#mostra todos os dados de diamantes
as_tibble(diamonds)
#mostra uma pequena parte dos dados

bookings_df <- read_csv("hotel_bookings.csv")
#importa um arquivo csv (que já foi feito upload)

head(bookings_df)
#mostra um resumo dos dados 