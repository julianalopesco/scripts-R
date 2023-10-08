install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")
#pacotes de limpeza


library(tidyverse)
library(skimr)
library(janitor)


bookings_df <- read_csv("hotel_bookings.csv")
#carrega os dados

head(bookings_df)
#exibe resumo dos dados

str(bookings_df)
glimpse(bookings_df)
#traz uma visão detalhada do dataframe 

colnames(bookings_df)
#mostra o nome das colunas 

skim_without_charts(bookings_df)
#resumo detalhado dos dados 

trimmed_df <- bookings_df %>% 
  select(hotel, is_canceled, lead_time)
#novodata frame com as colunas hotel, is_canceled, lead_time

View(trimmed_df)

trimmed_df %>% 
  select(hotel, is_canceled, lead_time) %>% 
  rename(hotel_type = hotel)
#renomeando variável 

example_df <- bookings_df %>%
  select(arrival_date_year, arrival_date_month) %>% 
  unite(arrival_month_year, c("arrival_date_month", "arrival_date_year"), sep = " ")
#unindo colunas

example_df <- bookings_df %>%
  mutate(guests = adults + children + babies)

head(example_df)
#criando uma nova coluna

example_df <- bookings_df %>%
  summarize(number_canceled = sum(is_canceled),
            average_lead_time = mean(lead_time))

view(example_df)

head(example_df)
#calculando estatísticas. Total de cancelamentos e a média de antecedência de reserva

