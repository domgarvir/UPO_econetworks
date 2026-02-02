hist(Q_rnd,
     breaks = 20,
     col = "grey80",
     border = "white",
     xlab = "Bipartite modularity (Qb)",
     main = "Distribution of bipartite modularity in random ensemble")

abline(v = Qb, col = "red", lwd = 2)

