FW_Ilist <- read.csv(FW_filename)
FW <- graph_from_data_frame(FW_Ilist,directed = TRUE)
plot_as_flux(FW,edge.width = E(FW)$weight*0.05)
