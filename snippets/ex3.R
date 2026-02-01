g2 <- graph_from_adjacency_matrix(
  A2,
  mode = "directed",   # or "undirected"
  weighted = TRUE,     # FALSE if binary
  diag = FALSE         # ignore self-loops
)
plot(g2,edge.width = E(g2)$weight)

