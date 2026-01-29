g3 <- graph(
  edges = c(
    "plant", "snail",
    "plant", "caterpillar",
    "plant", "rabbit",
    "snail", "lizard",
    "caterpillar", "lizard"
  ),
  directed = TRUE
)
plot(g3,vertex.color="white",vertex.frame.color="black", vertex.label.color="black",edge.color="black",vertex.size=20)
