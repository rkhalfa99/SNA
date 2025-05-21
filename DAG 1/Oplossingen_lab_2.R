# ===================================================
# Oefeningen intro R en RStudio: Lab 2
# ===================================================

# Benodigdheden laden
#install.packages('tidyverse') # indien nodig
library(tidyverse)  # omvat dplyr, tidyr, readr, enz.
library(dplyr)

### 1 Datatypes in R

# Oefening 1
# Doel: Bepaal/check het datatype van verschillende objecten

x1 <- "123"
x2 <- 123
x3 <- TRUE
x4 <- 123L
x5 <- 2 + 5i
x6 <- as.raw(0x10)

# Oplossing:
class(x1)  # character
class(x2)  # numeric
class(x3)  # logical
class(x4)  # integer
class(x5)  # complex
class(x6)  # raw

### 2 Datastructuren in R

# Oefening 2: Maak een matrix 'm' aan met de matrix() functie en transponeer de matrix (tip: typ ??transpose om te weten te komen hoe je een matrix transponeert)
# de matrix dient 3 rijen en twee kolommen te bevatten (tip: gebruik het 'byrow' argument in de matrxix() functie)
??transpose 
m <- matrix(1:6, nrow = 3, byrow = TRUE)
t(m)
?matrix
# Oefening 3: Maak een list 'l' aan en haal het tweede element eruit
l <- list(tekst = "Hallo", vector = 1:3, matrix = m)
l[[2]]  # vector: 1 2 3

# Oefening 4: Maak een dataframe 'df' aan en voeg een rij toe met naam = 'Robin', leeftijd = 26 en geslach = 'M'
df <- data.frame(
  naam = c("Jan", "Els"),
  leeftijd = c(28, 34),
  geslacht = c("M", "V")
)
df <- rbind(df, data.frame(naam = "Robin", leeftijd = 26, geslacht = "M"))
df

### 3 Exporteren en importeren van data

# Oefening 5: Exporteer de dataset 'mtcars' die standaard geladen is in R en exporteer deze als csv. zonder rijnamen te includeren
# Lees daarna de dataset opnieuw in en sla deze als object op met als naam 'df_mtcars' en print de eerste 5 rijen van deze dataframe
mtcars
write.csv(mtcars, "mtcars.csv", row.names = FALSE)
df_mtcars <- read.csv("mtcars.csv")
head(df_mtcars, n = 5)

### 4 Data Wrangling
# 4.1 Selectie van gegevens 

# Oefening 6: Ga verder met de df_mtcars dataset en selecter auto's met een mpg van meer dan 20 en selecteer enkel de variabelen 'mpg' en 'hp'
# Let op: Zorg dat je deze nieuwe dataset opslaat onder een nieuwe naam 
df_mtcars_1 <- df_mtcars %>%
  filter(mpg > 20) %>%
  select(mpg, hp)

# OF

df_mtcars_1 <- df_mtcars[df_mtcars$mpg > 20, ]
df_mtcars_1 <- df_mtcars_1[, c('mpg',  'hp')]
df_mtcars_1

# 4.2 Manipulatie van kolommen 

# Oefening 7: Voeg een nieuwe kolom 'efficiëntie' toe aan de df_mtcars dataset gedefineerd als mpg / gewicht. 
df_mtcars <- df_mtcars %>%
  mutate(efficiëntie = mpg / wt)
df_mtcars

# OF

df_mtcars$efficiëntie <- df_mtcars$mpg / df_mtcars$wt

# Oefening 8: Verwijder de kolom 'gear' van de df_mtcars dataset
# Let op: Zorg dat je deze nieuwe dataset opslaat onder een nieuwe naam 
df_mtcars_2 <- df_mtcars %>% select(-gear)

# OF

df_mtcars_2 <- df_mtcars[, !(names(df_mtcars) %in% 'gear')]

# 4.3 Ordenen van data 

# Oefening 9:Sorteer de vijf auto's met hoogste pk-waarde (hp) in de df_mtcars dataset
# Let op: Zorg dat je deze nieuwe dataset opslaat onder een nieuwe naam 
df_top5_hp <- df_mtcars %>% arrange(desc(hp)) %>% head(5)

# OF

df_top5_hp <- df_mtcars[order(-df_mtcars$hp), ][1:5, ]

# Oefening 10: Bonus: Zet mpg als eerste kolom in de df_mtcars dataset
df_mtcars <- df_mtcars %>% select(mpg, everything())

# OF

df_mtcars <- df_mtcars[, c("mpg", setdiff(names(df_mtcars), "mpg"))]

# 4.4 Samenvoegen van datasets 

# Oefening 11: Maak twee datasets aan met behulp van de data.frame() functie en voer een 'left-join' operatie uit.
# Het eerste dataframe krijgt de naam 'df1' en omvat de kolommen 'id', gaande van 1:3 en 'naam', welke omvat 'A', 'B', en 'C' 
# Het tweede dataframe krijgt de naam 'df2' en omvat de kolommen 'id', gaande van 1:3 en 'score', met als elementen (80, 90, 85) 
# Voer vervolgens een left join uit en join df1 en df2 op basis van 'id'. Let op: sla het resultaat van de left join op als apart object. 
df1 <- data.frame(id = 1:3, naam = c("A", "B", "C"))
df2 <- data.frame(id = 1:3, score = c(80, 90, 85))
df_left <- left_join(df1, df2, by = "id")
df_left

# 4.5 Hervormen van data

# Oefening 12: Zet dataset df4 in 'breed' formaat om naar lang formaat, en terug. 
# Zorg ervoor dat in het 'lang' formaat de jaartallen aparte waarden worden in een kolom samen met de overeenkomstige scores
df4 <- data.frame(
  naam = c("Eva", "Tom", "Lena"),
  jaar_2022 = c(75, 88, 93),
  jaar_2023 = c(82, 90, 95)
)

df_long <- df4 %>%
  pivot_longer(cols = starts_with("jaar"), names_to = "jaar", values_to = "score")

df_breed <- df_long %>%
  pivot_wider(names_from = "jaar", values_from = "score")

df_long
df_breed

# Oefening 13: Splits een datumkolom en voeg voor- en achternaam samen. 
# Maak een dataframe aan 'df_gesplitst' op basis van het dataframe 'df_datum', waar de datum gesplitst wordt in jaar, maand en dag
# Maak vervolgens op basis van 'df_gesplitst' een dataframe 'df_samengevoegd aan met een kolom 'volledige_naam' waar voor- en achternaam samen worden gevoegd. 
df_datum <- data.frame(
  datum = c("2023-05-12", "2024-03-08", "2024-11-20"),
  voornaam = c("Eva", "Tom", "Lena"),
  achternaam = c("Peeters", "Janssens", "De Smet")
)

df_gesplitst <- df_datum %>%
  separate(col = datum, into = c("jaar", "maand", "dag"), sep = "-")

df_samengevoegd <- df_gesplitst %>%
  unite("volledige_naam", voornaam, achternaam, sep = " ")

df_gesplitst
df_samengevoegd

# 4.6 Samenvatten en groeperen 

# Oefening 14: Bereken per categorie in 'df_scores' het gemiddelde, aantal observaties en standaard deviatie van de scores 
df_scores <- data.frame(
  id = 1:6,
  categorie = c("A", "A", "B", "B", "C", "C"),
  score = c(75, 82, 91, 85, 44, 63)
)

df_scores %>%
  group_by(categorie) %>%
  summarise(
    gemiddelde = mean(score, na.rm = TRUE),
    deviatie = sd(score, na.rm = TRUE),
    aantal = n()
  )

### 5. Functies en loops: Bonus oefeningen

# Oefening 15: Schrijf een eigen functie die verbruiksklasse toekent:
# Definieer een eigen functie 'verbruik_klasse' die voertuigen classificeert op basis van hun mpg-waarde in de 'df_mtcars' dataset: 
# - mpg < 15        => "Laag"
# - 15 ≤ mpg < 25   => "Gemiddeld"
# - mpg ≥ 25        => "Hoog"
# Tip: gebruik if, else if en else binnen de functie; gebruik vervolgens de 'sapply()' functie om de verbruik_klasse() functie toe te passen op elke rij van de df_mtcars dataset. 

# Functie
verbruik_klasse <- function(mpg) {
  if (mpg < 15) {
    return("Laag")
  } else if (mpg < 25) {
    return("Gemiddeld")
  } else {
    return("Hoog")
  }
}

# Toepassen op elke rij
df_mtcars$verbruiksklasse <- sapply(df_mtcars$mpg, verbruik_klasse)

# Resultaat bekijken
head(df_mtcars[, c("mpg", "verbruiksklasse")])

# Oefening 16: For-loop die gemiddelden print 
# Bereken het gemiddelde van elke numerieke kolom in de 'df_mtcars dataset' met een for-loop

cat("\nGemiddelden per numerieke kolom:\n")
for (col in names(df_mtcars)) {
  if (is.numeric(df_mtcars[[col]])) {
    gemiddeld <- mean(df_mtcars[[col]])
    cat("Gemiddelde van", col, ":", round(gemiddeld, 2), "\n")
  }
}

# Oefening 17: Functie met loop - schaal mpg tussen 0 en 1 
# Normaliseer de 'mpg'-kolom in de df_mtcars dataset tussen 0 en 1 via min-max normalisatie met een for-loop
# Enkele hints: 
# - Schrijf een functie die één vector als input aanvaardt (mpg).
# - Gebruik min() en max() om de minimale en maximale waarde van de vector te bepalen.
# - Initialiseer een lege vector waarin je de geschaalde waarden gaat opslaan.
# - Gebruik een for-loop om elke waarde in de vector te herberekenen met:
#     (waarde - minimum) / (maximum - minimum)
# - Geef uiteindelijk de vector met geschaalde waarden terug.
# - Pas de functie toe op de kolom 'mpg' van de df_mtcars dataset.
# - Gebruik head() om de eerste rijen van de output te inspecteren.

schaal_mpg <- function(mpg_vector) {
  min_val <- min(mpg_vector)
  max_val <- max(mpg_vector)
  geschaald <- numeric(length(mpg_vector))
  
  for (i in seq_along(mpg_vector)) {
    geschaald[i] <- (mpg_vector[i] - min_val) / (max_val - min_val)
  }
  
  return(geschaald)
}

# Toepassen
df_mtcars$mpg_schaal <- schaal_mpg(df_mtcars$mpg)

# Resultaat bekijken
head(df_mtcars[, c("mpg", "mpg_schaal")])


################################################################################
# Einde van lab 2
################################################################################
