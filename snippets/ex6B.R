#read and load network to graph
P_Filename<-"./Data/Medan_Rio_Blanco.csv"
df <- read.csv(P_Filename, row.names = 1)
I <- as.matrix(df)
B <- graph_from_biadjacency_matrix(t(I))

#1) number of plants and pollinators
#plants are stored in rows and polliantor sin collumns
Np <- nrow(I)
Na <- ncol(I)
cat(sprintf("There are %d plant species and %d pollinator species\n", Np, Na))

#if from the graph, one can do 
tt<-table(V(B)$type)
Np <- as.numeric(tt["TRUE"])
Na <- as.numeric(tt["FALSE"])

#2) most generalist pollinator
polls <- V(B)[type == FALSE]
kA <- igraph::degree(B, v= polls)
Pgen=polls$name[kA==max(kA)]
cat(sprintf("Most generalist pollinator is %s\n", Pgen))

#3)plants with degree 1
plants <- V(B)[type == TRUE]
kP <- igraph::degree(B, v= plants)
specialized_plants<-plants$name[kP == 1]
NP_s=length((specialized_plants))
cat(sprintf("There are %d plant species with only one mutualistic partner\n", NP_s))


#4) shared pollinators between generalist plants
#All the shared pollinators
Aproj <- igraph::bipartite_projection(B, which = "true", multiplicity = TRUE)
M <- igraph::as_adjacency_matrix(Aproj, attr = "weight", sparse = FALSE)
top2 <- plants$name[order(kP, decreasing = TRUE)][1:2]
shared_p <- M[top2[1], top2[2]]
cat(sprintf("The two most specialized plants share %d pollinators\n", shared_p))
