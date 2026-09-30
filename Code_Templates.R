# Code Templates

# Libraries
library(tidverse)
library(tidymodels)

# Binary Predictor
DF_NAME <- DF_NAME |>
  mutate(
    PV_NEW = if_else(PV == "TRUE", 1, 0, missing = NA_real_) # missing = NA_real_ Converts NA to numeric NA.
  )

# Single Variable
model1 <- lm(RV ~ PV, data = DF_NAME)

# Multiple Variables
model2 <- lm(RV ~ PV1 + PV2 + PV3 + PV4 + PV5, data = DF_NAME)

# Model Summary
summary(MODEL_NAME)

# LINE Assumptions
plot(MODEL_NAME, which = 1) # Residuals vs. Fitted plot
plot(MODEL_NAME, which = 2) # Q-Q plot

# Visualizations
## Scatterplot
DF_NAME |>
  ggplot(mapping = aes(x = V1, y = V2, color = CatergoricalVarible)) + # color is optional
  geom_point()+
  labs(title = "TITLE", x = "V1", y="V2", color="CatergoricalVariable")