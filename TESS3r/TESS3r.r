# TESS3r
install.packages("remotes")
remotes::install_github("bcm-uga/TESS3_encho_sen")
install.packages("maps")
install.packages("RColorBrewer")
install.packages("raster")
install.packages("mapproj")
library(tess3r)
library(maps)
library(RColorBrewer)
library(raster)
library(mapproj)
library(fields)

setwd("~/Dropbox/R/tess")

# To convert .geno file to lfmm format, use LEA package
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("LEA")
library(LEA)
geno2lfmm("rgran_data.geno", "rgran_data.lfmm", force = TRUE)


as.matrix(rgran_data <- read.lfmm("rgran_data.lfmm"))
as.matrix(rgran_coords <- read.table("rgran_coords.txt", header = FALSE))

# SNP data
## Running the main function tess3 requires two files as 
#  input to the program: 1) a file encoding individual 
#  genotypes, and 2) a file with individual geographic 
#  coordinates format=LONG-LAT. 

genotype = rgran_data
coordinates = rgran_coords

# check the genotype info and print the genotypes for the 
# first 3 individuals at 10 loci 
dim(genotype)
genotype[1:3,1:10]

# Estimating ancestry coefficients
# The main function of the tess3r package is the tess3 
# function. This function creates an object of class tess3 
# which contains the results of one or several runs of the 
# estimation algorithm. For example, running the program 
# for ancestral populations numbers ranging from K=1 to K=10 
# using 1 CPU can be programmed as follows.
genotype <- replace(genotype, genotype == 9, NA)
coordinates <- as.matrix(coordinates)
tess3.obj <- tess3(X = genotype, coord = coordinates, K = 1:15, 
                   lambda = 1, rep = 50,
                   method = "projected.ls", ploidy = 2, openMP.core.num = 2) 


# calculate the mean cross validation score (rmse)
mean.cverror = vector()
for (i in 1:15) {
  mean.cverror[i] <- mean(tess3.obj[[i]][["rmse"]])
}
diff.mean.cverror <- vector()
i=1
while (i <= length(mean.cverror)-1){
  diff.mean.cverror[i] <- mean.cverror[i]-mean.cverror[i+1]
  i = i +1
}
K_range = seq(2,15)
plot(tess3.obj, type = "b", pch=21, col="black", bg="gray", cex = 2, xlab = "Number of ancestral populations", ylab = "Cross-validation score",main = "Cross-validation score for each K")
plot(diff.mean.cverror, type = "b", pch=21, xaxt="n", xlab = "K value", ylab = "Difference in mean CV error", main = "Difference in mean CV error\nK(i)-K(i+1)")
axis(side=1, at=1:14, labels = K_range)


############ K=4
# retrieve tess3 Q matrix for K = 4 clusters 
q.matrix <- qmatrix(tess3.obj, K = 4)
# STRUCTURE-like barplot for the Q-matrix 
my.colors <- c("#4e1850", #purple
               "#e69842", #orange
               "#fee721", #yellow
               "#2d638c" #blue
)
my.palette <- CreatePalette(my.colors, 5)
barplot(q.matrix, border = NA, space = 0, 
        main = "Ancestry matrix", 
        xlab = "Individuals", ylab = "Ancestry proportions", 
        col.palette = my.palette) -> bp

axis(1, at = 1:nrow(q.matrix), labels = bp$order, las = 3, cex.axis = .5) 

#plot coordinate data on a lat-lon scale
plot(coordinates, pch = 15, cex = .5, 
     xlab = "Longitude", ylab = "Latitude")


#plot the diffusion map of ancestries
K=4
plot(q.matrix, coordinates, method = "map.max", interpol = FieldsKrigModel(10), main = paste("Diffusion map of ancestry for K=",K), 
     xlab = "Longitude", ylab = "Latitude", resolution = c(600,600), cex = .4, col.palette = my.palette)


############ K=5
# retrieve tess3 Q matrix for K = 5 clusters 
q.matrix <- qmatrix(tess3.obj, K = 5)
# STRUCTURE-like barplot for the Q-matrix 
my.colors <- c("#fee721", #yellow
               "#96d596", #green
               "#4e1850", #purple
               "#2d638c", #blue
               "#e69842" #orange
               )
my.palette <- CreatePalette(my.colors,4)
barplot(q.matrix, border = NA, space = 0, 
        main = "Ancestry matrix", 
        xlab = "Individuals", ylab = "Ancestry proportions", 
        col.palette = my.palette) -> bp

axis(1, at = 1:nrow(q.matrix), labels = bp$order, las = 3, cex.axis = .5) 

#plot coordinate data on a lat-lon scale
plot(coordinates, pch = 15, cex = .5, 
     xlab = "Longitude", ylab = "Latitude")


#plot the diffusion map of ancestries
K=5
plot(q.matrix, coordinates, method = "map.max", interpol = FieldsKrigModel(10), main = paste("Diffusion map of ancestry for K=",K), 
     xlab = "Longitude", ylab = "Latitude", resolution = c(600,600), cex = .4, col.palette = my.palette)

############ K=6
# retrieve tess3 Q matrix for K = 6 clusters 
q.matrix <- qmatrix(tess3.obj, K = 6)
# STRUCTURE-like barplot for the Q-matrix 
my.colors <- c("#e69842", #orange
               "#2d638c", #blue
               "#9b9b9b", #grey
               "#4e1850", #purple
               "#fee721", #yellow
               "#96d596" #green
)
my.palette <- CreatePalette(my.colors, 4)
barplot(q.matrix, border = NA, space = 0, 
        main = "Ancestry matrix", 
        xlab = "Individuals", ylab = "Ancestry proportions", 
        col.palette = my.palette) -> bp

axis(1, at = 1:nrow(q.matrix), labels = bp$order, las = 3, cex.axis = .5) 

#plot coordinate data on a lat-lon scale
plot(coordinates, pch = 15, cex = .5, 
     xlab = "Longitude", ylab = "Latitude")


#plot the diffusion map of ancestries
K=6
plot(q.matrix, coordinates, method = "map.max", interpol = FieldsKrigModel(10), main = paste("Diffusion map of ancestry for K=",K), 
     xlab = "Longitude", ylab = "Latitude", resolution = c(600,600), cex = .4, col.palette = my.palette)
