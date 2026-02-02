Q_rnd2 <- numeric(Nrand)
N_rnd2 <- numeric(Nrand)

for (i in seq_len(Nrand)) {
  print(i)
  # 1) randomize the matrix (preserve row/col sums)
    Np<-nrow(I)
    Na<-ncol(I)
    B <- graph_from_biadjacency_matrix(t(I))
    L <- igraph::ecount(B)   
    G0 <- igraph::sample_bipartite(Na, Np, m = L, type="gnm",directed = FALSE)
    I_rand<- as.matrix(as_biadjacency_matrix(B))


  # 2) compute modularity, safely
  mod_rnd <- bipartite::computeModules(I_rand) 
  NODF_rnd<- bipartite::nested(I_rand, method = "NODF")
  Q_rnd2[i] <- slot(mod_rnd, "likelihood") #store modularity
  N_rnd2[i] <-as.numeric(NODF_rnd)
}
