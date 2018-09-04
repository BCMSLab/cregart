# load libraries
library(tidyverse)
library(RSQLite)
library(cRegulome)

# get data

# Downlaod database file
if(!file.exists('cRegulome.db')) {
  get_db(test = FALSE,
         destfile = './cRegulome.db')
}

# Query the database 
conn <- dbConnect(SQLite(), './cRegulome.db')

all_tf <- get_tf(conn,
             tf = c('ERCC6', 'VEZF1'),
             study = 'PRAD',
             targets_only = TRUE)

all_mir <- get_mir(conn,
               mir = c('hsa-mir-23c', 'hsa-mir-378c', 'hsa-mir-761'),
               study = 'PRAD',
               targets_only = TRUE)

dbDisconnect(conn)

# Save data to rds objects
write_rds(all_tf, path = 'data/alltf.rds')
write_rds(all_mir, path = 'data/allmir.rds')

# Query mir with targets = False
conn <- dbConnect(SQLite(), './cRegulome.db')

all_mir <- get_mir(conn,
                   mir = c('hsa-mir-23c', 'hsa-mir-378c', 'hsa-mir-761'),
                   study = 'PRAD')

dbDisconnect(conn)

# Identify target genes
targets <- c('PEBP1', 'PIK3C3', 'PIK3CB', 'TBC1D25', 'TBC1D5', 'TOLLIP', 'WDR45', 'WIPI1', 'TGFBR1')

# Subset query output
tf <- all_tf %>%
  filter(feature %in% targets)

mir <- all_mir %>%
  filter(feature %in% targets)

write_rds(tf, path = 'data/tf.rds')
write_rds(mir, path = 'data/mir.rds')
