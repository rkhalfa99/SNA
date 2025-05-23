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
# Oefening 1: Laad het 'class_182_matrix_graph' object dat we in lab 3 hebben opgeslaan terug in in de R omgeving: 
load('Data/class_182_matrix_graph.RData')
class(class_182_matrix_graph)

################################################################################
### 2 Inspectie van het netwerk
# Oefening 2: Inspecteer het 'class_182_matrix_graph' object en de centrale kenmerken van het netwerk, en beantwoord volgende vragen: 

# 1. Hoeveel nodes telt het netwerk? 
print(paste("Het netwerk omvat", nrow(as.matrix(class_182_matrix_graph)), "nodes"))

# 2. Hoeveel edges en mogelijke edges telt het netwerk? (grofweg drie mogelijke benaderingen, extra punten voor diegene die ze alle drie kunnen geven)
  # Aantal edges (base R - geen igraph object)
print(paste("Het netwerk omvat", sum(as.matrix(igraph::as_adjacency_matrix(class_182_matrix_graph, sparse = TRUE))), "edges"))

  # OF Aantal edges (igraph objects)
print(paste("Het netwerk omvat", igraph::gsize(class_182_matrix_graph), "edges"))

  # Het totaal aantal mogelijke edges (nties = sna package)
print(paste("Het netwerk omvat", sna::nties(as.matrix(igraph::as_adjacency_matrix(class_182_matrix_graph, sparse = TRUE))), " mogelijke edges"))

# 3. Gaat het om een directed of undirected netwerk? 
igraph::is_directed(class_182_matrix_graph)

# 4. Welke attributen omvat het netwerk? (zowel vertex (node) als edge attributen)
  # Vertex (node) attributen
igraph::vertex_attr_names(class_182_matrix_graph)

  # Edge attributen
igraph::edge_attr_names(class_182_matrix_graph)

# 5. Hoeveel wederkerige relaties telt het netwerk?
sum(igraph::which_mutual(class_182_matrix_graph))

### 3 Analyse op node niveau
# Oefening 3: Analyseer en genereer de volgende maten van het netwerk op node niveau: 

# 1. Degree centrality (indegree, outdegree, overall degree, alsook de gemiddelden van deze degrees)
  # In-degee, out-degree en total degree per node (handig als je dit in een dataframe kan omzetten en/of in een histogram kan gieten)

    # Bereken in-degree, out-degree en total degree
in_deg  <- igraph::degree(class_182_matrix_graph, mode = "in")
out_deg <- igraph::degree(class_182_matrix_graph, mode = "out")
tot_deg <- igraph::degree(class_182_matrix_graph) 

    # Zet de resultaten in een tabel (optioneel, maar handig)

degree_tbl <- data.frame(
  node = names(in_deg),
  indegree = in_deg,
  outdegree = out_deg,
  degree = tot_deg
)  %>% arrange(desc(degree))

print(degree_tbl)

    # Giet de resultaten in een histgram (optioneel, maar handig)

par(mfrow=c(1,3))
hist(out_deg, xlim=c(0,15), ylim=c(0,10), breaks=7,
     main="Outdegree distribution", xlab="Outdegree", col="blue")
hist(in_deg, xlim=c(0,15), ylim=c(0,10), breaks=7,
     main="Indegree distribution", xlab="Indegree", col="red")
hist(tot_deg, xlim=c(0,15), ylim=c(0,10), breaks=7,
    main="Total degree distribution", xlab="Total degree", col="lightgreen")

  # Bereken de gemiddelden van elke degree (in, out & total)
mean(in_deg)
mean(out_deg)
mean(tot_deg)

# 2. Betweenness centrality: bereken de betweenness centrality per node alsook het gemiddele: 
bet_cent <- igraph::betweenness(class_182_matrix_graph, directed = TRUE)
mean_between <- mean(bet_cent)
print(paste("De gemiddelde betweenness centrality is gelijk aan", mean_between))

# 3. Closeness centrality: bereken de closeness centrality per node alsook het gemiddelde; zowel wat betreft het 'ontvangen' als 'verspreiden' van informatie: 

  # Closeness - in: Hoe snel actor info ontvangt:
close_cent_in <- igraph::closeness(class_182_matrix_graph, mode = 'in', normalized = TRUE)
print(close_cent_in)

  # Closeness - out: Hoe snel actor info kan verspreiden:
close_cent_out <- igraph::closeness(class_182_matrix_graph, mode = 'out', normalized = TRUE)
print(close_cent_out)

  # Calculate and print mean betweenness centrality - network level properties
mean_closeness_in <- mean(close_cent_in, na.rm = TRUE) # disregard missing values
print(paste("De gemiddelde afstand naar node vanaf andere nodes is gelijk aan", mean_closeness_in))

  # Calculate and print mean betweenness centrality - network level properties
mean_closeness_out <- mean(close_cent_out, na.rm = TRUE) # disregard missing values
print(paste("De gemiddelde afstand van node naar andere nodes is gelijk aan", mean_closeness_out)) # standaard wanneer directed

# 4. Eigenvector centrality: bereken de eigenvector centrality per node alsook het gemiddelde
table(sort(igraph::eigen_centrality(class_182_matrix_graph, directed = TRUE)$vector))

# Gemiddelde: 
mean_eig_cent <- mean(igraph::eigen_centrality(class_182_matrix_graph, directed = TRUE)$vector)
print(paste("De gemiddelde eigenvectorcentraliteit van de nodes in het netwerk bedraagt", mean_eig_cent))


################################################################################
### 3 Analyse op dyad niveau

# Oefening 4: Analyseer het netwerk op dyad niveau en genereer een antwoord op de volgende vragen: 

  # 1. Hoe ziet de dyad census van dit netwerk eruit? 
class_matrix <- as.matrix(igraph::as_adjacency_matrix(class_182_matrix_graph, sparse = TRUE)) # omzetten naar matrix voor sna package
dyad_count <- sna::dyad.census(class_matrix) # Bereken de dyad census
dyad_count

  # 2. Hoe ziet de dyad census van het netwerk eruit in vergelijking met een random netwerk, wat kunnen we concluderen (tip: visualiseer)? 
net_size <- nrow(class_matrix) # grootte van het netwerk
net_dens <- sna::gden(class_matrix) # density van het netwerk
random_net <- sna::rgraph(net_size, 100, net_dens)# Genereer 100 random netwerken op basis van de size en density of het echte netwerk
dim(random_net) # Klopt de dimensie?
random_net_dens <- sna::gden(random_net) # Density van het random netwerk
random_dyad <- sna::dyad.census(random_net) # Dyad census van het random netwerk
library(vioplot)
vioplot(random_dyad[1,], random_dyad[2,], random_dyad[3,],               
        names=colnames(random_dyad)[c(1,2,3)],  
        col="transparent",                
        ylim=c(0, 400))
points(1:3,
       dyad_count[c(1,2,3)],
       col="red",
       type="b",
       pch=15)

  # 3. In welke mate zijn de relaties in dit netwerk wederzijds? 
sna::grecip(class_matrix, measure = "dyadic.nonnull") 

  # 4. In welke mate zijn nodes met hetzelfde geslacht eerder met elkaar verbonden t.o.v. nodes die verschillen naar geslacht?

    #Assortativity met gender: 
      # Gender attribuut capteren
gender <- igraph::vertex_attr(class_182_matrix_graph, "gender")

      # Voor categorische attributen gebruiken we assortativity_nominal
assortativity_gender <- igraph::assortativity_nominal(class_182_matrix_graph, types = as.factor(gender), directed = TRUE)

      # Print out
print(assortativity_gender)

################################################################################
### 4 Analyse op triad niveau

# Oefening 5: Analyseer het netwerk op triad niveau en genereer een antwoord op de volgende vragen: 

  # 1. Hoe ziet de triad census van dit netwerk eruit? 
triad_count <- sna::triad.census(class_matrix, mode = 'digraph') #directed; 'graph' voor undirected
triad_count

  # 2. Wat is de triad census die de relatie tussen actoren 2, 8 en 14 beschrijft?
sna::triad.classify(class_matrix, tri=c(2,8,14))

  # 3. Hoe ziet de triad census van het netwerk eruit in vergelijking met een random netwerk, wat kunnen we concluderen omtrent het aantal transitive triplets (tip: visualiseer)? 
net_size <- nrow(class_matrix) # grootte van het netwerk
net_dens <- sna::gden(class_matrix) # density van het netwerk
random_net <- sna::rgraph(net_size, 100, net_dens)# Genereer 100 random netwerken op basis van de size en density of het echte netwerk
dim(random_net) # Klopt de dimensie?
random_net_dens <- sna::gden(random_net)# Density van het netwerk
random_triad <- sna::triad.census(random_net, mode = 'digraph')# Triad census van het netwerk

# Vioplot: distributie van transitive triplets (030T): gesimuleerd vs echt netwerk
vioplot(random_triad[,9],                 
        names=colnames(random_triad)[9],  
        col="transparent",                
        ylim=c(0, 75))                    

points(1, triad_count[9],               
       col="red",                         
       pch=15)   

################################################################################
### 4 Analyse op tussen-niveau
# Oefening 6: Voer blockmodelling uit op het netwerk aan de hand van volgende stappen: 
  # 1. berekenen de equivalentie (let op: er bestaan verschillende cluster methoden en distance maten, gebruik hier de hamming distance)
  # Hoeveel clusters kunnen we optimaal detecteren en gebruiken in ons blockmodel? 
equiv <- sna::equiv.clust(class_matrix, cluster.method="ward.D2", method="hamming")
plot(equiv)

  # 2. Voer blockmodelling uit en plot de sociomatrix: 
bm <- sna::blockmodel(class_matrix, equiv, k=3)

# Plot 
par(mfrow = c(1, 2), mar = c(4, 4, 2, 2))  # pas marges aan indien nodig
plot.sociomatrix(class_matrix, diaglab = FALSE, cex = 0.6, main = "Origineel netwerk")
plot.sociomatrix(bm$blocked.data, diaglab = FALSE, cex = 0.6, main = "Gerhergroepeerd netwerk")

  # 3. Isoleer de bloklidmaadschappen en plot het netwerk op basis van lidmaadschap aan een 'block': 
    # isoleer de bloklidmaatschappen 
str(bm, 1)
block_members <- bm$block.membership[order(bm$order.vector)]

    # gebruik nu de gplot() functie met de correcte kleur per knoop op basis van bloklidmaatschap
block_plot <- gplot(class_matrix, vertex.col=block_members)
block_plot

  # 4. Bonus: voer opnieuw blockmodelling uit, maar deze keer op de 'main component' van het netwerk:
sna::is.connected(class_matrix, connected = 'strong')  
cfriend <- sna::component.largest(class_matrix, connected = "weak", result = "graph")
equiv_2 <- sna::equiv.clust(cfriend, cluster.method="ward.D2", method="hamming")
plot(equiv_2)

bm_2 <- sna::blockmodel(cfriend, equiv_2, k=3)
par(mfrow = c(1, 2), mar = c(4, 4, 2, 2))  # pas marges aan indien nodig
plot.sociomatrix(cfriend, diaglab = FALSE, cex = 0.6, main = "Origineel netwerk")
plot.sociomatrix(bm_2$blocked.data, diaglab = FALSE, cex = 0.6, main = "Gerhergroepeerd netwerk")

str(bm_2, 1)
block_members_2 <- bm_2$block.membership[order(bm_2$order.vector)]

block_plot_2 <- gplot(cfriend, vertex.col=block_members_2)
block_plot_2

# Oefening 7: analyseer de onderliggende structuur van het netwerk via cliques, communities en k-cores. Doe dit aan de hand van volgende stappen:
  # 1. Maak het netwerk undirected
class_und <- class_matrix + t(class_matrix ) 
class_und[class_und==2] <- 1
class_und 
gplot(class_und) 

  # 2. Analyseer of we kunnen spreken van een 'small world': 
class_graph <- igraph::graph_from_adjacency_matrix(class_matrix)
class_graph <- igraph::as_undirected(class_graph)
igraph::is_connected(class_graph)

components <- igraph::decompose(class_graph)
igraph::vcount(components[[1]])

table(sapply(components, igraph::vcount))

myLayout <- igraph::layout_with_fr(class_graph)
plot(class_graph,
     edge.color = "black",
     edge.width = 1.5,
     edge.arrow.size = 0.25,
     vertex.size = 6,
     vertex.label = "",
     layout=myLayout)

main_component <- components[[1]]
main_component_members <- as.numeric(substr(names(igraph::V(main_component)),2,3))

igraph::mean_distance(main_component) 
igraph::diameter(main_component) 
igraph::transitivity(main_component) 

  # 3. Analyseer het aantal cliques in het netwerk, inclusief het aantal maximale cliques en de verdeling van maximale cliques: 
cliques <- igraph::cliques(class_graph)
length(cliques) 

all_cliques <- igraph::cliques(class_graph)
clique_sizes <- sapply(all_cliques, length)
table(clique_sizes)

table(sapply(igraph::max_cliques(class_graph), length))

max_cliques <- igraph::max_cliques(class_graph)
length(max_cliques)
clique_sizes <- sapply(max_cliques, length)
min(clique_sizes)  
max(clique_sizes)  

  # 4. Analyseer de verdeling van k-cores in het netwerk

cores <- igraph::coreness(class_graph)
cores

plot(class_graph,
     edge.color = "black",
     edge.width = 1.5,
     edge.arrow.size = 0.25,
     vertex.size = 6,
     vertex.label = "",
     vertex.color = cores,
     layout = myLayout, 
     main = 'k-cores')

  # 5. Analyseer de verdeling van communities in het netwerk
communities <- igraph::cluster_fast_greedy(class_graph)
length(communities)

igraph::sizes(communities)
igraph::membership(communities)

par(mfrow = c(1, 1), mar = c(4, 4, 2, 2))
plot(communities, class_graph,
     edge.color = "black",
     edge.width = 1.5,
     edge.arrow.size = 0.25,
     vertex.size = 6,
     vertex.label = "",
     layout=myLayout)

################################################################################
### 5 Analyse op netwerk niveau
# Oefening 8: Maak een analyse van het netwerk op netwerk niveau en beantwoord onderstaande vragen: 
  
  # 1. Hoe groot is het netwerk? 
length(class_graph)
igraph::mean_distance(main_component) 
igraph::diameter(main_component) 

  # 2. Hoe 'dicht' is het netwerk verbonden? 
sna::gden(class_matrix, mode = 'digraph') 

  # 3. In welke mate geldt het idom 'een vriend van een vriend is ook mijn vriend'? 
igraph::transitivity(main_component) 

################################################################################
# Einde van lab 4
################################################################################






