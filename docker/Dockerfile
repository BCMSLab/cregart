FROM rocker/verse:latest

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install libudunits2-dev

RUN Rscript -e "install.packages('ggforce', quiet = TRUE)"

RUN Rscript -e "update.packages(ask=FALSE)"
RUN Rscript -e "source("https://bioconductor.org/biocLite.R")"
RUN Rscript -e "biocLite()"

RUN Rscript -e "BiocInstaller::biocLite('AnnotationDbi', quiet = TRUE)"
RUN Rscript -e "BiocInstaller::biocLite('org.Hs.eg.db', quiet = TRUE)"
RUN Rscript -e "BiocInstaller::biocLite('clusterProfiler', quiet = TRUE)"

RUN Rscript -e "install.packages('cRegulome', quiet = TRUE)"
