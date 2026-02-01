#load the network
FW_Ilist <- read.csv(FW_filename)
FW <- graph_from_data_frame(FW_Ilist,directed = TRUE)

sp0='Suspension-feeding molluscs'
sp1='Tonguefish'
sp2='Fish and crustacean-eating birds'
sp3='Herbivorous ducks' 

#1) Do Tonguefish eat molluscs?
sp0_sp1=as.numeric(igraph::distances(FW,sp0,sp1,mode="out"))
cat(sprintf("1. It is %s that %s depends on %s\n",  is.finite(sp0_sp1), sp1, sp0
))

#2) and the Fish and crustacean eating birds?
sp0_sp2=as.numeric(igraph::distances(FW,sp0,sp2),mode="out")
cat(sprintf("2. It is %s that %s depends on %s\n",  is.finite(sp0_sp2), sp2, sp0
))

#3) Should ducka or birds accumulate more lead?
L2=igraph::distances(FW,sp0,sp2,mode="out",weights = NA)
L3=igraph::distances(FW,sp0,sp3,mode="out",weights=NA)

if (L2 < L3) {
  cat(sprintf("3. %s are in more danger since they are only %s steps away and %s are %s steps away\n",sp2, L2, sp3, L3
  ))
} else {
  cat(sprintf("3. %s are in more danger since they are only %s steps away and %s are %s steps away\n",sp3, L3, sp2, L2
  ))
}

#we can take into account weights too, in fact they are used by default, but nthe distance sums the weights because normally they are conceived as COSTS. 
#When the weights are preferences, or fluxes one needs to take the inverse, as more flux means less cost!
w_cost=1/E(FW)$weight
as.numeric(igraph::distances(FW,sp0,sp3,mode="out",weights = w_cost))
as.numeric(igraph::distances(FW,sp0,sp2,mode="out",weights = w_cost))

