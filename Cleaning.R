# Load packages
pacman::p_load(tidyverse, magrittr, stringr)

# Read the data
forza = read.csv("Forza_Horizon_Cars.csv")

# Cleaning by variable
## Car_Image
forza %<>% 
  select(-Car_Image)

## Name_and_model
forza$year = word(forza$Name_and_model, 1)
forza$model_make = sub('^\\w+\\s', '', forza$Name_and_model)
forza %<>%
  select(-Name_and_model)

## Model_type
forza$Model_type = as.factor(forza$Model_type)

## In_Game_Price
forza$In_Game_Price = as.numeric(gsub(",", "", forza$In_Game_Price))

## car_source
forza$car_source = as.factor(forza$car_source)

## stock_specs
forza$stock_specs = as.factor(forza$stock_specs)

## Stock_Rating
forza$Stock_Rating = as.numeric(
  str_sub(forza$Stock_Rating, 1, nchar(forza$Stock_Rating) -2)
  )

## Drive_Type
forza$Drive_Type = as.factor(forza$Drive_Type)

## speed
forza$speed = as.numeric(forza$speed)

## handling
forza$handling = as.numeric(forza$handling)

## acceleration
forza$acceleration = as.numeric(forza$acceleration)

## launch
forza$launch = as.numeric(forza$launch)

## braking
forza$braking = as.numeric(forza$braking)

## Offroad
forza$Offroad = as.numeric(forza$Offroad)

## Top_Speed, X.0.60_Mph, X0.100_Mph, g.force, car_source_1, car_source_2
forza %<>% 
  select(-Top_Speed,
         -X0.60_Mph,
         -X0.100_Mph,
         -g.force,
         -car_source_1,
         -car_source_2)

## Horse_Power
forza$Horse_Power = as.numeric(gsub(",", "", forza$Horse_Power))

## Weight_lbs
forza$Weight_lbs = as.numeric(gsub(",", "", forza$Weight_lbs))

## year
forza$year = as.factor(forza$year)

## model_make
forza$make = word(forza$model_make, 1)
forza$model = sub('^\\w+\\s', '', forza$model_make)
forza %<>%
  select(-model_make)

# Write the clean data set to a new csv
saveRDS(forza, "Clean_Forza.rds")


