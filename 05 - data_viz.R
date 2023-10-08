hotel_bookings <- read.csv("hotel_bookings.csv")

head(hotel_bookings)

#instalando e carregando o pacote de ggplot 
install.packages('ggplot2')
library(ggplot2)

#fazendo um gráfrico de barras
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel))

#salvando o gráfico
ggsave('hotel_booking_chart.png', width=7,
       height=7)

#mostrando os tipos de hotel e segmentos de mercado:
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = hotel, fill = market_segment))

#criando uma faceta pra cada setor de mercado diferente
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = hotel)) +
  facet_wrap("market_segment")

#exibe o nome das colunas existentes no dataframe
colnames(hotel_bookings)

library(tidyverse)

#filtrando os dados 
onlineta_city_hotels <- filter(hotel_bookings, 
                               (hotel=="" & 
                                  hotel_bookings$market_segment==""))

#visualizando o filtro
View(onlineta_city_hotels)

#outra forma de filtrar
onlineta_city_hotels_v2 <- hotel_bookings %>%
  filter(hotel=="City Hotel") %>%
  filter(market_segment=="Online TA")

View(onlineta_city_hotels_v2)