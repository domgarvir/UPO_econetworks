FW_filename<- "./Data/FW_st_marks.csv"
FW_Ilist <- read.csv(FW_filename)
FW <- graph_from_data_frame(FW_Ilist,directed = TRUE)

#how many species in the network?
N<-vcount(FW)
cat(sprintf("There are %d species\n", N))

#species with more predators (more out-neighbours)
#build a dataframe with the degree of each node
deg_df <- data.frame(
  species = names(igraph::degree(FW)),
  degree  = igraph::degree(FW),
  indeg   = igraph::degree(FW, mode = "in"),
  outdeg  = igraph::degree(FW, mode = "out"),
  row.names = NULL
)
#species with maximum out degree
most_preyed=deg_df$species[deg_df$outdeg == max(deg_df$outdeg)]
cat(sprintf("The most consumed prey is %s\n", most_preyed))


#now the species with larger in-connectivity
generalist_predator=deg_df$species[deg_df$indeg == max(deg_df$indeg)]
cat(sprintf("The most generalist species is %s\n", generalist_predator))

#who is preying on it?
predators=neighbors(FW, generalist_predator[1], mode = "out")
cat(sprintf("The predators of the first species are:\n"))
print(predators$name)