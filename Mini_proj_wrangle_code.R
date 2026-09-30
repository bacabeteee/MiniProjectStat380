library(tidyverse)

population <- read_csv("data/raw/pop.csv") |>
  select(geo, name, population = `2025`)

life_expectancy <- read_csv("data/raw/lex.csv") |>
  select(geo, name, life_expectancy = `2025`)

sanitation_access <- read_csv("data/raw/at_least_basic_sanitation_overall_access_percent.csv") |>
  select(geo, name, sanitation_access_pct = `2024`)

murder_deaths <- read_csv("data/raw/murder_total_deaths.csv") |>
  select(geo, name, murder_total_deaths = `2023`)

food_supply <- read_csv("data/raw/food_supply_kilocalories_per_person_and_day.csv") |>
  select(geo, name, food_supply_kcal_per_person_day = `2022`)

child_deaths <- read_csv("data/raw/number_of_child_deaths.csv") |>
  select(geo, name, number_of_child_deaths = `2022`)

female_head_of_state <- read_csv("data/raw/female_hos.csv") |>
  select(geo, name, female_head_of_state = `2021`)

project1_2025 <- life_expectancy |>
  left_join(population, by = c("geo", "name")) |>
  left_join(sanitation_access, by = c("geo", "name")) |>
  left_join(murder_deaths, by = c("geo", "name")) |>
  left_join(food_supply, by = c("geo", "name")) |>
  left_join(child_deaths, by = c("geo", "name")) |>
  left_join(female_head_of_state, by = c("geo", "name"))

# Converts raw counts into population-adjusted rates so countries can be compared
# fairly regardless of their population size.
project1_2025 <- project1_2025 |>
  mutate(murder_deaths_per_100k = (murder_total_deaths / population) * 100000,
         child_deaths_per_100k = (number_of_child_deaths / population) * 100000)

project1_2025 <- project1_2025 |>
  mutate(female_hos_binary = if_else(female_head_of_state == "Had a female head of state", 1, 0, missing = NA_real_))

# Delete unnecessary columns
project1_2025 <- project1_2025 |>
  select(-murder_total_deaths, -number_of_child_deaths, -population, -female_head_of_state)

write_csv(project1_2025, "data/project1_2025_merged.csv")
