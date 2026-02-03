Nrand=10
Q_rnd <- numeric(Nrand)
N_rnd <- numeric(Nrand)

for (i in seq_len(Nrand)) {
  #print(i)
  # 1) randomize the matrix (preserve row/col sums)
  I_rnd <- bipartite::nullmodel(I, N = 1, method = "r2dtable")[[1]]

  # 2) compute modularity, safely
  mod_rnd <- bipartite::computeModules(I_rnd) 
  NODF_rnd<- bipartite::nested(I_rnd, method = "NODF")
  Q_rnd[i] <- slot(mod_rnd, "likelihood") #store modularity
  N_rnd[i] <-as.numeric(NODF_rnd)
}
