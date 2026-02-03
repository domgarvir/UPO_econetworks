#construimos A
A<- ShP*(-0.6)
diag(A) <- -1
#A

#vemos cuántos nodos hay
S=nrow(A)

#cogemos un sampleo aleatorio de r para cada especie
r<-simplex_sampling(m = 1, n = S)[[1]]
#r

#integramos pensando que todas parten de la misma población
# equilibrio (si A invertible)
x_star <- solve(A, -r)
print(as.numeric(x_star))  #

#x0 <- rep(10, S)#todas e piezan con misma poblacion
x0 <- sample(1:20, S, replace = TRUE)
res <- integrate_GLV2(r, A, x0, times = seq(0, 20, by = 0.01))

ggplot(res, aes(x = time, y = density, colour = species)) +
  geom_line() +
  scale_y_log10() +
  theme_bw()
  
