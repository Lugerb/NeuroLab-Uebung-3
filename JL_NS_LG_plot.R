# Code innerhalb der folgenden 2 Linien darf nicht verändert werden
# ---------------------------------------------------------------------
library(tidyverse)
d = read_csv('data/dataset_random_dot_clean.csv')
# ---------------------------------------------------------------------

# Beginnen Sie hier mit Ihrem Code:
d <- read_csv("data/clean/dataset_dot_clean.csv")
View(dataset_dot_clean)
View(d)

d10 <- d |> 
  filter(rt <= 10)
d10


ggplot(data = d10,
       mapping = aes(x = condition, 
                     y = rt, 
                     color = factor(corr))) +
  geom_jitter(width = 0.4, alpha = 0.5) +
  scale_color_manual(name = "Antwort",
                     labels = c("Falsch", "Richtig"),
                     values = c("#cb4335", "#82e0aa")) +
  geom_boxplot(width = 0.3) +
  labs(title = "Auswertung Random Dot Experiment",
       subtitle = "Gibt es einen Unterschied in den Reaktionszeiten zwischen den beiden Bedingungen
       und unterscheiden sie sich abhängig von der Korrektheit der Antworten?",
       x = "Bedingung",
       y = "Reaktionszeiten") +
  scale_x_discrete(labels = c("accuracy" = "Genauigkeit",
                              "speed" = "Geschwindigkeit")) +
  theme_minimal()








