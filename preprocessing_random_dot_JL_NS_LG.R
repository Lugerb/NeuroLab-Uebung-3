##Data Processing Pipeline
library(tidyverse)

#Daten von einer Person um zusehen, ob Funktion funktioniert
##Daten vorbereiten
library(readr)
sub001 <- read_csv("data/raw/sub-001_random_dot.csv")
View(sub001)

#nur die gültigen Experimentdaten behalten    
d_sub001 <- sub001 |> 
  filter(!is.na(test_trials.thisN)) 

#Reihen ansehen
colnames(d_sub001)

#Neue Variablen erstellen
d_sub001 <- d_sub001 |> 
  mutate(
    trial = row_number(),
    initials1 = "JL",
    initials2 = "NS",
    initials3 = "LG"
  )

colnames(d_sub001)

#Datensatz vereinfachen
d_sub001_clean <- d_sub001 |> 
  select(
    id = participant,
    trial,
    direction,
    condition = randomInstr,
    corrAns,
    resp = respDots.keys,
    corr = respDots.corr,
    rt = respDots.rt,
    initials1,
    initials2,
    initials3
  )

#Funktion erstellen
read_dot <- function(path){
  d_dot <- read.csv(path) |> 
    filter(!is.na(test_trials.thisN)) |> 
    mutate(
      trial = row_number(),
      initials1 = "JL",
      initials2 = "NS",
      initials3 = "LG"
    ) |> 
    select(
      id = participant,
      trial,
      direction,
      condition = randomInstr,
      corrAns,
      resp = respDots.keys,
      corr = respDots.corr,
      rt = respDots.rt,
      initials1,
      initials2,
      initials3)
  
  return(d_dot)
}

d_dot_fun <- read_dot(path = "data/raw/sub-001_random_dot.csv")


#Automatisiertes Einlesen
d <- list.files(path = 'data/raw', pattern = 'random_dot') %>% 
  paste('data/raw/', ., sep = '') |> 
  map_dfr(read_dot)

#Abspeichern im Ordner Clean
##File mit Initialien
d |> write.csv(file = "data/clean/dataset_dot_clean_JL_NS_LG.csv", row.names = FALSE)

##File clean
d |> write.csv(file = "data/clean/dataset_dot_clean.csv", row.names = FALSE)

glimpse(d)
