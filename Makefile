#!/bin/bash

#R_OPT=--vanilla

SCRIPTS=scripts

MANUSCRIPT=manuscript
FIG_DIR=manuscript/figures
TAB_DIR=manuscript/tables

DATA=data
LOG=log

all: tf.rds
	
dir_tree:
	test ! -d $(LOG) && mkdir $(LOG) || echo '$(LOG)/ is already there.'
	test ! -d $(DATA) && mkdir $(DATA) || echo '$(DATA)/ is already there.'
	test ! -d $(MANUSCRIPT) && mkdir $(MANUSCRIPT) || echo '$(MANUSCRIPT)/ is already there.'
	test ! -d $(TAB_DIR) && mkdir $(TAB_DIR) || echo '$(TAB_DIR)/ is already there.'
	test ! -d $(FIG_DIR) && mkdir $(FIG_DIR) || echo '$(FIG_DIR)/ is already there.'
	
tf.rds: $(SCRIPTS)/get_data.R 
	R CMD BATCH $(R_OPT) $(SCRIPTS)/get_data.R $(LOG)/get_data.R.Rout