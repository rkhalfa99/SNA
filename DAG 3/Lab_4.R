# ===================================================
# Oefeningen basis SNA in R: Lab 4
# ===================================================

### Set up: check en stel de working directory correct in en laad de belangrijkste packages i.f.v. SNA in R
getwd()
library(sna)
library(igraph)
library(network)
library(intergraph)
#install.packages("igraphdata") ### Install this specific package also: built in datasets for exercises 
library(igraphdata)

### 1 Inladen en manipuleren van de ruwe netwerkdata 
# Oefening 1: Laad het 'class_182_matrix_graph' object dat we in lab 3 hebben opgeslaan terug in in de R omgeving (tip: gebruik de 'load()' functie): 
# Oplossing
...

################################################################################
### 2 Inspectie van het netwerk
# Oefening 2: Inspecteer het 'class_182_matrix_graph' object en de centrale kenmerken van het netwerk, en beantwoord volgende vragen: 

# 1. Hoeveel nodes telt het netwerk? 
# Oplossing
...

# 2. Hoeveel edges en mogelijke edges telt het netwerk? (grofweg drie mogelijke benaderingen, extra punten voor diegenen die ze alle drie kunnen geven)
# Aantal edges (base R - geen igraph object)
# Oplossing
...

# OF Aantal edges (igraph objects)
# Oplossing
...

# Het totaal aantal mogelijke edges 
# Oplossing
...

# 3. Gaat het om een directed of undirected netwerk? 
# Oplossing
...

# 4. Welke attributen omvat het netwerk? (zowel vertex (node) als edge attributen)
# Vertex (node) attributen
# Oplossing
...

# Edge attributen
# Oplossing
...

# 5. Hoeveel wederkerige relaties telt het netwerk?
# Oplossing
...

### 3 Analyse op node niveau
# Oefening 3: Analyseer en genereer de volgende maten van het netwerk op node niveau: 

# 1. Degree centrality (indegree, outdegree, overall degree, alsook de gemiddelden van deze degrees)
# In-degee, out-degree en total degree per node (handig als je dit in een dataframe kan omzetten en/of in een histogram kan gieten)

# Bereken in-degree, out-degree en total degree
# Oplossing
...

# Zet de resultaten in een tabel (optioneel, maar handig)
# Oplossing
...

# Giet de resultaten in een histgram (optioneel, maar handig)
# Oplossing
...

# Bereken de gemiddelden van elke degree maat (in, out & total)
# Oplossing
...

# 2. Betweenness centrality: bereken de betweenness centrality per node alsook het gemiddele: 
# Oplossing
...

# 3. Closeness centrality: bereken de closeness centrality per node alsook het gemiddelde; zowel wat betreft het 'ontvangen' als 'verspreiden' van informatie: 

# Closeness - in: Hoe snel actor info ontvangt:
# Oplossing
...

# Closeness - out: Hoe snel actor info kan verspreiden:
# Oplossing
...

# Gemiddelde closeness centrality (in) - network level properties
# Oplossing
...

# Gemiddelde closeness centrality (out) - network level properties
# Oplossing
...

# 4. Eigenvector centrality: bereken de eigenvector centrality per node alsook het gemiddelde
# Oplossing
...

# Gemiddelde: 
# Oplossing
...


################################################################################
### 3 Analyse op dyad niveau

# Oefening 4: Analyseer het netwerk op dyad niveau en genereer een antwoord op de volgende vragen: 

# 1. Hoe ziet de dyad census van dit netwerk eruit? 
# Oplossing
...

# 2. Hoe ziet de dyad census van het netwerk eruit in vergelijking met een random netwerk, wat kunnen we concluderen (tip: visualiseer)? 
# Oplossing
...

# 3. In welke mate zijn de relaties in dit netwerk wederzijds? 
# Oplossing
... 

# 4. In welke mate zijn nodes met hetzelfde geslacht eerder met elkaar verbonden t.o.v. nodes die verschillen naar geslacht?
# Oplossing
...

################################################################################
### 4 Analyse op triad niveau

# Oefening 5: Analyseer het netwerk op triad niveau en genereer een antwoord op de volgende vragen: 

# 1. Hoe ziet de triad census van dit netwerk eruit? 
# Oplossing
...

# 2. Wat is de triad census die de relatie tussen actoren 2, 8 en 14 beschrijft?
# Oplossing
...

# 3. Hoe ziet de triad census van het netwerk eruit in vergelijking met een random netwerk, wat kunnen we concluderen omtrent het aantal transitive triplets (tip: visualiseer)? 
# Oplossing
...

################################################################################
### 4 Analyse op tussen-niveau
# Oefening 6: Voer blockmodelling uit op het netwerk aan de hand van volgende stappen: 
# 1. berekenen de equivalentie (let op: er bestaan verschillende cluster methoden en distance maten)
# Hoeveel clusters kunnen we optimaal detecteren en gebruiken in ons blockmodel? 
# Oplossing
...

# 2. Voer blockmodelling uit en plot de sociomatrix: 
# Oplossing
...

# 3. Isoleer de bloklidmaadschappen en plot het netwerk op basis van lidmaadschap aan een 'block': 
# Oplossing
...

# 4. Bonus: voer opnieuw blockmodelling uit, maar deze keer op de 'main component' van het netwerk:
# Oplossing
...

# Oefening 7: analyseer de onderliggende structuur van het netwerk via cliques, communities en k-cores. Doe dit aan de hand van volgende stappen:
# 1. Maak het netwerk undirected
# Oplossing
...

# 2. Analyseer of we kunnen spreken van een 'small world': 
# Oplossing
...

# 3. Analyseer het aantal cliques in het netwerk, inclusief het aantal maximale cliques en de verdeling van maximale cliques: 
# Oplossing
...

# 4. Analyseer de verdeling van k-cores in het netwerk
# Oplossing
...

# 5. Analyseer de verdeling van communities in het netwerk
# Oplossing
...

################################################################################
### 5 Analyse op netwerk niveau
# Oefening 8: Maak een analyse van het netwerk op netwerk niveau en beantwoord onderstaande vragen: 

# 1. Hoe groot is het netwerk? 
# Oplossing
...

# 2. Hoe 'dicht' is het netwerk verbonden? 
# Oplossing
...

# 3. In welke mate geldt het idom 'een vriend van een vriend is ook mijn vriend'? 
# Oplossing
...

################################################################################
# Einde van lab 4
################################################################################