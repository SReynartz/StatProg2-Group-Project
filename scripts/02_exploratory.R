library(dplyr)

clean <- read.csv("../data/clean_data.csv", encoding = "UTF-8")

alkohol <- clean %>%
  filter(monatszahl == "Alkoholunfälle", auspraegung == "insgesamt") %>%
  select(jahr, monat, alkohol_wert = wert)

gesamt <- clean %>%
  filter(monatszahl == "Verkehrsunfälle", auspraegung == "insgesamt") %>%
  select(jahr, monat, gesamt_wert = wert)

merged <- inner_join(alkohol, gesamt, by = c("jahr", "monat")) %>%
  mutate(share_pct = 100 * alkohol_wert / gesamt_wert)

# Figure 1: seasonal pattern of mean alcohol-related accidents by calendar month
fig1_data <- merged %>%
  group_by(monat) %>%
  summarise(mean_alkohol = mean(alkohol_wert), .groups = "drop")

png("../outputs/figures/figure1_alcohol_seasonality.png", width = 1050, height = 675, res = 150)
plot(
  fig1_data$monat, fig1_data$mean_alkohol,
  type = "b", pch = 16, col = "steelblue", lwd = 2,
  xaxt = "n", xlab = "Month", ylab = "Mean number of alcohol-related accidents",
  main = "Figure 1: Seasonal pattern of alcohol-related accidents in Munich",
  sub = "Mean monthly count, averaged across all years"
)
axis(1, at = 1:12)
dev.off()

# Table 1: monthly average share (%) of alcohol-related accidents
table1 <- merged %>%
  group_by(monat) %>%
  summarise(
    mean_alkohol_unfaelle = round(mean(alkohol_wert), 1),
    mean_gesamt_unfaelle  = round(mean(gesamt_wert), 1),
    mean_share_pct        = round(mean(share_pct), 2),
    .groups = "drop"
  )

write.csv(table1, "../outputs/tables/table1_alcohol_share.csv", row.names = FALSE)

cat("Figure 1 saved to outputs/figures/figure1_alcohol_seasonality.png\n")
cat("Table 1:\n")
print(table1)
