FW_filename<- "./Data/FW_st_marks.csv"
FW_Ilist <- read.csv(FW_filename)
FW <- graph_from_data_frame(FW_Ilist,directed = TRUE)


Q_infomap  <- igraph::modularity(cluster_infomap(FW))

FW_und <- igraph::as_undirected(FW, mode = "collapse")
Q_louvain <- igraph::modularity(cluster_louvain(FW_und))

print(Q_infomap)
print(Q_louvain)
