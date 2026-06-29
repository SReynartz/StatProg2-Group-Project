library(dplyr)

raw <- read.csv("../data/raw/verkehrsunfaelle.csv", encoding = "UTF-8", stringsAsFactors = FALSE)

clean <- raw %>%
  filter(MONAT != "Summe") %>%
  mutate(
    jahr  = JAHR,
    monat = as.integer(substr(MONAT, 5, 6)),
    wert  = WERT
  ) %>%
  filter(!is.na(wert)) %>%
  select(monatszahl = MONATSZAHL, auspraegung = AUSPRAEGUNG, jahr, monat, wert)

write.csv(clean, "../data/clean_data.csv", row.names = FALSE)

cat("Cleaned rows:", nrow(clean), "\n")
cat("Categories kept:", paste(unique(clean$monatszahl), collapse = " | "), "\n")
