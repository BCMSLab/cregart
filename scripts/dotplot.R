# load libraries
library(tidyverse)
library(cRegulome)
library(cowplot)

# generate plot

tf <- read_rds('data/tf.rds')
ob <- cTF(tf)

p1 <- cor_plot(ob) +
  theme(legend.position = 'top',
        legend.direction = 'vertical') +
  scale_size_continuous(breaks = c(.5, .65)) +
  labs(x = '', y = '')

mir <- read_rds('data/mir.rds')
ob <- cmicroRNA(mir)

p2 <- cor_plot(ob) +
  theme(legend.position = 'top',
        legend.direction = 'vertical') +
  scale_size_continuous(breaks = c(.1, .3)) +
  labs(x = '', y = '')

plot_grid(p1, p2,
          scale = .9, 
          labels = 'AUTO',
          label_size = 10,
          label_fontface = 'plain') %>%
  ggsave(plot = .,
         filename = 'manuscript/figures/dotplot.png',
         width = 20, height = 12, units = 'cm')
