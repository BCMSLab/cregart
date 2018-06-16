# load libraries
library(tidyverse)
library(cRegulome)
library(cowplot)
library(grid)
library(gridExtra)

# generate data
alltf <- read_rds('data/alltf.rds')
ob <- cTF(alltf)

cor_upset(ob)
grid.edit('arrange', name = 'p1')
p1 <- grid.grab()


allmir <- read_rds('data/allmir.rds')
ob <- cmicroRNA(allmir)

cor_upset(ob)
grid.edit('arrange', name = 'p2')

p2 <- grid.grab()

plot_grid(p1, p2,
          scale = .9, 
          labels = 'AUTO',
          label_size = 10,
          label_fontface = 'plain') %>%
  ggsave(plot = .,
         filename = 'manuscript/figures/upsetplot.png',
         width = 20, height = 10, units = 'cm')


