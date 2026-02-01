## DAPC

install.packages("adegenet")
library(adegenet)

setwd("~/Dropbox/R/dapc/Rgranulosa")
#import genind file - all samples were included
a <- read.structure("rgran_ref_m65_randomSNP.str", n.ind=42, n.loc=1077, onerowperind=FALSE,
                    col.lab=1, col.pop=0, col.others=0, row.marknames=0,
                    NA.char="-9", ask=TRUE, quiet=FALSE)

# find clusters. Use each number separately
grpA <- find.clusters(a, n.pca=300, choose.n.clust=TRUE, max.n.clust=15, n.iter=1e5, n.start=10)
4
#5
#6

## show group assignments. 
grpA

## run DAPC
dapc1A <- dapc(a,grpA$grp)
4
2000
#5
#2000
#6
#2000

## a-score fitting
dapcA <- dapc(a,grpA$grp, n.da=10, n.pca=10)
temp <- optim.a.score(dapcA)
compoplot(dapcA, lab="", posi=list(x=12,y=-.01), cleg=.7)

## show summary
summary(dapc1A)


#  scatterplot k=4. Colors = yellow, blue, orange, purple
scatter(dapcA, xax=1, yax=2, ratio.pca=0.5, bg="white", pch=20,  cell=0, addaxes=TRUE, cstar=0, scree.da=FALSE, posi.da="topright", 
        col=c("#96d596", "#fee721", "#2d638c", "#e69842", "#4e1850"), solid=.8, cex=4, 
        clab=0, leg=FALSE, txt.leg=paste("Cluster",1:7), posi.leg="bottomright")
#  scatterplot k=5. Colors = green, yellow, blue, orange, purple
scatter(dapcA, xax=1, yax=2, ratio.pca=0.5, bg="white", pch=20,  cell=0, addaxes=TRUE, cstar=0, scree.da=FALSE, posi.da="topright", 
        col=c("#96d596", "#fee721", "#2d638c", "#e69842", "#4e1850"), solid=.8, cex=4, 
        clab=0, leg=FALSE, txt.leg=paste("Cluster",1:7), posi.leg="bottomright")
#  scatterplot k=6. Colors = green, yellow, blue, orange, purple, grey
scatter(dapcA, xax=1, yax=2, ratio.pca=0.5, bg="white", pch=20,  cell=0, addaxes=TRUE, cstar=0, scree.da=FALSE, posi.da="topright", 
        col=c("#96d596", "#fee721", "#2d638c", "#e69842", "#4e1850", "#9b9b9b"), solid=.8, cex=4, 
        clab=0, leg=FALSE, txt.leg=paste("Cluster",1:7), posi.leg="bottomright")

