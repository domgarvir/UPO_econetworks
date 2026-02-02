par(mfrow = c(2, 1), mar = c(4, 4, 3, 1))
xlim <- range(c(N_rnd, N_rnd2, NODF), na.rm = TRUE)
ylim <- range(c(Q_rnd, Q_rnd2, Qb), na.rm = TRUE)

# Panel 1
plot(N_rnd, Q_rnd,
     pch = 16,
     xlab = "N",
     xlim = xlim, ylim = ylim,
     ylab = "Q",
     main = "Null model 1")

points(NODF, Qb, pch = 17, col = "red", cex = 1.5)

# Panel 2
plot(N_rnd2, Q_rnd2,
     pch = 16,
     xlab = "N",
     xlim = xlim, ylim = ylim,
     ylab = "Q",
     main = "Null model 2")

points(NODF, Qb, pch = 17, col = "red", cex = 1.5)
