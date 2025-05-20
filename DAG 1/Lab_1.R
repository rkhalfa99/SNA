# ===================================================
# Oefeningen intro R en RStudio: Lab 1
# ===================================================

### 1 De R-console en basisgedrag

# Controleer vooreerst de working directory waarin je aan het werken bent


# Oefening 1:
# Onderzoek het onderscheid tussen hoofdletters in R.
# Definieer drie objecten met de namen Data, data en DATA en ken elk een ander numeriek getal toe.
# Controleer vervolgens de inhoud van elk object.

...

# Controleer de objecten
...

### 2 Simpele wiskundige bewerkingen

# Oefening 2:
# Voer enkele wiskundige operaties uit in R.
# Interpreteer het resultaat en verifieer of het overeenkomt met je verwachting.

... ### tel twee cijfers bij elkaar op
... ### trek twee cijfers van elkaar af
... ### vermenigvuldig twee cijfers
... ### Deel twee cijfers
... ### neem de vierkantworten van een getal
... ### neem het logaritme van een getal


### 3 Objecten en naamgeving

# Oefening 3:
# Maak drie objecten aan: een numeriek object, een tekstobject, en een 'logisch' object.
# Gebruik duidelijke en correcte namen.

... ### numeriek object
... ### tekstobject (string)
... ### 'logisch object' (JUIST/FOUT)


# Print de objecten


# Oefening 4:
# Bepaal of onderstaande namen geldig en gebruikelijk zijn als objectnamen in R.
# Indien niet, geef aan waarom in de comments naast 'oplossing:'

# gemiddelde_waarde    # Oplossing: 
# gemiddelde waarde   # Oplossing: 
# .gemiddelde         # Oplossing: 
# 1gemiddelde         # Oplossing:
# mean                # Oplossing: 


### 4 Functies in R

# Oefening 5:
# Maak een vector met vier gehele getallen en noem dit object 'waarden'.
# Bereken het gemiddelde ervan met behulp van een base R-functie.

... ### Maak vetor aan
... ### bereken het gemiddelde met een base R functie 

# Oefening 6:
# Gebruik de ingebouwde helpfunctie om informatie op te zoeken over de functie mean().
# Welke extra argumenten bestaan er?


### 5 Vectoren in R

# Oefening 7:
# Maak drie vectoren van respectievelijk numerieke, karakter- en logische waarden, noem deze vectoren respectievelijk v1, v2, & v3.

... ### object met numerieke waarden
... ### object met karakter/tekst waarden
... ### object met 'logische' waarden


# Print de inhoud

# Oefening 8:
# Pas enkele elementgewijze operaties toe op vector v1.

...      # tel v1 met '1' op
...      # vermenigvuldig v1 met 2
...      # controleer de 'lengte' van het object v1

# Oefening 9:
# Selecteer specifieke elementen uit vector v1.
# Gebruik zowel indexering als logische voorwaarden.

...      # raadpleeg het tweede element uit vector v1
...      # raadpleeg het eerste en derde element uit vector v1
...      # raadpleeg alle elementen uit vector v1 die groter zijn dan 8


# Oefening 10: Gebruik logische operatoren om een subset van elementen te extraheren uit het object 'v1'.

...      # raadpleeg alle elementen uit vector v1 die groter zijn dan of gelijk aan 10 en kleiner zijn dan 15
...      # raadpleeg alle elementen uit vector v1 gelijk aan 5 OF gelijk aan 15


# Oefening 11: Sorteer een vector van scores en pas de gesorteerde volgorde toe op een corresponderende namenvector.

...      # maak een object aan genaamd 'namen' met als elementen 'Eva', 'Liam', 'Noor'
...      # maak een object aan genaamd 'scores' met als waarden 90, 85, 95
...      # maak een object aan genaamd 'index' die de volgorde van de scores weerspiegelt van laag naar hoog 
namen[index]  # Oplossing dient te zijn: "Liam" "Eva" "Noor"


### 5.1 Vectorisatie en recycling

# Oefening 12:
# Demonstreer vectorisatie en recycling door twee vectoren met ongelijke lengte op te tellen. Benoem de eerste vector als 'x' en de tweede als 'y'

...      # maak een object aan genaamd 'x' met als elementen 1, 2, 3, 4
...      # maak een object aan genaamd 'y' met als waarden 10, 20
...      # tel het object 'y' bij het object 'x' op


# Oefening 13:
# Wat gebeurt er als de lengte van de langste vector geen veelvoud is van de kortere?

...      # maak een object aan genaamd 'x' met als elementen 1, 2, 3, 4
...      # maak een object aan genaamd 'y' met als waarden 10, 20, 30, 40
...      # tel het object 'y' bij het object 'x' op


### 5.2 Omgaan met ontbrekende waarden

# Oefening 14:
# Maak een vector met een ontbrekende waarde, benoem deze als 'v'.
# Bereken het gemiddelde met en zonder het negeren van NA.

...      # maak een object aan genaamd 'v' met als elementen 5, NA, 15
...      # bereken het gemiddelde van 'v' met het negereren van NA
...      # bereken het gemiddelde van 'v' zonder het negereren van NA


### 5.3 Functies met argumenten

# Oefening 15: Gebruik de functies round(), rep(), en seq() met aangepaste argumenten.

...      # gebruik de functie round(), met daarin het base object 'pi' en zorg ervoor dat het getal wordt afgerond op drie cijfers na de komma. Gebruik ?round om de argumenten te bekijken die je kan invoeren. 
...      # gebruik de functie rep() zodat je volgende uitkomst verkrijgt: 1 2 1 2 1 2. Tip: gebruik het argument 'times'
...      # gebruik de functie seq() zodat je volgende uitkomst verkrijgt: 1.00 1.25 1.50 1.75 2.00. Tip: gebruik de argumenten 'from', 'to' & 'by'


### 6 Opslaan en laden van objecten

# Oefening 17:
# Sla twee objecten op in een RData-bestand en laad ze vervolgens opnieuw in. De twee objecten werden reeds voor je aangemaakt, je dient ze alleen nog even te 'runnen': 

a <- c(1, 2, 3)
b <- "Hallo"

...      # sla de objecten 'a' en 'b' op als een RData-bestand in jouw working directory


################################################################################
# Einde van lab 1
################################################################################


















