library(dplyr)
library(gapminder)


masterGAP <- read.csv("gapminder_2025.csv")
lexGAP <- read.csv("lex.csv")
femHOSGAP <- read.csv("female_hos.csv")
cdGAP <- read.csv("number_of_child_deaths.csv")
foodGAP <- read.csv("food_supply_kilocalories_per_person_and_day.csv")
murderGAP <- read.csv("murder_total_deaths.csv")
sanitationGAP <- read.csv("at_least_basic_sanitation_overall_access_percent.csv")

femHOSGAP <- femHOSGAP |> 
  select(geo, X2021) |>
 rename(fem2021 = X2021)

cdGAP <- cdGAP |> 
  select(geo, X2022) |>
rename(cd2022 = X2022)

foodGAP <- foodGAP |> 
  select(geo, X2022) |>
rename(food2022 = X2022)

murderGAP <- murderGAP |> 
  select(geo, X2023)
rename(murder2023 = X2023)

sanitationGAP <- sanitationGAP |> 
  select(geo, X2024)
rename(sanitation2024 = X2024)



masterGAP <- masterGAP |>
  left_join(femHOSGAP, by = "geo")

masterGAP <- masterGAP |>
  left_join(cdGAP, by = "geo")

masterGAP <- masterGAP |>
  left_join(foodGAP, by = "geo")

masterGAP <- masterGAP |>
  left_join(murderGAP, by = "geo")

masterGAP <- masterGAP |>
  left_join(sanitationGAP, by = "geo")

df <- df |> 
  rename(id = emp_id, name = emp_name, department = dept)


