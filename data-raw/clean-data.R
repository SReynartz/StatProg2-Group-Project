# Read raw traffic accidents data and cleans column names.
# Cleaned version gets saved to data/verkehrsunfaelle.csv
# Run from project root.
library(readr)

traffic_accidents_raw <- read_csv("data-raw/verkehrsunfaelle.csv")

traffic_accidents <- traffic_accidents_raw |>
  janitor::clean_names()

write_csv(traffic_accidents, "data/verkehrsunfaelle.csv")
