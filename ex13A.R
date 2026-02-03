
#También sabes como sacaer la pryeccion de 1 modo y convertirla en matriz
proj <- bipartite_projection(B)
B_animals <- proj$proj1 #type==FALSE
ShP <- as.matrix(as_adjacency_matrix(B_animals,attr = "weight"))

