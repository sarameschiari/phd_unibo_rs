# R code for RS

install.packages("raster")
library(raster)

setwd("~/lab/")
# setwd("C:/lab/")  
# windows
# setwd("/Users/name/lab/")
p224r63_2011 <- brick("p224r63_2011_masked.grd")
plot(p224r63_2011)

#B1: blue
#B2: green
#B3: red
#B4: NIR

cl <- colorRampPalette(c('black','grey','light grey'))(100) 
plot(p224r63_2011, col=cl)

par(mfrow=c(2,2))
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # 
plot(p224r63_2011$B1_sre, col=clb)

clg <- colorRampPalette(c('dark green','green','light green'))(100) # 
plot(p224r63_2011$B2_sre, col=clg)

clr <- colorRampPalette(c('dark red','red','pink'))(100) # 
plot(p224r63_2011$B3_sre, col=clr)

cln <- colorRampPalette(c('red','orange','yellow'))(100) # 
plot(p224r63_2011$B4_sre, col=cln)

dev.off()

#RGB

plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")

plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

# exercise: mount NIR ontop the G of RGB

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
 
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

# 1988 image

p224r63_1988 <- brick("p224r63_1988_masked.grd")

par(mfrow=c(2,1))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

# DVI for the two years: compare with a difference in time
# NIR - RED
# NDVI = (NIR - RED) / (NIR - RED)

dvi1988 <- p224r63_1988$B4_sre - p224r63_1988$B3_sre
dvi2011 <- p224r63_2011$B4_sre - p224r63_2011$B3_sre

par(mfrow=c(2,1))
plot(dvi1988)
plot(dvi2011)

par(mfrow=c(2,1))
cldvi <- colorRampPalette(c('red','orange','green'))(100) # 
plot(dvi1988, col=cldvi)
plot(dvi2011, col=cldvi)

par(mfrow=c(2,1))
cldvi <- colorRampPalette(c('red','orange','yellow'))(100) # 
plot(dvi1988, col=cldvi)
plot(dvi2011, col=cldvi)

[12:05] Duccio Rocchini
    
cldif <- colorRampPalette(c('blue','white','red'))(100) #
plot(difdvi, col=cldif)

    
# difference in time
dev.off()
difdvi <- dvi2011 - dvi1988
cldif <- colorRampPalette(c('blue','white','red'))(100) #
plot(difdvi, col=cldif)
 
cldif <- colorRampPalette(c('blue','white','red'))(100) #
plot(difdvi, col=cldif)

# difference in time
dev.off()
difdvi <- dvi2011 - dvi1988
cldif <- colorRampPalette(c('blue','white','red'))(100) #
plot(difdvi, col=cldif)

library("RStoolbox")

# PCA 
p224r63_2011res <- aggregate(p224r63_2011, fact=10)

par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch="Lin")
 
p224r63_2011_pca <- rasterPCA(p224r63_2011res)

summary(p224r63_2011_pca$model)

plotRGB(p224r63_2011_pca$map, r=4, g=3, b=2, stretch="Lin")

plot(p224r63_2011_pca$map)

# land cover
p224r63_2011c <- unsuperClass(p224r63_2011, nClasses=5)
clclass <- colorRampPalette(c('red', 'green', 'yellow', 'blue', 'black'))(100) 
plot(p224r63_2011c$map, col=clclass)


