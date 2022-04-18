# Load packages
pacman::p_load(tidyverse, magrittr, stringr, plotly)

# Read the data
forza = readRDS("Clean_Forza.rds")

# Subset out observations whose price is greater than 5 million credits
cheap = subset(forza, In_Game_Price < 5000000)

# Engineer a value variable
cheap %<>% 
  mutate(value = In_Game_Price / Stock_Rating)

# Calculate average value by make
make = cheap %>%
  group_by(make) %>% 
  summarise(mean_value = mean(value))

# Exploratory Visualizations
cheap %>% 
  ggplot(aes(x = In_Game_Price, y = Stock_Rating)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ I(x^0.25))
ggplotly()

cheap %>% 
  ggplot(aes(x = In_Game_Price, y = Horse_Power, color = stock_specs)) +
  geom_point() +
  theme_bw() +
  xlim(0, 3000001) +
  labs(x = "Price", y = "Horse Power (HP)", title = "Price vs. Horse Power") +
  theme(plot.title = element_text(hjust = 0.5))
ggplotly()

#--------------------------------------
# Modeling price
reg = lm(In_Game_Price ~ Stock_Rating + speed + handling + acceleration +
           launch + braking + Offroad + Horse_Power + Weight_lbs,
         data = cheap)
summary(reg)







