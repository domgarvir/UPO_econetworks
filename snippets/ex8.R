df <- read.csv(P_Filename, row.names = 1)
I <- as.matrix(df)
B <- graph_from_biadjacency_matrix(t(I))
Np<-nrow(I)
Na<-ncol(I)
L <- igraph::ecount(B)   

# pollinators = type FALSE, get degree sequence and distribution
polls <- igraph::V(B)[type == FALSE]
Kpol <- igraph::degree(B)[polls]   # degree of pollinators in the bipartite graph

#random bipartiten network with Np,Na and L
G0 <- igraph::sample_bipartite(Na, Np, m = L, type="gnm",directed = FALSE)

#get degree sequence and distribution
polls0 <- igraph::V(G0)[type == FALSE]
Kpol_rnd <- igraph::degree(G0)[polls0]

df_B  <- cdf_get(Kpol)
df_G0 <- cdf_get(Kpol_rnd)

plot(df_B$k, df_B$p,
     pch = 16,
     log = "xy",
     xlab = "k (pollinator degree)",
     ylab = "P(K ≥ k)",
     main = "Cumulative degree distribution of polinators",
     ylim = c(0.001, 1))

points(df_G0$k, df_G0$p, pch = 1)

legend("topright",
       legend = c("Empirical (B)", "Random bipartite (G0)"),
       pch = c(16, 1),
       bty = "n")
       