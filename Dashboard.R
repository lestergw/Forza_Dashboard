# Load packages
pacman::p_load(tidyverse, magrittr, stringr, plotly)

# Read the data
forza = readRDS("Clean_Forza.rds")

# Subset out observations whose price is greater than 5 million credits
cheap = subset(forza, In_Game_Price < 5000000)

# Exploratory Visualizations
cheap %>% 
  ggplot(aes(x = In_Game_Price, y = Stock_Rating)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ I(x^0.25))
ggplotly()

