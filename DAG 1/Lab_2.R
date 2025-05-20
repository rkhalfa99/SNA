# ===================================================
# Oefeningen intro R en RStudio: Lab 2
# ===================================================

# Benodigdheden laden
#install.packages('tidyverse') # indien nodig
library(tidyverse)  # omvat dplyr, tidyr, readr, enz.
library(dplyr)

### 1 Datatypes in R

# Oefening 1
# Doel: Bepaal/check het datatype van onderstaande objecten (let op: run eerst deze paar lijnen aan code om het datatype te checken)

x1 <- "123"
x2 <- 123
x3 <- TRUE
x4 <- 123L
x5 <- 2 + 5i
x6 <- as.raw(0x10)

# Oplossing:
...

### 2 Datastructuren in R

# Oefening 2: Maak een matrix 'm' aan met de matrix() functie en transponeer de matrix (tip: typ ??transpose om te weten te komen hoe je een matrix transponeert)
# de matrix dient 3 rijen en twee kolommen te bevatten, dus 6 waarden (1:6) (tip: gebruik het 'byrow' argument in de matrix() functie)
# Oplossing:
...

# Oefening 3: Maak een list 'l' aan met volgende elementen tekst = 'hallo', vector = 1:3, matrix = m en haal het tweede element eruit
# Oplossing:
...

# Oefening 4: voeg een rij toe aan dataframe 'df' met naam = 'Robin', leeftijd = 26 en geslach = 'M'
df <- data.frame(
  naam = c("Jan", "Els"),
  leeftijd = c(28, 34),
  geslacht = c("M", "V")
)

# Oplossing:
...


### 3 Exporteren en importeren van data

# Oefening 5: Exporteer de dataset 'mtcars' die standaard geladen is in R en exporteer deze als csv. zonder rijnamen te includeren
# Lees daarna de dataset opnieuw in en sla deze als object op met als naam 'df_mtcars' en print de eerste 5 rijen van deze dataframe
mtcars
# Oplossing:
...

### 4 Data Wrangling
# 4.1 Selectie van gegevens 

# Oefening 6: Ga verder met de 'df_mtcars' dataset en selecter auto's met een mpg van meer dan 20 en selecteer enkel de variabelen 'mpg' en 'hp'
# Let op: Zorg dat je deze nieuwe dataset opslaat onder een nieuwe naam zoals df_mtcars_1
# Oplossing:
...

# OF (er zijn grofweg twee benaderingen om dit te doen; extra punten voor wie beide oplossingen kan vinden :))

# Oplossing:
...

# 4.2 Manipulatie van kolommen 

# Oefening 7: Voeg een nieuwe kolom 'efficiëntie' toe aan de df_mtcars dataset gedefineerd als mpg / gewicht. 
# Oplossing:
...

# OF (er zijn grofweg twee benaderingen om dit te doen; extra punten voor wie beide oplossingen kan vinden :))

# Oplossing:
...

# Oefening 8: Verwijder de kolom 'gear' van de df_mtcars dataset
# Let op: Zorg dat je deze nieuwe dataset opslaat onder een nieuwe naam 
# Oplossing:
...

# OF (er zijn grofweg twee benaderingen om dit te doen; extra punten voor wie beide oplossingen kan vinden :))

# Oplossing:
...

# 4.3 Ordenen van data 

# Oefening 9:Sorteer de vijf auto's met hoogste pk-waarde (hp) in de df_mtcars dataset
# Let op: Zorg dat je deze nieuwe dataset opslaat onder een nieuwe naam 
# Oplossing:
...

# OF (er zijn grofweg twee benaderingen om dit te doen; extra punten voor wie beide oplossingen kan vinden :))

# Oplossing:
...

# Oefening 10: Bonus: Zet mpg als eerste kolom in de df_mtcars dataset
# Oplossing:
...

# OF (er zijn grofweg twee benaderingen om dit te doen; extra punten voor wie beide oplossingen kan vinden :))

# Oplossing:
...

# 4.4 Samenvoegen van datasets 

# Oefening 11: Maak twee datasets aan met behulp van de data.frame() functie en voer een 'left-join' operatie uit.
# Het eerste dataframe krijgt de naam 'df1' en omvat de kolommen 'id', gaande van 1:3 en 'naam', welke volgende elementen omvat: 'A', 'B', en 'C' 
# Het tweede dataframe krijgt de naam 'df2' en omvat de kolommen 'id', gaande van 1:3 en 'score', met als elementen (80, 90, 85) 
# Voer vervolgens een left join uit en join df1 en df2 op basis van 'id'. Let op: sla het resultaat van de left join op als apart object 'df_left'. 
# Oplossing:
...


# 4.5 Hervormen van data

# Oefening 12: Zet dataset df4 in 'breed' formaat om naar lang formaat, en terug. 
# Zorg ervoor dat in het 'lang' formaat de jaartallen aparte waarden worden in een kolom samen met de overeenkomstige scores
# Tip: de oplossing is eenvoudiger dan je denkt
df4 <- data.frame(
  naam = c("Eva", "Tom", "Lena"),
  jaar_2022 = c(75, 88, 93),
  jaar_2023 = c(82, 90, 95)
)

# Oplossing:
...


# Oefening 13: Splits een datumkolom en voeg voor- en achternaam samen. 
# Maak een dataframe aan 'df_gesplitst' op basis van het dataframe 'df_datum', waar de datum gesplitst wordt in jaar, maand en dag
# Maak vervolgens op basis van 'df_gesplitst' een dataframe 'df_samengevoegd aan met een kolom 'volledige_naam' waar voor- en achternaam samen worden gevoegd. 
# Tip: de oplossing is eenvoudiger dan je denkt
df_datum <- data.frame(
  datum = c("2023-05-12", "2024-03-08", "2024-11-20"),
  voornaam = c("Eva", "Tom", "Lena"),
  achternaam = c("Peeters", "Janssens", "De Smet")
)

# Oplossing:
...


# 4.6 Samenvatten en groeperen 

# Oefening 14: Bereken per categorie in 'df_scores' het gemiddelde, aantal observaties en standaard deviatie van de scores 
df_scores <- data.frame(
  id = 1:6,
  categorie = c("A", "A", "B", "B", "C", "C"),
  score = c(75, 82, 91, 85, 44, 63)
)

# Oplossing:
...


### 5. Functies en loops: Bonus oefeningen

# Oefening 15: Schrijf een eigen functie:
# Definieer een eigen functie 'verbruik_klasse' die voertuigen classificeert op basis van hun mpg-waarde in de 'df_mtcars' dataset: 
# - mpg < 15        => "Laag"
# - 15 ≤ mpg < 25   => "Gemiddeld"
# - mpg ≥ 25        => "Hoog"
# Tip: gebruik if, else if en else binnen de functie; gebruik vervolgens de 'sapply()' functie om de verbruik_klasse() functie toe te passen op elke rij van de df_mtcars dataset. 

# Functie
# Oplossing:
...


# Toepassen op elke rij
# Oplossing:
...


# Resultaat bekijken
# Oplossing:
...


# Oefening 16: For-loop die gemiddelden print 
# Bereken het gemiddelde van elke numerieke kolom in de 'df_mtcars dataset' met een for-loop
# Oplossing:
...


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

# Functie
# Oplossing:
...


# Toepassen van de functie
# Oplossing:
...


# Resultaat bekijken
# Oplossing:
...



################################################################################
# Einde van lab 2
################################################################################