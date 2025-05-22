# ===================================================
# Oefeningen werken met netwerkdata in R: Lab 3
# ===================================================

### Set up: check en stel de working directory correct in en laad de belangrijkste packages i.f.v. SNA in R
getwd()
library(sna)
library(igraph)
library(network)
library(intergraph)
install.packages("igraphdata") ### Install this specific package also: built in datasets for exercises 
library(igraphdata)

### 1. Inladen en manipuleren van de ruwe netwerkdata 
# Oefening 1: Laad de .csv bestanden 'class182_networkdata.csv' en 'class182_attributedata.csv' in en sla deze als aparte object op in R
# Oplossing:
class_182 <- ...
class_182_att <- ...

# Oefening 2: Inspecteer de ruwe data afkomstig uit 'class_matrixdata.csv': denk na over hoe we deze data structuur in een eerste stap kunnen omzetten naar een binaire matrix
# Oplossing:

... # Print de eerste 10 rijen uit
... # Print de laatste 10 rijen uit
... # Genereer een overzicht van de structuur van de data
... # Verkrijg een samenvatting van de data
... # Print de kolomnamen 
... # Print de rijmnamen 

# Oefening 3: Het is duidelijk dat de data nog niet in matrixvorm staan. Belangrijk is dat we leren om verschillende structuren om te zetten in een matrix-vorm. 
# Voor deze dataset kunnen we dit in enkele stappen bereiken. Ik toon alvast een aantal stappen. Via de hints kunnen jullie zelf aanvullen. 

# Stap 1: converteer de friend_ties kolom naar binaire vorm aangezien er nu ook waarden boven 2 zijn. Tip: gebruik de 'ifelse()' functie:
...

# Stap 2/ # Zorg dat 'ego' en 'alter' als factor met dezelfde levels zijn (voor matrixvorm)
all_ids <- sort(unique(c(class_182$ego, class_182$alter)))
class_182$ego <- factor(class_182$ego, levels = all_ids)
class_182$alter <- factor(class_182$alter, levels = all_ids)

# Stap 3: Maak een brede matrix met de pivot_wider() functie
class_182 <- class_182 %>%
  class_182 <- ... %>% # selecteer de nodige kolommen (ego, alter & friend_tie)
  ... # gebruik de pivot_wider() functie

# Stap 4: Zet de ego kolom als rijnaam en verwijder deze uit de matrix
class_182_matrix <- as.matrix(class_182[,-1])
rownames(class_182_matrix) <- class_182$ego


### 2. Inspecteren en manipuleren van matrix netwerk data
# Oefening 4: inspecteer de matrix representatie van de netwerkdata. 
# Controleer of dit nu effectief een matrix formaat is en inspecteer de basis eigenschappen zoals: 
# structuur, 
# dimensies, 
# rij-kolomnamen, 
# frequentie en verdeling van de waarden
# of de matrix symmetrisch is of niet
# of er zelfverbindingen zijn

... # Controleer of de matrix een matrix is
... # controleer de structuur van de matrix
... # controleer de dimensies van de matrix
... # controleer de rijnamen van de matrix
... # controleer de kolomnamen van de matrix
... # controleer de verdeling van de waarden van de matrix
... # controleer of de matrix symmetrisch is
... # controleer of er zelfverbindingen zijn

# Oefening 5: inspecteer en bereken de proportie van ontbrekende waarden in de 'class_182_matrix' dataset

# Aantal ontbrekende waarden in de matrix
...

# Ken de ontbrekende waarden toe aan een object
...

# Hoeveel relaties omvat onze dataset?
...

# Ken het aantal relaties toe als 'ones'
...

# Tel het aantal nullen en ken dit toe als 'zeros'
...

# Bereken de proportie NA's in de data
...

### 3. Netwerkobjecten 
# Oefening 6: Gebruik het matrix netwerk object en zet deze om naar een igraph netwerk object en noem dit 'class_182_matrix_graph'

class_182_matrix_graph <- ...
class_182_matrix_graph

# Oefening 7: Voeg nu alle attributen uit de class_182_att dataset toe aan het igraph object dat je hierboven aanmaakte
# Instellen van de node attributes 
...
class_182_matrix_graph

################################################################################
# Einde van lab 3
################################################################################