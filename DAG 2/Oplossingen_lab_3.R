# ===================================================
# Oefeningen werken met netwerkdata in R: Lab 3
# ===================================================

### Set up: check en stel de working directory correct in en laad de belangrijkste packages i.f.v. SNA in R
getwd()
library(sna)
library(igraph)
library(network)
library(intergraph)
# install.packages("igraphdata") ### Install this specific package also: built in datasets for exercises 
library(igraphdata)
library(tidyverse)

### 1. Inladen en manipuleren van de ruwe netwerkdata 
# Oefening 1: Laad de .csv bestanden 'class182_networkdata.csv' en 'class182_attributedata.csv' in en sla deze als aparte object op in R
class_182 <- read.csv('Data/class182_networkdata.csv')
class_182_att <- read.csv('Data/class182_attributedata.csv')

# Oefening 2: Inspecteer de ruwe data afkomstig uit 'class_matrixdata.csv': denk na over hoe we deze data structuur in een eerste stap kunnen omzetten naar een binaire matrix
head(class_182, n = 10) # Print de eerste 10 rijen uit
tail(class_182, n = 10) # Print de laatste 10 rijen uit
str(class_182) # Genereer een overzicht van de structuur van de data
summary(class_182) # Verkrijg een samenvatting van de data
colnames(class_182) # Print de kolomnamen 
rownames(class_182) # Print de rijmnamen 

# Oefening 3: Het is duidelijk dat de data nog niet in matrixvorm staan. Belangrijk is dat we leren om verschillende structuren om te zetten in een matrix-vorm. 
# Voor deze dataset kunnen we dit in enkele stappen bereiken. Ik toon alvast een aantal stappen. Via de hints kunnen jullie zelf aanvullen. 

# Stap 1: converteer de friend_ties kolom naar binaire vorm aangezien er nu ook waarden boven 2 zijn
class_182$friend_tie <- ifelse(class_182$friend_tie > 0, 1, 0)

# Stap 2/ # Zorg dat 'ego' en 'alter' als factor met dezelfde levels zijn (voor matrixvorm)
all_ids <- sort(unique(c(class_182$ego, class_182$alter)))
class_182$ego <- factor(class_182$ego, levels = all_ids)
class_182$alter <- factor(class_182$alter, levels = all_ids)

# Stap 3: Maak een brede matrix met de pivot_wider() functie
class_182 <- class_182 %>%
  select(ego, alter, friend_tie) %>%
  pivot_wider(names_from = alter, values_from = friend_tie, values_fill = 0)

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

is.matrix(class_182_matrix) # Controleer of de matrix een matrix is
str(class_182_matrix) # controleer de structuur van de matrix
dim(class_182_matrix) # controleer de dimensies van de matrix
rownames(class_182_matrix) # controleer de rijnamen van de matrix
colnames(class_182_matrix) # controleer de kolomnamen van de matrix
table(class_182_matrix, useNA = "ifany") # controleer de verdeling van de waarden van de matrix
isSymmetric(class_182_matrix) # controleer of de matrix symmetrisch is
any(diag(class_182_matrix) != 0) # controleer of er zelfverbindingen zijn

# Oefening 5: inspecteer en bereken de proportie van ontbrekende waarden in de matrix dataset

# Aantal ontbrekende waarden in de matrix
sum(is.na(class_182_matrix))

# Ken de ontbrekende waarden toe aan een object
missings <- sum(is.na(class_182_matrix))

# Hoeveel relaties omvat onze dataset?
sum(class_182_matrix)

# Ken dit toe als 'één'
ones <- sum(class_182_matrix, na.rm=TRUE)

# MINITASK: Hoe tellen we aantal nullen in de dataset?
zeros <- sum(class_182_matrix == 0, na.rm = TRUE)

# Op deze manier kunnen we de proportie NA's berekenen in de data
missings / (zeros + ones)

### 3. Netwerkobjecten 
# Oefening 6: Gebruik het matrix netwerk object en zet deze om naar een igraph netwerk object en noem dit 'class_182_matrix_graph'

class_182_matrix_graph <- graph_from_adjacency_matrix(adjmatrix = class_182_matrix, 
                                                mode = "directed")
class_182_matrix_graph

# Oefening 7: Voeg nu alle attributen uit de class_182_att dataset toe aan het igraph object dat je hierboven aanmaakte
# Instellen van de node attributes 
class_182_matrix_graph <- set_vertex_attr(graph = class_182_matrix_graph, 
                                    name = "gender", 
                                    value = class_182_att$gender)

class_182_matrix_graph <- set_vertex_attr(graph = class_182_matrix_graph, 
                                          name = "grade", 
                                          value = class_182_att$grade)

class_182_matrix_graph <- set_vertex_attr(graph = class_182_matrix_graph, 
                                          name = "race", 
                                          value = class_182_att$race)
class_182_matrix_graph
save(class_182_matrix_graph, file = "Data/class_182_matrix_graph.RData")

################################################################################
# Einde van lab 3
################################################################################












