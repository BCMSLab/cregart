FROM rocker/verse:latest

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install libudunits2-dev

RUN Rscript -e "update.packages(ask=FALSE)"

RUN Rscript -e "install.packages('ggforce', quiet = TRUE)"
RUN Rscript -e "install.packages('BiocManager', quiet = TRUE)"

RUN Rscript -e "BiocManager::install('AnnotationDbi', quiet = TRUE)"
RUN Rscript -e "BiocManager::install('org.Hs.eg.db', quiet = TRUE)"
RUN Rscript -e "BiocManager::install('clusterProfiler', quiet = TRUE)"

RUN Rscript -e "install.packages('cRegulome', quiet = TRUE)"
