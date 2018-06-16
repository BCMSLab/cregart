# load libraries
library(tidyverse)
library(cRegulome)
library(cowplot)

# generate data
alltf <- read_rds('data/alltf.rds')
ob <- cTF(alltf)

p1 <- cor_joy(ob) +
  labs(x = 'Transcription Factor',
       y = 'Expression Correlation')

allmir <- read_rds('data/allmir.rds')
ob <- cmicroRNA(allmir)

p2 <- cor_joy(ob)+
  labs(x = 'microRNA',
       y = 'Expression Correlation')

plot_grid(p1, p2,
          scale = .9, 
          labels = 'AUTO',
          label_size = 10,
          label_fontface = 'plain') %>%
  ggsave(plot = .,
         filename = 'manuscript/figures/joyplot.png',
         width = 20, height = 10, units = 'cm')
