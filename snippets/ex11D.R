hist(Q_rnd2,
     breaks = 20,
     col = "grey80",
     border = "white",
     xlim = c(0.57, 0.59),
     xlab = "Bipartite modularity (Qb)",
     main = "Distribution of bipartite modularity in random ensemble")

abline(v = Qb, col = "red", lwd = 2)