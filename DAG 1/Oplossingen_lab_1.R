# ===================================================
# Oefeningen intro R en RStudio: Lab 1
# ===================================================

### 1 De R-console en basisgedrag

# Oefening 1:
# Onderzoek het onderscheid tussen hoofdletters in R.
# Definieer drie objecten met de namen Data, data en DATA en ken elk een ander numeriek getal toe.
# Controleer vervolgens de inhoud van elk object.

Data <- 5
data <- 10
DATA <- 15

# Controleer de objecten
Data   # Oplossing: 5
data   # Oplossing: 10
DATA   # Oplossing: 15

### 2 Simpele wiskundige bewerkingen

# Oefening 2:
# Voer enkele wiskundige operaties uit in R.
# Interpreteer het resultaat en verifieer of het overeenkomt met je verwachting.

3 + 7        # Oplossing: 10
12 - 4       # Oplossing: 8
6 * 9        # Oplossing: 54
20 / 5       # Oplossing: 4
sqrt(49)     # Oplossing: 7
log(1)       # Oplossing: 0


### 3 Objecten en naamgeving

# Oefening 3:
# Maak drie objecten aan: een numeriek object, een tekstobject, en een 'logisch' object.
# Gebruik duidelijke en correcte namen.

getal <- 100
tekst <- "Analyse"
logisch <- TRUE

# Print de objecten
getal     # Oplossing: 100
tekst     # Oplossing: "Analyse"
logisch   # Oplossing: TRUE

# Oefening 4:
# Bepaal of onderstaande namen geldig en gebruikelijk zijn als objectnamen in R.
# Indien niet, geef aan waarom.

# gemiddelde_waarde    # Oplossing: geldig (snake_case)
# gemiddelde waarde   # Oplossing: ongeldig (bevat spatie)
# .gemiddelde         # Oplossing: geldig (maar ongebruikelijk)
# 1gemiddelde         # Oplossing: ongeldig (mag niet starten met cijfer)
# mean                # Oplossing: technisch geldig, maar af te raden (overschrijft ingebouwde functie)


### 4 Functies in R

# Oefening 5:
# Maak een vector met vier gehele getallen en noem dit object 'waarden'.
# Bereken het gemiddelde ervan met behulp van een R-functie.

waarden <- c(2, 4, 6, 8)
mean(waarden)         # Oplossing: 5

# Oefening 6:
# Gebruik de ingebouwde helpfunctie om informatie op te zoeken over de functie mean().
# Welke extra argumenten bestaan er?

?mean
# Oplossing: Argumenten zoals trim, na.rm enz.


### 5 Vectoren in R

# Oefening 7:
# Maak drie vectoren van respectievelijk numerieke, karakter- en logische waarden, noem deze vectoren respectievelijk v1, v2, & v3.

v1 <- c(5, 10, 15)
v2 <- c("X", "Y", "Z")
v3 <- c(TRUE, FALSE, TRUE)

# Bekijk de inhoud
v1   # Oplossing: 5 10 15
v2   # Oplossing: "X" "Y" "Z"
v3   # Oplossing: TRUE FALSE TRUE

# Oefening 8:
# Pas enkele elementgewijze operaties toe op vector v1.

v1 + 1          # Oplossing: 6 11 16
v1 * 2          # Oplossing: 10 20 30
length(v1)      # Oplossing: 3

# Oefening 9:
# Selecteer specifieke elementen uit vector v1.
# Gebruik zowel indexering als logische voorwaarden.

v1[2]           # Oplossing: 10
v1[c(1, 3)]     # Oplossing: 5 15
v1[v1 > 8]      # Oplossing: 10 15

# Oefening 10: Gebruik logische operatoren om een subset van elementen te extraheren.

v1[v1 >= 10 & v1 < 15]  # Oplossing: 10
v1[v1 == 5 | v1 == 15]  # Oplossing: 5 15

# Oefening 11: Sorteer een vector van scores en pas de gesorteerde volgorde toe op een corresponderende namenvector.

namen <- c("Eva", "Liam", "Noor")
scores <- c(90, 85, 95)
index <- order(scores)

namen[index]   # Oplossing: "Liam" "Eva" "Noor"


### 5.1 Vectorisatie en recycling

# Oefening 12:
# Demonstreer vectorisatie en recycling door twee vectoren met ongelijke lengte op te tellen. Benoem de eerste vector als 'x' en de tweede als 'y'

x <- c(1, 2, 3, 4)
y <- c(10, 20)
x + y   # Oplossing: 11 22 13 24 (recycling van y)

# Oefening 13:
# Wat gebeurt er als de lengte van de langste vector geen veelvoud is van de kortere?

x <- c(1, 2, 3)
y <- c(10, 20, 30, 40)
x + y   # Oplossing: Waarschuwing + resultaat met gerecycleerde elementen


### 5.2 Omgaan met ontbrekende waarden

# Oefening 14:
# Maak een vector met een ontbrekende waarde, benoem deze als 'v'.
# Bereken het gemiddelde met en zonder het negeren van NA.

v <- c(5, NA, 15)
mean(v)                 # Oplossing: NA
mean(v, na.rm = TRUE)   # Oplossing: 10


### 5.3 Functies met argumenten

# Oefening 15: Gebruik de functies round(), rep(), en seq() met aangepaste argumenten.

round(pi, digits = 3)             # Oplossing: 3.142
rep(1:2, times = 3)               # Oplossing: 1 2 1 2 1 2
seq(from = 1, to = 2, by = 0.25)  # Oplossing: 1.00 1.25 1.50 1.75 2.00


### 6 Opslaan en laden van objecten

# Oefening 17:
# Sla twee objecten op in een RData-bestand en laad ze vervolgens opnieuw in. De twee objecten werden reeds voor je aangemaakt: 

a <- c(1, 2, 3)
b <- "Hallo"

save(a, b, file = "mijn_data.RData")

################################################################################
# Einde van lab 1
################################################################################


