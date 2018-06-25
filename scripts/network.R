# load libraries
library(tidyverse)
library(cRegulome)
library(igraph)

# generate plot

tf <- read_rds('data/tf.rds')
ob <- cTF(tf)

p1 <- cor_igraph(ob)

mir <- read_rds('data/mir.rds')
ob <- cmicroRNA(mir)

p2 <- cor_igraph(ob)

png(filename = 'manuscript/figures/network.png',
    width = 20, height = 12, units = 'cm', res = 300)

par(mfrow=c(1,2))
set.seed(123456)
plot(p1, vertex.color = as.factor(V(p1)$type == 'TF'))
mtext('A', line = 3, adj = -.3)
plot(p2, vertex.color = as.factor(V(p2)$type == 'microRNA'))
mtext('B', line = 3, adj = -.3)

dev.off()
