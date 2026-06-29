library(dplyr)

clean <- read.csv("../data/clean_data.csv", encoding = "UTF-8")

gesamt <- clean %>%
  filter(monatszahl == "Verkehrsunfälle", auspraegung == "insgesamt") %>%
  arrange(jahr, monat) %>%
  mutate(t = row_number(), monat = factor(monat, levels = 1:12))

n_test <- 12
n <- nrow(gesamt)
train <- gesamt[1:(n - n_test), ]
test  <- gesamt[(n - n_test + 1):n, ]

model <- lm(wert ~ t + monat, data = train)

table2 <- broom::tidy(model)
write.csv(table2, "../outputs/tables/table2_regression_coefficients.csv", row.names = FALSE)

pred <- predict(model, newdata = test)
rmse <- sqrt(mean((test$wert - pred)^2))

png("../outputs/figures/figure2_predicted_vs_actual.png", width = 1050, height = 675, res = 150)
plot(
  test$t, test$wert,
  type = "b", pch = 16, col = "black", lwd = 2,
  xlab = "Time index (test period, last 12 months)", ylab = "Monthly accident count",
  main = "Figure 2: Predicted vs. actual monthly accident counts",
  sub = sprintf("Test-set RMSE = %.1f", rmse),
  ylim = range(c(test$wert, pred))
)
lines(test$t, pred, type = "b", pch = 17, col = "tomato", lwd = 2)
legend("topleft", legend = c("Actual", "Predicted"), col = c("black", "tomato"), pch = c(16, 17), lwd = 2, bty = "n")
dev.off()

cat("Test-set RMSE:", round(rmse, 1), "\n")
cat("Table 2:\n")
print(table2)
