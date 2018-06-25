#!/bin/bash

R_OPT=--vanilla

SCRIPTS=scripts

MANUSCRIPT=manuscript
FIG_DIR=manuscript/figures
TAB_DIR=manuscript/tables
ADD_FLS=manuscript/add_files

DATA=data
LOG=log

all: dir_tree \
	$(DATA)/tf.rds \
	$(DATA)/mir.rds \
	$(DATA)/alltf.rds \
	$(DATA)/allmir.rds \
	$(TAB_DIR)/output.tex \
	$(TAB_DIR)/functions_description.tex \
	$(FIG_DIR)/dotplot.png \
	$(FIG_DIR)/upsetplot.png \
	$(FIG_DIR)/joyplot.png \
	$(FIG_DIR)/network.png \
	$(ADD_FLS)/manuscript_code.R \
	clean

dir_tree:
	test ! -d $(LOG) && mkdir $(LOG) || echo '$(LOG)/ is already there.'
	test ! -d $(DATA) && mkdir $(DATA) || echo '$(DATA)/ is already there.'
	test ! -d $(MANUSCRIPT) && mkdir $(MANUSCRIPT) || echo '$(MANUSCRIPT)/ is already there.'
	test ! -d $(TAB_DIR) && mkdir $(TAB_DIR) || echo '$(TAB_DIR)/ is already there.'
	test ! -d $(FIG_DIR) && mkdir $(FIG_DIR) || echo '$(FIG_DIR)/ is already there.'
	test ! -d $(ADD_FLS) && mkdir $(ADD_FLS) || echo '$(ADD_FLS)/ is already there.'
	
$(DATA)/tf.rds $(DATA)/mir.rds $(DATA)/alltf.rds $(DATA)/allmir.rds: $(SCRIPTS)/get_data.R cRegulome.db
	R CMD BATCH $(R_OPT) $(SCRIPTS)/get_data.R $(LOG)/get_data.R.Rout

$(TAB_DIR)/functions_description.tex: $(SCRIPTS)/functions_description.R
	R CMD BATCH $(R_OPT) $(SCRIPTS)/functions_description.R $(LOG)/functions_description.R.Rout

$(TAB_DIR)/output.tex: $(SCRIPTS)/output.R $(DATA)/tf.rds $(DATA)/mir.rds
	R CMD BATCH $(R_OPT) $(SCRIPTS)/output.R $(LOG)/output.R.Rout

$(FIG_DIR)/dotplot.png: $(SCRIPTS)/dotplot.R $(DATA)/tf.rds $(DATA)/mir.rds
	R CMD BATCH $(R_OPT) $(SCRIPTS)/dotplot.R $(LOG)/dotplot.R.Rout

$(FIG_DIR)/upsetplot.png: $(SCRIPTS)/upsetplot.R $(DATA)/alltf.rds $(DATA)/allmir.rds
	R CMD BATCH $(R_OPT) $(SCRIPTS)/upsetplot.R $(LOG)/upsetplot.R.Rout

$(FIG_DIR)/joyplot.png: $(SCRIPTS)/joyplot.R $(DATA)/alltf.rds $(DATA)/allmir.rds
	R CMD BATCH $(R_OPT) $(SCRIPTS)/joyplot.R $(LOG)/joyplot.R.Rout

$(FIG_DIR)/network.png: $(SCRIPTS)/network.R $(DATA)/tf.rds $(DATA)/mir.rds
	R CMD BATCH $(R_OPT) $(SCRIPTS)/network.R $(LOG)/network.R.Rout
	
$(ADD_FLS)/manuscript_code.R: $(SCRIPTS)/*
	cat $(SCRIPTS)/get_data.R \
		$(SCRIPTS)/output.R \
		$(SCRIPTS)/dotplot.R \
		$(SCRIPTS)/upsetplot.R \
		$(SCRIPTS)/joyplot.R \
		> $(ADD_FLS)/manuscript_code.R

# clean up
clean:
	rm -f *.pdf
	rm -f *.RData
