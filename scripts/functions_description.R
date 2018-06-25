# load libraries
library(tidyverse)
library(reshape2)
library(xtable)

# generate table
list('get\\_db' = "Download the database file.",
     'get\\_mir' = "Get correlations of the input microRNA with all genes or targets only.",
     'get\\_tf' = "Get correlations of the input TF with all genes or targets only.",
     'cor\\_tidy' = "Transform the objects cTF and cmicroRna to a tidy data.frame.",
     'cor\\_hist' = "Makes a histogram of each of the regulome elements correlation values.",
     'cor\\_joy' = "Makes a joy plot for each of the regulome elements correlation values.",
     'cor\\_plot' = "Makes a dot plot of element correlations with colors corresponding to direction and size to the value of the correlation.",
     'cor\\_upset' = "Makes an upset plot of the intersections of sets of regulome elements’ feature/gene hits.",
     'cor\\_venn\\_diagram' = "Makes a venn diagram of the numbers and the intersection of the regulome elements’ feature/gene hits.",
     'cor\\_igraph' = "Make a directed graph of the regulators TF/microRNA and thier targets.") %>%
  melt() %>%
  setNames(c('Description', 'Method')) %>%
  select(Method, Description) %>%
  xtable(caption = 'Description of the package functions and methods.',
         align = 'cp{.2\\textwidth}p{.7\\textwidth}',
         label = 'tab:functions_description') %>%
  print(include.rownames = FALSE,
        booktabs = TRUE,
        add.to.row = list(pos = list(3),
                          command = '\\midrule '),
        caption.placement = 'top',
        table.placement = 'H',
        sanitize.text.function = identity,
        file = paste('manuscript/tables', 'functions_description.tex', sep = '/'))
