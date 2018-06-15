# load libraries
library(tidyverse)
library(RSQLite)
library(cRegulome)

# get data

targets <- c('PEBP1', 'PIK3C3', 'PIK3CB', 'TBC1D25', 'TBC1D5', 'TOLLIP', 'WDR45', 'WIPI1', 'TGFBR1')

if(!file.exists('cRegulome.db')) {
  get_db(test = FALSE)
  unzip('cRegulome.db.gz')
  
}
conn <- dbConnect(SQLite(), 'cRegulome.db')

tf <- get_tf(conn,
             tf = c('ERCC6', 'VEZF1'),
             study = 'PRAD',
             targets_only = TRUE) %>%
  filter(feature %in% targets)

mir <- get_mir(conn,
               mir = c('hsa-mir-23c', 'hsa-mir-378c', 'hsa-mir-761'),
               study = 'PRAD') %>%
  filter(feature %in% targets)

dbDisconnect(conn)

write_rds(tf, path = 'data/tf.rds')
write_rds(mir, path = 'data/mir.rds')
